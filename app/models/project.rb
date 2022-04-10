class Project < ApplicationRecord
  has_many :projects_stacks, dependent: :destroy
  
  validates :title, :production_link, :repository_link, presence: true
  accepts_nested_attributes_for :projects_stacks, reject_if: :all_blank, allow_destroy: true

  paginates_per 9

  scope :search_project, -> (title, page){ 
    where("lower(title) LIKE ?", "%#{title.downcase}%").includes(:projects_stacks).page(page).with_attached_thumbnail
  }
end

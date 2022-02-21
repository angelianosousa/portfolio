class Project < ApplicationRecord
  has_many :projects_stacks, dependent: :destroy
  has_many_attached :pictures_carousel
  has_one_attached :photo_principal

  accepts_nested_attributes_for :projects_stacks, reject_if: :all_blank, allow_destroy: true
end

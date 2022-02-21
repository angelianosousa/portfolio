class Project < ApplicationRecord
  has_many :projects_stacks
  has_many_attached :pictures

  accepts_nested_attributes_for :projects_stacks, reject_if: :all_blank, allow_destroy: true
end

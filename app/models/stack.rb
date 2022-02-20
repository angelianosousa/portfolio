class Stack < ApplicationRecord
  has_one_attached :picture
  has_many :projects_stacks
end

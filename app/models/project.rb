class Project < ApplicationRecord
  has_many :projects_stacks
  has_many :stacks

end

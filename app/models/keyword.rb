class Keyword < ActiveRecord::Base

  # Associations
  belongs_to :project

  # Validations
  validates :name,    :presence => true, :uniqueness => true
  validates :project, :presence => true
end
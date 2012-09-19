class Audit < ActiveRecord::Base

  # Associations
  belongs_to :project

  # Validations
  validates :project, :presence => true
end
class Project < ActiveRecord::Base

  # Associations
  has_many :audits
  has_many :keywords

  # Validations
  validates :name,     :presence => true, :uniqueness => true
  validates :domain,   :presence => true, :uniqueness => true
end
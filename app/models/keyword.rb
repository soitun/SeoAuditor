class Keyword < ActiveRecord::Base

  # Associations
  belongs_to :project
  has_many :keyword_audits
  has_many :audits, :through => :keyword_audits

  # Validations
  validates :name,    :presence => true, :uniqueness => true
  validates :project, :presence => true
end
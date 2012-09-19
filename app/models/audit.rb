class Audit < ActiveRecord::Base

  # Associations
  belongs_to :project
  has_many :keyword_audits
  has_many :keywords, :through => :keyword_audits

  # Validations
  validates :project, :presence => true
end
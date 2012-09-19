class KeywordAudit < ActiveRecord::Base

  # Associations
  belongs_to :audit
  belongs_to :keyword

  # Validations
  validates :audit,   :presence => true
  validates :keyword, :presence => true
end
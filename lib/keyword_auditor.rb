require 'open-uri'

class KeywordAuditor
  attr_accessor :uri, :keywords
  def initialize(uri, keywords)
    @uri = uri
    @keywords = keywords.kind_of?(Array) ? keywords : [keywords]
  end

  def perform
    doc = Nokogiri::HTML(open(uri))
    results = {}

    keywords.each do |keyword|
      occurences = doc.content.downcase.scan(keyword.name).count
      results.merge!(keyword.name => occurences)
    end

    results
  end

  def self.audit(uri, keywords)
    new(uri, keywords).perform
  end
end
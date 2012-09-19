require 'spec_helper'
require 'keyword_auditor'

describe KeywordAuditor do
  before { stub_request_and_return_dummy_html("http://www.example.com") }

  it "should return a hash of the count for the keyword at a url" do
    result = KeywordAuditor.audit("http://www.example.com", Factory.create(:keyword, :name => "agile"))
    expected_hash = { "agile" => 2 }
    result.should eql expected_hash
  end

  it "should return a hash of the count for multiple keywords at a url" do
    result = KeywordAuditor.audit("http://www.example.com", [Factory.create(:keyword, :name => "agile"), Factory.create(:keyword, :name => "technology")] )
    expected_hash = { "agile" => 2, "technology" => 5 }
    result.should eql expected_hash
  end
end
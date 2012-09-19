require 'spec_helper'

describe KeywordAudit do
  context "associations" do
    it { should belong_to :audit }
    it { should belong_to :keyword }
  end

  context "validations" do
    let(:keyword_audit) { Factory.create :keyword_audit }

    it "should be valid by default" do
      keyword_audit.should be_valid
    end

    context "presence" do
      it { should validate_presence_of :audit }
      it { should validate_presence_of :keyword }
    end
  end
end
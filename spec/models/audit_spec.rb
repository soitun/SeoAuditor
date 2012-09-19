require 'spec_helper'

describe Audit do

  context "associations" do
    it { should belong_to :project }
  end

  context "validations" do
    let(:audit) { Factory.create :audit }

    it "should be valid by default" do
      audit.should be_valid
    end

    context "presence" do
      it { should validate_presence_of :project }
    end
  end
end
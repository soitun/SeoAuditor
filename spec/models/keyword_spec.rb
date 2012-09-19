require 'spec_helper'

describe Keyword do

  context "associations" do
    it { should belong_to :project }
  end

	context "validations" do
    let(:keyword) { Factory.create :keyword }

    it "should be valid by default" do
      keyword.should be_valid
    end

    context "presence" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :project }
    end

    context "uniqueness" do
      before { keyword }
      it { should validate_uniqueness_of :name }
    end
  end
end
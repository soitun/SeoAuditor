require 'spec_helper'

describe Project do
  context "associations" do
    it { should have_many(:audits) }
    it { should have_many(:keywords) }
  end

  context "validations" do
    let(:project) { Factory.create(:project) }

    it "should be valid by default" do
      project.should be_valid
    end

    context "presence" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :domain }
    end

    context "uniqueness" do
      before { project }
      it { should validate_uniqueness_of :name }
      it { should validate_uniqueness_of :domain }
    end
  end
end
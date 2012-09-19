require 'spec_helper'

describe "Audits" do
  let(:project) { Factory.create :project }
  before { Factory.create(:keyword, :name => "agile", :project => project) }

  it "Creating a new audit" do
    visit new_project_audit_path project
    
    click_button "Perform Audit"
    page.should have_content "The keyword \"agile\" has been used 2 times in this document."
  end	
end

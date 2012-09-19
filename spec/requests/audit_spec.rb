require 'spec_helper'

describe "Audits" do
  let(:project) { Factory.create :project }
  let!(:keyword) { Factory.create(:keyword, :name => "agile", :project => project) }
  before { stub_request_and_return_dummy_html(project.domain) }

  it "Creating and showing a new audit" do
    visit new_project_audit_path project

    click_button "Perform Audit"

    current_path.should eql project_audit_path(project, Audit.last)
    within "table" do
      page.should have_content keyword.name
      page.should have_content "2"
    end
  end
end


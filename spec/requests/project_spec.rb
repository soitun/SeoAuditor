require 'spec_helper'

describe "Project Page" do
  let(:project) { Factory.create(:project) }

  it "creating projects" do
    visit new_project_path

    fill_in "Name", :with => "Unboxed"
    fill_in "Domain", :with => "http://www.unboxedconsulting.com"
    click_button "Add Project"

    # TODO - flash messages
    # page.should have_content "Project successfully created."
    page.should have_selector "h1", :text => "Unboxed"
  end
end

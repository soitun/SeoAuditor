require 'spec_helper'

describe "Project Page" do
  let(:project) { Factory.create(:project) }

  it "creating projects" do
    visit new_project_path

    fill_in "Name", :with => "Unboxed"
    click_button "Add Project"

    page.should have_content "Project successfully created."
    within "table" do
      page.should have_selector "td", :text => "Unboxed"
    end
  end
end

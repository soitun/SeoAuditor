require 'spec_helper'

describe "Keywords pages" do
  let(:project) { Factory.create(:project) }

  it "creating keywords" do
    visit new_project_keyword_path project

    fill_in "Name", :with => "agile"
    click_button "Add Keyword"

    page.should have_content "Keyword successfully created."
    within "table" do
      page.should have_selector "td", :text => "agile"
    end
  end
end


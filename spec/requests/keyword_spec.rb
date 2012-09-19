require 'spec_helper'

describe "Keywords pages" do
  let(:project) { Factory.create(:project) }

  it "viewing the keyword index and deletiung one" do
    2.times { Factory.create(:keyword, :project => project) }

    visit project_keywords_path project

    within "table" do
      page.should have_selector "tr", :count => 2
    end
  end

  it "creating keywords" do
    visit new_project_keyword_path project

    fill_in "Name", :with => "agile"
    click_button "Add Keyword"

    current_path.should eql project_keywords_path(project)
    # TODO - flash messages
    # page.should have_content "Keyword successfully created."
    within "table" do
      page.should have_selector "td", :text => "agile"
    end
  end
end


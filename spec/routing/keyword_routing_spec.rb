require 'spec_helper'

describe KeywordsController, 'routing' do
  let(:project) { Factory.create(:project) }
  let(:keyword) { Factory.create(:keyword) }

  it "should route to the index page" do
    { :get => "/projects/#{project.to_param}/keywords" }.
    should route_to(
      :project_id => project.to_param,
      :controller => "keywords",
      :action => "index"
    )
  end

  it "should route to the new page" do
    { :get => "/projects/#{project.to_param}/keywords/new" }.
    should route_to(
      :project_id => project.to_param,
      :controller => "keywords",
      :action => "new"
    )
  end

  it "should route to the create action" do
    { :post => "/projects/#{project.to_param}/keywords" }.
    should route_to(
      :project_id => project.to_param,
      :controller => "keywords",
      :action => "create"
    )
  end

  it "should route to the destroy action" do
    { :delete => "/projects/#{project.to_param}/keywords/#{keyword.to_param}" }.
    should route_to(
      :project_id => project.to_param,
      :controller => "keywords",
      :action => "destroy",
      :id => keyword.to_param
    )
  end
end

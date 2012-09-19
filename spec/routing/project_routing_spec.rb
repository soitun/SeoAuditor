require 'spec_helper'

describe ProjectsController, 'routing' do
  let(:project) { Factory.create(:project) }

  it "should route to the new page" do
    { :get => "/projects/new" }.should route_to("projects#new")
  end

  it "should route to the create action" do
    { :post => "/projects" }.should route_to("projects#create")
  end

  it "should route to the show action" do
    { :get => "/projects/#{project.to_param}" }.
    should route_to(
      :controller => "projects",
      :action => "show",
      :id => project.to_param
    )
  end

  it "should route to the edit action" do
    { :get => "/projects/#{project.to_param}/edit" }.
    should route_to(
      :controller => "projects",
      :action => "edit",
      :id => project.to_param
    )
  end

  it "should route to the update action" do
    { :put => "/projects/#{project.to_param}" }.
    should route_to(
      :controller => "projects",
      :action => "update",
      :id => project.to_param
    )
  end

  it "should route to the destroy action" do
    { :delete => "/projects/#{project.to_param}" }.
    should route_to(
      :controller => "projects",
      :action => "destroy",
      :id => project.to_param
    )
  end
end

require 'spec_helper'

describe AuditsController, 'routing' do
  let(:project) { Factory.create(:project) }
  let(:audit) { Factory.create(:audit) }

  it "should route to the new page" do
    { :get => "/projects/#{project.to_param}/audits/new" }.
    should route_to(
      :project_id => project.to_param,
      :controller => "audits",
      :action => "new"
    )
  end

  it "should route to the create action" do
    { :post => "/projects/#{project.to_param}/audits" }.
    should route_to(
      :project_id => project.to_param,
      :controller => "audits",
      :action => "create"
    )
  end

  it "should route to the show action" do
    { :get => "/projects/#{project.to_param}/audits/#{audit.to_param}" }.
    should route_to(
      :project_id => project.to_param,
      :id => audit.to_param,
      :controller => "audits",
      :action => "show"
    )
  end
end

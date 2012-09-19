require 'spec_helper'

describe ProjectsController do
  let(:project) { Factory.create(:project) }
	
  describe "GET 'new'" do
    before { get :new, :project_id => project.to_param }

    it { should respond_with :success }
    it { should render_template :new }
    it { should assign_to :project }
  end

  describe "POST 'create'" do
    context "in general" do
      before { post :create, :project_id => project.to_param }

      it { should assign_to :project }
    end

    context "with valid params" do
      let(:valid_params) { { :project => Factory.attributes_for(:project) } }
      before { expect { post :create, valid_params }.to change(Project, :count).by(1) }

      it { should redirect_to project_path(Project.last) }
    end

    context "with invalid params (without any projects)" do
      let(:invalid_params) { { :project => {} } }
      before { expect { post :create, invalid_params }.to_not change(Project, :count).by(1) }

      it { should render_template :new }
    end
  end
end
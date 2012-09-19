require 'spec_helper'

describe AuditsController do
  let(:project) { Factory.create(:project) }
	
  describe "GET 'new'" do
    before { get :new, :project_id => project.to_param }

    it { should respond_with :success }
    it { should render_template :new }
    it { should assign_to :audit }
  end

  describe "POST 'create'" do
    context "in general" do
      before { post :create, :project_id => project.to_param }

      it { should assign_to :project }
      it { should assign_to :audit }
    end

    context "with valid params" do
      let(:valid_params) { { :project_id => project.to_param, :audit => Factory.attributes_for(:audit) } }
      before { expect { post :create, valid_params }.to change(Audit, :count).by(1) }

      it { should redirect_to project_audit_path(project, Audit.last) }
    end

    context "with invalid params" do
      let(:invalid_params) { { :project_id => project.to_param } }
      before { expect { post :create, invalid_params }.to_not change(Audit, :count).by(1) }

      it { should render_template :new }
    end
  end

  describe "GET 'show'" do
  	let(:audit) { Factory.create(:audit, :project => project)}
    before { get :show, :project_id => project.to_param, :id => audit.to_param }

    it { should assign_to :project }
    it { should assign_to :audit }
  end
end
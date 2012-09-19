require 'spec_helper'

describe KeywordsController do
  let(:project) { Factory.create(:project) }
	
  describe "GET 'new'" do
    before { get :new, :project_id => project.to_param }

    it { should respond_with :success }
    it { should render_template :new }
    it { should assign_to :keyword }
  end

  describe "POST 'create'" do
    context "in general" do
      before { post :create, :project_id => project.to_param }

      it { should assign_to :project }
      it { should assign_to :keyword }
    end

    context "with valid params" do
      let(:valid_params) { { :project_id => project.to_param, :keyword => Factory.attributes_for(:keyword) } }
      before { expect { post :create, valid_params }.to change(Keyword, :count).by(1) }

      it { should redirect_to project_keywords_path(project) }
    end

    context "with invalid params (without any keywords)" do
      let(:invalid_params) { { :project_id => project.to_param } }
      before { expect { post :create, invalid_params }.to_not change(Keyword, :count).by(1) }

      it { should render_template :new }
    end
  end
end
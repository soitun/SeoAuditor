class KeywordsController < ApplicationController
  before_filter :fetch_project

  def index
    @keywords = @project.keywords
  end

  def new
    @keyword = @project.keywords.build
  end

  def create
    @keyword = Keyword.new(params[:keyword])
    @keyword.project = @project
    if @keyword.save
      redirect_to project_keywords_path(@project), :message => "Keyword successfully created."
    else
      render :new, :error => "Hmmm something borked it"
    end
  end
end
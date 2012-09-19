class ProjectsController < ApplicationController

	def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      redirect_to project_path(@project), :message => "Congratulations you have created an project"
    else
      render :new, :error => "Hmmm something borked it"
    end
  end
end
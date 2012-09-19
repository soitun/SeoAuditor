class AuditsController < ApplicationController
  before_filter :fetch_project

  def new
    @audit = @project.audits.build
  end

  def create
  	@audit = Audit.new
    @audit.project = @project

  	if @audit.save
      redirect_to project_audit_path(@project, @audit), :message => "Congratulations you have created an audit"
    else
      render :new, :error => "Hmmm something borked it"
    end
  end

  def show
    @audit = @project.audits.find_by_id params[:id]
  end
end
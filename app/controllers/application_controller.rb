class ApplicationController < ActionController::Base
  protect_from_forgery

	protected
  def fetch_project
    @project ||= Project.find_by_id(params[:project_id])
  end

end

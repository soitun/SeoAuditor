class AuditsController < ApplicationController
  before_filter :fetch_project

  def new
    @audit = @project.audits.build
  end

  def create
  	@audit = Audit.new
    @audit.project = @project

    audit_hash = KeywordAuditor.audit(@project.domain, @project.keywords)
    audit_hash.each_pair do |name, occurences|
      keyword = @project.keywords.find_by_name name
      @audit.keyword_audits << KeywordAudit.new(:keyword => keyword, :occurences => occurences, :audit => @audit)
    end

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
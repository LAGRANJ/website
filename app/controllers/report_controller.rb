class ReportController < ApplicationController
  def index
  	@reports = Report.all
  end

  def show
  end
end

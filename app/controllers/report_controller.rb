class ReportController < ApplicationController
  add_breadcrumb "Главная страница", :root_path  
  def index
  	@reports = Report.all
  end

  def show
  end
end

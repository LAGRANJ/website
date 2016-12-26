class ReportController < ApplicationController
  add_breadcrumb "Главная страница", :root_path  
  before_action :init_sidebar_data, only:[:index]
  def index
  	@reports = Report.all
  end

end

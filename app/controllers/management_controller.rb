class ManagementController < ApplicationController
	add_breadcrumb "Главная страница", :root_path  
  before_action :init_sidebar_data, only:[:index]
  def index
  	@managers = Manager.all
  end
end

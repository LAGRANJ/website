class Products::CreditTypesController < ApplicationController
  add_breadcrumb "Главная страница", :root_path
  before_action :init_sidebar_data, only:[:index]
  
  def index
  	@credit_purposes = JSON.parse(Redis.current.get("credit_purposes"))
  	@credit_types = CreditType.all
  
  end
end

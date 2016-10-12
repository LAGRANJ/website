class Products::CreditTypesController < ApplicationController
  add_breadcrumb "Главная страница", :root_path
  def index  	
  	@credit_purposes = JSON.parse(Redis.current.get("credit_purposes"))
  end
end

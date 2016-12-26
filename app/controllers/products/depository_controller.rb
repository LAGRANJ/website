class Products::DepositoryController < ApplicationController
  add_breadcrumb "Главная страница", :root_path
  before_action :init_sidebar_data, only:[:index]
  def index
  	@safe_types = JSON.parse(Redis.current.get("safe_types"))
  	@safe_tariffs = JSON.parse(Redis.current.get("safe_tariffs")).select{|x| x["CustomerTypeID"]==params["client_type"].to_i}
  end
  def calculate_commission_fee    
    @safe_tariffs = JSON.parse(Redis.current.get("safe_tariffs")).select{|x| x["CustomerTypeID"]==params["client_type"].to_i}
    respond_to do |format|
      format.js {}
    end
  end
end

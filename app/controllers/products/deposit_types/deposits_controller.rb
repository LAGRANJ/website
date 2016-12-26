class Products::DepositTypes::DepositsController < ApplicationController
  add_breadcrumb "Главная страница", :root_path
  before_action :add_def_breadcrumb
  before_action :init_sidebar_data, only:[:index,:show]
  
  def index    
    @deposit_type = JSON.parse(Redis.current.get("deposit_types")).select{|x| x["TypeID"] == params[:type_id].to_i}.first
    @deposit_products = JSON.parse(Redis.current.get("deposit_products"))
    @deposit_currencies = JSON.parse(Redis.current.get("deposit_currencies"))
  end
  def show
    add_breadcrumb "Типы депозитов", products_deposit_types_deposits_path(params[:client_type],params[:type_id])
    @deposit = JSON.parse(Redis.current.get("deposit_products")).select{|c| c["ProductID"] == params["product_id"].to_i}.first()
    @deposit_interests = JSON.parse(Redis.current.get("deposit_interests_#{@deposit["ProductID"]}"));    
  end
  def calculate_rate_payment
    respond_to do |format|
      format.js {}
    end
  end

  def add_def_breadcrumb
    add_breadcrumb "Виды депозитов", products_deposit_types_path(params[:client_type])
  end
end

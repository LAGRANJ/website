class Products::DepositTypesController < ApplicationController
  add_breadcrumb "Главная страница", :root_path
  def index
  	@abs_deposit_types = JSON.parse(Redis.current.get("deposit_types"))
  	@deposit_types = DepositType.all;
  end
end

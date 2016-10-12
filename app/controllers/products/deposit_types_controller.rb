class Products::DepositTypesController < ApplicationController
  add_breadcrumb "Главная страница", :root_path
  def index
  	@deposit_types = JSON.parse(Redis.current.get("deposit_types"))
  	@deposit_type_details = DepositTypeDetail.all;
  end
end

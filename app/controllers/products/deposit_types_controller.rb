class Products::DepositTypesController < ApplicationController
  add_breadcrumb "Главная страница", :root_path
  before_action :init_sidebar_data, only:[:index]
  def index
  	@abs_deposit_types = JSON.parse(Redis.current.get("deposit_types"))
  	@deposit_types = DepositType.all;
  end
end

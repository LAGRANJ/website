class Products::CreditTypes::CreditsController < ApplicationController  
  before_action :add_def_breadcrumb
  def index
    @credit_purposes = JSON.parse(Redis.current.get("credit_purposes"))
    @credit_products = JSON.parse(Redis.current.get("credit_products"))


    @currencies = Redis.current.lrange('currencies',0,-1)
    @market_rates_cash = Hash.new()
    @market_rates_noncash = Hash.new()
    @currency_rates = Hash.new()
    @currencies.each do |currencyid|
      @currency_rates[currencyid] = JSON.parse(Redis.current.get("currencyid:#{currencyid}_3"))
      @market_rates_noncash[currencyid] = JSON.parse(Redis.current.get("currencyid:#{currencyid}_2"))
      @market_rates_cash[currencyid] = JSON.parse(Redis.current.get("currencyid:#{currencyid}_1"))
    end
  end
  def show
    add_breadcrumb "Типы кредитов", products_credit_types_credits_path(params[:client_type],params[:typeid])
    @credit = JSON.parse(Redis.current.get("credit_products")).select{|c| c["ProductID"] == params["product_id"].to_i}.first()
    @credit_interests = JSON.parse(Redis.current.get("credit_interests_#{@credit["ProductID"]}"));
    @user = Hash.new()
    @user[:name] = "username"
  end
  def calculate_rate_payment
    respond_to do |format|
      format.html { render plain: "custom action" }
      format.js {}
      format.json { render json: {"interest" => 18,"payment"=> 5699 } }
    end
  end

  def add_def_breadcrumb
    add_breadcrumb "Главная страница", :root_path
    add_breadcrumb "Виды кредитов", products_credit_purposes_path(params[:client_type])
  end
end

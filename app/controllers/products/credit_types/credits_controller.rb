class Products::CreditTypes::CreditsController < ApplicationController  
  before_action :add_def_breadcrumbs
  before_action :init_sidebar_data, only:[:index,:show]
  def index
    @credit_purpose = JSON.parse(Redis.current.get("credit_purposes")).select{|x| x["ID"] == params[:type_id].to_i}.first
    @credit_products = JSON.parse(Redis.current.get("credit_products")).select{|prod| prod["TypeID"]==params[:type_id].to_i and 
          (prod["IsForCompanies"] && params[:client_type].to_i==2 || prod["IsForIndividuals"] && params[:client_type].to_i==1)}
    @credit_types = CreditType.all    
  end
  def show
    add_breadcrumb "Типы кредитов", products_credit_types_credits_path(params[:client_type],params[:typeid])    
    @credit = JSON.parse(Redis.current.get("credit_products")).select{|c| c["ProductID"] == params["product_id"].to_i}.first
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

  def add_def_breadcrumbs
    add_breadcrumb "Главная страница", :root_path
    add_breadcrumb "Виды кредитов", products_credit_purposes_path(params[:client_type])
  end
end

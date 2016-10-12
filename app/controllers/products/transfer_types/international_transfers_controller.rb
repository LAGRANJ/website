class Products::TransferTypes::InternationalTransfersController < ApplicationController
  add_breadcrumb "Главная страница", :root_path 
  before_action :add_def_breadcrumb   
  def index        
    @transfer_type_details = TransferTypeDetail.all
    @transfer_types = JSON.parse(Redis.current.get("transfer_types"))
  end
  def show    
    add_breadcrumb "Типы переводов", products_transfer_types_international_transfers_path(params["client_type"], params["typeid"])

    @transfer_type = TransferTypeDetail.find_by(typeid: params["typeid"])
    @transfer_commissions = TransferCommission.select{|commission| commission.typeid == params["typeid"].to_i && commission.currencyid == 840}
    @transfer_types = JSON.parse(Redis.current.get("transfer_types"))
  end
  def commission_table
  	@transfer_commissions = TransferCommission.order(:minsum).select{|commission| commission.typeid == params["typeid"].to_i && commission.currencyid == params["currencyid"].to_i}
    respond_to do |format|
      format.html { render plain: "commission_table" }
      format.json { render json: {"interest" => 18,"payment"=> 5699 } }
      format.js {}
    end
  end
  def calculate_commission_fee
    @transfer_types = JSON.parse(Redis.current.get("transfer_types"))
  	respond_to do |format|
      format.html { render plain: "custom action" }
      format.js {}
      format.json { render json: {"interest" => 18,"payment"=> 5699 } }
    end
  end
  def add_def_breadcrumb
    add_breadcrumb "Виды переводов", products_transfer_types_path(params["client_type"])
  end 
end

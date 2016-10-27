class Products::TransferTypes::InternationalTransfersController < ApplicationController
  add_breadcrumb "Главная страница", :root_path 
  before_action :add_def_breadcrumb   
  def index        
    @transfer_type_details = TransferTypeDetail.all
    @transfer_types = JSON.parse(Redis.current.get("transfer_types")).select{
      |x| x["GroupID"] == 1 && (x["IsForIndividuals"] && params["client_type"].to_i == 1 || x["IsForCompanies"] && params["client_type"].to_i == 2)
    }
  end
  def show    
    add_breadcrumb "Типы переводов", products_transfer_types_international_transfers_path(params["client_type"], params["typeid"])

    @transfer_type_details = TransferTypeDetail.find_by(typeid: params["typeid"])
    @transfer_commissions = TransferCommission.select{|commission| commission.typeid == params["typeid"].to_i && commission.currencyid == 840}
    @transfer_types = JSON.parse(Redis.current.get("transfer_types"))
    @transfer_type = @transfer_types.select{|x| x["TypeID"] == params["typeid"].to_i}.first
  end
  def commission_table
  	@transfer_commissions = TransferCommission.order(:minsum).select{|commission| commission.typeid == params["typeid"].to_i && 
      commission.currencyid == params["currencyid"].to_i && (commission.countryid == params["countryid"]||commission.countryid==-1)}
    respond_to do |format|    
      format.js {}
    end
  end
  def calculate_commission_fee
    @transfer_types = JSON.parse(Redis.current.get("transfer_types"))
  	respond_to do |format|      
      format.js {}      
    end
  end
  def add_def_breadcrumb
    add_breadcrumb "Виды переводов", products_transfer_types_path(params["client_type"])
  end 
end

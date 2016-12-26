class Products::TransferTypes::LocalTransfersController < ApplicationController  
    add_breadcrumb "Главная страница", :root_path 
  before_action :init_sidebar_data, only:[:index,:show_cliring_gross,:show_swift,:show_branch_transfers]
  before_action :add_def_breadcrumb, only:[:index,:show_cliring_gross,:show_swift,:show_branch_transfers]  
  def index        
    @transfer_type_details = TransferTypeDetail.all
    @transfer_types = JSON.parse(Redis.current.get("transfer_types")).select{
      |x| x["GroupID"] == 0 && (x["IsForIndividuals"] && params["client_type"].to_i == 1 || x["IsForCompanies"] && params["client_type"].to_i == 2)
    }
  end

  def show_branch_transfers
  	@branch_transfer_commissions = JSON.parse(Redis.current.get("branch_transfer_commissions"))
  	@regions = @branch_transfer_commissions.map{|x| {region_id: x["BranchID"], region_name: x["RegionName"]}}.uniq
  end
  
  def branch_transfers_commission_table
  	@branch_transfer_commissions = JSON.parse(Redis.current.get("branch_transfer_commissions"))
  	respond_to do |format|
      format.html { render plain: "commission_table" }
      format.json { render json: {"interest" => 18,"payment"=> 5699 } }
      format.js {}
    end
  end
  def branch_transfers_calculate_commission_fee
    @branch_transfer_commissions = JSON.parse(Redis.current.get("branch_transfer_commissions"))
  	respond_to do |format|
      format.html { render plain: "custom action" }
      format.js {}
      format.json { render json: {"interest" => 18,"payment"=> 5699 } }
    end
  end


  def show_cliring_gross
    @cliring_gross_commissions = JSON.parse(Redis.current.get("cliring_gross_commissions"))
  end
  
  def cliring_gross_calculate_commission_fee
    @cliring_gross_commissions = JSON.parse(Redis.current.get("cliring_gross_commissions"))
    respond_to do |format|
      format.html { render plain: "custom action" }
      format.js {}
      format.json { render json: {"interest" => 18,"payment"=> 5699 } }
    end
  end

  def show_swift
    @swift_commissions = JSON.parse(Redis.current.get("swift_commissions")).select{|x| x["CustomerTypeID"]==params["client_type"]}

  end
  
  def swift_calculate_commission_fee
    @swift_commissions = JSON.parse(Redis.current.get("swift_commissions"))
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

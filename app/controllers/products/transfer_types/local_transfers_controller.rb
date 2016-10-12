class Products::TransferTypes::LocalTransfersController < ApplicationController
  def index

  end

  def show
  	@branch_transfer_commissions = JSON.parse(Redis.current.get("branch_transfer_commissions"))
  	@regions = @branch_transfer_commissions.map{|x| {region_id: x["BranchID"], region_name: x["RegionName"]}}.uniq
  end
  
  def commission_table
  	@branch_transfer_commissions = JSON.parse(Redis.current.get("branch_transfer_commissions"))
  	respond_to do |format|
      format.html { render plain: "commission_table" }
      format.json { render json: {"interest" => 18,"payment"=> 5699 } }
      format.js {}
    end
  end
  def calculate_commission_fee
    @branch_transfer_commissions = JSON.parse(Redis.current.get("branch_transfer_commissions"))
  	respond_to do |format|
      format.html { render plain: "custom action" }
      format.js {}
      format.json { render json: {"interest" => 18,"payment"=> 5699 } }
    end
  end
end

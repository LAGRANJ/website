class Admin::DepositTypesController < ApplicationController
  layout "admin_application"
  before_action :set_deposit_type, only: [:show, :edit, :update, :destroy]

  # GET /deposit_types
  # GET /deposit_types.json
  def index
    @deposit_types = DepositType.all
    @abs_deposit_types = JSON.parse(Redis.current.get("deposit_types"))
  end

  # GET /deposit_types/1
  # GET /deposit_types/1.json
  def show
  end

  # GET /deposit_types/1/edit
  def edit    
  end

  # PATCH/PUT /deposit_types/1
  # PATCH/PUT /deposit_types/1.json
  def update
    respond_to do |format|
      if @deposit_type.update(deposit_type_params)
        format.html { redirect_to admin_deposit_type_path(@deposit_type), notice: 'Deposit type was successfully updated.' }
        format.json { render :show, status: :ok, location: @deposit_type }
      else
        format.html { render :edit }
        format.json { render json: @deposit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deposit_type
      @deposit_type = DepositType.find(params[:id])
      @abs_deposit_type = JSON.parse(Redis.current.get("deposit_types")).select{|x| x["TypeID"]==@deposit_type.type_id}.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deposit_type_params
      params.require(:deposit_type).permit(:caption, :description, :footer, :image)
    end
end

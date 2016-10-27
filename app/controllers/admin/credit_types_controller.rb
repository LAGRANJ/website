class Admin::CreditTypesController < ApplicationController
  layout "admin_application"
  before_action :set_credit_type, only: [:show, :edit, :update, :destroy]

  # GET /credit_types
  # GET /credit_types.json
  def index
    @credit_types = CreditType.all
    @abs_credit_types = JSON.parse(Redis.current.get("credit_purposes"))
  end

  # GET /credit_types/1
  # GET /credit_types/1.json
  def show
  end

  # GET /credit_types/new
  def new
    @credit_type = CreditType.new
  end

  # GET /credit_types/1/edit
  def edit 
  end

  # PATCH/PUT /credit_types/1
  # PATCH/PUT /credit_types/1.json
  def update
    respond_to do |format|
      if @credit_type.update(credit_type_params)
        format.html { redirect_to admin_credit_type_path(@credit_type), notice: 'Credit type was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_type }
      else
        format.html { render :edit }
        format.json { render json: @credit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_type
      @credit_type = CreditType.find(params[:id].to_i)
      @abs_credit_type = JSON.parse(Redis.current.get("credit_purposes")).select{|x| x["ID"]==@credit_type.type_id}.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_type_params
      params.require(:credit_type).permit(:caption, :description, :footer, :image)
    end
end

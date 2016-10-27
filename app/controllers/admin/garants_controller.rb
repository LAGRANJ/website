class Admin::GarantsController < ApplicationController
  layout "admin_application"
  before_action :set_garant, only: [:show, :edit, :update, :destroy, :destroy_image, :destroy_detail]

  # GET /garants
  # GET /garants.json
  def index
    @garants = Garant.all
  end

  # GET /garants/1
  # GET /garants/1.json
  def show
    @garant_image = GarantImage.new(garant_id: params[:id].to_i)
    @garant_detail = GarantDetail.new(garant_id: params[:id].to_i)
  end

  # GET /garants/new
  def new
    @garant = Garant.new
  end

  # GET /garants/1/edit
  def edit
  end

  # POST /garants
  # POST /garants.json
  def create
    @garant = Garant.new(garant_params)

    respond_to do |format|
      if @garant.save
        format.html { redirect_to admin_garant_path(@garant), notice: 'Garant was successfully created.' }
        format.json { render :show, status: :created, location: @garant }
      else
        format.html { render :new }
        format.json { render json: @garant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /garants/1
  # PATCH/PUT /garants/1.json
  def update
    respond_to do |format|
      if @garant.update(garant_params)
        format.html { redirect_to admin_garant_path(@garant), notice: 'Garant was successfully updated.' }
        format.json { render :show, status: :ok, location: @garant }
      else
        format.html { render :edit }
        format.json { render json: @garant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garants/1
  # DELETE /garants/1.json
  def destroy
    @garant.destroy
    respond_to do |format|
      format.html { redirect_to admin_garants_path, notice: 'Garant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_image
    @garant_image = GarantImage.new(garant_image_params)
    respond_to do |format|
      if @garant_image.save
        format.html { redirect_to admin_garant_path(@garant_image.garant), notice: 'Mini Special offer was successfully created.' }
        format.json { render :show, status: :created, location: @garant_image }
      else
        format.html { render :new }
        format.json { render json: @garant_image.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy_image
    @garant_image = GarantImage.find(params[:image_id])
    @garant_image.destroy
    respond_to do |format|
        format.html { redirect_to admin_garant_path(@garant), notice: 'Garant image was successfully destroyed.' }              
    end
  end
  def add_detail
    @garant_detail = GarantDetail.new(garant_detail_params)
    respond_to do |format|
      if @garant_detail.save
        format.html { redirect_to admin_garant_path(@garant_detail.garant), notice: 'Garant detail was successfully created.' }
        format.json { render :show, status: :created, location: @garant_detail }
      else
        format.html { render :new }
        format.json { render json: @garant_detail.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy_detail
    @garant_detail = GarantDetail.find(params[:detail_id])
    @garant_detail.destroy
    respond_to do |format|
        format.html { redirect_to admin_garant_path(@garant), notice: 'Garant detail was successfully destroyed.' }              
    end
  end
  def garant_image_params
    params.require(:garant_image).permit(:garant_id, :image_description, :image)
  end
  def garant_detail_params
    params.require(:garant_detail).permit(:garant_id, :prop_key, :prop_value)
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_garant
    @garant = Garant.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def garant_params
    params.require(:garant).permit(:name, :description, :cost, :region, :phone)
  end
end

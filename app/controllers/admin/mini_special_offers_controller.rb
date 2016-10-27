class Admin::MiniSpecialOffersController < ApplicationController
  layout "admin_application"
  before_action :set_mini_special_offer, only: [:show, :edit, :update, :destroy]

  # GET /mini_special_offers
  # GET /mini_special_offers.json 
  def index
    @mini_special_offers = MiniSpecialOffer.all
  end

  # GET /mini_special_offers/1
  # GET /mini_special_offers/1.json
  def show
  end

  # GET /mini_special_offers/new
  def new
    @mini_special_offer = MiniSpecialOffer.new
  end

  # GET /mini_special_offers/1/edit
  def edit
  end

  # POST /mini_special_offers
  # POST /mini_special_offers.json
  def create
    @mini_special_offer = MiniSpecialOffer.new(mini_special_offer_params)

    respond_to do |format|
      if @mini_special_offer.save
        format.html { redirect_to admin_mini_special_offer_path(@mini_special_offer), notice: 'Mini Special offer was successfully created.' }
        format.json { render :show, status: :created, location: @mini_special_offer }
      else
        format.html { render :new }
        format.json { render json: @mini_special_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /special_offers/1
  # PATCH/PUT /special_offers/1.json
  def update
    respond_to do |format|
      if @mini_special_offer.update(mini_special_offer_params)
        format.html { redirect_to admin_mini_special_offer_path @mini_special_offer, notice: 'Mini Special offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @mini_special_offer }
      else
        format.html { render :edit }
        format.json { render json: @mini_special_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mini_special_offers/1
  # DELETE /mini_special_offers/1.json
  def destroy
    @mini_special_offer.destroy
    respond_to do |format|
      format.html { redirect_to admin_mini_special_offers_url, notice: 'Mini Special offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mini_special_offer
      @mini_special_offer = MiniSpecialOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mini_special_offer_params
      params.require(:mini_special_offer).permit(:caption, :description, :body, :creation_date, :priority, :image, :caption_text_color, :description_text_color, :enabled)
    end
end

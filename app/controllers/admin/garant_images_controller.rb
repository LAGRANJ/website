class Admin::GarantImagesController < ApplicationController
  def create
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
  def destroy
  end
  def garant_image_params
    params.require(:garant_image).permit(:garant_id, :image_description)
  end
end

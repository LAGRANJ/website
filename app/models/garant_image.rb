class GarantImage < ApplicationRecord
  belongs_to :garant
  has_attached_file :image, styles: { small: "100x75", med: "200x150", large: "400x300" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  
  private

  def file_dimensions(width = 322, height = 318)
    dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)
    unless dimensions.width == width && dimensions.height == height
      errors.add :image, "Width must be #{width}px and height must be #{height}px"
    end
  end
end

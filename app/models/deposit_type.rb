class DepositType < ApplicationRecord
  has_attached_file :image, styles: { small: "64x64", med: "128x128", large: "520x270" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validate :file_dimensions
  private

  def file_dimensions(width = 620, height = 270)
    if image!=nil && image.queued_for_write[:original]!=nil
      dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)
      unless dimensions.width == width && dimensions.height == height
        errors.add :image, "Width must be #{width}px and height must be #{height}px"
      end
    end
  end
end

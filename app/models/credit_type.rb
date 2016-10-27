class CreditType < ApplicationRecord
  has_attached_file :image, styles: { small: "60x40", med: "120x80", large: "600x400" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validate :file_dimensions
  private

  def file_dimensions(width = 600, height = 400 )
    if image!=nil && image.queued_for_write[:original]!=nil
      dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)
      unless dimensions.width == width && dimensions.height == height
        errors.add :image, "Width must be #{width}px and height must be #{height}px"
      end
    end
  end
end

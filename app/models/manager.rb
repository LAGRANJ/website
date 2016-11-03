class Manager < ApplicationRecord
	has_attached_file :photo, styles: { small: "75x100", med: "150x200", large: "300x400" }
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  
  private

  def file_dimensions(width = 322, height = 318)
    dimensions = Paperclip::Geometry.from_file(photo.queued_for_write[:original].path)
    unless dimensions.width == width && dimensions.height == height
      errors.add :photo, "Width must be #{width}px and height must be #{height}px"
    end
  end	
end

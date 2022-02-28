class Stack < ApplicationRecord
  has_one_attached :picture
  has_many :projects_stacks, dependent: :destroy

  validate :picture_format
  validates :name, presence: true

  def resize_image
    resized_image = MiniMagick::Image.read(picture.download)
    resized_image = resized_image.resize "400x400"
    v_filename = picture.filename
    v_content_type = picture.content_type
    picture.purge
    picture.attach(io: File.open(resized_image.path), filename:  v_filename, content_type: v_content_type)
  end

  private

  def picture_format
    return unless picture.attached?

    if picture.blob.content_type.start_with? 'image/'
      if picture.blob.byte_size > 10.megabytes
        errors.add(:picture, 'O tamanho do arquivo tem de ser até 10MB')
        picture.purge
      else
        resize_image
      end
    else
      picture.purge
      errors.add(:picture, 'precisa ser no formato image')
    end
  end
end

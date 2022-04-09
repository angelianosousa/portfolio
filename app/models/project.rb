class Project < ApplicationRecord
  has_many :projects_stacks, dependent: :destroy
  has_one_attached :thumbnail
  
  validate :thumbnail_format
  validates :title, :production_link, :repository_link, presence: true
  accepts_nested_attributes_for :projects_stacks, reject_if: :all_blank, allow_destroy: true

  paginates_per 9

  def resize_image
    resized_image = MiniMagick::Image.read(thumbnail.download)
    resized_image = resized_image.resize "450x388"
    v_filename = thumbnail.filename
    v_content_type = thumbnail.content_type
    thumbnail.purge
    thumbnail.attach(io: File.open(resized_image.path), filename:  v_filename, content_type: v_content_type)
  end

  private

  def thumbnail_format
    return unless thumbnail.attached?

    if thumbnail.blob.content_type.start_with? 'image/'
      if thumbnail.blob.byte_size > 10.megabytes
        errors.add(:thumbnail, 'O tamanho do arquivo tem de ser 10MB')
        thumbnail.purge
      else
        resize_image
      end
    else
      thumbnail.purge
      errors.add(:thumbnail, 'precisa ser no formato image')
    end
  end

  scope :search_project, -> (title, page){ 
    where("lower(title) LIKE ?", "%#{title.downcase}%").includes(:projects_stacks).page(page).with_attached_thumbnail
  }
end

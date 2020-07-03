class Picture < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: 'must be a valid image format' },
                    dimension: { width: { min: 200, max: 1000 },
                                 height: { min: 200, max: 1000 },
                                 message: 'is not given between dimension' }
end

class Entry < ApplicationRecord

  belongs_to :user
  has_many :comments
  mount_uploader :picture, PictureUploader
  validates :user, presence: true
  validates :body, presence: true, length: {maximum: 150}
  validate :picture_size
  scope :following_ids, -> (user_id, following_ids) {where(
    "user_id = ? OR user_id IN (?)", user_id, following_ids)}

  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, "should be less than 5MB"
    end
  end
end

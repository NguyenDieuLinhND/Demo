class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :entry
  validates :user, presence: true
  validates :entry, presence: true
  validates :comment, presence: true
end

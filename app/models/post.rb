class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :category, presence: true
  validates :title, presence: true, length: { maximum:50 }
  validates :content, presence: true, length: { maximum:500 }
end

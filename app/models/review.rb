class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  has_many :comments
  validates :user_id, presence: true
  validates :book_id, presence: true
end

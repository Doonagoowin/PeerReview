class Post < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  belongs_to :user
end

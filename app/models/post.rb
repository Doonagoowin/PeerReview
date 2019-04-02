class Post < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :tags
end

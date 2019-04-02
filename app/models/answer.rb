class Answer < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :answer_comments,  dependent: :destroy
end

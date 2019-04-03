class User < ApplicationRecord
          
            include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :posts
has_many :answers
has_many :post_comments
has_many :answer_comments
belongs_to :cohort

end

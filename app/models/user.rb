class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tips , dependent: :destroy
  has_many :sells, dependent: :destroy
  has_many :gives, dependent: :destroy
  has_many :sellcomments, dependent: :destroy
  has_many :tipcomments, dependent: :destroy
  has_many :givecomments, dependent: :destroy
  has_many :needcomments, dependent: :destroy
  has_many :noticecomments, dependent: :destroy
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,authentication_keys: [:name]

  validates :name,
   length: { minimum: 2, maximum: 20 }, uniqueness: true

   validates :profile,length: {maximum: 50}
   has_many :post_comments, dependent: :destroy
   has_many :favorites, dependent: :destroy

   has_many :books, dependent: :destroy

   attachment :profile_image




end

class Book < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :body, presence: true
  validates :body,length: {maximum: 200}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
      Book.where(['title LIKE ?', "%#{search}%"])
    else

    end
  end

end

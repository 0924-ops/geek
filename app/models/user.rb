class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
:recoverable, :rememberable, :validatable
has_many :tweets,dependent: :destroy
validates :name, presence: true
  validates :profile, length: { maximum: 200 }
has_many :likes, dependent: :destroy
has_many :liked_tweets, through: :likes, source: :tweet
has_one_attached :image 
def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
end
end

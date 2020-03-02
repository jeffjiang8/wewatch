class User < ApplicationRecord
    has_secure_password
    validates :user_name, :first_name, :last_name, :age, :password, :phone_number, presence: true
    validates :phone_number, length: { is: 10 }
    validates :user_name, :phone_number, uniqueness: true

    has_many :views
    has_many :shows, through: :views
    has_many :follows
    has_many :user_achievements
    has_many :achievements, through: :user_achievements
    has_many :comments
    has_many :watches
    has_many :episodes, through: :watches

    # following
    has_many :followings
    has_many :followed_users, through: :followings

    has_many :followers, foreign_key: :followed_user_id, class_name: 'Following'
    has_many :follower_users, through: :followers, source: :user
end


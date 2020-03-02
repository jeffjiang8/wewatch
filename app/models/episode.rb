class Episode < ApplicationRecord
    belongs_to :season
    has_many :comments

    has_many :watches
    has_many :users, through: :watches
end
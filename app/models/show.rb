class Show < ApplicationRecord
    has_many :views
    has_many :users, through: :views
    has_many :seasons
    has_many :ratings

    def self.search_shows(query)
        Show.where("lower(name) LIKE ?", "%#{query.downcase}%")
    end 

    def self.check_out
        Show.all.sample(8)
    end

end

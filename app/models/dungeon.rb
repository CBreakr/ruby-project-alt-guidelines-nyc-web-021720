class Dungeon < ActiveRecord::Base
    has_many :levels
    has_many :encounters, through: :levels
    has_many :campaigns
    has_many :users, through: :campaigns
end
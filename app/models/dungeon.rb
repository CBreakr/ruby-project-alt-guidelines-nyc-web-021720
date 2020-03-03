class Dungeon < ActiveRecord::Base
    has_many :levels
    has_many :encounters, through: :levels
end
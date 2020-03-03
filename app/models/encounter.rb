class Encounter < ActiveRecord::Base
    belongs_to :monster
    has_many :levels
    has_many :dungeons, through: :levels
end
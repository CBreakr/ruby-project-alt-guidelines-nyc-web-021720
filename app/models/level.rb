class Level < ActiveRecord::Base
    belongs_to :dungeon
    belongs_to :encounter
end
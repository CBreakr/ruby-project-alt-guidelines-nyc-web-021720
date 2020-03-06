class Encounter < ActiveRecord::Base
    belongs_to :monster
    has_many :levels
    has_many :dungeons, through: :levels

    def display
        "#{monster.name} x #{num_enemies} (id::#{id})"
    end
    
    #
    def self.get_encounter_id_from_display_string(option)
        option.split("::")[1].gsub(")", "")
    end
    
    #
    def self.find_by_display_string(display_string)
        find(get_encounter_id_from_display_string(display_string))
    end

    #
    def get_difficulty
        0.2 + 0.005 * (monster.challenge + 0.5) * num_enemies
    end
end
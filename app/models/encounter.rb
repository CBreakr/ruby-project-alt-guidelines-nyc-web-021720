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
end
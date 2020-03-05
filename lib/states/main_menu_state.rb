require_relative './base_campaign_state'
require_relative './base_encounter_state'
require_relative './base_dungeon_state'

class MainMenuState < State

    def initialize
        super
        @use_back = false
    end
    
    def start_up(input_value, user_id)
        ["Encounters", "Dungeons", "Campaigns"]
    end

    def select_option(choice, input_value, user_id) 
        if choice == "Encounters" then
            [BaseEncounterState.new, nil]
        elsif choice == "Dungeons"
            [BaseDungeonState.new, nil]
        elsif choice == "Campaigns"
            [BaseCampaignState.new, nil]
        end
    end
end
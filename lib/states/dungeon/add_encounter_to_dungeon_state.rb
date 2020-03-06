require_relative './base_dungeon_state'

class AddEncounterToDungeonState < State
    def start_up(input_value, user_id)
        puts "ADD ENCOUNTER TO DUNGEON STATE".yellow
        options = ["DONE"]
        options += Encounter.all.map do |enc|
            enc.display
        end
    end

    def run_back(options, input_value, user_id, choice)
        [BaseDungeonState.new, nil]
    end

    def select_option(choice, input_value, user_id)
        if choice == "DONE"
            [BaseDungeonState.new,nil]
        else
            enc = Encounter.find_by_display_string(choice)
            Level.create(dungeon: input_value, encounter: enc)
            [self, input_value]
        end
    end
end
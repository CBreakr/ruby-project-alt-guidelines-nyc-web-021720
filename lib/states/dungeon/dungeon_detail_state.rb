require_relative './base_dungeon_state'
require_relative './dungeon_name_state'

class DungeonDetailState < State

    def header_text
        "DUNGEON DETAILS"
    end

    def start_up(input_value, user_id)
        puts "Dungeon name: #{input_value.name} Difficulty: #{input_value.difficulty}"
        options = ["Edit name", "Edit difficulty", "Add encounter"]
        options += input_value.levels.all.map do |level|
            "Remove from dungeon: ".red + level.encounter.display
        end
        options << "Delete this dungeon"
    end

    def run_back(options, input_value, user_id, choice)
        [BaseDungeonState.new, nil]
    end

    def select_option(choice, input_value, user_id)
        if choice == "Edit name"
            [DungeonNameState.new, input_value]
        elsif choice == "Edit difficulty"  
            [DungeonDifficultyState.new, input_value]
        elsif choice == "Add encounter"
            [AddEncounterToDungeonState.new, input_value]
        elsif choice == "Delete this dungeon"
            input_value.delete
            [BaseDungeonState.new, nil]
        else
            if confirmation?
                enc = Encounter.find_by_display_string(choice.gsub("Remove from dungeon: ", ""))
                input_value.levels.find do |level|
                    level.encounter == enc
                end.delete
                [self, input_value]
            else
                [self, input_value]
            end
        end
        
    end
end


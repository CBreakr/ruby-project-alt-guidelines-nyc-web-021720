require_relative './add_encounter_to_dungeon_state'
require_relative './dungeon_name_state'
require_relative './dungeon_detail_state'


class DungeonDifficultyState < State
    def initialize
        super
        @use_options = false
    end

    def header_text
        "DUNGEON DETAILS"
    end

    def start_up(input_value, user_id)
        if input_value
            puts "current dungeon: #{input_value.name}, difficulty #{input_value.difficulty}"
        end
        puts "> Enter dungeon difficulty as a " + "number".red
    end

    def run_back(options, input_value, user_id, choice)
        if input_value
            [DungeonDetailState.new, input_value]
        else
            [DungeonNameState.new, nil]
        end
    end

    def select_option(choice, input_value, user_id)
        choice_as_num = choice.to_i
        if choice_as_num > 0
            if input_value
                input_value.update(difficulty: choice_as_num)
                [DungeonDetailState.new, input_value]
            else
                dun = Dungeon.create(name: input_value, difficulty: choice_as_num)
                [AddEncounterToDungeonState.new, dun]
            end
        else
            false
        end
    end
end
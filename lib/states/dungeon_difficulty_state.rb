require_relative './add_encounter_to_dungeon_state'
require_relative './dungeon_name_state'


class DungeonDifficultyState < State
    def initialize
        super
        @use_options = false
    end

    def start_up(input_value, user_id)
        puts "Enter dungeon difficulty as a " + "number".red
    end

    def run_back(options, input_value, user_id, choice)
        [DungeonNameState.new, nil]
    end

    def select_option(choice, input_value, user_id)
        choice_as_num = choice.to_i
        if choice_as_num > 0
            dun = Dungeon.create(name: input_value, difficulty: choice_as_num)
            [AddEncounterToDungeonState.new, dun]
        else
            false
        end
    end
end
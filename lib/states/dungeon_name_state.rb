require_relative './base_dungeon_state'
require_relative './dungeon_difficulty_state'
require_relative './dungeon_detail_state'

class DungeonNameState < State

    def initialize
        super
        @use_options = false
    end

    def start_up(input_value, user_id)        
        if input_value
            puts "current dungeon: #{input_value.name}"
        end
        puts "Enter dungeon name"
    end

    def run_back(options, input_value, user_id, choice)
        if input_value
            [DungeonDetailState.new, input_value]
        else
            [BaseDungeonState.new, nil]
        end
    end

    def select_option(choice, input_value, user_id)
        if input_value
            input_value.update(name: choice)
            [DungeonDetailState.new, input_value]
        else
            [DungeonDifficultyState.new, choice]
        end
    end
end
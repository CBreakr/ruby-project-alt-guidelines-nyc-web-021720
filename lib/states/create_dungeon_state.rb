require_relative './base_dungeon_state'
require_relative './dungeon_difficulty_state'

class CreateDungeonState < State

    def initialize
        super
        @use_options = false
    end

    def start_up(input_value, user_id)        
        puts "Enter dungeon name"
    end

    def run_back(options, input_value, user_id, choice)
        [BaseDungeonState.new, nil]
    end

    def select_option(choice, input_value, user_id)
        [DungeonDifficultyState.new, choice]
    end
end
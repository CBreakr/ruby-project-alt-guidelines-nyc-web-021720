require_relative './dungeon_name_state'
require_relative './dungeon_detail_state'

class BaseDungeonState < State

    def header_text
        "DUNGEON BASE"
    end

    def start_up(input_value, user_id)
        options = ["Create new dungeon"]
        options += Dungeon.all.map do |dungeon|
            dungeon.name
        end        
        options
    end

    def run_back(options, input_value, user_id, choice)
        [MainMenuState.new, nil]
    end

    def select_option(choice, input_value, user_id)
        if choice == "Create new dungeon" then
            [DungeonNameState.new, nil]
        else
            dun = Dungeon.find_by(name: choice)
            [DungeonDetailState.new, dun]
        end
    end
end
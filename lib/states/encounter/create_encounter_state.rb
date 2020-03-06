require_relative './create_encounter_state'
require_relative './number_of_monsters_state'

class CreateEncounterState < State

    def header_text
        "CREATE ENCOUNTER"
    end

    def start_up(input_value, user_id)        
        puts "Select monster"
        Monster.all.map do |monster|
            monster.name
        end
    end

    def run_back(options, input_value, user_id, choice)
        [CreateEncounterState.new, nil]
    end

    def select_option(choice, input_value, user_id)
        monster = Monster.find_by(name: choice)
        [NumberOfMonstersState.new, monster]
    end
end
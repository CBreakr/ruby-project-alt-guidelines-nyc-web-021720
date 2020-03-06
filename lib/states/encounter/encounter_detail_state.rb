require_relative './base_encounter_state'
require_relative './number_of_monsters_state'

class EncounterDetailState < State
    def start_up(input_value, user_id)
        puts input_value.display.blue
        ["Change Number of Monsters", "Delete Encounter"]
    end

    def run_back(options, input_value, user_id, choice)
        [BaseEncounterState.new, nil]
    end

    def select_option(choice, input_value, user_id)
        if choice == "Change Number of Monsters" then
            [NumberOfMonstersState.new, input_value]
        elsif choice == "Delete Encounter" then
            if confirmation? then
                input_value.delete
                [BaseEncounterState.new, nil]
            else
                [self, input_value]
            end
        end
    end
end
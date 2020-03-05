require_relative './create_encounter_state'
require_relative './encounter_detail_state'

class BaseEncounterState < State
    def start_up(input_value, user_id)
        options = ["Create new encounter"]
        options += Encounter.all.map do |enc|
            "#{enc.monster.name} x #{enc.num_enemies} (id::#{enc.id})"
        end        
        options
    end

    def run_back(options, input_value, user_id, choice)
        [MainMenuState.new, nil]
    end

    def select_option(choice, input_value, user_id)
        if choice == "Create new encounter" then
            [CreateEncounterState.new, nil]
        else
            enc = Encounter.find(get_encounter_id(choice))
            [EncounterDetailState.new, enc]
        end
    end

    #
    def get_encounter_id(option)
        option.split("::")[1].gsub(")", "")
    end
end
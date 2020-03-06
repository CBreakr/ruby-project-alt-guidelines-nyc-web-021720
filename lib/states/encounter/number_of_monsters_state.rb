require_relative './create_encounter_state'
require_relative './base_encounter_state'
require_relative './encounter_detail_state'

class NumberOfMonstersState < State

    def header_text
        "NUMBER OF MONSTERS"
    end

    def initialize
        super
        @use_options = false
    end

    def start_up(input_value, user_id)
        if is_input_monster?(input_value) then
            puts "> enter the number of #{input_value.name} in this encounter"
        else
            puts "currently #{input_value.num_enemies} of #{input_value.monster.name} in this encounter"
            puts "> how many would you like instead?"
        end
    end

    def run_back(options, input_value, user_id, choice)
        if is_input_monster?(input_value) then
            [CreateEncounterState.new, nil]
        else
            [EncounterDetailState.new, input_value]
        end
    end

    def select_option(choice, input_value, user_id)
        choice_as_num = choice.to_i
        if choice_as_num > 0 then
            if is_input_monster?(input_value) then
                Encounter.create(monster: input_value, num_enemies: choice_as_num)
            else
                input_value.update(num_enemies: choice_as_num)
            end

            [BaseEncounterState.new, nil]
        else 
            false
        end
    end

    def is_input_monster?(input_val)
        input_val.is_a?(Monster)
    end
end
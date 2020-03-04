require_relative "./state"

class MainMenuState < State

    def initialize
        @use_back = false
    end
    
    def start_up(input_value, user)
        ["Create new campaign", "View existing campaigns"]
    end

    def select_option(options, input_value, user, choice_num)     
        puts "chose option: #{choice_num}"
        if choice_num == 1 then
            puts "you chose: #{options[choice_num-1]}"
            puts "should be Create new campiagn"
            # [CreateCampaignState.new, nil]
        else
            puts "you chose: #{options[choice_num-1]}"
            puts "should be View existing campaign"
            # [SelectCampignState.new,  nil]
        end
    end
end
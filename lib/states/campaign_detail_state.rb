require_relative './create_campaign_state'
require_relative './view_campaign_state'

class CampaignDetailState < State
    def start_up(input_value, user)
        puts "Campaign selected: #{input_value.dungeon.name}"
        puts "Campaign defeat status: #{input_value.defeated}"
        puts "Attempts at this Campaign: #{input_value.num_attempts}"
        puts ""
        ["run", "edit", "delete"]
    end

    def run_back(options, input_value, user, choice)
        [ViewCampaignState.new, nil]
    end

    def select_option(options, input_value, user, choice_num)
        #possibly abstract assigning choice_num to a variable
        command = options[choice_num - 1]
        if command == "run"
            puts "the game is starting"
        elsif command == "edit"
            [CreateCampaignState.new, input_value]
        elsif command == "delete"
            binding.pry
            input_value.destroy
            [MainMenuState.new, nil]
        end
    end
end

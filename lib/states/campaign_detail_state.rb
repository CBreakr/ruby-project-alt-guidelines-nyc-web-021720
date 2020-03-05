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

    def select_option(choice, input_value, user)
        #possibly abstract assigning choice_num to a variable
        if choice  == "run"
            puts "the game is starting"
        elsif choice == "edit"
            [CreateCampaignState.new, input_value]
        elsif choice == "delete"
            input_value.destroy
            binding.pry
            [MainMenuState.new, nil]
        end
    end
end

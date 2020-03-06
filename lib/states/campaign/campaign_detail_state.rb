require_relative './create_campaign_state'
require_relative '../main_menu_state'
require_relative './base_campaign_state'

class CampaignDetailState < State
    def start_up(input_value, user_id)
        puts "Campaign selected: #{input_value.dungeon.name}"
        puts "Campaign defeat status: #{input_value.defeated}"
        puts "Attempts at this Campaign: #{input_value.num_attempts}"
        puts ""
        ["run", "delete"]
    end

    def run_back(options, input_value, user_id, choice)
        [BaseCampaignState.new, nil]
    end

    def select_option(choice, input_value, user_id)
        #possibly abstract assigning choice_num to a variable
        if choice  == "run"
            run_game(input_value)
            [BaseCampaignState.new, nil]
        elsif choice == "delete"
            if confirmation? then
                input_value.destroy
                [MainMenuState.new, nil]
            else
                [self, input_value]
            end
        end
    end

    def run_game(campaign)
        puts "the game is starting".green
        success = true
        campaign.dungeon.encounters.each do |enc|
            puts "now fighting: "
            puts enc.display
            if !determine_success(enc) then
                success = false
                break
            end
        end

        campaign.num_attempts += 1

        if success then
            campaign.defeated = true
            puts "you are victorious!"
        else
            puts "you have been defeated!"
        end

        campaign.save
    end

    def determine_success(encounter)
        rand > 0.2
    end
end

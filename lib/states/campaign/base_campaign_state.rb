require_relative '../main_menu_state'
require_relative './create_campaign_state'
require_relative './campaign_detail_state'

class BaseCampaignState < State

    def header_text
        "CAMPAIGNS BASE"
    end

    def initialize
        super
        @use_main_menu = false
    end

    def start_up(input_value, user_id)
        options = ["Create new campaign"] + User.find(user_id).campaigns.map do |campaign|
            campaign.display
        end
    end

    def run_back(options, input_value, user_id, choice)
        [MainMenuState.new, nil]
    end

    def select_option(choice, input_value, user_id)
        if choice == "Create new campaign"
            [CreateCampaignState.new, nil]
        else
            [CampaignDetailState.new, Campaign.find_by_display_string(choice)]
        end
    end
end
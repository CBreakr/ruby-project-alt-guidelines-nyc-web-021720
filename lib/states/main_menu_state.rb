require_relative './view_campaign_state'
class MainMenuState < State

    def initialize
        @use_back = false
    end
    
    def start_up(input_value, user)
        ["Create new campaign", "View existing campaigns"]
    end

    def select_option(options, input_value, user, choice_num)     
        if choice_num == 1 then
            [CreateCampaignState.new, nil]
        else
            [ViewCampaignState.new,  nil]
        end
    end
end
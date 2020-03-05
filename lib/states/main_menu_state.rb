require_relative './view_campaign_state'
class MainMenuState < State

    def initialize
        super
        @use_back = false
    end
    
    def start_up(input_value, user)
        ["Create new Campaign", "View existing campaigns"]
    end

    def select_option(choice, input_value, user) 
        if choice == "Create new Campaign" then
            [CreateCampaignState.new, nil]
        else choice == "View existing campaigns"
            [ViewCampaignState.new,  nil]
        end
    end
end
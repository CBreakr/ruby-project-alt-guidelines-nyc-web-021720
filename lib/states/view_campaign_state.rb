require_relative './main_menu_state'
class ViewCampaignState < State
    def start_up(input_value, user)
        puts "These are the available campaigns"
        # binding.pry
        user.campaigns.map do |campaign|
            campaign.dungeon.name
        end
    end

    def run_back(options, input_value, user, choice)
        [MainMenuState.new, nil]
    end

    def select_option(options, input_value, user, choice_num)
        selected_camp = user.campaigns.find do |campaign|
            campaign.dungeon.name == options[choice_num - 1]
        end
        [CampaignDetailState.new, selected_camp]
    end
end

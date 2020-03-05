require_relative './campaign_detail_state'
class CreateCampaignState < State

    def start_up(input_value, user)
        puts "These are the available dungeons"
        puts "Which level do you want to add to your Campaign?"
        Dungeon.all.map {|dungeon| dungeon.name}
    end

    def run_back(options, input_value, user, choice)
        if input_value
            #go to campaign_details_state
            [CampaignDetailState.new, input_value]
        else
            #go to main menu state
            [MainMenuState.new, nil]
        end
    end

    def select_option(options, input_value, user, choice_num)
        dungeon_name = options[choice_num -1]
        puts "you added level #{dungeon_name}"
        found_dun = Dungeon.find_by(name: dungeon_name)
        Campaign.create(user: user, dungeon: found_dun)
        [MainMenuState.new, nil]
    end
end

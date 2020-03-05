require_relative './campaign_detail_state'
class CreateCampaignState < State

    def start_up(input_value, user_id)
        puts "These are the available dungeons"
        puts "Which level do you want to add to your Campaign?"
        Dungeon.all.map {|dungeon| dungeon.name}
    end

    def run_back(options, input_value, user_id, choice)
        if input_value
            #go to campaign_details_state
            [CampaignDetailState.new, input_value]
        else
            #go to main menu state
            [MainMenuState.new, nil]
        end
    end

    def select_option(choice, input_value, user_id)
        dungeon_name = choice
        puts "you added level #{dungeon_name}"
        found_dun = Dungeon.find_by(name: dungeon_name)
        Campaign.create(user_id: user_id, dungeon: found_dun)
        [MainMenuState.new, nil]
    end
end

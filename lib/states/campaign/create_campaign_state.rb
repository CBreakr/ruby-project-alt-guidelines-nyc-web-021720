require_relative './campaign_detail_state'
require_relative './base_campaign_state'

class CreateCampaignState < State

    def header_text
        "CREATE CAMPAIGN"
    end

    def start_up(input_value, user_id)
        puts "These are the available dungeons"
        puts "Which level do you want to add to your Campaign?"
        Dungeon.all.map {|dungeon| dungeon.name}
    end

    def run_back(options, input_value, user_id, choice)
        #go to main menu state
        [BaseCampaignState.new, nil]
    end

    def select_option(choice, input_value, user_id)
        dungeon_name = choice
        puts "you added level #{dungeon_name}"
        found_dun = Dungeon.find_by(name: dungeon_name)
        Campaign.create(user_id: user_id, dungeon: found_dun)
        [BaseCampaignState.new, nil]
    end
end

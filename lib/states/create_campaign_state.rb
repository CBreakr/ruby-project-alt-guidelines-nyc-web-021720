class CreateCampaignState < State

    def start_up(input_value, user)
        Dungeon.all.map {|dungeon| dungeon.name}
    end

    def select_option(options, input_value, user, choice_num)

    end
end

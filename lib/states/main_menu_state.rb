class MainMenuState < State
    
    def start_up(input_value, user)
        ["Create new campaign", "View existing campaigns"]
    end

    def interpret(options, input_value, user, choice)
        choice_num = choice.to_i
        
        if  choice.to_i > 0 ||  choice_num <= options.length
            if choice = 1
                [CreateCampaignState, nil]
            else
                [SelectCampignState,  nil]
            end
        else
            false
        end 
    end
end
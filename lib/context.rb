class Context
    def start (starting_state, user_id)
        current_state = starting_state
        next_input = nil
        # checks to see if current state is not nil
        while current_state 
            # current_state.run returns an array with two elements
            current_state, next_input = current_state.run(next_input, user_id)
            # current_state.run(next_input, user)
            # current_state = MainMenuState
            # next_input =  nil
        end
    end
end


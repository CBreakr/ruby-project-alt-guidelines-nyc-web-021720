class State
    def run(input_value, user)
        options = start_up(input_value, user)
        display_options(options)
        evaluate(options, input_value, user)
    end
    
    def start_up(input_value, user)
    end

    # options is an array
    def display_options(options)
        options.each_with_index do |option, index|
            puts "#{index + 1}: #{option}"
        end
    end

    def interpret(options, input_value, user, choice)
    end

    # return is going to be an array [next_state, output_value]
    def evaluate(options, input_value, user)
        choice = gets.chomp
        result = interpret(options, input_value, user, choice)
        # if result is nonsense, then re-run evaluate
        # if result is back, the go back
        # if result is quit, then return an array [nil, nil]
        # if result is finish, then perform finish

        if result
            result
        else
            evaluate(options, input_value, user)
        end

    end
end

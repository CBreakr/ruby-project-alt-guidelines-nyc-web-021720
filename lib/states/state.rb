class State
    attr_accessor :use_back

    def initialize
        @use_back = true
    end

    #
    def run(input_value, user)
        options = start_up(input_value, user)
        display_options(options)
        evaluate(options, input_value, user)
    end
    
    #
    def start_up(input_value, user)
    end

    # options is an array
    def display_options(options)
        options.each_with_index do |option, index|
            puts "#{index + 1}: #{option}"
        end

        if(@use_back) then
            puts "enter b to go back to previous menu"
        end
        puts "enter q to quit"
    end

    # return is going to be an array [next_state, output_value]
    def evaluate(options, input_value, user)
        choice = gets.chomp
        
        result = interpret_defaults(options, input_value, user, choice)

        result ||= interpret(options, input_value, user, choice)
        
        # if result is nonsense, then re-run evaluate
        # if result is back, the go back
        # if result is quit, then return an array [nil, nil]
        # if result is finish, then perform finish

        if result then
            result
        else
            evaluate(options, input_value, user)
        end
    end

    #
    def interpret_defaults(options, input_value, user, choice)
        if (@use_back && choice == "b") then
            run_back(options, input_value, user, choice)
        elsif(choice == "q") then
            return [nil, nil]
        end

        return nil
    end

    #
    def run_back(options, input_value, user, choice)
        puts "go back!"
        false
    end

    #
    def interpret(options, input_value, user, choice)        
        choice_num = choice.to_i
        
        if valid_choice?(choice_num, options) then
            select_option(options, input_value, user, choice_num)
        else
            false
        end
    end

    #
    def select_option(options, input_value, user, choice_num)
    end

    #
    def valid_choice?(choice_num, options)
        choice_num > 0 && choice_num <= options.length
    end
end

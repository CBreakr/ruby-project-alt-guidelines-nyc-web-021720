class State
    attr_accessor :use_back, :use_options

    def initialize
        @use_back = true
        @use_options = true
    end

    #
    def run(input_value, user_id)
        options = start_up(input_value, user_id)
        display_messages(options)
        evaluate(options, input_value, user_id)
    end
    
    #
    def start_up(input_value, user_id)
    end

    # options is an array
    def display_messages(options)
        if @use_options
            options.each_with_index do |option, index|
                puts "#{index + 1}: #{option}"
            end
        else
            puts options
        end

        if(@use_back) then
            puts "enter b to go back to previous menu"
        end
        puts "enter q to quit"
    end

    # return is going to be an array [next_state, output_value]
    def evaluate(options, input_value, user_id)
        choice = gets.chomp
        
        result = interpret_defaults(options, input_value, user_id, choice)
        
        # binding.pry
        result ||= interpret(options, input_value, user_id, choice)
        
        # if result is nonsense, then re-run evaluate
        # if result is back, the go back
        # if result is quit, then return an array [nil, nil]
        # if result is finish, then perform finish

        if result then
            result
        else
            evaluate(options, input_value, user_id)
        end
    end

    #
    def interpret_defaults(options, input_value, user_id, choice)
        if (@use_back && choice == "b") then
            return run_back(options, input_value, user_id, choice)
        elsif(choice == "q") then
            return [nil, nil]
        end

        return nil
    end

    #
    def run_back(options, input_value, user_id, choice)
        false
    end

    #
    def interpret(options, input_value, user_id, choice)        
        # 
        if @use_options
            choice_num = choice.to_i
            
            if valid_choice?(choice_num, options) then
                select_option(options[choice_num - 1], input_value, user_id)
            else
                false
            end
        else
            select_option(choice, input_value, user_id)
        end
    end

    #
    def select_option(choice, input_value, user_id)
    end

    #
    def valid_choice?(choice_num, options)
        choice_num > 0 && choice_num <= options.length
    end

    #
    def confirmation?
        puts "Are you sure? (y/n)".red
        response = gets.chomp
        while !is_yes_or_no?(response)
            response = gets.chomp
        end

        response.downcase == "y" ? true : false        
    end

    #
    def is_yes_or_no?(val)
        val.downcase == "y" || val.downcase == "n"
    end
end

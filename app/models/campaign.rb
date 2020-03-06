class Campaign < ActiveRecord::Base
    belongs_to :user
    belongs_to :dungeon

    def display
        defeated_status = self.defeated ? ", " + "DEFEATED".green : ""
        str =  "#{dungeon.name}" + ", difficulty: #{difficulty_score}".yellow + "#{defeated_status}, attempts: #{num_attempts} (id::#{id})"
        # defeated ? str.red : str.green
    end

    def self.find_by_display_string(display_string)
        find(display_string.split("::")[1].gsub(")", ""))
    end

    def run
        success = true
        dungeon.encounters.each do |enc|
            puts "now fighting: "
            puts enc.display
            if !determine_success(enc) then
                success = false
                break
            end
        end

        self.num_attempts = self.num_attempts + 1

        if success then
            self.defeated = true
            puts "you are victorious!".green
        else
            puts "you have been defeated!".red
        end

        self.save
    end

    def determine_success(encounter)        
        rand > encounter.get_difficulty
    end

    def difficulty_score
        dungeon.difficulty_score
    end
end
class Campaign < ActiveRecord::Base
    belongs_to :user
    belongs_to :dungeon

    def display
        str =  "#{dungeon.name}, attempts: #{num_attempts} (id::#{id})"
        defeated ? str.red : str.green
    end

    def self.find_by_display_string(display_string)
        find(display_string.split("::")[1].gsub(")", ""))
    end
end
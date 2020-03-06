class Dungeon < ActiveRecord::Base
    has_many :levels
    has_many :encounters, through: :levels
    has_many :campaigns
    has_many :users, through: :campaigns

    def difficulty_score
        # how do I want to calculte this, based on encounters?
        # this would be based more on the highest than the average

        # base it on the probability!

        score = (1 - self.encounters.reduce(1) do |total, enc|
            total *= (1 - enc.get_difficulty)
        end) * 100

        '%.1f' % score
    end
end
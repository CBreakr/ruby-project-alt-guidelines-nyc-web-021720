class FixMonsterChallenge < ActiveRecord::Migration[5.2]
  def change
    remove_column :monsters, :dc_value
    add_column :monsters, :challenge, :integer
  end
end

class FixMonsterTypeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :monsters, :type
    add_column :monsters, :monster_type, :string
  end
end

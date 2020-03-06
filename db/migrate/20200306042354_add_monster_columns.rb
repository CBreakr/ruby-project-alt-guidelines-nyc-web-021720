class AddMonsterColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :armor_class, :integer
    add_column :monsters, :type, :string
    add_column :monsters, :dc_value, :integer
  end
end

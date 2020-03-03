class CreateDungeons < ActiveRecord::Migration[5.2]
  def change
    create_table :dungeons do |table|
      table.string :name
      table.integer :difficulty
    end
  end
end

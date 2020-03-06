class RemoveDungeonDifficulty < ActiveRecord::Migration[5.2]
  def change
    remove_column :dungeons, :difficulty
  end
end

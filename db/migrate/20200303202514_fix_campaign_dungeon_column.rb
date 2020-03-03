class FixCampaignDungeonColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :campaigns, :dengeon_id
    add_column :campaigns, :dungeon_id, :integer
  end
end

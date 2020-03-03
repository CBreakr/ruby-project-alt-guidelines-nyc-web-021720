class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |table|
      table.integer :user_id
      table.integer :dengeon_id
      table.boolean :defeated, default: false
      table.integer :num_attempts, default: 0
    end
  end
end
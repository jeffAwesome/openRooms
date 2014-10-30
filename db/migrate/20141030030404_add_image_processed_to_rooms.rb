class AddImageProcessedToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :image_processed, :boolean
  end
end

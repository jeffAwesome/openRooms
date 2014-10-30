class AddImageUrlToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :remote_image_url, :string
  end
end

class AddLatitudeAndLongitudeToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :latitude, :float
    add_column :photos, :longitude, :float
  end
end

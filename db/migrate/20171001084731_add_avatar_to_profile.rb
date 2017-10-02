class AddAvatarToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :avatar_data, :string
  end
end

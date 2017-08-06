class AddCoordinatesToUsers < ActiveRecord::Migration
  def change
    enable_extension "postgis"
    add_column :users, :coordinates, :st_point,geographic: true
  end
end

class AddCoordinatesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :coordinates, :st_point,geographic: true
  end
end

class AddImageToCars < ActiveRecord::Migration
  def change
    add_attachment :cars, :image
  end
end

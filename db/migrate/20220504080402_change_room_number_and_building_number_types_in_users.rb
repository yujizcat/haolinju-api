class ChangeRoomNumberAndBuildingNumberTypesInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :building_number, :string
    change_column :users, :room_number, :string
  end
end

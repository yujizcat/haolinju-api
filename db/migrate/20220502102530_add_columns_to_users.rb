class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nickname, :string
    add_column :users, :last_name, :string
    add_column :users, :is_banned, :integer
    add_column :users, :score, :integer
    add_column :users, :building_number, :integer
    add_column :users, :room_number, :integer
    add_reference :users, :compound, null: false, foreign_key: true
  end
end

class CreateBids < ActiveRecord::Migration[6.1]
  def change
    create_table :bids do |t|
      t.references :user, null: false, foreign_key: true
      t.references :owner_item, null: false
      t.references :taker_item, null: false
      t.string :status
      t.string :note

      t.timestamps
    end
  end
end

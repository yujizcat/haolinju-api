class CreateCompounds < ActiveRecord::Migration[6.1]
  def change
    create_table :compounds do |t|
      t.string :address

      t.timestamps
    end
  end
end

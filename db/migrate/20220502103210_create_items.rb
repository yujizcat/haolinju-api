class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :category
      t.string :description
      t.string :condition
      t.string :image_url
      t.integer :value
      t.string :request
      t.string :freebie
      t.string :status

      t.timestamps
    end
  end
end

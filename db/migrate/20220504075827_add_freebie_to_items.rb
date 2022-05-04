class AddFreebieToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :is_freebie, :boolean
  end
end

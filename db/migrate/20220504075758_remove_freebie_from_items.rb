class RemoveFreebieFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :freebie
  end
end

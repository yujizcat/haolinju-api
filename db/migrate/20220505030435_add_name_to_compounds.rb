class AddNameToCompounds < ActiveRecord::Migration[6.1]
  def change
    add_column :compounds, :name, :string
  end
end

class ChangeValueDefaultTo1 < ActiveRecord::Migration[6.1]
  def change
    change_column_default :items, :value, 1
  end
end

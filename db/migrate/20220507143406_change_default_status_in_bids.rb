class ChangeDefaultStatusInBids < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bids, :status, 'available'
  end
end

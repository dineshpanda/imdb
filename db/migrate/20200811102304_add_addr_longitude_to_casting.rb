class AddAddrLongitudeToCasting < ActiveRecord::Migration[6.0]
  def change
    add_column :castings, :addr_longitude, :float
  end
end

class AddAddrLatitudeToCasting < ActiveRecord::Migration[6.0]
  def change
    add_column :castings, :addr_latitude, :float
  end
end

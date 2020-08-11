class AddAddrFormattedAddressToCasting < ActiveRecord::Migration[6.0]
  def change
    add_column :castings, :addr_formatted_address, :string
  end
end

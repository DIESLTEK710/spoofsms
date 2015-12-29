class AddIpToSpoof < ActiveRecord::Migration
  def change
    add_column :spoofs, :ip_addr, :string
  end
end

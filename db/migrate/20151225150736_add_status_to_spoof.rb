class AddStatusToSpoof < ActiveRecord::Migration
  def change
    add_column :spoofs, :status, :string
  end
end

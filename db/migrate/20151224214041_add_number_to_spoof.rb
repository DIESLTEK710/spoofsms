class AddNumberToSpoof < ActiveRecord::Migration
  def change
    add_column :spoofs, :number, :string
  end
end

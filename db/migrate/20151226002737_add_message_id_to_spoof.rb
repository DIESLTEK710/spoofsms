class AddMessageIdToSpoof < ActiveRecord::Migration
  def change
    add_column :spoofs, :message_id, :string
  end
end

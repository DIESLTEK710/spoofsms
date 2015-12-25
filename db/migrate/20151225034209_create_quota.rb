class CreateQuota < ActiveRecord::Migration
  def change
    create_table :quota do |t|
      t.integer :sum
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

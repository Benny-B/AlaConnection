class CreateBios < ActiveRecord::Migration
  def change
    create_table :bios do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :bios, [:user_id, :created_at]
  end
end

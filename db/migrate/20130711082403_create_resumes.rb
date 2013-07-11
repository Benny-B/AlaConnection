class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :resumes, [:user_id, :created_at]
  end
end

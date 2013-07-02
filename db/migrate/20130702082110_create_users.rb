class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :hashed_password
      t.string :education

      t.timestamps
    end
  end
end

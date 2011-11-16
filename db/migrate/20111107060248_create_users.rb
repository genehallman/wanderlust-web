class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :gender
      t.string :language
      t.string :location
      t.integer :age
      t.string :nationality
      t.string :blurb
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.timestamps
    end
  end
  
  def down
    drop_table :users  
  end
    
end

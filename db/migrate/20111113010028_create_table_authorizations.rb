class CreateTableAuthorizations < ActiveRecord::Migration
  def up
    create_table :authorizations do |t| 
      t.string "provider"
      t.string "uid"
      t.integer "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def down
    drop_table :authorizations
  end
end

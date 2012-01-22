class ChangeUserTable < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :username, :age
      t.datetime  :date_of_birth
      t.string    :single_access_token
      t.string    :perishable_token
      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip
    end
  end
end

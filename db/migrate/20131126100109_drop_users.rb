class DropUsers < ActiveRecord::Migration
  def change
    if table_exists?(:users)
      drop_table :users
    end
  end
end

class DropRequests < ActiveRecord::Migration
  def change
    if table_exists?(:requests)
      drop_table :requests
    end
  end
end

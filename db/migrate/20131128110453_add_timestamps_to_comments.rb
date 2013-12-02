class AddTimestampsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :created_at, :timestamp
    add_column :comments, :updated_at, :timestamp
  end
end

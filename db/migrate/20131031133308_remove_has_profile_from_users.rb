class RemoveHasProfileFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :has_avatar, :boolean
  end
end

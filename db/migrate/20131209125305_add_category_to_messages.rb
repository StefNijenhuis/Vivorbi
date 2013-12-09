class AddCategoryToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :category_id, :integer
  end
end

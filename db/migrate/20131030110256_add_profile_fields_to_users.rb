class AddProfileFieldsToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string

    add_column :users, :first_name, :string
    add_column :users, :in_between, :string
    add_column :users, :last_name, :string
    add_column :users, :street, :string
    add_column :users, :house_number, :string
    add_column :users, :postal_code, :string
    add_column :users, :place, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :cellphone, :string
    add_column :users, :phone, :string
    add_column :users, :email, :string
    add_column :users, :hobbies, :text
    add_column :users, :has_avatar, :boolean
  end
end

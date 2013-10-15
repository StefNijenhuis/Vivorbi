class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.datetime :date
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

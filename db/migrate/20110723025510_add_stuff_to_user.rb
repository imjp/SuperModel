class AddStuffToUser < ActiveRecord::Migration
  def change
    add_column :users, :photo_1, :string
    add_column :users, :photo_2, :string
    add_column :users, :photo_3, :string
    add_column :users, :sex, :string
  end
end

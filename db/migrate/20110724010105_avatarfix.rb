class Avatarfix < ActiveRecord::Migration
  def up
	rename_column :users, :sex, :gender
	remove_column :users, :avatar_file_name
	remove_column :users, :avatar_content_type
	remove_column :users, :avatar_file_size
	remove_column :users, :avatar_updated_at
	remove_column :portfolios, :image_1
	remove_column :portfolios, :image_2
	remove_column :portfolios, :image_3
  end

  def down
  end
end

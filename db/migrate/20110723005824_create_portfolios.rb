class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.integer :height
      t.string :bust
      t.integer :waist
      t.integer :hips
      t.integer :shoes
      t.string :eyes
      t.string :hair
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.references :user

      t.timestamps
    end
    add_index :portfolios, :user_id
  end
end

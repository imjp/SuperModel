class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.integer :phone
      t.string :facebook
      t.references :user

      t.timestamps
    end
    add_index :contact_infos, :user_id
  end
end
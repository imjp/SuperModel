class AlterPhoneFromIntegerToString < ActiveRecord::Migration
  def up
	change_column :contact_infos, :phone, :text
  end

  def down
  end
end

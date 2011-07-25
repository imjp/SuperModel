class DropTableContactinfos < ActiveRecord::Migration
  def up
	drop_table :contactinfos
  end

  def down
  end
end

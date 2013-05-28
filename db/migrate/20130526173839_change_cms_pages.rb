class ChangeCmsPages < ActiveRecord::Migration
  def up
    change_table :cms_pages do |t|
      t.integer :menu_id
    end
    change_table :cms_menus do |t|
      t.integer :menu_id
    end
  end

  def down
  end
end

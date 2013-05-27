class CreateCmsMenuItems < ActiveRecord::Migration
  def change
    create_table :cms_menu_items do |t|
      t.integer :menu_id
      t.string :label
      t.integer :page_id
      t.string :link
      t.string :menu_item_type

      t.timestamps
    end
  end
end

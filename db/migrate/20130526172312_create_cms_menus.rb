class CreateCmsMenus < ActiveRecord::Migration
  def change
    create_table :cms_menus do |t|
      t.integer :site_id
      t.string :label

      t.timestamps
    end
  end
end

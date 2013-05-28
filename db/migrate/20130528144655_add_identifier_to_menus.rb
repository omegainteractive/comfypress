class AddIdentifierToMenus < ActiveRecord::Migration
  def change
    add_column :cms_menus, :identifier, :string
  end
end

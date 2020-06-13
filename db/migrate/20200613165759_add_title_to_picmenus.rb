class AddTitleToPicmenus < ActiveRecord::Migration[6.0]
  def change
    add_column :picmenus, :title, :string
  end
end

class AddBiotextToBios < ActiveRecord::Migration[6.0]
  def change
    add_column :bios, :bio, :text
  end
end

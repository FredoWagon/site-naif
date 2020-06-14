class CreatePicmenus < ActiveRecord::Migration[6.0]
  def change
    create_table :picmenus do |t|

      t.timestamps
    end
  end
end

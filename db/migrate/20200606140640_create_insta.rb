class CreateInsta < ActiveRecord::Migration[6.0]
  def change
    create_table :insta do |t|

      t.timestamps
    end
  end
end

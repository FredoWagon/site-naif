class CreateMurales < ActiveRecord::Migration[6.0]
  def change
    create_table :murales do |t|
      t.string :name

      t.timestamps
    end
  end
end

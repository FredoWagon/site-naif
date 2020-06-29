class AddPositionToPaintings < ActiveRecord::Migration[6.0]
  def change
    add_column :paintings, :position, :integer
  end
end

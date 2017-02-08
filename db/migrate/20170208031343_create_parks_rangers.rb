class CreateParksRangers < ActiveRecord::Migration[5.0]
  def change
    create_table :parks_rangers do |t|
      t.references :park
      t.references :ranger

      t.timestamps
    end
  end
end

class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.string :name, null: false
      t.string :status, null: false
      t.bigint :price, null: false
      t.integer :beds, null: false, default: 0
      t.integer :baths, null: false, default: 0
      t.st_point :coords, null: false, geographic: true
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.timestamps

      t.index :coords, using: :gist
      t.index %i[latitude longitude]
      t.index :status
      t.index :price
    end
  end
end

class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.st_point :coords, null: false, geographic: true

      t.index :coords, using: :gist
      t.timestamps
    end
  end
end

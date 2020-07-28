class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.st_point :location, geographic: true

      t.timestamps
    end
    add_index :users, :location, using: :gist
  end
end

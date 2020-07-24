class CreateCastings < ActiveRecord::Migration[6.0]
  def change
    create_table :castings do |t|
      t.integer :movie_id
      t.integer :actor_id
      t.string :character_name
      t.string :profile
      t.string :addr

      t.timestamps
    end
  end
end

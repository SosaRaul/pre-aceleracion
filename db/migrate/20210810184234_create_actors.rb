class CreateActors < ActiveRecord::Migration[6.1]
  def change
    create_table :actors do |t|
      t.references :character, null: false,foreign_key: true
      t.references :movie, null: false,foreign_key: true
      t.timestamps
    end
  end
end

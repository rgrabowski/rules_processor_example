class CreateRules < ActiveRecord::Migration[5.0]
  def change
    create_table :rules do |t|
      t.string :name
      t.jsonb :meet_all_data, default: [], null: false
      t.jsonb :meet_any_data, default: [], null: false
      t.jsonb :actions_data, default: [], null: false
      t.integer :order

      t.timestamps
    end
  end
end

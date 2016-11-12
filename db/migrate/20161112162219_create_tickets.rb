class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :subject
      t.string :status
      t.string :priority
      t.integer :requester_id
      t.text :description

      t.timestamps
    end
  end
end

class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :description
      t.boolean :done
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

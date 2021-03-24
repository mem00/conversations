class CreateThoughts < ActiveRecord::Migration[6.0]
  def change
    create_table :thoughts do |t|
      t.text :text, null: false
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end

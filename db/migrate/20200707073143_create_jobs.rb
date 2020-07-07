class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.decimal :duration
      t.text :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

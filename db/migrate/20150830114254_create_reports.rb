class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.date :daily_date
      t.text :body
      t.boolean :public
      t.text :confidentiality
      t.string :rank
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.string :email
      t.string :picture
      t.integer :role
      t.boolean :send_mail

      t.timestamps null: false
    end
  end
end

class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.references :user, index: true, foreign_key: true
      t.references :target, :polymorphic => true

      t.timestamps null: false
    end
  end
end

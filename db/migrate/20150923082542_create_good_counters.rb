class CreateGoodCounters < ActiveRecord::Migration
  def change
    create_table :good_counters do |t|
      t.references :user, index: true, foreign_key: true
      t.references :target, :polymorphic => true

      t.timestamps null: false
    end
  end
end

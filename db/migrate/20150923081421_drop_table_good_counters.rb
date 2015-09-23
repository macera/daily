class DropTableGoodCounters < ActiveRecord::Migration
  def change
    drop_table :good_counters
  end
end

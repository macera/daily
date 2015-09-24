class DropTableTimereports < ActiveRecord::Migration
  def change
    drop_table :timereports
  end
end

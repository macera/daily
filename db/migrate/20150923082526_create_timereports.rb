class CreateTimereports < ActiveRecord::Migration
  def change
    create_table :timereports do |t|
      t.time :time_from
      t.time :time_to
      t.string :occupation
      t.string :remark
      t.references :report, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

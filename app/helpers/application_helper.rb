module ApplicationHelper
  def table_show(key, table)
    value = ''
    table.each do |t|
      value = t[0] if t[1] == key
    end
    value
  end
end

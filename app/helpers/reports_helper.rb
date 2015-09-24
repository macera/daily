module ReportsHelper

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) +
    link_to("#", { onclick: "remove_fields(this)", class: "btn btn-danger" }) do
      raw(name)
    end
  end

  def link_to_add_fields(name, f, association, target)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to "#", { onclick: %Q[add_fields(this, "#{association}", "#{escape_javascript(fields)}", "#{target}")], class: "btn btn-info" } do
      raw(name)
    end
  end

  # 新規作成時、デフォルトの時刻を指定する
  def setting_default_time(i)
    case i
    when 0
      { h_start: 9, h_end: 12 }
    when 1
      { h_start: 13, h_end: 18 }
    else
      { h_start: 0, h_end: 0 }
    end
  end

  def occupation_table
    [
      ["プログラミング", "P"],
      ["テスト", "T"],
      ["レビュー", "R"],
      ["プログラム改修", "B"],
      ["ドキュメント", "C"],
      ["環境・支援", "E"],
      ["付帯サービス", "S"],
      ["営業・企画調査", "A"],
      ["管理・事務・他", "G"],
      ["会議・行事", "M"],
      ["教育・訓練", "L"],
      ["デザイン", "D"],
      ["出張(移動時間)", "F"]
    ]
  end
end

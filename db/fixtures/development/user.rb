User.seed do |u|
  u.id = 1
  u.last_name = '酢良'
  u.first_name = '太郎'
  u.last_name_kana = 'スラ'
  u.first_name_kana = ''
  u.email = 'test1@example.com'
  u.picture = ''
  u.role = 1
  u.send_mail = true
end

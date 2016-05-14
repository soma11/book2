# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
data = <<-EOF
---
books:
  -
    name: Pocket詳解 CakePHP辞典
    isbn: 9784798027456
  -
    name: Ruby on Rails 4 アプリケーションプログラミング
    isbn: 9784774164106
  -
    name: パーフェクトPython
    isbn: 9784774155395
  -
    name: Rubyによるクローラー開発技法
    isbn: 9784797380354
  -
    name: Webアプリ開発を加速する CakePHP2定番レシピ119
    isbn: 9784798039510
EOF

yaml = YAML.load data
yaml["books"].each do |b|
  M::Book.create! name: b["name"], isbn: b["isbn"]
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by(id: 1) do |user|
  user.email = '6851@subakashi'
  user.password = '0353847031'
  user.admin = true
end

Writer.find_or_create_by(id: 1) do |writer|
  writer.code = 'yamamoto'
  writer.pass = '0353847031'
  writer.status = ''
  writer.name = 'やまもん'
  writer.image = ''
  writer.twitter = ''
  writer.instagram = ''
  writer.youtube = ''
  writer.about = ''
  writer.description = ''
end

Writer.find_or_create_by(id: 2) do |writer|
  writer.code = 'sato'
  writer.pass = '0353847031'
  writer.status = ''
  writer.name = 'こーしろー｜迂闊'
  writer.image = ''
  writer.twitter = ''
  writer.instagram = ''
  writer.youtube = ''
  writer.about = ''
  writer.description = ''
end

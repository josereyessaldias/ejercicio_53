# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Category.destroy_all
#User.destroy_all
#Activity.destroy_all



Category.create(name:"Leer",past:"leyó",sustantivo:"Libros",participio:"leído",futuro:"leerá")
Category.create(name:"Ver Películas",past:"vió",sustantivo:"Películas",participio:"vista",futuro:"verá")
Category.create(name:"Hacer Trekking",past:"que realizó",sustantivo:"Trekking",participio:"realizado",futuro:"realizará")

User.create(name:"José",email:"jpreyess@uc.cl",password:'123456')
User.create(name:"Ganso",email:"ganso@ganso.ganso",password:'123456')
User.create(name:"Gato",email:"gato@gato.gato",password:'123456')
User.create(name:"Oso",email:"oso@oso.oso",password:'123456')



require 'csv'

peliculas = File.open(Rails.root.join('lib','seed.csv'), 'r:iso-8859-1')
notas = peliculas.readlines
peliculas.close


noti = []
notas.each do |i|
	noti << i.split(",")
end

noti.each do |i|
	i[4].delete!("\n")
end

noti.each do |i|
	Activity.create(name:i[0].to_s,author:i[1].to_s,owner_id:i[2].to_i,category_id:i[3].to_i,remote_photo_url:i[4].to_s)
end


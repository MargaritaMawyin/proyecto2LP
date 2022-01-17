puts "Proyecto 2P - G8"
require 'open-uri'
require 'nokogiri'
require 'csv'

require "./Extractores/Extractor3d"
require "./Extractores/ExtractorLiga"
require "./Extractores/ExtractorMundo"
require "./Juego/Juegos"


link3d = "https://www.3djuegos.com/index.php?zona=top100"
out_file_3d = "3djuegos"

linkLiga = "https://www.ligadegamers.com/mejores-videojuegos-de-la-historia/"
out_file_liga = "ligadegamers"

linkMundo = "https://www.mundogamers.com/top100-juegos-editores.html"
out_file_mundo = "mundogamers"
#peliculas = URI.open(link)
#datos = peliculas.read
#parsed_content = Nokogiri::HTML(datos)
#galeria = parsed_content.css('.article_movie_title')
#puts galeria
puts("---------3D JUEGOS---------")
puts(link3d)
Extractor3d.new.extraerJuegos(link3d.to_s, out_file_3d)

puts("---------LIGA DE GAMERS---------")
puts(linkLiga)
ExtractorLiga.new.extraerJuegos(linkLiga.to_s, out_file_liga)

puts("---------MUNDO GAMERS---------")
puts(linkMundo)
ExtractorMundo.new.extraerJuegos(linkMundo.to_s, out_file_mundo)


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

#Creación de archivo CSV general
out_file_general = "juegos_general"
CSV.open('csv/' +out_file_general +'.csv','wb') do |csv|
  csv << %w[top titulo genero plataforma anio_lanzamiento]
end

puts("---------3D JUEGOS---------")
puts(link3d)
extractor_3d = Extractor3d.new(out_file_general)
extractor_3d.extraerJuegos(link3d.to_s, out_file_3d)

puts("---------LIGA DE GAMERS---------")
puts(linkLiga)
extractor_liga = ExtractorLiga.new(out_file_general)
extractor_liga.extraerJuegos(linkLiga.to_s, out_file_liga)

puts("---------MUNDO GAMERS---------")
puts(linkMundo)
extractor_mundo = ExtractorMundo.new(out_file_general)
extractor_mundo.extraerJuegos(linkMundo.to_s, out_file_mundo)


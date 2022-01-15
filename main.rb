require 'open-uri'
require 'nokogiri'
require 'csv'

require "./Etiqueta"
  
    link= "https://www.mundogamers.com/top100-juegos-editores.html"
    juegos = URI.open(link)
    datos = juegos.read
    parsed_content = Nokogiri::HTML(datos)
    datos = parsed_content.css('#right_box')
   
    datos.css('.fich.div_valoraciones').each do |v|
      nombre= v.css('.carac').css('.ln1').css('.juego').inner_text
      puts nombre

      genero= v.css('.carac').css('.ln2').css('.genero').inner_text
      puts genero

      fecha= v.css('.carac').css('.ln2').css('.fecha_lanzamiento').inner_text
      puts fecha
      arreglo=[]
      plataforma= v.css('.carac').css('.ln3').css('.platforms_fich').css('.juego').each do |b|
      arreglo.push(b.inner_text)
      end
      puts arreglo

      ranking= v.css('.fecha_fich').css('.valoracion').inner_text
      puts ranking
      
       puts ' '

      juego = Etiqueta.new(nombre, genero, arreglo,ranking)
      juego.registrar()

     

      end
    

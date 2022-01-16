class ExtractorMundo
  def extraerJuegos(url)
    CSV.open('csv/mundogamers.csv','wb') do |csv|
      csv << %w[top titulo genero plataforma fecha]
    end

    juegos = URI.open(url)
    datos = juegos.read
    parsed_content = Nokogiri::HTML(datos)
    datos = parsed_content.css('#right_box')
   
    datos.css('.fich.div_valoraciones').each do |v|

      top = "10"
      titulo= v.css('.carac').css('.ln1').css('.juego').inner_text

      genero= v.css('.carac').css('.ln2').css('.genero').inner_text

      fecha= v.css('.carac').css('.ln2').css('.fecha_lanzamiento').inner_text
      arreglo=[]
      plataforma= v.css('.carac').css('.ln3').css('.platforms_fich').css('.juego').each do |b|
      arreglo.push(b.inner_text)
      end

      juego = Juegos.new(top,titulo,genero,arreglo,fecha)
      #juego.toString()
      juego.registrar2()

     

      end





  end
end
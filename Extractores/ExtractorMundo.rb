class ExtractorMundo
  def initialize(out_file_general)
    @out_file_general = out_file_general
  end 

  def extraerJuegos(url, out_file)
    CSV.open('csv/' +out_file +'.csv','wb') do |csv|
      csv << %w[top titulo genero plataforma anio_lanzamiento]
    end

    juegos = URI.open(url)
    datos = juegos.read
    parsed_content = Nokogiri::HTML(datos)
    datos = parsed_content.css('#right_box')

    datos.css('.fich.div_valoraciones').each do |dato|

      top = dato.css('.bloque_texto.fich div').inner_text
      titulo= dato.css('.carac').css('.ln1').css('.juego').inner_text

      genero= dato.css('.carac').css('.ln2').css('.genero').inner_text.downcase

      fecha= dato.css('.carac').css('.ln2').css('.fecha_lanzamiento').inner_text.split('/')[2]
      arreglo=[]
      plataforma= dato.css('.carac').css('.ln3').css('.platforms_fich').css('.juego').each do |arr|
        arreglo.push(arr.inner_text)
      end

      juego = Juegos.new(top,titulo,genero,arreglo[0],fecha)
      juego.toString()
      juego.registrar(out_file)
      juego.registrar(@out_file_general)
    end
  end
end

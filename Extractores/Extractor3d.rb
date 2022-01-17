class Extractor3d
  def extraerJuegos(url, out_file)
    CSV.open('csv/' +out_file +'.csv','a') do |csv|
      csv << %w[top titulo genero plataforma anio_lanzamiento]
    end
    pagina = URI.open(url)
    contenido = pagina.read
    parsed = Nokogiri::HTML(contenido)

    for i in 1..100
      contenedor = parsed.css("table:nth-of-type(2)").css("tr:nth-of-type(#{i})")
      contenedor.each do |datos|
        top = datos.css(".pos_top").inner_text
        titulo = datos.css("td a").inner_text
        genero = datos.css("td[class='tac dn600 wi74']:first-of-type").inner_text
        plataforma = datos.css("td:nth-of-type(3)").css("div").inner_text
        fecha = datos.css("td[class='tac dn480 cF wi88']:first-of-type").inner_text.split('-')[2]
        if fecha == nil
          fecha = '2021'
        end
        juego = Juegos.new(top,titulo,genero,plataforma,fecha)
        juego.toString()
        juego.registrar(out_file)
      end 
    end
  end
end

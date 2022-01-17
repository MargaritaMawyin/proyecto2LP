class ExtractorLiga

  def extraerJuegos(url)
    CSV.open('csv/ligagamers.csv','wb') do |csv|
      csv << %w[top titulo genero plataforma anio_lanzamiento]
    end
    pagina = URI.open(url)
    contenido = pagina.read
    parsed = Nokogiri::HTML(contenido)

    for i in (1..100).to_a.reverse
      contenedorTitulo = parsed.css("div[class='article--body']").css("h2:nth-of-type(#{i})")
      contenedor = parsed.css("div[class='article--body']").css("ul:nth-of-type(#{i})")
      contenedor.each do |datos|
        top = contenedorTitulo.inner_text.split(".")[0]
        titulo = contenedorTitulo.inner_text.split(".")[1]
        genero = datos.css("li:nth-of-type(3)").inner_text.split(':')[1..-1].join(' ').strip.split(",")[0]
        plataforma = datos.css("li:nth-of-type(2)").inner_text.split(':')[1..-1].join(' ').strip.split(",")[0]
        fecha = datos.css("li:first-of-type").inner_text.split(':')[1..-1].join(' ').strip[0..-2]
        juego = Juegos.new(top,titulo,genero,plataforma,fecha)
        juego.toString()
        juego.registrar3()
      end
    end
  end
end

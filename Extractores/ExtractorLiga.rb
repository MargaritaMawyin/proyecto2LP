class ExtractorLiga
  def initialize(out_file_general)
    @out_file_general = out_file_general
  end

  def extraerJuegos(url, out_file)
    CSV.open('csv/' +out_file +'.csv','wb') do |csv|
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
        genero = genero.sub(".", "").downcase

        plataforma = datos.css("li:nth-of-type(2)").inner_text.split(':')[1..-1].join(' ').strip.split(",")[0]
        plataforma = plataforma.sub(".", "")
        fecha = datos.css("li:first-of-type").inner_text.split(':')[1..-1].join(' ').strip
        fecha = fecha.sub(".", "")
        juego = Juegos.new(top,titulo,genero,plataforma,fecha)
        juego.toString()
        juego.registrar(out_file)
        juego.registrar(@out_file_general)
      end
    end
  end
end

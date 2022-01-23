class Juegos
  attr_accessor :top, :titulo, :genero, :plataforma, :fecha  
  def initialize(top,titulo,genero,plataforma,fecha)
    @top = top
    @titulo = titulo
    @genero = genero
    @plataforma = plataforma
    @fecha = fecha
    normalizarGenero
  end

  def registrar(out_file)
    CSV.open('csv/' +out_file +'.csv','a') do |csv|
      csv << [@top,@titulo,@genero,@plataforma,@fecha]
    end
  end

  def toString()
    puts "Top: "+@top+"\nTitulo: "+@titulo+"\nGenero: "+@genero+"\nPlataforma: "+@plataforma+"\nFecha: "+@fecha
  end

  def normalizarGenero()
    if @genero.include? "acción"
      @genero = "accion"
    end
    if @genero.include? "action"
      @genero = "accion"
    end
    if @genero.include? "aventura"
      @genero = "aventura"
    end
    if @genero.include? "conducción"
      @genero = "carreras"
    end
    if @genero.include? "estrategia"
      @genero = "estrategia"
    end
    if @genero.include? "rpg"
      @genero = "rpg"
    end
    if @genero.include? "simulación"
      @genero = "simulacion"
    end
    if @genero.include? "simulador"
      @genero = "simulacion"
    end
    if @genero.include? "survival"
      @genero = "supervivencia"
    end
    if @genero.include? "baloncesto"
      @genero = "deportes"
    end
    if @genero.include? "fútbol"
      @genero = "deportes"
    end
    if @genero.include? "hack'n'slash"
      @genero = "hack and slash"
    end
    if @genero.include? "plataforma"
      @genero = "plataforma"
    end
    if @genero.include? "puzle"
      @genero = "puzzle"
    end
  end
end

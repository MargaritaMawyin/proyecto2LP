class Juegos
  attr_accessor :top, :titulo, :genero, :plataforma, :fecha  
  def initialize(top,titulo,genero,plataforma,fecha)
    @top = top
    @titulo = titulo
    @genero = genero
    @plataforma = plataforma
    @fecha = fecha
  end

  def registrar()
    CSV.open('csv/3djuegos.csv','a') do |csv|
      csv << [@top,@titulo,@genero,@plataforma,@fecha]
    end
  end

  def registrar2()
    CSV.open('csv/mundogamers.csv','a') do |csv|
      csv << [@top,@titulo,@genero,@plataforma,@fecha]
    end
  end

  def registrar3()
    CSV.open('csv/ligagamers.csv','a') do |csv|
      csv << [@top,@titulo,@genero,@plataforma,@fecha]
    end
  end

  def toString()
    puts "Top: "+@top+"\nTitulo: "+@titulo+"\nGenero: "+@genero+"\nPlataforma: "+@plataforma+"\nFecha: "+@fecha
  end

  
end
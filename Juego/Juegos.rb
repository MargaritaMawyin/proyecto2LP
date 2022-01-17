class Juegos
  attr_accessor :top, :titulo, :genero, :plataforma, :fecha  
  def initialize(top,titulo,genero,plataforma,fecha)
    @top = top
    @titulo = titulo
    @genero = genero
    @plataforma = plataforma
    @fecha = fecha
  end

  def registrar(out_file)
    CSV.open('csv/' +out_file +'.csv','a') do |csv|
      csv << [@top,@titulo,@genero,@plataforma,@fecha]
    end
  end

  def toString()
    puts "Top: "+@top+"\nTitulo: "+@titulo+"\nGenero: "+@genero+"\nPlataforma: "+@plataforma+"\nFecha: "+@fecha
  end

  
end

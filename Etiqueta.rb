class Etiqueta
  attr_accessor :nombre, :genero, :plataforma, :ranking

  def initialize(nombre,genero,plataforma,ranking)
    @nombre = nombre
    @genero = genero
    @plataforma = plataforma
    @ranking = ranking
  end

  def registrar()
    CSV.open('etiquetas.csv','a') do |csv|
      csv << [@nombre,@genero,@plataforma,@ranking]
    end
  end

  def toString()
    puts "nombre= "+@nombre+"\ngenero= "+@genero+"\nplataforma= "+@plataforma+"\nranking= "+@ranking
  end

end
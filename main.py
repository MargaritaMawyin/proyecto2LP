
import plataformasGrafico
import AnioLanzamientoGrafico
import GeneroGrafico
import matplotlib.pyplot as plt

def main():
    print("Graficos estadisticos")

plataformasGrafico.plataformas()
plataformasGrafico.clasificacion()
plataformasGrafico.grafico()
plt.show()

#--------Grafico de barras y pastel del anio de lanzamiento-----
AnioLanzamientoGrafico.anio_lanzamiento()

#------Grafico generos ---------
GeneroGrafico.genero()

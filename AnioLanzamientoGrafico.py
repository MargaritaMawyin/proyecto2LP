import pandas as pd
import matplotlib.pyplot as plt
import random
import matplotlib.colors as mcolors
def anio_lanzamiento():
    df = pd.read_csv("./csv/juegos_general.csv")
    # Se crea nuevo campo para cantidad_juegos
    df['cantidad_juegos'] = 1

    # Se agrupan por año lanzamiento y se van sumando los juegos de cada año
    df = df.groupby(['anio_lanzamiento']).cantidad_juegos.count().reset_index()
    df = df.set_index('anio_lanzamiento')  # Se utiliza el año de lanzamiento como nuevo indice

    # Al tener el año de lanzamiento como indice y un unico campo con la cantidad de juegos, se grafica en un grafico de barras.
    df.plot(kind="bar", figsize=(8, 7))

    # Se establece el grafico de barras como primera figura.
    plot1 = plt.figure(1)

    # -------Grafico de pastel --------------

    # funcion para obtener el porcentaje de juegos de cada año con respecto al total de juegos.
    def compute_percentage(x):
        pct = float(x / df['cantidad_juegos'].sum()) * 100
        return round(pct, 2)

    # Nuevo campo para obtener los porcentajes de juegos en cada año.
    df['porcentaje_juegos'] = df.apply(compute_percentage, axis=1)

    # Se crea un nuevo dataFrame para analizar sus porcentajes
    ordenByPorcentaje = df.sort_values(by=['porcentaje_juegos'], ascending=False)
    ordenByPorcentaje = ordenByPorcentaje.reset_index()  # Cambiamos el indice.
    plot2 = plt.figure(2)

    # Write label in the format "Manufacturer - Percentage %"
    labels = ['{0} - {1:1.2f} %'.format(i, j) for i, j in
              zip(ordenByPorcentaje.anio_lanzamiento, ordenByPorcentaje.porcentaje_juegos)]
    colors = random.choices(list(mcolors.CSS4_COLORS.values()), k=34)
    ax = ordenByPorcentaje.porcentaje_juegos.plot(kind='pie', labels=None, colors=colors,
                                                  figsize=(10, 7))  # the pie plot
    # add the legend
    ax.legend(labels, loc='best', bbox_to_anchor=(-0.1, 1.), fontsize=8)
    print(df)
    plt.show()


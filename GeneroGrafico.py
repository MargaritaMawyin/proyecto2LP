import pandas as pd
import matplotlib.pyplot as plt

def genero():
    df = pd.read_csv("./csv/juegos_general.csv")
    df['numero_juegos'] = 1

    df = df.groupby(['genero']).count().numero_juegos
    df = df.sort_values(ascending= True)
    df.plot(kind="barh",figsize=(10, 7))
    print(df)

    plt.show()

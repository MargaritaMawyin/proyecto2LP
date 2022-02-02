import os
import pathlib
from builtins import print

import matplotlib.pyplot
import pandas as pd
from matplotlib.pyplot import barh, show
import matplotlib.pyplot as plt

def plataformas():
    dir = 'csv/juegos_general.csv'
    plataformasLista=[]
    with open(dir, "r") as archivo:
        for linea in archivo:
            #print(linea)
            plataformasLista.append(linea.split(",")[3])
    #print (plataformasLista)
    #unique_list = list(dict.fromkeys(plataformas))
    #print(unique_list)
    return plataformasLista


def clasificacion():
    names = ['PC', 'NintendoSwitch', 'PS5', 'PS4', 'Multi', 'XboxOne', 'XOne', 'Xbox360',
             'PlayStation3', 'GameCube',
             'Dreamcast', 'Nintendo64', 'SNES', 'PlayStation1', 'XboxSeries', 'Android', 'WiiU',
             'NES', '3DS', 'Arcade','GameBoyAdvance', 'Nintendo DS','Xbox']
    numeroDePlataformas=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    for p in plataformas():
        #print(p + '?')
        if p == 'PC':
            numeroDePlataformas[0]+=1
        if p == 'Nintendo Switch':
            numeroDePlataformas[1]+=1
        if p == 'PS5':
            numeroDePlataformas[2]+=1
        if p == 'PS4' or  p =='PlayStation 4' or  p =='PlayStaton 4':
            numeroDePlataformas[3]+=1
        if p == 'Multi':
            numeroDePlataformas[4] += 1
        if p == 'Xbox One':
            numeroDePlataformas[5] += 1
        if p == 'XOne':
            numeroDePlataformas[6] += 1
        if p == 'Xbox 360':
            numeroDePlataformas[7] += 1
        if p == 'PlayStation 3':
            numeroDePlataformas[8]+=1
        if p == 'GameCube':
            numeroDePlataformas[9]+=1
        if p == 'Dreamcast':
            numeroDePlataformas[10] += 1
        if p == 'Nintendo 64':
            numeroDePlataformas[11]+=1
        if p == 'SNES':
            numeroDePlataformas[12]+=1
        if p == 'PlayStation 1':
            numeroDePlataformas[13]+=1
        if p == 'Xbox Series':
            numeroDePlataformas[14] += 1
        if p == 'Android':
            numeroDePlataformas[15]+=1
        if p == 'Wii U':
            numeroDePlataformas[16] += 1
        if p == 'NES':
            numeroDePlataformas[17] += 1
        if p == '3DS':
            numeroDePlataformas[18] += 1
        if p == 'Arcade':
            numeroDePlataformas[19] += 1
        if p == 'Game Boy Advance':
            numeroDePlataformas[20] += 1
        if p == 'Nintendo DS':
            numeroDePlataformas[21] += 1
        if p == 'Xbox':
            numeroDePlataformas[22] += 1
        else:
            continue
    return names, numeroDePlataformas

def grafico():
    plt.barh(clasificacion()[0], clasificacion()[1])
    plt.show
    plt.ylabel("Plataformas")
    plt.xlabel("Frecuencia")
    return



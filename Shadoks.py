# Module Shadoks

Alphabet = ["Ga","Bu","Zo","Meu"]

def Traduire(valeur):
    if type(valeur) is int:
        indexs = []
        texte = ""
        while True:
            texte = Alphabet[valeur%4]+texte
            if (valeur>3):
                valeur //= 4
            else:
                break
        return texte
    elif type(valeur) is str:
        compteur = 0
        num = 0
        while True:
            fini = True
            for lettre in Alphabet:
                if valeur.endswith(lettre):
                    num += Alphabet.index(lettre)*(4**compteur)
                    compteur += 1
                    valeur = valeur[0:-len(lettre)]
                    fini = False
            if fini: 
                break
        return num;

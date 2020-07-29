class Shadoks {

    static alphabet { ["Ga","Bu","Zo","Meu"] }

    static traduire(valeur) {
      if(valeur.type == String){
        valeur = valeur.trim()
        var parsedString = Num.fromString(valeur)
        if(parsedString){
          if(parsedString.isInteger){
            return this.nombreEnTexte(parsedString)
          }else{
            return 0
          }
        }else{
          return this.texteEnNombre(valeur)
        }
      }else{
        if(valeur.isInteger){
          return nombreEnTexte(valeur)
        }else{
          return "Ga"
        }
      }
    }

    static texteEnNombre(texte) {
      var num = 0
      var compteur = 0
      var fini = true
      while (true){
        fini = true
        for (index in 0..(alphabet.count-1)){
          var letter = alphabet[index]
          if (texte.endsWith(letter)){
            num = num + index*(4.pow(compteur))
            compteur = compteur+1
            var letterCount = letter.count
            texte.codePoints.map{|c| String.fromCodePoint(c) }
            if(texte.count>=1+letterCount){
              texte = texte.toList[0..-(1+letterCount)].join()
            }else{
              texte = ""
            }
            fini = false
          }
        }
        if(fini) break
      }
      return num
    }

    static nombreEnTexte(nombre) {
		  var texte = ""
      while(true){
        texte = alphabet[nombre%4]+texte
        if(nombre>3){
          nombre = (nombre/4).floor
        }else{
          break
        }
      }
      return texte
    }
}
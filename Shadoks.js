var Shadoks = (function(){
	var Alphabet = ["Ga","Bu","Zo","Meu"];
	function Traduire(valeur){
		if(typeof(valeur)=="string"){
			return ShadokEnNombre(valeur);
		}else if (typeof(valeur)=="number"){
			return NombreEnShadok(valeur);
		}else{
			return "Impossible de traduire "+valeur
		}
	}
	function NombreEnShadok(num){
		var indexs = [];
		var text = "";
		while(true){
            text = Alphabet[num%4] + text;
            if(num>3){
                num = Math.floor(num / 4);
            }else{
                break;
            }
		}
		return text;
	}
	function ShadokEnNombre(texte){
		var compteur = 0;
		var num = 0;
		var fini;
		while(true){
            fini = true;
            for(var l in Alphabet){
				var lettre = Alphabet[l];
                if(texte.search(new RegExp(lettre+'$'))>=0){
					num += Alphabet.indexOf(lettre)*Math.pow(4,compteur++);
                    texte = texte.substring(0,texte.length-lettre.length);
                    fini = false;
                }
            }
            if(fini)break;
        }
		return num;
	}
	return {
		Traduire: Traduire,
		get Alphabet() {
			return Alphabet;
		}
	}
})();



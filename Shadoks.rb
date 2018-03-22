class Shadoks

	attr_reader		:Alphabet
	
	@@Alphabet = ["Ga","Bu","Zo","Meu"]
	
	def self.Alphabet
		@@Alphabet
	end
	
	def self.Traduire(valeur)
		case valeur
		when String
			return texteEnNombre(valeur)
		when Integer
			return nombreEnTexte(valeur)
		end
	end
	
	def self.texteEnNombre(texte)
		num = 0
		compteur = 0;
		while true
			fini = true
			@@Alphabet.each{|lettre|
				if texte.end_with?(lettre)
					num += @@Alphabet.index(lettre)*(4**compteur)
					compteur += 1
					texte = texte[0..-(lettre.length+1)]
					fini = false
				end
			}
			break if fini
		end
		return num;
	end
	
	def self.nombreEnTexte(num)
		texte = ""
		while true
			texte = @@Alphabet[num%4] + texte
			if num>3
				num /= 4
			else
				break
			end	
		end
		return texte;
	end
	
	private_class_method :texteEnNombre, :nombreEnTexte
	
end
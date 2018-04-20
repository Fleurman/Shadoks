import java.util.Arrays;

public class Shadoks {
    static final String[] Alphabet = {"Ga","Bu","Zo","Meu"};
    
    static public String Traduire(int num){
        StringBuilder text = new StringBuilder();
        while(true){
            text.insert(0, Alphabet[num%4]);
            if(num>3){
                num = num/4;
            }else{
                break;
            }
        }
        return text.toString();
    }
    
    static public int Traduire(String text){
        int compteur = 0, num = 0;
        while(true){
            boolean fini = true;
            for(String lettre : Alphabet){
                if(text.endsWith(lettre)){
                    num += Arrays.asList(Alphabet).indexOf(lettre)*(Math.pow(4d,compteur++));
                    text = text.substring(0,text.length()-lettre.length());
                    fini = false;
                }
            }
            if(fini)break;
        }
        return num;
    }
    
}
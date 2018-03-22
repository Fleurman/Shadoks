using System;
using System.Text;
using System.Collections.Generic;

class Shadoks{
    static public readonly String[] Alphabet = {"Ga","Bu","Zo","Meu"};
    static public string Traduire(int num){
        List<int> indexs = new List<int>();
        StringBuilder text = new StringBuilder();
        while(true){
            text.Insert(0,Alphabet[num%4]);
            if(num>3){
                num = num/4;
            }else{
                break;
            }
        }
        return text.ToString();
    }

    static public int Traduire(string text){
        double compteur = 0;
        double num = 0;
        while(true){
            bool fini = true;
            foreach(string lettre in Alphabet){
                if(text.EndsWith(lettre)){
                    num += Array.IndexOf(Alphabet,lettre)*(Math.Pow(4d,compteur++));
                    text = text.Substring(0,text.Length-lettre.Length);
                    fini = false;
                }
            }
            if(fini)break;
        }
        return (int)num;
    }
}
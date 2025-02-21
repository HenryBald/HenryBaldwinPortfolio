import java.util.Random;
import java.util.Scanner;

public class RandomWordGenerator
{
    public static void main(String[] args)
    {
        Random randPre = new Random();
        Random randSrf = new Random();
        Random randRoot = new Random();
        String[] pre = {"Pre", "Re", "Uni", "Omni", "Tele", "Para", "Homo", "Cosmo", "Pheno", "Neuro", "Hetero", "Iso", "Circum", "Neo", "Demi", "Pro", "Mis", "Non", "Trans", "Super"};
        String[] root = {"skyline", "light", "time", "truth", "form", "change", "knowledge", "distance", "influence", "chaos", "identity", "memory", "power", "growth", "unity", "disorder", "structure", "pattern", "energy", "nature"};
        String[] srf = {"plex", "ual", "fil", "ous", "ment", "osis", "phobia", "phrenia", "tate", "ly", "s", "ual", "cast", "able", "ful", "less", "like", "some", "ant", "ness"};
        
        
        String[] preDef = {"being before", "repetitive", "one", "all", "being distant to", "being beside", "being the same", "universal", "the appearance of", "the nervous system of", "being different to", "being equal to", "being around", "being new", "being half of", "supporting", "being wrong about", "not being", "across", "above"};
        String[] rootDef = {"the worst high school of all time", "light", "time", "truth", "form", "change", "knowledge", "distance", "influence", "chaos", "identity", "memory", "power", "growth", "unity", "disorder", "structure", "pattern", "energy", "nature"};
        String[] srfDef = {"Complex of", "Relating to", "Thread of", "Full of", "State or result of", "Condition of", "Fear of", "Mental disorder of", "State of", "In a certain way of", "Plural of", "Relating to", "Form or shape of", "Capable of", "Full of", "Without", "Resembling", "Having the quality of", "Characteristic of", "State of being of"};
        
        System.out.print("How many random words do you want? ");
        
        Scanner scanner = new Scanner(System.in);
        int wordCount = scanner.nextInt();
        
        for (int i = 0; i < wordCount; i++) 
        {
            int randPreNum = randPre.nextInt(20);
            int randSrfNum = randSrf.nextInt(20);
            int randRootNum = randRoot.nextInt(20);
            
            System.out.println(pre[randPreNum] + "-" + root[randRootNum] + "-" + srf[randSrfNum] + " | Definition: " + srfDef[randSrfNum] + " " + preDef[randPreNum] + " " + rootDef[randRootNum] + ".");
        }
        scanner.close();
    }
}
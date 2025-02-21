public class MyProgram
{
    public static void main(String[] args)
    {
        int bottles = 99;
        for(int i=97; i>0; i--)
        {
            System.out.println(bottles + " bottles of reed on the wall, " + bottles + " bottles of reed.");
            bottles=bottles-1;
            System.out.println("Take one down, pass it around, " + bottles + " bottles of reed on the wall.");
        }
     System.out.println("1 bottle of reed on the wall, 1 bottle of reed");
     System.out.println("Take one down, pass it around, 0 bottles of reed on the wall.");
    }
}
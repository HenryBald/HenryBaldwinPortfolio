import java.lang.Math;
import java.util.Scanner;

public class MyProgram
{
    public static void main(String[] args)
    {
        
        Scanner scanner = new Scanner(System.in);
        

        System.out.println("This program will calculate the surface area and volume of a shape of your choice.");
        System.out.println("Type 'b' for a box, 'p' for a pyramid, 's' for a sphere, or 'c' for a cylinder.");
        
        String shapeString = scanner.nextLine();
        
        if(shapeString.equals("b"))
        {
        System.out.println("You chose box!");
        System.out.println("Enter length:");
        String length = scanner.nextLine();
        System.out.println("Enter width:");
        String width = scanner.nextLine();
        System.out.println("Enter height:");
        String height = scanner.nextLine();
        
        Box b1 = new Box(Integer.parseInt(length),Integer.parseInt(width),Integer.parseInt(height));
        
        System.out.println("Your volume is " + b1.calcVol());
        System.out.println("Your surface area is " + b1.calcSurfArea());

        } else if(shapeString.equals("p")) {
        System.out.println("You chose pyramid!");
        System.out.println("Enter length:");
        String length = scanner.nextLine();
        System.out.println("Enter width:");
        String width = scanner.nextLine();
        System.out.println("Enter height:");
        String height = scanner.nextLine();
        
        Pyramid p1 = new Pyramid(Integer.parseInt(length),Integer.parseInt(width),Integer.parseInt(height));
        
        System.out.println("Your volume is " + p1.calcVol());
        System.out.println("Your surface area is " + p1.calcSurfArea());
        
        } else if(shapeString.equals("s")) {
            
        System.out.println("You chose sphere!");
        System.out.println("Enter radius:");
        String length = scanner.nextLine();
        
        Sphere s1 = new Sphere(Integer.parseInt(length));
        
        System.out.println("Your volume is " + s1.calcVol());
        System.out.println("Your surface area is " + s1.calcSurfArea());
            
        } else if(shapeString.equals("c")) {
            
            System.out.println("You chose cylinder!");
        System.out.println("Enter radius:");
        String length = scanner.nextLine();
        System.out.println("Enter height:");
        String width = scanner.nextLine();
        
        Cylinder c1 = new Cylinder(Integer.parseInt(length),Integer.parseInt(width));
        
        System.out.println("Your volume is " + c1.calcVol());
        System.out.println("Your surface area is " + c1.calcSurfArea());
        
        } else {
            System.out.println("no");
        }
    }
}
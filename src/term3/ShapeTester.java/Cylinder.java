public class Cylinder {
    // Declalre and initialize attributes

    double r;
    double h;
    
    //Constructor
    Cylinder(double r, double h) {
        this.r = r;
        this.h = h;
    }
    // methods to calculate volume and surface area
    public double calcVol() {
        double vol=Math.PI * Math.pow(r, 2) * h;
        return vol;
    }
    public double calcSurfArea() {
        // calculate surface area
        double sa = 2 * Math.PI * r * h + 2 * Math.PI * Math.pow(r, 2);
        return sa;
    }
    

}
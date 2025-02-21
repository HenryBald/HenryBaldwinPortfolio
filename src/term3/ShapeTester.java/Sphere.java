public class Sphere {
    // Declalre and initialize attributes
    
    double r;
    
    //Constructor
    Sphere(double r) {
        this.r = r;
    }
    // methods to calculate volume and surface area
    public double calcVol() {
        double vol = 4.188888888*Math.pow(r,3);
        return vol;
    }
    public double calcSurfArea() {
        // calculate surface area
        double vol = 4*Math.PI*Math.pow(r,2);
        return vol;
    }
    

}
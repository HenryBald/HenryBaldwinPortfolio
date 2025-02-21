public class Pyramid {
    // Declalre and initialize attributes
    
    double l;
    double w;
    double h;

    //Constructor
    Pyramid(double l, double w, double h) {
        this.l = l;
        this.w = w;
        this.h = h;
    }
    
    // methods to calculate volume and surface area
    public double calcVol() {
        double vol= l*h*w/3;
        return vol;
    }
    
    public double calcSurfArea() {
        // calculate surface area
    double sa = l*w+l*Math.sqrt(Math.pow(w/2,2)+Math.pow(h,2))+w*Math.sqrt(Math.pow(w/2,2)+Math.pow(h,2));
    return sa;
        }
        

}
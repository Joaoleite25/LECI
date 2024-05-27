package Teste;

public class StandardShippingCostCalculator implements IShippingCostCalculator {
    @Override
    public double calculateShippingCost(Parcel parcel) {
        double weight = parcel.getWeight();

        if (weight < 5) {
            return weight * 1;
        } else if (weight <= 10) {
            return weight * 2;
        } else {
            return weight * 3;
        }
    }
}

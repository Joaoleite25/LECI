package Ex04;
import java.util.Scanner;


public class CarDemo {

    static Scanner sc = new Scanner(System.in);

    static int registerCars(Car[] cars) {
        int numCars = 0;
        while (numCars < cars.length) {
            System.out.println("Insira dados do carro (marca modelo ano quilômetros): ");
            String input = sc.nextLine();
            if (input.isEmpty()) {
                break;
            }
            String[] carData = input.split(" ");
            if (carData.length < 4) {
                System.out.println("Dados mal formatados. Tente novamente.");
                continue;
            }
            String make = carData[0];
            String model = carData[1];
            for (int i = 2; i < carData.length - 2; i++) {
                model += " " + carData[i];
            }
            int year;
            int kms;
            try {
                year = Integer.parseInt(carData[carData.length - 2]);
                kms = Integer.parseInt(carData[carData.length - 1]);
            } catch (NumberFormatException e) {
                System.out.println("Dados mal formatados. Tente novamente.");
                continue;
            }
            cars[numCars] = new Car(make, model, year, kms);
            numCars++;
        }
        
        return numCars;
    }

    static void registerTrips(Car[] cars, int numCars) {
        
        while (true) {
            System.out.println("Registe uma viagem no formato \"carro:distância\": ");
            String input = sc.nextLine();
            if (input.isEmpty()) {
                break;
            }
            String[] tripData = input.split(":");
            if (tripData.length != 2) {
                System.out.println("Dados mal formatados. Tente novamente.");
                continue;
            }
            int carIndex;
            int distance;
            try {
                carIndex = Integer.parseInt(tripData[0]);
                distance = Integer.parseInt(tripData[1]);
                if (carIndex < 0 || carIndex >= numCars) {
                    System.out.println("Índice do carro inválido. Tente novamente.");
                    continue;
                }
            } catch (NumberFormatException e) {
                System.out.println("Dados mal formatados. Tente novamente.");
                continue;
            }
            cars[carIndex].drive(distance);
        }
    }


    static void listCars(Car[] cars) {
        System.out.println("Carros registados:");
        for (Car car : cars) {
            System.out.println(car);
        }
        System.out.println("");
    }

    public static void main(String[] args) {

        Car[] cars = new Car[10];

        int numCars = registerCars(cars);

        if (numCars>0) {
            listCars(cars);
            registerTrips(cars, numCars);
            listCars(cars);
        }

        sc.close();

    }
}
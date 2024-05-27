package aula09;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

public class Ex02 {
    public static void main(String[] args) {
        int[] dimensions = {1000, 5000, 10000, 20000, 40000, 100000};
        String[] structures = {"ArrayList", "LinkedList"};
        System.out.println("Collection\t" + arrayToString(dimensions));
        System.out.println("-------------------------------------------------------------------------------------------------------");
        for (String structure : structures) {
            System.out.println(structure);
            for (int dim : dimensions) {
                Collection<Integer> col;
                if (structure.equals("ArrayList")) {
                    col = new ArrayList<>();
                } else if (structure.equals("LinkedList")) {
                    col = new LinkedList<>();
                } else {
                    col = null;
                }
                double[] times = checkPerformance(col, dim);
                System.out.println(dim + "\t\t" + arrayToString(times));
            }
            System.out.println();
        }
    }

    private static double[] checkPerformance(Collection<Integer> col, int DIM) {
        double start, stop;

        start = System.nanoTime();
        for (int i = 0; i < DIM; i++)
            col.add(i);
        stop = System.nanoTime();
        double addTime = (stop - start) / 1e6;

        start = System.nanoTime();
        for (int i = 0; i < DIM; i++) {
            int n = (int) (Math.random() * DIM);
            col.contains(n);
        }
        stop = System.nanoTime();
        double searchTime = (stop - start) / 1e6;

        start = System.nanoTime();
        Iterator<Integer> iterator = col.iterator();
        while (iterator.hasNext()) {
            iterator.next();
            iterator.remove();
        }
        stop = System.nanoTime();
        double removeTime = (stop - start) / 1e6;

        return new double[]{addTime, searchTime, removeTime};
    }

    private static String arrayToString(int[] array) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < array.length; i++) {
            sb.append(array[i]);
            if (i < array.length - 1) {
                sb.append("\t\t");
            }
        }
        return sb.toString();
    }

    private static String arrayToString(double[] array) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < array.length; i++) {
            sb.append(String.format("%.2f", array[i]));
            if (i < array.length - 1) {
                sb.append("\t\t");
            }
        }
        return sb.toString();
    }
}

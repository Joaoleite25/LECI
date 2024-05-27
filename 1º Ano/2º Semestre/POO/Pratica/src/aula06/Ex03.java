package aula06;

import java.util.Arrays;

public class Ex03 {

    public class Conjunto {
        private int[] elementos;
        private int tamanho;

        public Conjunto() {
            this.elementos = new int[10]; // Inicializa o array com tamanho 10
            this.tamanho = 0;
        }

        public void insert(int n) {
            if (!contains(n)) {
                if (tamanho == elementos.length) {
                    elementos = Arrays.copyOf(elementos, tamanho * 2); // Dobra o tamanho do array se necessário
                }
                elementos[tamanho++] = n;
            }
        }

        public boolean contains(int n) {
            for (int i = 0; i < tamanho; i++) {
                if (elementos[i] == n) {
                    return true;
                }
            }
            return false;
        }

        public void remove(int n) {
            for (int i = 0; i < tamanho; i++) {
                if (elementos[i] == n) {
                    for (int j = i; j < tamanho - 1; j++) {
                        elementos[j] = elementos[j + 1];
                    }
                    tamanho--;
                    return;
                }
            }
        }

        public void empty() {
            tamanho = 0;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < tamanho; i++) {
                sb.append(elementos[i]).append(" ");
            }
            return sb.toString();
        }

        public int size() {
            return tamanho;
        }

        public Conjunto combine(Conjunto add) {
            Conjunto result = new Conjunto();
            for (int i = 0; i < this.tamanho; i++) {
                result.insert(this.elementos[i]);
            }
            for (int i = 0; i < add.size(); i++) {
                result.insert(add.elementos[i]);
            }
            return result;
        }

        public Conjunto subtract(Conjunto dif) {
            Conjunto result = new Conjunto();
            for (int i = 0; i < this.tamanho; i++) {
                if (!dif.contains(this.elementos[i])) {
                    result.insert(this.elementos[i]);
                }
            }
            return result;
        }

        public Conjunto intersect(Conjunto inter) {
            Conjunto result = new Conjunto();
            for (int i = 0; i < this.tamanho; i++) {
                if (inter.contains(this.elementos[i])) {
                    result.insert(this.elementos[i]);
                }
            }
            return result;
        }

        public void main(String[] args) {
            Conjunto c1 = new Conjunto();
            c1.insert(4);
            c1.insert(7);
            c1.insert(6);
            c1.insert(5);
            Conjunto c2 = new Conjunto();
            int[] test = { 7, 3, 2, 5, 4, 6, 7 };
            for (int el : test)
                c2.insert(el);
            c2.remove(3);
            c2.remove(5);
            c2.remove(6);
            System.out.println(c1);
            System.out.println(c2);
            System.out.println("Número de elementos em c1: " + c1.size());
            System.out.println("Número de elementos em c2: " + c2.size());
            System.out.println("c1 contém 6?: " + ((c1.contains(6) ? "sim" : "não")));
            System.out.println("c2 contém 6?: " + ((c2.contains(6) ? "sim" : "não")));
            System.out.println("União:" + c1.combine(c2));
            System.out.println("Interseção:" + c1.intersect(c2));
            System.out.println("Diferença:" + c1.subtract(c2));
            c1.empty();
            System.out.println("c1:" + c1);
        }
    }

}

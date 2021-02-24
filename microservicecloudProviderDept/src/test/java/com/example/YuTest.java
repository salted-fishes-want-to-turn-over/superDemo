package com.example;

public class YuTest {
    private static class Student {
        String name;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public Student(String name) {
            this.name = name;
        }
    }

    public static void main(String[] args) {
        Student s1 = new Student("小张");
        Student s2 = new Student("小李");
        YuTest.swap(s1, s2);
        System.out.println("s1:" + s1.getName());
        System.out.println("s2:" + s2.getName());

    }

    public static void swap(Student x, Student y){
        Student temp = x;
        x = y;
        y = temp;
        System.out.println("x:" + x.getName());
        System.out.println("y:" + y.getName());
    }
}

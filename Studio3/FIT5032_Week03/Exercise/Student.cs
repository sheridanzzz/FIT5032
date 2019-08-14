using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FIT5032_Week03.Exercise
{
    public class Student
    {
        public string Name { get; set; }
        public string PhoneNumber { get; set; }

        public Student(String name, String phoneNumber)
        {
            Name = name;
            PhoneNumber = phoneNumber;
        }
    }

    public class ExampleDictionary
    {
        public void Example()
        {
            Dictionary<int, Student> studentDictionary = new Dictionary<int, Student>();
            //used for indexing student to id as an example. int is id

            Student s1 = new Student("Alex", "0431170991");//creates object of student class
            Student s2 = new Student("Kim", "0431170992");

            studentDictionary.Add(1,s1);//add values to dictionary
            studentDictionary.Add(2,s2);

            Student result = new Student("", "");

            studentDictionary.TryGetValue(1, out result);
            //checks if the student with index 1 exists, boolean.
        }
    }
}
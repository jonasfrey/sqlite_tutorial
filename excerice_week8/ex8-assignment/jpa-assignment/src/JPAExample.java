import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class JPAExample {

    public static void main(String[] args) {

        EntityManagerFactory factory =
                Persistence.createEntityManagerFactory("university");
        EntityManager em = factory.createEntityManager();

        TypedQuery<Instructor> q1 =
                em.createQuery("SELECT e FROM Instructor e", Instructor.class);
        List<Instructor> instructorList = q1.getResultList();

        for (Instructor instructor : instructorList) {
            System.out.println(instructor);
        }


        TypedQuery<Department> q2 =
                em.createQuery("SELECT e FROM Department e", Department.class);
        List<Department> departmentList = q2.getResultList();

        for (Department o_department : departmentList) {
            List<Instructor> a_o_instructor_filtered = o_department.f_a_o_instructor();

            float n_sum = 0;

            for (Instructor o_instructor_filtered : a_o_instructor_filtered) {
                n_sum += o_instructor_filtered.salary;
                System.out.println(o_instructor_filtered);
            }

            System.out.println("average salary:");
            System.out.println(n_sum/a_o_instructor_filtered.size());

        }

        // many to many connections
        for (Instructor instructor : instructorList) {
            System.out.println(instructor.f_a_o_department());
        }
        for (Department o_department : departmentList) {
            System.out.println(o_department.f_a_o_instructor());
        }

        em.close();
        factory.close();
    }

}
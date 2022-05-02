import javax.persistence.*;
import java.util.List;

import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

@Entity
public class Department {

// schema department
// CREATE TABLE department (
//     dept_name varchar(20),
//     building varchar(15),
//     budget numeric(12, 2) check (budget > 0),
//     primary key (dept_name)
// );

    @Id
    public String dept_name;
    public String building;
    public float budget;

    public Department() {
        super();
    }
    public List<Instructor> f_a_o_instructor() {

        EntityManagerFactory factory =
                Persistence.createEntityManagerFactory("university");
        EntityManager em = factory.createEntityManager();

        TypedQuery<Instructor> q1 =
                em.createQuery("SELECT e FROM Instructor e", Instructor.class);
        List<Instructor> instructorList = q1.getResultList();

        List<Instructor> a_o_instructor_filtered = instructorList.stream()
                .filter(p -> p.dept_name.equals(this.dept_name) ).collect(Collectors.toList());

        return a_o_instructor_filtered;
    }

    @Override
    public String toString() {
        return "Department ["+
                " dept_name=" + dept_name +
                ", building=" + building +
                ", numeric=" + budget + "]";
    }

}

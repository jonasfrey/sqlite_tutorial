import javax.persistence.*;
import java.util.List;
import java.util.stream.Collectors;

@Entity
public class Instructor {
    @Id
    public Integer id;
    public String name;
    public String dept_name;
    public float salary;

    public Instructor() {
        super();
    }

    public List<Department> f_a_o_department() {

        EntityManagerFactory factory =
                Persistence.createEntityManagerFactory("university");
        EntityManager em = factory.createEntityManager();

        TypedQuery<Department> q1 =
                em.createQuery("SELECT e FROM department e", Department.class);
        List<Department> departmentList = q1.getResultList();

        List<Department> a_o_department_filtered = departmentList.stream()
                .filter(p -> p.dept_name.equals(this.dept_name) ).collect(Collectors.toList());

        return a_o_department_filtered;
    }


    @Override
    public String toString() {
        return "Instructor [id=" + id +
				", name=" + name +
				", dept_name=" + dept_name +
				", salary=" + salary + "]";
    }

}

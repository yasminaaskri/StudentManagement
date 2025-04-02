package com.esgitech.restclient.repository;




import com.esgitech.restclient.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface StudentRep extends JpaRepository<Student, Long> {
    @Query("SELECT s FROM Student s WHERE s.nom = :term OR s.prenom = :term")
    List<Student> findByNomOrPrenom(@Param("term") String term);
}

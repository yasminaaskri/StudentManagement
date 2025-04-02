package com.esgitech.restclient.controller;

import com.esgitech.restclient.entity.Student;
import com.esgitech.restclient.repository.StudentRep;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Path("/students")
public class StudentRest {

    @Autowired
    private StudentRep studentRepository;

    @GET
    @Produces({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    public List<Student> getStudents() {
        return studentRepository.findAll();
    }

    @GET
    @Path("/{id}")
    @Produces({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    public Student getStudent(@PathParam("id") Long id) {
        return studentRepository.findById(id).orElseThrow(() -> new RuntimeException("Student not found"));
    }

    @POST
    @Produces({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    public Student save(Student student) {
        return studentRepository.save(student);
    }

    @GET
    @Path("/search/{term}")
    @Produces({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    public List<Student> search(@PathParam("term") String term) {
        return studentRepository.findByNomOrPrenom(term);
    }

    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)  // Add this annotation
    @Produces({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
    public Response update(@PathParam("id") Long id, Student newStudent) {
        try {
            Student student = studentRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Student not found"));
            student.setNom(newStudent.getNom());
            student.setPrenom(newStudent.getPrenom());
            Student updated = studentRepository.save(student);
            return Response.ok(updated).build();
        } catch (Exception e) {
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(e.getMessage())
                    .build();
        }
    }

    @DELETE
    @Path("/{id}")
    @Produces({MediaType.APPLICATION_JSON})
    public void delete(@PathParam("id") Long id) {
        studentRepository.deleteById(id);
    }
}


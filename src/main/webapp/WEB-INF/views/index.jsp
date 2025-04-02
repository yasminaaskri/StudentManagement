<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Gérer les étudiants</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        async function deleteStudent(id) {
            if (confirm("Êtes-vous sûr de vouloir supprimer cet étudiant?")) {
                try {
                    const response = await fetch(`/api/students/`+ encodeURIComponent(id), {
                        method: "DELETE"
                    });
                    if (response.ok) {
                        alert("Étudiant supprimé !");
                        location.reload();
                    } else {
                        alert("Erreur lors de la suppression.");
                    }
                } catch (error) {
                    console.error("Error:", error);
                    alert("Erreur réseau");
                }
            }
        }
    </script>
</head>
<body class="container mt-5">
<div class="card">
    <div class="card-header bg-primary text-white">
        <h1 class="h4">Liste des étudiants</h1>
    </div>
    <div class="card-body">
        <a href="/view/create" class="btn btn-success mb-3">Ajouter un étudiant</a>
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${students}" var="student">
                <tr>
                    <td>${student.id}</td>
                    <td>${student.nom}</td>
                    <td>${student.prenom}</td>
                    <td>
                        <a href="/view/edit?id=${student.id}" class="btn btn-sm btn-warning">Modifier</a>
                        <button onclick="deleteStudent(${student.id})" class="btn btn-sm btn-danger">Supprimer</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
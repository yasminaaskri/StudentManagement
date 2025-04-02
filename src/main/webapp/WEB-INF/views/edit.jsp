<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Modifier un étudiant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        async function updateStudent() {
            const id = document.getElementById("id").value;
            const nom = document.getElementById("nom").value;
            const prenom = document.getElementById("prenom").value;

            console.log("Attempting to update student:", {id, nom, prenom});

            try {
                const url = '/api/students/' + encodeURIComponent(id);
                console.log("Request URL:", url);

                const response = await fetch(url, {
                    method: "PUT",
                    headers: {
                        "Content-Type": "application/json",
                        "Accept": "application/json"
                    },
                    body: JSON.stringify({
                        nom: nom,
                        prenom: prenom
                    })
                });

                if (!response.ok) {
                    const error = await response.text();
                    throw new Error(error || "Update failed with status: " + response.status);
                }

                alert("Student updated successfully!");
                window.location.href = "<c:url value='/view/' />";
            } catch (error) {
                console.error("Update failed:", {error});
                alert("Error updating student: " + error.message);
            }
        }
    </script>
</head>
<body class="container mt-5">
<div class="card">
    <div class="card-header bg-primary text-white">
        <h1 class="h4">Modifier un étudiant</h1>
    </div>
    <div class="card-body">
        <form onsubmit="event.preventDefault(); updateStudent();">
            <input type="hidden" id="id" value="${student.id}">
            <div class="mb-3">
                <label for="nom" class="form-label">Nom :</label>
                <input type="text" class="form-control" id="nom" value="${student.nom}" required>
            </div>
            <div class="mb-3">
                <label for="prenom" class="form-label">Prénom :</label>
                <input type="text" class="form-control" id="prenom" value="${student.prenom}" required>
            </div>
            <button type="submit" class="btn btn-primary">Modifier</button>
            <a href="<c:url value='/view/' />" class="btn btn-secondary">Retour</a>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
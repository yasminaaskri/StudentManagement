<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Ajouter un étudiant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        async function addStudent() {
            const nom = document.getElementById("nom").value;
            const prenom = document.getElementById("prenom").value;

            const response = await fetch("/api/students", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ nom, prenom })
            });

            if (response.ok) {
                alert("Étudiant ajouté !");
                window.location.href = "<c:url value='/view/' />";
            } else {
                alert("Erreur d'ajout.");
            }
        }
    </script>
</head>
<body class="container mt-5">
<div class="card">
    <div class="card-header bg-primary text-white">
        <h1 class="h4">Ajouter un nouvel étudiant</h1>
    </div>
    <div class="card-body">
        <form onsubmit="event.preventDefault(); addStudent();">

            <div class="mb-3">
                <label for="nom" class="form-label">Nom :</label>
                <input type="text" class="form-control" id="nom" placeholder="Entrez le nom" required>
            </div>
            <div class="mb-3">
                <label for="prenom" class="form-label">Prénom :</label>
                <input type="text" class="form-control" id="prenom" placeholder="Entrez le prénom" required>
            </div>
            <button type="submit" class="btn btn-primary">Ajouter</button>
            <a href="/view/" class="btn btn-secondary">Retour</a>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
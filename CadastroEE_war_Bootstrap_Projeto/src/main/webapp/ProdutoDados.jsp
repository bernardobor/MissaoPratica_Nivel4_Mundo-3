<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Produto</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container">
    <h1 class="my-4">Cadastro de Produto</h1>
    <form action="ServletProdutoFC" method="post" class="form">
        <input type="hidden" name="acao" value="${produto == null ? 'incluir' : 'alterar'}">
        <c:if test="${produto != null}">
            <input type="hidden" name="id" value="${produto.id}">
        </c:if>
        <div class="mb-3">
            <label class="form-label">Nome:</label>
            <input type="text" name="nome" class="form-control" value="${produto != null ? produto.nome : ''}">
        </div>
        <div class="mb-3">
            <label class="form-label">Quantidade:</label>
            <input type="number" name="quantidade" class="form-control" value="${produto != null ? produto.quantidade : ''}">
        </div>
        <div class="mb-3">
            <label class="form-label">Preço de Venda:</label>
            <input type="text" name="precoVenda" class="form-control" value="${produto != null ? produto.precoVenda : ''}">
        </div>
        <button type="submit" class="btn btn-primary">${produto == null ? 'Incluir' : 'Alterar'}</button>
    </form>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

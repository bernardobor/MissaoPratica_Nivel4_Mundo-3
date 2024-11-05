<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Produto</title>
</head>
<body>
    <h1>Cadastro de Produto</h1>
    <form action="ServletProdutoFC" method="post">
        <input type="hidden" name="acao" value="${produto == null ? 'incluir' : 'alterar'}">
        <c:if test="${produto != null}">
            <input type="hidden" name="id" value="${produto.id}">
        </c:if>
        <div>
            <label>Nome:</label>
            <input type="text" name="nome" value="${produto != null ? produto.nome : ''}">
        </div>
        <div>
            <label>Quantidade:</label>
            <input type="number" name="quantidade" value="${produto != null ? produto.quantidade : ''}">
        </div>
        <div>
            <label>Preço de Venda:</label>
            <input type="text" name="precoVenda" value="${produto != null ? produto.precoVenda : ''}">
        </div>
        <button type="submit">${produto == null ? 'Incluir' : 'Alterar'}</button>
    </form>
</body>
</html>

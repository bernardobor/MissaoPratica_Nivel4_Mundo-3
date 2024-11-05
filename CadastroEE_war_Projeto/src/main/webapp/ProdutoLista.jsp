<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Produtos</title>
</head>
<body>
    <h1>Lista de Produtos</h1>
    <a href="ServletProdutoFC?acao=formIncluir">Incluir Produto</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Quantidade</th>
            <th>Preço</th>
            <th>Ações</th>
        </tr>
        <c:forEach var="produto" items="${produtos}">
            <tr>
                <td>${produto.id}</td>
                <td>${produto.nome}</td>
                <td>${produto.quantidade}</td>
                <td>${produto.precoVenda}</td>
                <td>
                    <a href="ServletProdutoFC?acao=formAlterar&id=${produto.id}">Alterar</a>
                    <a href="ServletProdutoFC?acao=excluir&id=${produto.id}">Excluir</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

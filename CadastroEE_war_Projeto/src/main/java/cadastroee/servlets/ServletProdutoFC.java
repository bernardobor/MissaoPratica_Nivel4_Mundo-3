package cadastroee.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.ejb.EJB;
import cadastroee.controller.ProdutoFacadeLocal;
import cadastroee.model.Produto;
import java.util.List;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/ServletProdutoFC")
public class ServletProdutoFC extends HttpServlet {

    @EJB
    ProdutoFacadeLocal facade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("acao");
        String destino;
        if ("formAlterar".equals(acao) || "formIncluir".equals(acao)) {
            destino = "ProdutoDados.jsp";
        } else {
            destino = "ProdutoLista.jsp";
        }

        if ("listar".equals(acao)) {
            List<Produto> produtos = facade.findAll();
            request.setAttribute("produtos", produtos);
        } else if ("formAlterar".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Produto produto = facade.find(id);
            request.setAttribute("produto", produto);
        } else if ("excluir".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            facade.remove(facade.find(id));
            List<Produto> produtos = facade.findAll();
            request.setAttribute("produtos", produtos);
        } else if ("alterar".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Produto produto = facade.find(id);
            produto.setNome(request.getParameter("nome"));
            produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            produto.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
            facade.edit(produto);
            List<Produto> produtos = facade.findAll();
            request.setAttribute("produtos", produtos);
        } else if ("incluir".equals(acao)) {
            Produto produto = new Produto();
            produto.setNome(request.getParameter("nome"));
            produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            produto.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
            facade.create(produto);
            List<Produto> produtos = facade.findAll();
            request.setAttribute("produtos", produtos);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}

<%@page import="java.util.ArrayList"%>
<%@page import="Bean.Produto"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
<script>
	$(document).ready(function(){
		$(".parallax").parallax();
		$(".dropdown-button").dropdown();
		$(".modal-trigger").leanModal();
		$(".button-collapse").sideNav();
	});
</script>
	<title>D&C</title>
	
	<style type="text/css">
		#cadastroModal{
			width: 60%;
		}
		#loginModal{
			width: 20%;
		}
		.parallax-container{
			height: 500px; 
		}

	</style>
</head>
<body>
    <%
        if(session.getAttribute("nome") != null){
            out.println("<script> "
                    + "$(document).ready(function(){ "
                    +    "$('#loginButton, #cadastroButton').css('display', 'none'); "
                    +    "$('#minhaContaButton, #logoutButton').css('display', 'inline-block'); "
                    +    "$('#minhaContaButtonMobile, #logoutButtonMobile').css('display', 'block'); "
                    + "});"
                    + "</script>");           
        }
        if (session.getAttribute("admin") != null) {
            out.println("<script>alert('Desculpe, você está logado como administrador. Para poder efetuar compras logue novamente com um usuário normal.')</script>");
        }
    %>
<ul id="dropdown1" class="dropdown-content">
  <li><a href="doces.jsp">Doces</a></li>
  <li><a href="salgados.jsp">Salgados</a></li>
</ul>
<ul id="dropdown2" class="dropdown-content">
  <li><a href="doces.jsp">Doces</a></li>
  <li><a href="salgados.jsp">Salgados</a></li>
</ul>
<nav class="grey darken-2 z-depth-3">
  <div class="nav-wrapper container grey darken-2">
    <a href="#!" class="brand-logo"><img src="img/logo.png" style="width:70px;"></a>
<!-- Botão do Menu Mobile -->
    <a href="#" data-activates="mobile" class="button-collapse"><img src="img/menuButton.png" style="width:30px; margin-top: 15px;"></a>
<!-- Opções da Navbar -->
    <ul class="right hide-on-med-and-down">
      <li class="waves-effect waves-yellow"><a href="index.jsp">Início</a></li>
      <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Produtos</a></li>
      <li class="waves-effect waves-yellow"><a href="pedido.jsp">Carrinho</a></li>
      <li id="loginButton"><a href="#loginModal" class="waves-effect waves-yellow btn modal-trigger white black-text">Login</a></li>
      <li id="cadastroButton"><a href="#cadastroModal" class="waves-effect waves-light btn-large modal-trigger yellow darken-1 ">Cadastre-se</a></li>
      <li id="minhaContaButton" style="display:none;"><a href="userHome.jsp" class="waves-effect waves-light btn-large yellow darken-1">Minha Página</a></li>
      <li id="logoutButton" style="display:none;"><a href="ServletLogout" class="white-text">Sair</a></li>
    </ul>
<!-- Opções do Menu Mobile -->
    <ul class="side-nav" id="mobile">
      <li><a href="index.jsp">Início</a></li>
      <li><a href="#!" class="dropdown-button" data-activates="dropdown2">Produtos</a></li>
      <li><a href="pedido.jsp">Carrinho</a></li>
      <li id="loginButton"><a href="#loginModal" class="waves-effect waves-yellow btn modal-trigger white black-text">Login</a></li>
      <li id="cadastroButton"><a href="#cadastroModal" class="waves-effect waves-light btn-large modal-trigger yellow darken-1 ">Cadastre-se</a></li>
      <li id="minhaContaButtonMobile" style="display:none;"><a href="userHome.jsp" class="waves-effect waves-light btn-large yellow darken-1">Minha Página</a></li>
      <li id="logoutButtonMobile" style="display:none;"><a href="ServletLogout">Sair</a></li>
    </ul>
  </div>
</nav>
<!-- Banner Parallax -->
<div class="parallax-container">
	<div class="parallax">
		<img src="img/homebanner.jpg" style="width:120%;">
	</div>
</div>
<!--Modal da tela de Login -->
 <div id="loginModal" class="modal">
    <div class="modal-content">
      <h4>Login</h4>
      <div class="row">
    <form class="col s12" method="post" action="ServletLogin">
      <div class="row">
	      <div class="input-field col s12">
	      		<input id="login" name="login" type="text">
	      		<label for="login">Usuário</label>
	      </div>
	  </div>
	  <div class="row">
	        <div class="input-field col s12">
	          <input id="password" type="password" name="password" class="validate">
	          <label for="password">Senha</label>
	        </div>      	
	  </div>
      <div class="row">
      	  <div class="input-field col s1"></div>
	      	<div class="input-field col s10">
	      		<input class="btn-large waves-effect waves-light yellow darken-1" type="submit" value="Entrar">
	      	</div>
      	  
      </div>
    </form>
  </div>
  </div>
</div>
<!--Modal da tela de Cadastro -->
<div id="cadastroModal" class="modal">
    <div class="modal-content">
      <h4>Cadastro</h4>
      <div class="row">
    <form class="col s12" method="post" action="ServletCadastro">
      <div class="row">
        <div class="input-field col s12">
          <input placeholder="Ex: José da Silva Santos" id="name" name="name" type="text" title="Insira o seu nome." class="validate" required="required">
          <label for="first_name">Nome Completo</label>
        </div>
      </div>
      <div class="row">
      	<div class="input-field col s6">
      		<input id="cpf" name="cpf" type="text" title="Insira o seu CPF." required="required">
      		<label for="cpf">CPF</label>
      	</div>
        <div class="input-field col s6">
          <input id="rg" type="text" class="validate" name="rg" title="Insira o seu RG." required="required">
          <label for="rg">RG</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input placeholder="Ex: example@example.com" id="email" name="email" type="email" class="validate">
          <label for="email">E-mail</label>
        </div>
      </div>
       <div class="row">
        <div class="input-field col s12">
          <input placeholder="Ex: Rua Miguel Alcides de Castro" id="endereco" name="endereco" type="text" class="validate">
          <label for="address">Endereço</label>
        </div>
      </div>
      <div class="row">
      	<div class="input-field col s6">
      		<input id="phone" name="telefone" type="text">
      		<label for="phone">Telefone</label>
      	</div>
      <div class="file-field input-field col s6">
	      <div class="btn yellow darken-1 waves-effect wave-light">
	        <span>Foto</span>
	        <input name="foto" type="file">
	      </div>
	      <div class="file-path-wrapper">
	        <input class="file-path validate" placeholder="Escolha a foto do seu perfil" type="text">
	      </div>
      </div>
      </div>
      <div class="row">
      <div class="input-field col s6">
      		<input id="login" name="login" type="text" title="Insira um nome de usuário." required="required">
      		<label for="login">Usuário</label>
      </div>
        <div class="input-field col s6">
          <input id="password" type="password" name="password" title="Insira uma senha." class="validate" required="required">
          <label for="password">Senha</label>
        </div>      	
      </div>
      <div class="row">
     	 <div class="input-field col s4"></div>
	      <input class="btn-large waves-effect waves-light yellow darken-1 col s2" type="submit" value="Cadastrar">	  
	      <button class="waves-effect waves-red btn-flat btn-large white col s2" type="reset">
	      	Limpar
	      </button>		 
	     <div class="input-field col s4"></div> 
      </div>
    </form>
  </div>
 </div>
</div>

<!-- Row dos Doces -->
<div class="container">
    <div class="section">
 <!-- Linha -->

      <div class="row">
      	<h4>Doces...</h4>
           <% 
                ProdutoDAO produtoDao = new ProdutoDAO();
                ArrayList<Produto> produtos = produtoDao.listarTodos("doce"); 
                int i=0;
                for (Produto product : produtos ) {
                    i++;
                        
            %>
            <form method="post" action="ServletPedido">
              <input type="text" name="id" style="display:none;" value="<%= product.getIdProduto()%>"/>
              <div class="col s12 m4 hoverable">
                <div class="icon-block">
                                <h2 class="center light-blue-text">
                                    <img class="circle" src="produtoImg/<%=product.getFoto()%>" style="width:150px; height:150px;">
                                </h2>
                        <h5 class="center"><%=product.getNomeProduto()%></h5>
                        <p class="light center" style="height:43.64px;"><%=product.getDescricao()%></p>
                        <h4><p class="orange-text center">R$ <%=product.getPrecoUnidade()%></p></h4>
                        <div class="center">
                                <button type="submit" class="btn waves-effect waves-light white-text yellow darken-2">
                                      Comprar
                                </button>
                        </div>
                        <br>
                </div>
              </div>
            </form>
            <%
                if(i==3){
                    break;
                }
              }
              
            %>
      </div>
 <!-- Fim da Linha -->
      <a class="yellow-text right-align" href="doces.jsp"><h5 class="light">Clique para ver mais...</h5></a>
    </div>
 </div>
 <!-- Parallax Salgados -->
<div class="parallax-container valign-wrapper" style="height:350px;">
    <div class="row container">
      <h4 class="header col s12 center-align white-text">Aqui você encontra qualidade e preço baixo! Faça seu pedido com a Delícias & Cia</h4>
    </div>
    <div class="parallax"><img src="img/salgadosBanner.jpg"></div>
</div>

<!-- Row dos Salgados -->
<div class="container">
    <div class="section">
 <!-- Linha -->
      <div class="row">
        <h4>Salgados...</h4>
           <% 
                ProdutoDAO produtoDao2 = new ProdutoDAO();
                ArrayList<Produto> produtos2 = produtoDao2.listarTodos("salgado"); 
                int i2=0;
                for (Produto product : produtos2 ) {
                    i2++;
                        
            %>
            <form method="post" action="ServletPedido">
              <input type="text" name="id" style="display:none;" value="<%= product.getIdProduto()%>"/>
              <div class="col s12 m4 hoverable">
                <div class="icon-block">
                                <h2 class="center light-blue-text">
                                    <img class="circle" src="produtoImg/<%=product.getFoto()%>" style="width:150px; height:150px;">
                                </h2>
                        <h5 class="center"><%=product.getNomeProduto()%></h5>
                        <p class="light center" style="height:43.64px;"><%=product.getDescricao()%></p>
                        <h4><p class="orange-text center">R$ <%=product.getPrecoUnidade()%></p></h4>
                        <div class="center">
                                <button type="submit" class="btn waves-effect waves-light white-text yellow darken-2">
                                      Comprar
                                </button>
                        </div>
                        <br>
                </div>
              </div>
            </form>
            <%
                if(i2==3){
                    break;
                }
              }
              
            %>
      </div>
 <!-- Fim da Linha -->
      <a class="yellow-text right-align" href="salgados.jsp"><h5 class="light">Clique para ver mais...</h5></a>
    </div>
 </div>
</body>
</html>
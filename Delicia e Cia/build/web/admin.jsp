<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
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
	<meta charset="utf-8">
	<style type="text/css">
		#cadastroModal{
			width: 60%;
		}
		#loginModal{
			width: 20%;
		}
	</style>
</head>
<body>
<%
        if(session.getAttribute("admin") != null){
                  
        }else{
            if (session.getAttribute("nome") != null) {
                out.println("<script>alert('Desculpe, você não tem privilégios para acessar esta página.')</script>");
            }
            out.println("<script>location.replace('index.jsp')</script>");
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
    <a href="#" data-activates="mobile-demo" class="button-collapse"><img src="img/menuButton.png" style="width:30px; margin-top: 15px;"></a>
<!-- Opções da Navbar -->
    <ul class="right hide-on-med-and-down">
      <li class="waves-effect waves-yellow"><a href="admin.jsp">Home</a></li>
      <li class="waves-effect waves-yellow"><a href="#">Contato</a></li>
      <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Cadastro</a></li>
    </ul>
<!-- Opções do Menu Mobile -->
    <ul class="side-nav" id="mobile-demo">
      <li><a href="index.jsp">Home</a></li>
      <li><a href="#">Contato</a></li>
      <li><a href="#!" class="dropdown-button" data-activates="dropdown2">Produtos</a></li>
      <li><a href="#loginModal" class="waves-effect waves-yellow btn modal-trigger white black-text">Login</a></li>
      <li><a href="#cadastroModal" class="waves-effect waves-light btn-large modal-trigger yellow darken-1 ">Cadastre-se</a></li>
    </ul>
  </div>
</nav>
<!--Modal da tela de Login -->
 <div id="loginModal" class="modal">
    <div class="modal-content">
      <h4>Login</h4>
      <div class="row">
    <form class="col s12" method="post" action="~~~~EDITHERE~~~~">
      <div class="row">
	      <div class="input-field col s12">
	      		<input id="user" name="user" type="text">
	      		<label for="user">Usuário</label>
	      </div>
	  </div>
	  <div class="row">
	        <div class="input-field col s12">
	          <input id="password" type="password" class="validate">
	          <label for="password">Senha</label>
	        </div>      	
	  </div>
      <div class="row">
      	  <div class="input-field col s1"></div>
	      	<div class="input-field col s10">
	      		<input class="btn-large waves-effect waves-light yellow darken-1" type="submit" value="Entrar">
	      	</div>
      	  <div class="input-field col s1"></div>
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
    <form class="col s12" method="post" action="~~~~EDITHERE~~~~">
      <div class="row">
        <div class="input-field col s12">
          <input placeholder="Ex: José da Silva Santos" id="name" type="text" class="validate">
          <label for="first_name">Nome Completo</label>
        </div>
      </div>
      <div class="row">
      	<div class="input-field col s6">
      		<input id="cpf" name="cpf" type="text">
      		<label for="cpf">CPF</label>
      	</div>
        <div class="input-field col s6">
          <input id="rg" type="text" class="validate">
          <label for="rg">RG</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input placeholder="Ex: example@example.com" id="email" type="email" class="validate">
          <label for="email">E-mail</label>
        </div>
      </div>
       <div class="row">
        <div class="input-field col s12">
          <input placeholder="Ex: Rua Miguel Alcides de Castro" id="address" type="text" class="validate">
          <label for="address">Endereço</label>
        </div>
      </div>
      <div class="row">
      	<div class="input-field col s6">
      		<input id="phone" name="phone" type="text">
      		<label for="phone">Telefone</label>
      	</div>
      <div class="file-field input-field col s6">
	      <div class="btn yellow darken-1 waves-effect wave-light">
	        <span>Foto</span>
	        <input name="photo" type="file">
	      </div>
	      <div class="file-path-wrapper">
	        <input class="file-path validate" placeholder="Escolha a foto do seu perfil" type="text">
	      </div>
      </div>
      </div>
      <div class="row">
      <div class="input-field col s6">
      		<input id="user" name="user" type="text">
      		<label for="user">Usuário</label>
      </div>
        <div class="input-field col s6">
          <input id="password" type="password" class="validate">
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
        <div class="col s12 m4 hoverable">
          <div class="icon-block">
	  		  <h2 class="center light-blue-text">
	 			<img class="circle" src="http://www.saudedica.com.br/wp-content/uploads/2014/03/batata-doce.jpg" style="width:150px; height:167px;" ">
	 		  </h2>
	          <h5 class="center">Batata Doce!</h5>
	          <p class="light center">Não deixa de ser doce. O mais saudável possível. É natural!</p>
	          <h4><p class="orange-text center">R$ 2,00/Kg.</p></h4>
	          <div class="center">
		          <button class="btn waves-effect waves-light white-text yellow darken-2">
		          	Comprar
		          </button>
	          </div>
	          <br>
          </div>
        </div>

        <div class="col s12 m4 hoverable">
          <div class="icon-block">
	  		  <h2 class="center light-blue-text">
	 			<img class="circle" src="http://www.bolsademulher.com/sites/www.bolsademulher.com/files/receita/melhores-receitas-de-doce-5.jpg" style="width:150px;">
	 		  </h2>
	          <h5 class="center">Cupcake Top!</h5>
	          <p class="light center">Delicioso Cupcake com Chantilly Azul. Engorda pouquinho. </p>
	          <h4><p class="orange-text center">R$ 2,00/Cada</p></h4>
	          <div class="center">
		          <button class="btn waves-effect waves-light white-text yellow darken-2">
		          	Comprar
		          </button>
	          </div>
	          <br>
          </div>
        </div>

        <div class="col s12 m4 hoverable">
          <div class="icon-block">
	  		  <h2 class="center light-blue-text">
	 			<img class="circle" src="http://www.bolsademulher.com/sites/www.bolsademulher.com/files/receita/melhores-receitas-de-doce-5.jpg" style="width:150px;">
	 		  </h2>
	          <h5 class="center">Cupcake Top!</h5>
	          <p class="light center">Delicioso Cupcake com Chantilly Azul. Engorda pouquinho. </p>
	          <h4><p class="orange-text center">R$ 2,00/Cada</p></h4>
	          <div class="center">
		          <button class="btn waves-effect waves-light white-text yellow darken-2">
		          	Comprar
		          </button>
	          </div>
	          <br>
          </div>
        </div>

      </div>
 <!-- Fim da Linha -->
    </div>
 </div>
</body>
</html>
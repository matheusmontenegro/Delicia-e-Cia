<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
<script>
  $(document).ready(function(){
    $(".button-collapse").sideNav();
    $('select').material_select();
  });

</script>
  <title>D&C Management</title>
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

<nav class="grey darken-2 z-depth-3">
  <div class="nav-wrapper container grey darken-2">
    <a href="#!" class="brand-logo"><img src="img/logo.png" style="width:70px;"></a>
<!-- Botão do Menu Mobile -->
    <a href="#" data-activates="mobile-demo" class="button-collapse"><img src="img/menuButton.png" style="width:30px; margin-top: 15px;"></a>
<!-- Opções da Navbar -->
    <ul class="right hide-on-med-and-down">
      <li class="waves-effect waves-yellow"><a href="admin.jsp">Home</a></li>
      <li class="waves-effect waves-yellow"><a href="cadastro.jsp">Cadastrar Produto</a></li>
      <li class="waves-effect waves-yellow"><a href="#!">Pesquisar Produto</a></li>
      <li class="waves-effect waves-yellow" id="logoutButton"><a href="ServletLogout" class="white-text">Logout</a></li>
    </ul>
<!-- Opções do Menu Mobile -->
    <ul class="side-nav" id="mobile-demo">
      <li class="waves-effect waves-yellow"><a href="index.jsp">Home</a></li>
      <li class="waves-effect waves-yellow"><a href="cadastro.jsp">Cadastro</a></li>
      <li class="waves-effect waves-yellow" id="logoutButtonMobile"><a href="ServletLogout">Logout</a></li>
    </ul>
  </div>
</nav>

<div class="row container">
  <div class="section col s10 offset-s1">
    <div class="row">
        <div class="card hoverable col s12">
            <div class="card-content">
            <span class="card-title">Cadastrar Produto</span>
            <form method="post" action="ServletCadProduto">
              <div class="row">
              <div class="input-field col s5 offset-s1">
                <select name="tipo" required="required">
                  <option disabled>Escolha um tipo...</option>
                  <option value="doce" selected>Doce</option>
                  <option value="salgado">Salgado</option>
                </select>
                <label>Tipo do Produto</label>
              </div>
                <div class="input-field col s5">
                    <input id="quantidade" placeholder="Ex: 500" type="number" name="quantidade" required="required" />
                    <label for="quantidade">Quantidade</label>
                </div>
              </div>
              <div class="row">
                <div class="input-field col s10 offset-s1">
                  <input id="nomeProduto" placeholder="Ex: Coxinha de Frango." type="text" name="nomeProduto" class="validate" required="required">
                  <label for="nomeProduto">Nome do Produto</label>
                </div>                
              </div>
              <div class="row">
                <div class="col s10 offset-s1">
                  <textarea id="descricao" placeholder="Insira aqui a descrição do Produto." name="descricao" maxlength="200" class="validate materialize-textarea" required="required"></textarea>
                  <label for="descricao">Descrição do Produto</label>
                </div>                
              </div>
              <div class="row">
                <div class="input-field col s5 offset-s1">
                  <input id="precoUnidade" placeholder="Ex: 3,00" type="number" name="precoUnidade" min="1" class="validate" required="required">
                  <label for="precoUnidade">Preço da unidade. R$</label>
                </div>  
                <div class="input-field col s5">
                  <input id="precoCento" placeholder="Ex: 250,00" type="number" name="precoCento" min="1" class="validate" required="required">
                  <label for="precoCento">Preço do cento. R$</label>
                </div>                
              </div>
              <div class="row">
                <div class="section col s10 offset-s1">
                  <div class="file-field input-field">
                    <div class="btn yellow darken-2 waves-effect wave-light">
                      <span>Imagem</span>
                      <input name="foto" type="file">
                    </div>
                    <div class="file-path-wrapper">
                      <input class="file-path validate" placeholder="Escolha a imagem do produto." type="text">
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-action">
                  <button class="waves-effect waves-light btn-large yellow darken-2" type="submit">Cadastrar</button>
                  <button class="waves-effect waves-red btn-large white black-text" type="reset">Limpar</button>
              </div>
              </form>
            </div>
          
       </div>
    </div>
  </div>
</div>

  
</body>
</html>
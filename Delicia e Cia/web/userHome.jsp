<%@page import="Bean.Pessoa"%>
<%@page import="DAO.PessoaDAO"%>
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
  });
</script>
  <title>D&C Management</title>
</head>
<body>
    <%
        if(session.getAttribute("admin") != null){
                out.println("<script>alert('VocÃª estÃ¡ usando uma conta de administrador, para visualizar esta pÃ¡gina entre com uma conta de usuÃ¡rio comum.')</script>");
                out.println("<script>location.replace('admin.jsp')</script>");
        }else{
            if (session.getAttribute("nome") != null) {

            }else{
                out.println("<script>location.replace('index.jsp')</script>");
            }
        }
    %>

<nav class="grey darken-2 z-depth-3">
  <div class="nav-wrapper container grey darken-2">
    <a href="#!" class="brand-logo"><img src="img/logo.png" style="width:70px;"></a>
<!-- BotÃ£o do Menu Mobile -->
    <a href="#" data-activates="mobile-demo" class="button-collapse"><img src="img/menuButton.png" style="width:30px; margin-top: 15px;"></a>
<!-- OpÃ§Ãµes da Navbar -->
        <%  
            if (session.getAttribute("login") != null) {
              PessoaDAO pessoaDao = new PessoaDAO();
              Pessoa pessoa = pessoaDao.getPessoa(session.getAttribute("login").toString()); 
              pageContext.setAttribute("pessoa", pessoa);
            }
        %>
    <ul class="right hide-on-med-and-down">
      <li class="waves-effect waves-yellow"><a href="index.jsp">Home</a></li>
      <li class="waves-effect waves-yellow"><a href="userHome.jsp">Minha Página</a></li>
      <li class="waves-effect waves-yellow"><a href="#">Hitórico de Pedidos</a></li>
      <li class="waves-effect waves-yellow"><a href="pedido.jsp">Carrinho</a></li>
      <li class="waves-effect waves-yellow" id="logoutButton"><a href="ServletLogout" class="white-text">Logout</a></li>
      <li><div class="chip"><img src="perfilImg/${pessoa.getFoto_perfil()}" alt="Usuário da Sessão">${pessoa.getNome()}</li>
    </ul>
<!-- OpÃ§Ãµes do Menu Mobile -->
    <ul class="side-nav" id="mobile-demo">
    <li style="display:inline-block;"><div class="chip hoverable"><img src="perfilImg/${pessoa.getFoto_perfil()}" alt="Usuário da Sessão">${pessoa.getNome()}</li>
      <li class="waves-effect waves-yellow"><a href="index.jsp">Home</a></li>
      <li class="waves-effect waves-yellow"><a href="userHome.jsp">Minha Página</a></li>
      <li class="waves-effect waves-yellow"><a href="#">Histórico de Pedidos</a></li>
      <li class="waves-effect waves-yellow"><a href="#">Carrinho</a></li>
      <li class="waves-effect waves-yellow" id="logoutButtonMobile"><a href="ServletLogout">Logout</a></li>
    </ul>
  </div>
</nav>
  <div class="row container">
    <div class="col s12">
      <img src="img/logo.png" class="center-align" style="width:50%; margin-left:25%;" >
    </div>
  </div>   
  <div class="row container">
    <div class="col s12">
      <label style="font-size: 38pt;" class="center col s12">Minha Página</label>
    </div>
  </div>  
</body>
</html>
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
    <div class="col s12">
      <img src="img/logo.png" class="center-align" style="width:50%; margin-left:25%;" >
    </div>
  </div>   
  <div class="row container">
    <div class="col s12">
      <label style="font-size: 38pt;" class="center col s12">Gerenciamento</label>
    </div>
  </div>  
</body>
</html>
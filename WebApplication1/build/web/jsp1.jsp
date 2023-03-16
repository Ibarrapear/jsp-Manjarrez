<%-- 
    Document   : jsp1
    Created on : 9 mar 2023, 13:11:18
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
       
        <div class="card">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
      N&uacute;meros de menor a mayor
  </div>
      <div class="uno rounded"></div>
        </div>
        <div class="uno">
    <h1>Hello World!</h1>
    
    <% 
        int x = (int)((Math.random()* 100));
        int a = (int)((Math.random()* 100));
        int b = (int)((Math.random()* 100));
        int c = (int)((Math.random()* 100));
        int d = (int)((Math.random()* 100));
        
        int[] numeros = {x, a, b, c, d};
        
        for (int i = 0; i < numeros.length - 1; i++) {
            for (int j = i + 1; j < numeros.length; j++) {
                if (numeros[i] > numeros[j]) {
                    int temp = numeros[i];
                    numeros[i] = numeros[j];
                    numeros[j] = temp;
                }
            }
        }
    %>
    
    <h1>Los números ordenados de menor a mayor son:</h1>
    <% 
        for (int i = 0; i < numeros.length; i++) {
    %>
    <h1><%= numeros[i] %></h1>
    <% 
        }
    %>
</div>
        <a href="jsp2.jsp">Ir a JSP2</a>
    </body>
</html>

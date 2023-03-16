<%-- 
    Document   : jsp2
    Created on : 14 mar 2023, 13:13:53
    Author     : alumno
--%>

<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Tabla de calificaciones</title>
    </head>
    <body>
    <%
    // Clase para almacenar nombres y calificaciones
        class Estudiante implements Serializable {
            String nombre;
            int calificacion;
        
            Estudiante(String nombre, int calificacion) {
                this.nombre = nombre;
                this.calificacion = calificacion;
            }
        
            public String getNombre() {
                return nombre;
            }
        
            public int getCalificacion() {
                return calificacion;
            }
        }
    
        // Generar datos aleatorios
        String[] nombres = {"Juan", "Maria", "Luis", "Ana", "Pedro", "Sofia", "Carlos"};
        int[] calificaciones = {50, 60, 70, 80, 90, 100};
    
        List<Estudiante> estudiantes = new ArrayList<Estudiante>();
        for (int i = 0; i < 10; i++) {
            String nombre = nombres[(int)(Math.random() * nombres.length)];
            int calificacion = calificaciones[(int)(Math.random() * calificaciones.length)];
            estudiantes.add(new Estudiante(nombre, calificacion));
        }
    
        // Ordenar estudiantes por calificación
        Collections.sort(estudiantes, new Comparator<Estudiante>() {
            public int compare(Estudiante e1, Estudiante e2) {
                return e1.getCalificacion() - e2.getCalificacion();
            }
        });
    
        // Guardar estudiantes en un archivo
        try {
            ObjectOutputStream outq = new ObjectOutputStream(new FileOutputStream("estudiantes.ser"));
            for (Estudiante e : estudiantes) {
                outq.writeObject(e);
            }
            outq.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    
        // Leer estudiantes del archivo y crear tabla
        try {
          ObjectInputStream in = new ObjectInputStream(new FileInputStream("estudiantes.ser"));
    %>
    <table border="1">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Calificación</th>
            </tr>
        </thead>
        <tbody>
    <%
            Estudiante e;
            while ((e = (Estudiante)in.readObject()) != null) {
    %>
            <tr>
                <td><%= e.getNombre() %></td>
                <td><%= e.getCalificacion() %></td>
            </tr>
    <%
            }
            in.close();
        } catch (EOFException e) {
            // Fin del archivo
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    %>
        </tbody>
    </table>
    </body>
</html>

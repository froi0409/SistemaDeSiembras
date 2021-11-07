<%-- 
    Document   : blogs
    Created on : 15 oct. 2021, 0:13:27
    Author     : hectoradolfo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../html/importaciones/importaciones-head.html" %>
        <title>blogs personal</title>
    </head>
    <body>
        <%@include file="../html/nav/cabecera-usuario.html" %>
        <div class="main">
            <%@include file="../html/blogs/plublicacion.html"%>
            <%@include file="mensaje.jsp" %>
        </div>

        <!--  aqui debe de ir el ciclo pra obtener todas las publicaciones  creadas y oque estan en la db
                lista de publicaciones 
                for( i = 0; listPublicaciones().size(); i ++) {
                
                -->
        <div class="container-md">            
            <div class="row g-3">
                <div class="col-sm-3">

                </div>
                
                
                
                <div class="col-sm-6">
                    <div class="formlario h-100 p-5 border rounded-3 border border-primary bg-light ">


                        <div class="row g-2">

                            <h4>Mi primera publicacion eje: {{aqui puede ir algun titulo o fecha o id eje: listaPublicacione().getID(i)}}</h4>
                            <div class="containre-sm"> 
                                <p>la luna llena adasdadasd
                                    asasd
                                    aqui va la publicacion ejemplo {{ listaPublicaciones().getPUBLICACION(i)}}
                                </p>
                            </div>
                        </div>
                        <form >
                            <div class="row g-3">
                                <div class="col">
                                    <button class="btn btn-outline-success" type="button" id="like" name="like"
                                            onclick="like();"><img src="https://cdn.icon-icons.com/icons2/2337/PNG/128/like_heart_thumbs_up_favourite_icon_142417.png" width="40"  alt="*"/>Me gusta </button> <br>

                                </div>
                                <div class="col">
                                    <button class="btn btn-outline-success" type="submit" id="comentar" name="comentar"
                                            onclick="comentar();"><img src="https://cdn.icon-icons.com/icons2/402/PNG/128/comment-edit_40480.png" width="40"  alt="*"/>ver comentarios</button> 

                                </div>
                            </div>
                        </form><br>



                        <div class="form-floating">
                            <form id="comentarios" name="comentarios">
                                <div class="input-group mb-3">
                                    <input class="form-control"  type="text" placeholder="escribe un comentario"  id="comentario" name="comentario">
                                    <button name="publicar-comentario" type="submit" class="btn btn-outline-secondary ">comentar</button>
                                </div><br></form>

                        </div>

                        <%
                            if (request.getParameter("comentar") != null) {

                        %>

                        <div class="row g-3">
                            <label>comentarios</label>
                            
                           <!--  aqui debe de ir el for para obtener los comentarios de las publicaciones 
                              
                              for (int m = 0; m < listaComentariosDePublicacion.length(); m++ ) {
                            
                            -->
                            
                            <div class="containre-sm"> 
                                <h6>la luna llena adasdadasd
                                    aqui tiene que ir el comentario
                                     por ejemplo {{listCOmentearioPUblicacion().getComentario(m)}}
                                </h6>
                            </div>
                        </div>
                        <form class="g-4">
                            <div class="containre-sm">
                                <div class="row g-3">
                                    <div class="col">
                                        <button class="btn btn-outline-success" type="button" id="like-comentario" name="like-comentario" 
                                                onclick="like();"><img src="https://cdn.icon-icons.com/icons2/2337/PNG/128/like_heart_thumbs_up_favourite_icon_142417.png" width="19"  alt="*"/>Me gusta </button> <br>

                                    </div>
                                </div>
                            </div>
                        </form>
                        <!--    }   aqui termila el for para obtener los comentarios de cada publicacion -->
                        

                        <%                            }


                        %>






                    </div>
                </div>
            </div> <br>
        </div>

                        <!-- aqui termina el ciclo que recorre la lista de todas las publicaciones 
                          de la base de datos } -->
                        


    </body>
</html>

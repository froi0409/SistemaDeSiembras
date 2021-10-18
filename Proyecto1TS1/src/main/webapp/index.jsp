<%-- 
    Document   : index
    Created on : 13/10/2021, 11:06:25
    Author     : froi-pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesion</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
            crossorigin="anonymous">
        <script src="../../js/validation.js"></script>

        <link href="css/configuracionesPrincipales.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <%@include file="html/nav/barraDeNavegacion.html"%>

        <div class="main">
            

            <div class="container-sm">
                <div class="row g-3">
    
                    <div class="col-sm-3">
    
                    </div>
                    <div class="col-sm-6">
                        <div class="formulario h-100 p-5  border rounded-3">
                            <h3 style="color:#202643">Registro de usuario</h3>
                            <h6 style="color:#202643">es facil y rapido.</h6><br>
                            <form class="row g-3 needs-validation"  method="POST">
                                <div class="form-floating">
                                    <input type="text" class="form-control inputPrueba" id="codigo_usuario" name="codigo_usuario"
                                           placeholder="codigo usuario..." required />
                                    <label for="codigo_usuario" style="color:#97908c">Codigo de usuario <span style="color:red">*</span></label>
                                    <div class="invalid-tooltip" oninput="codigo_usuario">
                                        Please choose a unique and valid username.
                                    </div>
                                </div>
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="nombre" name="nombre" required 
                                           placeholder="ingresar nombre completo..."/>
                                    <label for="nombre" style="color:#97908c">Nombre Usuario<span style="color:red">*</span></label>
                                    <div class="invalid-tooltip">
                                        Please choose a unique and valid username.
                                    </div>
                                </div>
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="correo" name="correo"
                                           placeholder="e-mail.." required  />
                                    <label for="correo" style="color:#97908c"> Correo electronico <span style="color:red">*</span></label>
                                </div>
    
                                <div class="row g-3">
                                    <div class="col">
                                        <div class="form-floating">
                                            <select class="form-select" aria-label="Default select example" id="sexo" 
                                                    name="sexo" required>
                                                <option value="femenino">Femenino</option>
                                                <option value="masculino">Masculino</option>
                                            </select>
                                            <label for="sexo" style="color:#97908c"> Sexo:<span style="color:red">*</span></label>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-floating">
                                            <input type="date" class="form-control" id="birth" name="birth" required
                                                   />
                                            <label for="birth" style="color:#97908c">Fecha nacimiento <span style="color:red">*</span></label>
                                        </div>
                                    </div>
                                </div>
    
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="telefono" name="telefono" required
                                           placeholder="numero telefono.."/>
                                    <label for="telefono" style="color:#97908c"> Numero de telefono <span style="color:red">*</span></label>
                                </div>
    
                                <div class="form-floating">
    
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" style ="color:#97908c"> Password <span style="color:red">*</span></span>
                                        <input type="password" class="form-control" id="password1" name="password" required 
                                               placeholder="password.."   />
    
                                        <button class="btn btn-outline-secondary botonPass" type="button"  onclick="verOcultar();"><img src="https://media.istockphoto.com/vectors/disable-eye-hide-outline-icon-signs-and-symbols-can-be-used-for-web-vector-id1143076782?b=1&k=20&m=1143076782&s=170x170&h=-UByt2wYonyDRpMh7pmriqUnUy7Satvik7ZJWkFsnzE=" width="45"  alt="ver-ocultar"/></button>                                
    
                                    </div>
    
                                </div><!-- comment -->
    
                                <div class="form-floating">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" style ="color:#97908c"> Confirmar password <span style="color:red">*</span></span>
                                        <input type="password" class="form-control" id="password-confirm" name="password-confirm"
                                               placeholder="confirma tu password.." required />
                                        <button class="btn btn-outline-secondary botonPass" type="button" onclick="confirmarPassword();"><img src="https://media.istockphoto.com/vectors/disable-eye-hide-outline-icon-signs-and-symbols-can-be-used-for-web-vector-id1143076782?b=1&k=20&m=1143076782&s=170x170&h=-UByt2wYonyDRpMh7pmriqUnUy7Satvik7ZJWkFsnzE=" width="45"  alt="ver-ocultar"/></button>
                                    </div>
                                </div>
    
                                <div class="d-grid gap-2 col-6 mx-auto">
                                    <button class="btn botonRegistro" type="submit">Registrarse y unirse</button>
                                </div>
                                <!--agregamos el ngif para una sentencia de que aparezca un mensaje cuando no estan lleno los input-->
    
                            </form>
                            <br><br>
                            <div class="d-grid gap-2 col-5 mx-auto" align="center">
                                <h5> Ya eres usuario? 
                                    <a class="nav-link active"  href="../../Proyecto1TS1/">Iniciar sesion</a>
                                </h5>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>



            <br><br><br>

        </div>
    </body>
</html>

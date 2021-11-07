/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// Example starter JavaScript for disabling form submissions if there are invalid fields
function verOcultar() {
    var tipo = document.getElementById("password1");
    if (tipo.type === "password") {
        tipo.type = "text";
    } else {
        tipo.type = "password";
    }
}

function confirmarPassword() {
    var tipo = document.getElementById("password-confirm");
    if (tipo.type === "password") {
        tipo.type = "text";
    } else {
        tipo.type = "password";
    }
}

function abrirModal() {
    document.getElementById('miModal').style.display = 'inline';
    document.getElementById('publicacion').focus();
}

function comentar() {
}
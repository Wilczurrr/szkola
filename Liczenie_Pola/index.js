    
function licz() {

    //PROSTOKĄT

    let a = document.getElementById("a").value
    let b = document.getElementById("b").value

    let obw = parseFloat(2*a+2*b)
    let pole = parseFloat(a*b)
    let przek = parseFloat(Math.sqrt(a**2 + b**2)).toFixed(3)
    
    document.getElementById("pole").value = pole
    document.getElementById("obwod").value = obw
    document.getElementById("przek").value = przek

    //KOŁO

    let r = document.getElementById("r").value
    let pi = Math.PI

    let polek = parseFloat(pi*r**2).toFixed(3)
    let obwodk = parseFloat(2*pi*r).toFixed(3)

    document.getElementById("polek").value = polek
    document.getElementById("obwk").value = obwodk











}

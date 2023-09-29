    
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



//ARRAY CYFRY

const lista = [1,232,64,123,7,3,1] //Stworzenie i wyświetlenie listy

let text = ""

for(let i = 0; i < lista.length ;i++){

    text += lista[i] + "<br>";
}

document.getElementById("przed").innerHTML = text

const newlista = lista.sort(function(a, b){return a - b})  //Posortowanie i wyświetlenie
text = ""

for(i = 0; i < newlista.length; i++){

    text += "<li>" + newlista[i] + "</li>";
}

document.getElementById("po").innerHTML = text


const randomlista = lista.sort(function(){return 0.5 - Math.random()}) //Zrandomizowanie listy i wyświetlenie
text = ""


for(i = 0; i < randomlista.length; i++){

    text += randomlista[i] + "<br>";
}

document.getElementById("random").innerHTML = text




//ARRAY STRINGI

const listatext = ["Bannan","Pomarańcza","Granat","Arbuz","Cytryna"] //Stworzenie i wyświetlenie listy

text = ""

for(let i = 0; i < listatext.length ;i++){

    text += listatext[i] + "<br>";
}

document.getElementById("przedtext").innerHTML = text

const newlistatext = listatext.sort()  //Posortowanie i wyświetlenie
text = ""

for(i = 0; i < newlistatext.length; i++){

    text += "<li>" + newlistatext[i] + "</li>";
}

document.getElementById("potext").innerHTML = text








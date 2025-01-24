function reset_load(){
    const img = document.querySelector("img");
    img.style.width =  500 + "px";
    img.style.height = 500 + "px";
    img.style.opacity = 100 + "%";
    document.getElementById("width").value = 500;
    document.getElementById("height").value = 500;
    document.getElementById("opacity").value = 100;
    document.getElementById("range1Value").value = 500;
    document.getElementById("range2Value").value = 500;
    document.getElementById("range3Value").value = 100;
};

function rozmiar(){

    const jednostka = document.getElementById("jednostka").value;
    const width = document.getElementById("width").value;
    const height = document.getElementById("height").value;
    const img = document.querySelector("img");
    const wmax = document.getElementById("width");
    const hmax =  document.getElementById("height");

    switch(jednostka){
        case "cm":
            wmax.setAttribute("max", 50);
            hmax.setAttribute("max", 50);
            img.style.width =  width + jednostka;
            img.style.height = height + jednostka;
            break;
        case "in":
            wmax.setAttribute("max", 60);
            hmax.setAttribute("max", 60);
            img.style.width =  width + jednostka;
            img.style.height = height + jednostka;
            break;
        case "pt":
            wmax.setAttribute("max", 500);
            hmax.setAttribute("max", 500);
            img.style.width =  width + jednostka;
            img.style.height = height + jednostka;
            break;
        case "pc":
            wmax.setAttribute("max", 50);
            hmax.setAttribute("max", 50);
            img.style.width =  width + jednostka;
            img.style.height = height + jednostka;
            break;
        case "mm":
            wmax.setAttribute("max", 500);
            hmax.setAttribute("max",500 );
            img.style.width =  width + jednostka;
            img.style.height = height + jednostka;
            break;
        case "px":
            wmax.setAttribute("max", 1000);
            hmax.setAttribute("max", 1000);
            img.style.width =  height + jednostka;
            img.style.height = width + jednostka;
            break;          
            
    };

    document.getElementById("range1Value").value = width;
    document.getElementById("range2Value").value = height;

};

function opacity(){
    const opacity = document.getElementById("opacity").value;
    const img = document.querySelector("img");
    img.style.opacity = opacity + "%";
    document.getElementById("range3Value").value = opacity;

};

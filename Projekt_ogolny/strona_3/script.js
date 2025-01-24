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

    const jednostki = {
        "px": {max: 1000, jed: "px" },
        "cm": {max: 50, jed: "cm" },
        "in": {max: 50, jed: "in" },
        "pt": {max: 500, jed: "pt" },
        "pc": {max: 50, jed: "pc" },
        "mm": {max: 500, jed: "mm" },
    };

    const ust = jednostki[jednostka];
    
    if(ust){
        wmax.setAttribute("max", ust.max)
        hmax.setAttribute("max", ust.max)
        img.style.width =  width + ust.jed;
        img.style.height = height + ust.jed;
    }


    document.getElementById("range1Value").value = width;
    document.getElementById("range2Value").value = height;

};

function opacity(){
    const opacity = document.getElementById("opacity").value;
    const img = document.querySelector("img");
    img.style.opacity = opacity + "%";
    document.getElementById("range3Value").value = opacity;

};

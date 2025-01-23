function reset(){
    const width = document.getElementById("width").value = 500;
    const height = document.getElementById("height").value = 500;
    const img = document.querySelector("img");
    img.style.width =  width + "px";
    img.style.height = height + "px";
};

function rozmiar(){

    const jednostka = document.getElementById("jednostka").value;
    const height = parseInt(document.getElementById("width").value);
    const width = parseInt(document.getElementById("height").value);
    
    
    const img = document.querySelector("img");

    switch(jednostka){
        case "cm":
            img.style.width =  width * (2.54 / 96) + jednostka;
            img.style.height = height * (2.54 / 96) + jednostka;
            document.getElementById("range1Value").value = (height * (2.54 / 96)).toFixed(2);
            document.getElementById("range2Value").value = (width * (2.54 / 96)).toFixed(2);
            break;
        case "in":
            img.style.width =  width + jednostka;
            img.style.height = height + jednostka;
            break;
        case "pt":
            img.style.width =  width + jednostka;
            img.style.height = height + jednostka;
            break;
        case "pc":
            img.style.width =  width + jednostka;
            img.style.height = height + jednostka;
            break;
        case "mm":
            img.style.width =  width + jednostka;
            img.style.height = height + jednostka;
            break;
        case "px":
            img.style.width =  width + jednostka;
            img.style.height = height + jednostka;
            document.getElementById("range1Value").value = width;
            document.getElementById("range2Value").value = height;
            break;          
            
    }


};

//możliwośc range w input i na odwrót

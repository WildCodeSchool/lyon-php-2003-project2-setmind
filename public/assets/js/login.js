let slideIndex = 0;
showSlides();

function showSlides()
{
    let i;
    let slides = document.getElementsByClassName("bnj-login-mySlides");
    let dots = document.getElementsByClassName("bnj-login-form-dot");
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" bnj-login-dot-active", "");
    }
    slides[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " bnj-login-dot-active";
    setTimeout(showSlides, 5000); // Change image every 5 seconds
}

function showTab(evt, tabButton) {
    let i = 0;
    let tabContentContainer = document.getElementsByClassName('bnj-form-content');
    let tab = document.getElementsByClassName('bnj-tab');

    for (i = 0; i < tabContentContainer.length; i++) {
        tabContentContainer[i].style.display = "none";
    }

    for (i = 0; i < tab.length; i++) {
        tab[i].className = tab[i].className.replace(" bnj-tab-active", "");
    }

    document.getElementById(tabButton).style.display = "flex";
    document.getElementById(tabButton).style.flexDirection = "column";
    document.getElementById(tabButton).style.justifyContent = "space-evenly";
    document.getElementById(tabButton).style.alignItems = "center";

    evt.currentTarget.className += " bnj-tab-active";

}
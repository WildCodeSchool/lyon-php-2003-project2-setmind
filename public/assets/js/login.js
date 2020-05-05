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
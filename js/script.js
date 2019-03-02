window.onscroll = function(){

    var summary = document.querySelector('#hero-summary');
    var about = document.querySelector('#about-tile');
    var projects = document.querySelector('#projects-tile');
    var resume = document.querySelector('#resume-tile');

    if (summary.getBoundingClientRect().bottom <= 0){
        var nav = document.querySelector('#top-menu');
        nav.style.backgroundColor = '#1A1A1D';
    }

    if (summary.getBoundingClientRect().top >= 0) {
        var nav = document.querySelector('#top-menu');
        nav.style.backgroundColor = 'transparent';
    }

    if (resume.getBoundingClientRect().top <= 0) {
        var nav = document.querySelector('#top-menu');
        nav.style.backgroundColor = 'transparent';
    }
}

window.onhashchange = function() {
    scrollToId(window.location.hash)
}

scrollToId = function(id){
    id = id.replace('#','')
    history.pushState(null,null,'#' + id);
    document.getElementById(id + '-tile').scrollIntoView();
}

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

    if (about.getBoundingClientRect().top >= 0) {  
        if (typeof window.history.replaceState == 'function') {
        history.replaceState({}, '', window.location.href.slice(0, -1));
        }
    }

    if (about.getBoundingClientRect().top <= 0 && about.getBoundingClientRect().bottom >= 0) {
        history.pushState(null,null,'#' + 'about');
    }

    if (projects.getBoundingClientRect().top <= 0 && projects.getBoundingClientRect().bottom >= 0) {
        history.pushState(null,null,'#' + 'projects');
    }

    if (resume.getBoundingClientRect().top <= 0) {
        var nav = document.querySelector('#top-menu');
        nav.style.backgroundColor = 'transparent';
        history.pushState(null,null,'#' + 'resume');
    }
}

scrollToId = function(id){
    history.pushState(null,null,'#' + id);
    document.getElementById(id + '-tile').scrollIntoView();
}

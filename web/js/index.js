function change(name) {
    document.querySelector('iframe').setAttribute('src','/' +name+'?method=list');
}

 const msa = () => {
  console.log("masonry fonction")
  var elem = document.querySelector('.grid');
  var msnry = new Masonry( elem, {
  // options
  itemSelector: '.grid-item',
  fitWidth: true,
  gutter: 10
});
 }


 const imald =  imagesLoaded( '.grid', function() {
    console.log("imageLoad");
    msa();
  });

imald();

document.addEventListener('turbolinks:load', imald)

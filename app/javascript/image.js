if (document.URL.match(/new/) || document.URL.match(/edit/)){

  document.addEventListener("DOMContentLoaded", function(){
    const ImageList = document.getElementById("image-list")

    document.getElementById("item-image").addEventListener("change",function(e){
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      const divElement = document.createElement('div')
      const imgElement = document.createElement('img')
      imgElement.setAttribute('src', blob)

      divElement.appendChild(imgElement)
      ImageList.appendChild(divElement)
      console.log(ImageList)
      
    })

  });

}
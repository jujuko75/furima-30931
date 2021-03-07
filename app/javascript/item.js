if (document.URL.match(/new/) || document.URL.match(/edit/)){

window.addEventListener("DOMContentLoaded", function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {

    let price = document.getElementById("item-price").value;
    let fee = Math.floor(price * 0.1);
    let profit = Math.ceil(price - fee);
    document.getElementById("add-tax-price").innerHTML = fee;
    document.getElementById("profit").innerHTML = profit;

  });

})

}
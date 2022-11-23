function item (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
      const profit = document.getElementById("profit");
      profit.innerHTML = Math.floor(inputValue - inputValue * 0.1).toLocaleString();
  })
};

window.addEventListener('load', item);

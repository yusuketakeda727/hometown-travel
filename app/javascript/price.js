function price (){
  const itemPrice  = document.getElementById('item-price');
  itemPrice.addEventListener("keyup", () => {
    const feeRate = 0.1;
    const fee =  Math.floor(itemPrice.value * feeRate);
    const profit = (itemPrice.value - fee);
    const outputFee = document.getElementById("add-tax-price");
    const outputProfit = document.getElementById("profit");
    outputFee.innerHTML = `${fee}`;
    outputProfit.innerHTML = `${profit}`;
  });
}
window.addEventListener('load', price);

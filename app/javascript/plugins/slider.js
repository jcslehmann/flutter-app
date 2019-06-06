import noUiSlider from 'nouislider';
const initSlider = () => {
  const slider = document.querySelector('.money-slider');
  const priceSliderText = document.querySelector('.price-slider-text');
  const priceSliderInput = document.querySelector('.price_per_night');
  console.log(slider)
  if (slider) {
    noUiSlider.create(slider, {
      start: [0],
      step: 1,
      connect: "lower",
      range: {
        min: [0],
        max: [50]
      }
    });
    slider.noUiSlider.on('update', () => {
      const currentValue = slider.noUiSlider.get();
      priceSliderText.innerHTML = currentValue + " " + "credits";
      priceSliderInput.value = currentValue;
    });
  }
}

export { initSlider }

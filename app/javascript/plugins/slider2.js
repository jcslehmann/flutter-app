import noUiSlider from 'nouislider';
const initScndSlider = () => {
  const slider = document.querySelector('.decimal-slider');
  const decimalSliderText = document.querySelector('.decimal_value_text');
  const decimalSliderInput = document.querySelector('.decimal_value');
  console.log(slider)
  if (slider) {
    noUiSlider.create(slider, {
      start: [1],
      step: 0.2,
      connect: "lower",
      range: {
        min: [1],
        max: [10]
      }
    });
    slider.noUiSlider.on('update', () => {
      const currentValue = slider.noUiSlider.get();
      decimalSliderText.innerHTML = "x " + " " + currentValue;
      decimalSliderInput.value = currentValue;
    });
  }
}

export { initScndSlider };


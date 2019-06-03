const backButtonFirst = () => {
  const firstButton = document.getElementById('b-button-one')
  const deadline = document.querySelector('.deadline')
  const proposition = document.querySelector('.proposition')
  firstButton.addEventListener('click', (event) => {
      // proposition.classList.add('left-fix')
      // proposition.classList.remove('slide-out')
      // proposition.classList.remove('no-display')
      proposition.classList.add('slide-in')
      setTimeout(function() {
      deadline.classList.add('no-display')
      }, 100);
    })
}

const backButtonSecond = () => {
  const secondButton = document.getElementById('b-button-two')
  const oddsStake = document.querySelector('.odds-stake')
  const deadline = document.querySelector('.deadline')
  secondButton.addEventListener('click', (event) => {
      deadline.classList.add('slide-in')
      setTimeout(function() {
        oddsStake.classList.add('no-display')
      }, 100)
      // oddsStake.classList.add('no-display')
      // deadline.classList.remove('no-display')
    })
}

const backButtonThird = () => {
  const thirdButton = document.getElementById('b-button-three')
  const oddsStake = document.querySelector('.odds-stake')
  const receiver = document.querySelector('.receiver')
  thirdButton.addEventListener('click', (event) => {
    oddsStake.classList.add('slide-in')
    setTimeout(function() {
      receiver.classList.add('no-display')
    }, 100)
      // receiver.classList.add('no-display')
      // oddsStake.classList.remove('no-display')
    })
}

export { backButtonFirst };
export { backButtonSecond };
export { backButtonThird };

const backButtonFirst = () => {
  const firstButton = document.getElementById('b-button-one')
  const deadline = document.querySelector('.deadline')
  const proposition = document.querySelector('.proposition')
  firstButton.addEventListener('click', (event) => {
      deadline.classList.add('d-none')
      proposition.classList.remove('d-none')
    })
}

const backButtonSecond = () => {
  const secondButton = document.getElementById('b-button-two')
  const oddsStake = document.querySelector('.odds-stake')
  const deadline = document.querySelector('.deadline')
  secondButton.addEventListener('click', (event) => {
      oddsStake.classList.add('d-none')
      deadline.classList.remove('d-none')
    })
}

const backButtonThird = () => {
  const thirdButton = document.getElementById('b-button-three')
  const oddsStake = document.querySelector('.odds-stake')
  const receiver = document.querySelector('.receiver')
  thirdButton.addEventListener('click', (event) => {
      receiver.classList.add('d-none')
      oddsStake.classList.remove('d-none')
    })
}

export { backButtonFirst };
export { backButtonSecond };
export { backButtonThird };

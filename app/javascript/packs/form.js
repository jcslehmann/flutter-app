const buttonFirst = () => {
  const firstButton = document.getElementById('button-one')
  const proposition = document.querySelector('.proposition')
  const deadline = document.querySelector('.deadline')
    firstButton.addEventListener('click', (event) => {
      proposition.classList.add('d-none')
      deadline.classList.remove('d-none')
    })
  }

const buttonSecond = () => {
  const secondButton = document.getElementById('button-two')
  const deadline = document.querySelector('.deadline')
  const oddsStake = document.querySelector('.odds-stake')
  secondButton.addEventListener('click', (event) => {
      deadline.classList.add('d-none')
      oddsStake.classList.remove('d-none')
    })
}

const buttonThird = () => {
  const thirdButton = document.getElementById('button-three')
  const oddsStake = document.querySelector('.odds-stake')
  const receiver = document.querySelector('.receiver')
  thirdButton.addEventListener('click', (event) => {
      oddsStake.classList.add('d-none')
      receiver.classList.remove('d-none')
    })
}


export { buttonFirst };
export { buttonSecond };
export { buttonThird };

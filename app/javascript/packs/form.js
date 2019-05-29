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
  const odds = document.querySelector('.odds')
  secondButton.addEventListener('click', (event) => {
      deadline.classList.add('d-none')
      odds.classList.remove('d-none')
    })
}

const buttonThird = () => {
  const thirdButton = document.getElementById('button-three')
  const odds = document.querySelector('.odds')
  const stake = document.querySelector('.stake')
  thirdButton.addEventListener('click', (event) => {
      odds.classList.add('d-none')
      stake.classList.remove('d-none')
    })
}

const buttonFourth = () => {
  const fourthButton = document.getElementById('button-four')
  const stake = document.querySelector('.stake')
  const receiver = document.querySelector('.receiver')
  fourthButton.addEventListener('click', (event) => {
      stake.classList.add('d-none')
      receiver.classList.remove('d-none')
    })
}

export { buttonFirst };
export { buttonSecond };
export { buttonThird };
export { buttonFourth };

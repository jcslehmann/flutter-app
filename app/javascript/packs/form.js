const buttonFirst = () => {
  const firstButton = document.getElementById('button-one')
  const proposition = document.querySelector('.proposition')
  const deadline = document.querySelector('.deadline')
    firstButton.addEventListener('click', (event) => {
      proposition.classList.remove("slide-out")
      proposition.classList.remove("slide-in")
      proposition.classList.add("slide-out")
      setTimeout(function(){
        deadline.classList.remove('no-display')
      }, 500);
    })
  }

const buttonSecond = () => {
  const secondButton = document.getElementById('button-two')
  const deadline = document.querySelector('.deadline')
  const oddsStake = document.querySelector('.odds-stake')
  secondButton.addEventListener('click', (event) => {
      deadline.classList.remove("slide-out")
      deadline.classList.remove("slide-in")
      deadline.classList.add("slide-out")
      setTimeout(function(){
        oddsStake.classList.remove('no-display')
      }, 500);
    })
}

const buttonThird = () => {
  const thirdButton = document.getElementById('button-three')
  const oddsStake = document.querySelector('.odds-stake')
  const receiver = document.querySelector('.receiver')
  thirdButton.addEventListener('click', (event) => {
      oddsStake.classList.remove("slide-out")
      oddsStake.classList.remove("slide-in")
      oddsStake.classList.add("slide-out")
      setTimeout(function(){
        receiver.classList.remove('no-display')
      }, 500);
    })
}


export { buttonFirst };
export { buttonSecond };
export { buttonThird };

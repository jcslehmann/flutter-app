 // Set the date we're counting down to
    const timer = () => {
      const deadline = document.querySelector('.javascript-cheat').innerText;
      // var countDownDate = new Date(deadline).getTime();
      var date = new Date(deadline.replace(/-/g, '/')).getTime();
      var now = new Date().getTime();


      // Update the count down every 1 second
      var x = setInterval(function() {
        // Get today's date and time

        // Find the distance between now and the count down date
        var distance = date - now;

        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Display the result in the element with id="demo"
        document.getElementById("countdownTimer").innerHTML = days + "d " + hours + "h "
       + minutes + "m ";

        // If the count down is finished, write some text
        if (distance < 0) {
          clearInterval(x);
          document.getElementById("countdownTimer").innerHTML = "EXPIRED";
        }
      }, 1000);
    };

export { timer };

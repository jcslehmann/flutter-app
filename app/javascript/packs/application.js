import "bootstrap";
import "./form";
import "nouislider/distribute/nouislider.css";
import 'select2/dist/css/select2.css';
import { loadSelectForm } from '../plugins/init_select';
import { initSlider } from "../plugins/slider";
import { initScndSlider } from "../plugins/slider2";
import { buttonFirst } from './form';
import { buttonSecond } from './form';
import { buttonThird } from './form';
import { backButtonFirst } from './form2';
import { backButtonSecond } from './form2';
import { backButtonThird } from './form2';
import { flat } from '../plugins/flatpickr';
import { timer } from './timer';

// buttonFirst();
// buttonSecond();
// buttonThird();
// backButtonFirst();
// backButtonSecond();
// backButtonThird();
// loadSelectForm();
// initSlider();
// initScndSlider();
// flat();

const url = window.location.pathname;

const setPath = () => {
  $(`#myDropdown a[href="${url}"] .btn`).addClass('changefill');
  $(`#myDropdown a[href="${url}"] .center-btn`).addClass('changefill2')
}

$(document).ready(() => {
  setPath();
  if (/\/users\/[1-9]*\/bets\/new/.test(url)) {
    buttonFirst();
    buttonSecond();
    buttonThird();
    backButtonFirst();
    backButtonSecond();
    backButtonThird();
    loadSelectForm();
    initSlider();
    initScndSlider();
    flat();
  }
  if (/\/bets\/[1-9]*/.test(url)) {
    console.log('fghj')
    timer();
  }
})


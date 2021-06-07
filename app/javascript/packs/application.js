// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"



Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
// Required Core Stylesheet
import "@glidejs/glide/src/assets/sass/glide.core";

// Optional Theme Stylesheet
import "@glidejs/glide/src/assets/sass/glide.theme";


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { qrCode } from "../components/qrCode"
import {billEditShow} from "../components/billEditShow"
import {newSplitFormShow} from "../components/newSplitFormShow"
import {billEditShow} from "../components/billEditShow"
import {newSplitFormShow} from "../components/newSplitFormShow"
import {billFormAutoFill} from '../components/billFormAutoFill'
import {Glide} from "../../../src/plugins/init_glide"

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  billFormAutoFill();
  billEditShow();
  newSplitFormShow();
  new Glide('.glide', {
    type: 'carousel',
    startAt: 0,
    perView: 7,
    peek: 0,
    gap: 5,
    // width: 95,
    bound: true,
  }).mount();
  qrCode();
});


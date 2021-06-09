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




// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { qrCode } from "../components/qrCode"
import {newSplitFormShow} from "../components/newSplitFormShow"
import {billExpand} from "../components/billExpand"
import {billFormAutoFill} from '../components/billFormAutoFill'
import {initGlide} from "../../../src/plugins/init_glide"
import {splitShowTabs} from '../components/splitShowTabs'

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  billFormAutoFill();
  billExpand();
  newSplitFormShow();
  qrCode();
  initGlide();
  splitShowTabs();
});


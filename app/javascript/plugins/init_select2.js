import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2(); // (~ document.querySelectorAll)
  console.log("bonjour");
};

export { initSelect2 };

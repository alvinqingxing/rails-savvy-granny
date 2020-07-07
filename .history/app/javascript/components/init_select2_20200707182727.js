import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    theme: 'bootstrap4',
  });
};

export { initSelect2 };
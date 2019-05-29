import $ from 'jquery';
import 'select2';


const loadSelectForm = () => {
  $(document).ready(function() {
    $('.select').select2({
      allowClear: true,
      width: 200
    });
  });
}

export { loadSelectForm };


import flatpickr from "flatpickr";
import "flatpickr/dist/themes/dark.css";
// import "flatpickr/dist/flatpickr.min.css" // Note this is important!

const flat = flatpickr(".datepicker", {
  disableMobile: true,
  altInput: true,
  altFormat: "F j, Y",
  dateFormat: "Y-m-d",
});

export { flat };

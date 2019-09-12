$(document).ready(function () {
    $('.datepicker').datepicker({
        format: "dd/mm/yyyy"


    }).datepicker(
        "setDate", new Date(2019, 08 - 1, 20)
    );
});
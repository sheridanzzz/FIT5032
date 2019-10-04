$(document).ready(function () {
    $('.datepicker').datepicker({
        format: "dd/mm/yyyy"
    }).datepicker(
        "setDate", new Date()
    );
});


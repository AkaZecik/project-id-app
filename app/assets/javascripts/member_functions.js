$(document).on("turbolinks:load", function () {
    let function_still_active = $("#function_still_active");

    $("select[id*=until]").prop("disabled",
        function_still_active.prop("checked"));

    $("span#function_active").click(function () {
        function_still_active.click();
    });

    function_still_active.click(function () {
        $("select[id*=until]").prop("disabled",
            $("#function_still_active").prop("checked"));
    });
});
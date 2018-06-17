$(document).ready(function () {
    let date_of_death_nil = $("#date_of_death_nil");

    $("select[id*=date_of_death]").prop("disabled",
        date_of_death_nil.prop("checked"));

    $("span#person_didnt_die").click(function () {
        date_of_death_nil.click();
    });

    date_of_death_nil.click(function () {
        $("select[id*=date_of_death]").prop("disabled",
            $("#date_of_death_nil").prop("checked"));
    });
});
/**
 * Created by Mehrdad on 7/24/2017.
 *
 * read more in https://alertifyjs.org/
 */
$(document).ready(function () {
    alertify.parent(document.body);

});

function successNotify(message) {
    alertify.success(message);
}

function warningNotify(message) {
    alertify.warning(message);
}

function infoNotify(message) {
    alertify.log(message);
}

function errorNotify(message) {
    alertify.error(message)
}

function alerty(message) {
    alertify.alert(message);
}

function customNotify(message,status,timeout,pos) {
    UIkit.notify(
        {message : message,
            status  : status,
            timeout : timeout,
            pos     : pos}
    );
}

$(".notify").on("click", function (e) {
    customNotify($(this).attr("data-message"),$(this).attr("data-status"),$(this).attr("data-timeout"),$(this).attr("data-pos"));
});

/*  confirm example
alertify
    .okBtn("Accept")
    .cancelBtn("Deny")
    .confirm("Confirm dialog with custom button labels", function (ev) {

        // The click event is in the
        // event variable, so you can use
        // it here.
        ev.preventDefault();
        alertify.success("You've clicked OK");

    }, function(ev) {

        // The click event is in the
        // event variable, so you can use
        // it here.
        ev.preventDefault();

        alertify.error("You've clicked Cancel");

    });*/


/*  promise example
if ("function" !== typeof Promise) {
    alertify.alert("Your browser doesn't support promises");
    return;
}

alertify.confirm("Confirm?").then(function (resolvedValue) {
    // "resolvedValue" is an object with the following keys:
    // buttonClicked
    // inputValue (only for prompts)
    // event

    // The click event is in
    // resolvedValue, so you can use
    // it here.
    resolvedValue.event.preventDefault();
    alertify.alert("You clicked the " + resolvedValue.buttonClicked + " button!");
});*/

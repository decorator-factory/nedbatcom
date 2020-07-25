// Ned Batchelder's Javascript code.
// http://nedbatchelder.com

function nospam(user, domain, args) {
	var ch = String.fromCharCode;
	var loc = "ma" + ch(105) + "lto" + ch(58) + user + ch(64) + domain;
	if (args) {
		loc += "?" + args;
	}
	window.location = loc;
}

// Manipulate the submit button on the comment form.
jQuery(function($){
    // Make the add button wait 2 secs to really submit.
    $("#addbtn").click(function(){
        $.timer(2000, function(timer){
            $("#addbtn").unbind().click();
            timer.stop();
        });
        return false;
    });
    // In 2 seconds,
    $.timer(2000, function(timer) {
        // remove our custom click function.
        $("#addbtn").unbind();
        timer.stop();
    });
});

window.addEventListener("DOMContentLoaded", function (event) {
    var thisdate = new Date().toJSON().slice(5,10).replace("-", "");
    document.querySelectorAll(".thisdate").forEach(function (clicky) {
        clicky.href = "/blog/archive/date" + thisdate + ".html";
    });

    var storage = window.localStorage;

    if (storage.getItem("othermode") == "true") {
        document.querySelector("html").classList.toggle("othermode");
    }

    var otherswitches = document.querySelectorAll(".othermode-switch");
    otherswitches.forEach(function (otherswitch) {
        otherswitch.addEventListener("click", function (event) {
            storage.setItem(
                "othermode",
                (storage.getItem("othermode") == "true") ? "false" : "true"
            );
            document.querySelector("html").classList.toggle("othermode");
        });
    });
});

$(document).ready(function () {
    alert("Eu sou o cara do Login");
    $("#Login").bind("click", function () {
        var loginData = {
            "Username": "" + $("#inputUsername").val() + "",
            "Password": "" + $("#inputPassword").val() + ""
        };

        $.ajax({
            type: "POST",
            url: "/CredentialsTest/DoLogin",
            data: JSON.stringify(loginData),
            contentType: "application/json",
            datatype: "json",
            success: function(loginvalues) {
                if (loginvalues == "True")
                    window.location.reload();
                else {
                    alert("Error, login not found!");
                }
            },
            error: function() { alert("Error, login not found!"); }

    });
    });
})
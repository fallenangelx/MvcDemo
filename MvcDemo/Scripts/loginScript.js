$(document).ready(function () {
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
            success: function (loginvalues) {
                if (loginvalues == "True")
                    window.location.href = '/BlogPost/Create';
                else {
                    alert("Error, login not found!");
                }
            },
            error: function () { alert("Error, login not found!"); }

        });
    });
})
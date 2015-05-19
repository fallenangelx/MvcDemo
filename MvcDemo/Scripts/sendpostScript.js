$(document).ready(function () {
    $("#Post").bind("click", function () {
        if (($("#inputTitle").val() == "") && ($("#inputPostText").val() == "")) {
            alert("You must put the Title and/or Post Text!");
            window.location.reload();
        } else if (($("#inputTitle").val() == "") || ($("#inputPostText").val() == "")) {
            alert("You must put the Title and/or Post Text!");
            window.location.reload();
        }
        else {
            var postData = {
                "Title": "" + $("#inputTitle").val() + "",
                "Post": "" + $("#inputPostText").val() + ""
            };


            $.ajax({
                type: "POST",
                url: "/BlogPost/Create",
                data: JSON.stringify(postData),
                contentType: "application/json",
                datatype: "json",
                success: function () { window.location.href = '/BlogPost/Index'; },
                error: function () { alert("Error, invalid post parameters!"); }

            });
        }
    });
})
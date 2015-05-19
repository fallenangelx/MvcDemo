$(document).ready(function () {
    $("#newCommentBtn").bind("click", function () {
        $("#newCommentModal").modal("show");
    });

    $("#saveComment").bind("click", function (obj) {

        var comment = {
            "Comment": "" + $("#inputComment").val() + "",
            "UserId": "" + $("#UserID").val() + "",
            "PostId": "" + $("#PostID").val() + ""
        };

        $.ajax({
            type: "POST",
            url: "/BlogPost/NewComment",
            data: JSON.stringify(comment),
            contentType: "application/json",
            datatype: "json",
            success: function (commentreturn) {
                if (commentreturn == "True") {
                    $("#commentModal").modal("hide");
                    window.location.reload();
                } else {
                    alert("Error, you must fill the comment area!");
                }
            }

        });


    });
})
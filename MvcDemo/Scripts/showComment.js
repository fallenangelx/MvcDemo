$(document).ready(function () {
    $("#showAllCommentsBtn").bind("click", function () {
        $("#showCommentModal").modal("show");

        $.ajax({
            type: "GET",
            url: "/BlogPost/ReturnComment",
            contentType: "application/json",
            datatype: "json",
            success: function () { $("#commentModal").modal("hide"); window.location.reload(); }
        });
    });
})

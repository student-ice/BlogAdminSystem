
$('#update').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)

    var id = button.data("id")
    var username =  button.data("username")
    var password =  button.data("password")
    var email = button.data("email")
    var telephone = button.data("telephone")
    var gender = button.data("gender")

    var modal = $(this)

    modal.find('#updateInputID').val(id);
    modal.find('#updateInputUsername').val(username);
    modal.find('#updateInputPassword').val(password);
    modal.find('#updateInputEmail').val(email);
    modal.find('#updateInputTelephone').val(telephone);
    var list = modal.find('.update-gender')
    for (let i = 0 ; i < list.length ; i++){
        if ( gender == $(list.get(i)).val()) {
            $(list.get(i)).prop('checked', true)
        }
    }

})

$('#delete').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)

    let id =  button.data("id")

    var modal = $(this)

    modal.find('.delete-label').text("是否要删除ID 为：" + id + " 的用户?")
    modal.find('#deleteIdInput').val(id)
})
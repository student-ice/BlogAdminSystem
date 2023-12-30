$('#delete').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)

    let id =  button.data("id")

    var modal = $(this)

    modal.find('.delete-label').text("是否要删除ID 为：" + id + " 的博客?")
    modal.find('#deleteIdInput').val(id)
})
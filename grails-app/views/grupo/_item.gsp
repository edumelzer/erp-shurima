
<div id="items${i}" class="item-div" >
    <g:hiddenField name='itemsList[${i}].id' value='${item?.id}' />
    <g:hiddenField name='itemsList[${i}].deleted' value='false' />
    <g:hiddenField name='itemsList[${i}].new' value="${item?.id == null?'true':'false'}" />

<g:textField name='itemsList[${i}].item' value='${item?.item}' />
    <g:select name="itemsList[${i}].item"
        from="${com.shurima.Item.list()}"
        optionKey="nome"
        optionValue="id"
        value="${item}" />

    <span class="del-item">
        <img src="${resource(dir:'images/skin', file:'icon_delete.png')}" style="vertical-align:middle;" />
    </span>
</div>

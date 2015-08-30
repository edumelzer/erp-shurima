
<script type="text/javascript">
    var childCount = ${grupin?.items?.size()} + 0;

    function addItem() {

        console.log("Mimimi acontecendo");

        var clone = $("#item_clone").clone()
        var htmlId = 'itemsList[' + childCount + '].';
        var itemInput = clone.find("input[id$=number]");

        clone.find("input[id$=id]")
            .attr('id', htmlId + 'id')
            .attr('name', htmlId + 'id');

        clone.find("input[id$=deleted]")
            .attr('id', htmlId + 'deleted')
            .attr('name', htmlId + 'deleted');

        clone.find("input[id$=new]")
            .attr('id', htmlId + 'new')
            .attr('name', htmlId + 'new')
            .attr('value', 'true');

        itemInput.attr('id', htmlId + 'number')
            .attr('name', htmlId + 'number');

        clone.find("select[id$=type]")
            .attr('id', htmlId + 'type')
            .attr('name', htmlId + 'type');

        clone.attr('id', 'item' + childCount);

        $("#childList").append(clone);

        clone.show();
        itemInput.focus();
        childCount++;
    }

    //bind click event on delete buttons using jquery live
    $('.del-item').live('click', function() {
        //find the parent div
        var prnt = $(this).parents(".item-div");
        //find the deleted hidden input
        var delInput = prnt.find("input[id$=deleted]");
        //check if this is still not persisted
        var newValue = prnt.find("input[id$=new]").attr('value');
        //if it is new then i can safely remove from dom
        if (newValue == 'true') {
            prnt.remove();
        } else {
            //set the deletedFlag to true
            delInput.attr('value', 'true');
            //hide the div
            prnt.hide();
        }
    });
</script>

<div id="childList">
    <g:each var="item" in="${grupin.items}" status="i">

        <!-- Render the phone template (_phone.gsp) here -->
        <g:render template='item' model="['item':item,'i':i,'hidden':false]" />
        <!-- Render the phone template (_phone.gsp) here -->

    </g:each>
</div>
<input type="button" value="Adicionar Item" onclick="addItem();" />

var all;
var undoMes;
var levelOne;
var levelTwo;
var levelThree;
var lines = 20;
$(document).ready(function() {
	$.ajax({
		type     : "post",
		cache    : true,
		async    : false,
		dataType : "json",
		data	 : "",
		url      : "http://"+document.location.host+"/JWLetter/select" ,
		success  : function(res){

			all = res.all;
			undoMes = res.undo;
			levelOne = res.levelOne;
			levelTwo = res.levelTwo;
			levelThree = res.levelThree;

		}
	});
	showMessage();
	showTag();
});


function page(tmp){
	var ul = tmp.parentNode.parentNode;
	var id = ul.parentNode.getAttribute("id");
	var table = ul.parentNode.children[0].children[1].children[1].children[0].children[0];
	if(id=="message"){
		showTitle(table,all,tmp.innerHTML,"message");
	}else if(id=="undo"){
		showTitle(table,undoMes,tmp.innerHTML,"undo");
	}else if(id=="levelone"){
		showTitle(table,levelOne,tmp.innerHTML,"levelone");
	}else if(id=="leveltwo"){
		showTitle(table,levelTwo,tmp.innerHTML,"leveltwo");
	}else if(id=="levelthree"){
		showTitle(table,levelThree,tmp.innerHTML,"levelthree");
	}
	for(var i=1;i<ul.children.length-1;i++){
		if(ul.children[i].children[0].innerHTML==tmp.innerHTML)
			{
			ul.children[i].setAttribute("class", "active");
			}else{
				ul.children[i].setAttribute("class", "");
			}

	}
}
function createXHR() {

    // Checks whether support XMLHttpRequest or not.
    	if (typeof XMLHttpRequest != "undefined") {
    		return new XMLHttpRequest();
    	}

    // IE6 and elder version.
    	else if (typeof ActiveXObject != "undefined") {
    		if (typeof arguments.callee.activeXString != "string") {
    			var versions = [
    			                "MSXML2.XMLHttp6.0",
    			                "MSXML2.XMLHttp3.0",
    			                "MSXML2.XMLHttp"];

    			for (var i = 0; i < versions.length; i++) {
    				try {
    					var xhr = new ActiveXObject(versions[i]);
    					arguments.callee.activeXString = versions[i];
    					return xhr;
    				}
    				catch (ex) {
    					throw new Error(ex.toString());
    				}
    			}
    			return new ActiveXObject(arguments.callee.activeXString);
    		}
    		else {
    			throw new Error("No XHR object available");
    		}

    	}
    	//var tableOld = document.getElementById("result-tab");
        //tableOld.firstChild.removeNode(true);
        var tb = document.getElementById('result-tab');
        var rowNum=tb.rows.length;

        for (i=1;i<rowNum;i++)
        {
            tb.deleteRow(i);
            rowNum=rowNum-1;
            i=i-1;
        }
        var t = document.getElementById("result-tab");

        for(var i=0; i<dataItems.length; i++)
        {
            var item = dataItems[i];
            var table = document.getElementById("result-tab");
            var tabRow = table.insertRow(i+1);
            tabRow.setAttribute("id", "item"+i);
            var checkCell = tabRow.insertCell(0);
            checkCell.innerHTML = "<input class='tc' name='id[]' value='' type='checkbox'>";
            //checkCell.value = item.id;
            var idCell = tabRow.insertCell(1);
            idCell.innerHTML = "<a>" +item.id+"</a>";
            var nameCell = tabRow.insertCell(2);
            nameCell.innerHTML = "<a>"+item.name+"</a>";
            var numberCell = tabRow.insertCell(3);
            numberCell.innerHTML = "<a>"+item.tel+"</a>";
            var operationCell = tabRow.insertCell(4);
            operationCell.innerHTML = "<a class='link-update' onclick='showUpdate(this.id)' width='%5' id='modify"+i+"' >修改&nbsp</a>"
                + "<a class='link-del' onclick='deleteWorker(this.id)' id='delete"+item.id+"'>删除&nbsp</a>"
                + "<a class='check-state' onclick='checkWorkerState()' id='check"+item.id+"'>查看状态</a>";
        }
    	return null;
    }

    function searchWorker()
    {
        var searchTable = document.getElementById("search-tab");
        var t = document.getElementById("selectController");
        var name = searchTable.rows[0].cells[1].getElementsByTagName("input")[0].value;
        var number = searchTable.rows[0].cells[3].getElementsByTagName("input")[0].value;
        var url = "http://"+document.location.host+"/BlackGame/info";
        $.ajax({
            type     : "post",
            cache    : true,
            async    : true,
            dataType : "json",
            data	 : "name=" + name + "&tel=" + number,
            url      : url ,
            success  : function(res){
            	var dataItems = res;
                //var tableOld = document.getElementById("result-tab");
                //tableOld.firstChild.removeNode(true);
                var tb = document.getElementById('result-tab');
                var rowNum=tb.rows.length;

                for (i=1;i<rowNum;i++)
                {
                    tb.deleteRow(i);
                    rowNum=rowNum-1;
                    i=i-1;
                }
                var t = document.getElementById("result-tab");

                for(var i=0; i<dataItems.length; i++)
                {
                    var item = dataItems[i];
                    var table = document.getElementById("result-tab");
                    var tabRow = table.insertRow(i+1);
                    tabRow.setAttribute("id", "item"+i);
                    var checkCell = tabRow.insertCell(0);
                    checkCell.innerHTML = "<input class='tc' name='id[]' value='' type='checkbox'>";
                    //checkCell.value = item.id;
                    var idCell = tabRow.insertCell(1);
                    idCell.innerHTML = "<a>" +item.id+"</a>";
                    var nameCell = tabRow.insertCell(2);
                    nameCell.innerHTML = "<a>"+item.name+"</a>";
                    var numberCell = tabRow.insertCell(3);
                    numberCell.innerHTML = "<a>"+item.tel+"</a>";
                    var operationCell = tabRow.insertCell(4);
                    operationCell.innerHTML = "<a class='link-update' onclick='showUpdate(this.id)' width='%5' id='modify"+i+"' >修改&nbsp</a>"
                        + "<a class='link-del' onclick='deleteWorker(this.id)' id='delete"+item.id+"'>删除&nbsp</a>"
                        + "<a class='check-state' onclick='checkWorkerState()' id='check"+item.id+"'>查看状态</a>";
                }
            }
        });
    }

    function updateWorker()
    {

    	var updateTable = document.getElementById("update-tab");
    	var id = updateTable.rows[0].cells[1].children[0].innerHTML;
    	var name = updateTable.rows[1].cells[1].children[0].value;
		var phoneId = updateTable.rows[2].cells[1].children[0].value;
		var info = updateTable.rows[3].cells[1].children[0].value;
        var url = "http://"+document.location.host+"/BlackGame/updateDriver";
        $.ajax({
            type     : "POST",
            cache    : true,
            async    : true,
            dataType : "json",
            data     : "id="+id +"&name="+name+"&tel="+phoneId+"&info="+info,
            url      : url,
            success  : function(res){
                alert("更新成功！");
                location.reload();
            }
        });
    }

    function deleteWorker(id)
    {
    	if(window.confirm("确定要删除该人员信息吗？"))
    	{
    		var index = id.substr("delete".length);

            var url = "http://"+document.location.host+"/BlackGame/deleteDriver";
            $.ajax({
                type     : "POST",
                cache    : true,
                async    : true,
                dataType : "json",
                data     : "id="+index,
                url      : url,
                success  : function(res){
                    alert("删除成功");
                    location.reload();
                }
            });
    	}

    }

    function addWorker()
    {

    	var insertTable = document.getElementById("insert-tab");
        var t = document.getElementById("addSelect");

        var name = insertTable.rows[0].cells[1].getElementsByTagName("input")[0].value;
        var phoneId = insertTable.rows[1].cells[1].getElementsByTagName("input")[0].value;

        var url = "http://"+document.location.host+"/BlackGame/addDriver";
        $.ajax({
            type     : "POST",
            cache    : true,
            async    : true,
            dataType : "json",
            data     : "name="+name+"&tel="+phoneId,
            url      : url,
            success  : function(res){
                alert("添加成功！");
                location.reload();
            }
        });
    }

    function showTitle(table,data,page,id){
    	for(var i=0;i<table.children.length;){
    		table.removeChild(table.children[0]);
    	}
    	var start = lines*(page-1);
    	for(var i=0;i<lines;i++){
    		var tr = document.createElement("tr");
    		var td1 = "<td><div class='icheckbox_flat-blue' aria-checked='false' aria-disabled='false' style='position: relative;'> <input type='checkbox' style='position: absolute; opacity: 0;'> <ins class='iCheck-helper' style='position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);'></ins></div></td>";
    		var td2;
    		var td3="<td width='20%' class='mailbox-name'><a href='read-mail.html'>"+data[start+i].author.trim()+"</a></td>";
    		var td4="<td width='65%' class='mailbox-subject' >"+"<a onclick='showDetail("+data[start+i].letter_id+","+page+","+id+")' name ='"+(start+i)+"'>"+data[start+i].attachments+"</a></td>";
    		var td5 = "<td class='mailbox-attachment'></td>";
    		var td6;
    			if(data[start+i].ifRead==0){
    				td2="<td width='5%' class='mailbox-star'><a href='#'><i class='fa fa-star text-yellow'></i></a></td>";
    			}else if(data[start+i].ifRead==1){
    				td2="<td width='5%' class='mailbox-star'><a href='#'><i class='fa fa-star-o text-yellow'></i></a></td>";
    			}
    			if(data[start+i].name==0){
    				td6="<td width='10%' class='mailbox-date'>一级信件</td>"
    			}else if(data[start+i].name==1){
    				td6="<td width='10%' class='mailbox-date'>二级信件</td>"
    			}else if(data[start+i].name==2){
    				td6="<td width='10%' class='mailbox-date'>三级信件</td>"
    			}
    			tr.innerHTML=td1+td2+td3+td4+td5+td6;
    			table.appendChild(tr);

    	}
    }

    function showMessage()
	{
		document.getElementById("message").style.display="";
		var table = document.getElementById("message").children[0].children[1].children[1].children[0].children[0];
		showTitle(table,all,1,"message");
		var index = document.getElementById("message").children[1];
		for(var i =0;i<index.children.length;){
			index.removeChild(index.children[0]);
		}
		var pre=document.createElement("li");
		var prea = document.createElement("a");
		prea.setAttribute("href", "#");
		prea.setAttribute("onclick", "minus(this)");
		prea.innerHTML="&laquo;";
		pre.appendChild(prea);
		index.appendChild(pre);
		var len;
		if((all.length/lines+1)>5){
			len =6;
		}else{
			len = all.length/lines+2;
		}
		for(var i =1;i<all.len;i++){
			 var li=document.createElement("li");
			 var lia = document.createElement("a");
			 lia.setAttribute("href", "#");
			 lia.setAttribute("onclick","page(this)");
			 lia.innerHTML=i;
			 li.appendChild(lia);
			 index.appendChild(li);
		}
		var end=document.createElement("li");
		var enda = document.createElement("a");
		enda.setAttribute("href", "#");
		enda.setAttribute("onclick", "plus(this)");
		enda.innerHTML="&raquo;";
		end.appendChild(enda);
		index.appendChild(end);
		document.getElementById("message").children[1].children[1].setAttribute("class", "active");
		for(var i=2;i<document.getElementById("message").children[1].children.length-1;i++){
			document.getElementById("message").children[1].children[i].setAttribute("class", "");
		}
		document.getElementById("undo").style.display="none";
		document.getElementById("levelone").style.display="none";
		document.getElementById("leveltwo").style.display="none";
		document.getElementById("levelthree").style.display="none";
		document.getElementById("searchresult").style.display="none";
		document.getElementById("letter_contents").style.display="none";
		document.getElementById("tagBox").style.display="none";
		document.getElementById("statiscresult").style.display="none";
		var ul = document.getElementById("ul");
		for(var i=0;i<ul.children.length-1;i++){
			ul.children[i].className='';
			ul.children[i].children[0].children[1].className='label label-warning pull-right';
		}
		document.getElementById("showSearch").setAttribute("class", "");
		document.getElementById("showMessage").setAttribute("class", "active");
		document.getElementById("showMessage").children[0].children[1].innerHTML=all.length;
		document.getElementById("showUndo").children[0].children[1].innerHTML=undoMes.length;
		document.getElementById("showOneLevel").children[0].children[1].innerHTML=levelOne.length;
		document.getElementById("showTwoLevel").children[0].children[1].innerHTML=levelTwo.length;
		document.getElementById("showThreeLevel").children[0].children[1].innerHTML=levelThree.length;
		document.getElementById("showMessage").children[0].children[1].className='label label-primary pull-right';
	}

    function showUndo()
	{
		document.getElementById("message").style.display="none";
		document.getElementById("undo").style.display="";
		var table = document.getElementById("undo").children[0].children[1].children[1].children[0].children[0];
		showTitle(table,undoMes,1,"undo");
		var index = document.getElementById("undo").children[1];
		for(var i =0;i<index.children.length;){
			index.removeChild(index.children[0]);
		}
		var pre=document.createElement("li");
		var prea = document.createElement("a");
		prea.setAttribute("href", "#");
		prea.setAttribute("onclick", "minus(this)");
		prea.innerHTML="&laquo;";
		pre.appendChild(prea);
		index.appendChild(pre);
		var len;
		if((all.length/lines+1)>5){
			len =6;
		}else{
			len = all.length/lines+2;
		}
		for(var i =1;i<len;i++){
			 var li=document.createElement("li");
			 var lia = document.createElement("a");
			 lia.setAttribute("href", "#");
			 lia.setAttribute("onclick","page(this)");
			 lia.innerHTML=i;
			 li.appendChild(lia);
			 index.appendChild(li);
		}
		var end=document.createElement("li");
		var enda = document.createElement("a");
		enda.setAttribute("href", "#");
		enda.setAttribute("onclick", "plus(this)");
		enda.innerHTML="&raquo;";
		end.appendChild(enda);
		index.appendChild(end);
		document.getElementById("undo").children[1].children[1].setAttribute("class", "active");
		for(var i=2;i<document.getElementById("undo").children[1].children.length-1;i++){
			document.getElementById("undo").children[1].children[i].setAttribute("class", "");
		}
		document.getElementById("levelone").style.display="none";
		document.getElementById("leveltwo").style.display="none";
		document.getElementById("levelthree").style.display="none";
		document.getElementById("searchresult").style.display="none";
		document.getElementById("letter_contents").style.display="none";
		document.getElementById("tagBox").style.display="none";
		document.getElementById("statiscresult").style.display="none";
		var ul = document.getElementById("ul");
		for(var i=0;i<ul.children.length-1;i++){
			ul.children[i].className='';
			ul.children[i].children[0].children[1].className='label label-warning pull-right';
		}
		document.getElementById("showSearch").setAttribute("class", "");
		document.getElementById("showUndo").setAttribute("class", "active");
		document.getElementById("showUndo").children[0].children[1].className='label label-primary pull-right';
	}

    function showOneLevel()
	{
		document.getElementById("message").style.display="none";
		document.getElementById("undo").style.display="none";
		document.getElementById("levelone").style.display="";
		var table = document.getElementById("levelone").children[0].children[1].children[1].children[0].children[0];
		showTitle(table,levelOne,1,"levelone");
		var index = document.getElementById("levelone").children[1];
		for(var i =0;i<index.children.length;){
			index.removeChild(index.children[0]);
		}
		var pre=document.createElement("li");
		var prea = document.createElement("a");
		prea.setAttribute("href", "#");
		prea.setAttribute("onclick", "minus(this)");
		prea.innerHTML="&laquo;";
		pre.appendChild(prea);
		index.appendChild(pre);
		var len;
		if((all.length/lines+1)>5){
			len =6;
		}else{
			len = all.length/lines+2;
		}
		for(var i =1;i<len;i++){
			 var li=document.createElement("li");
			 var lia = document.createElement("a");
			 lia.setAttribute("href", "#");
			 lia.setAttribute("onclick","page(this)");
			 lia.innerHTML=i;
			 li.appendChild(lia);
			 index.appendChild(li);
		}
		var end=document.createElement("li");
		var enda = document.createElement("a");
		enda.setAttribute("href", "#");
		enda.setAttribute("onclick", "plus(this)");
		enda.innerHTML="&raquo;";
		end.appendChild(enda);
		index.appendChild(end);
		document.getElementById("levelone").children[1].children[1].setAttribute("class", "active");
		for(var i=2;i<document.getElementById("levelone").children[1].children.length-1;i++){
			document.getElementById("levelone").children[1].children[i].setAttribute("class", "");
		}
		document.getElementById("leveltwo").style.display="none";
		document.getElementById("levelthree").style.display="none";
		document.getElementById("searchresult").style.display="none";
		document.getElementById("letter_contents").style.display="none";
		document.getElementById("tagBox").style.display="none";
		document.getElementById("statiscresult").style.display="none";
		var ul = document.getElementById("ul");
		for(var i=0;i<ul.children.length-1;i++){
			ul.children[i].className='';
			ul.children[i].children[0].children[1].className='label label-warning pull-right';
		}
		document.getElementById("showSearch").setAttribute("class", "");
		document.getElementById("showOneLevel").setAttribute("class", "active");
		document.getElementById("showOneLevel").children[0].children[1].className='label label-primary pull-right';
	}

    function showTwoLevel()
	{
		document.getElementById("message").style.display="none";
		document.getElementById("undo").style.display="none";
		document.getElementById("levelone").style.display="none";
		document.getElementById("statiscresult").style.display="none";
		document.getElementById("leveltwo").style.display="";
		var table = document.getElementById("leveltwo").children[0].children[1].children[1].children[0].children[0];
		showTitle(table,levelTwo,1,"leveltwo");
		var index = document.getElementById("leveltwo").children[1];
		for(var i =0;i<index.children.length;){
			index.removeChild(index.children[0]);
		}
		var pre=document.createElement("li");
		var prea = document.createElement("a");
		prea.setAttribute("href", "#");
		prea.setAttribute("onclick", "minus(this)");
		prea.innerHTML="&laquo;";
		pre.appendChild(prea);
		index.appendChild(pre);
		var len;
		if((all.length/lines+1)>5){
			len =6;
		}else{
			len = all.length/lines+2;
		}
		for(var i =1;i<len;i++){
			 var li=document.createElement("li");
			 var lia = document.createElement("a");
			 lia.setAttribute("href", "#");
			 lia.setAttribute("onclick","page(this)");
			 lia.innerHTML=i;
			 li.appendChild(lia);
			 index.appendChild(li);
		}
		var end=document.createElement("li");
		var enda = document.createElement("a");
		enda.setAttribute("href", "#");
		enda.setAttribute("onclick", "plus(this)");
		enda.innerHTML="&raquo;";
		end.appendChild(enda);
		index.appendChild(end);
		document.getElementById("leveltwo").children[1].children[1].setAttribute("class", "active");
		for(var i=2;i<document.getElementById("leveltwo").children[1].children.length-1;i++){
			document.getElementById("leveltwo").children[1].children[i].setAttribute("class", "");
		}
		document.getElementById("levelthree").style.display="none";
		document.getElementById("searchresult").style.display="none";
		document.getElementById("letter_contents").style.display="none";
		document.getElementById("tagBox").style.display="none";
		var ul = document.getElementById("ul");
		for(var i=0;i<ul.children.length-1;i++){
			ul.children[i].className='';
			ul.children[i].children[0].children[1].className='label label-warning pull-right';
		}
		document.getElementById("showSearch").setAttribute("class", "");
		document.getElementById("showTwoLevel").setAttribute("class", "active");
		document.getElementById("showTwoLevel").children[0].children[1].className='label label-primary pull-right';
	}

    function showThreeLevel()
	{
		document.getElementById("message").style.display="none";
		document.getElementById("undo").style.display="none";
		document.getElementById("levelone").style.display="none";
		document.getElementById("leveltwo").style.display="none";
		document.getElementById("statiscresult").style.display="none";
		document.getElementById("levelthree").style.display="";
		var table = document.getElementById("levelthree").children[0].children[1].children[1].children[0].children[0];
		showTitle(table,levelThree,1,"levelthree");
		var index = document.getElementById("levelthree").children[1];
		for(var i =0;i<index.children.length;){
			index.removeChild(index.children[0]);
		}
		var pre=document.createElement("li");
		var prea = document.createElement("a");
		prea.setAttribute("href", "#");
		prea.setAttribute("onclick", "minus(this)");
		prea.innerHTML="&laquo;";
		pre.appendChild(prea);
		index.appendChild(pre);
		var len;
		if((all.length/lines+1)>5){
			len =6;
		}else{
			len = all.length/lines+2;
		}
		for(var i =1;i<len;i++){
			 var li=document.createElement("li");
			 var lia = document.createElement("a");
			 lia.setAttribute("href", "#");
			 lia.setAttribute("onclick","page(this)");
			 lia.innerHTML=i;
			 li.appendChild(lia);
			 index.appendChild(li);
		}
		var end=document.createElement("li");
		var enda = document.createElement("a");
		enda.setAttribute("href", "#");
		enda.setAttribute("onclick", "plus(this)");
		enda.innerHTML="&raquo;";
		end.appendChild(enda);
		index.appendChild(end);
		document.getElementById("levelthree").children[1].children[1].setAttribute("class", "active");
		for(var i=2;i<document.getElementById("levelthree").children[1].children.length-1;i++){
			document.getElementById("levelthree").children[1].children[i].setAttribute("class", "");
		}
		document.getElementById("searchresult").style.display="none";
		document.getElementById("letter_contents").style.display="none";
		document.getElementById("tagBox").style.display="none";
		var ul = document.getElementById("ul");
		for(var i=0;i<ul.children.length-1;i++){
			ul.children[i].className='';
			ul.children[i].children[0].children[1].className='label label-warning pull-right';
		}
		document.getElementById("showSearch").setAttribute("class", "");
		document.getElementById("showThreeLevel").setAttribute("class", "active");
		document.getElementById("showThreeLevel").children[0].children[1].className='label label-primary pull-right';
	}

    function showSearch()
	{
		document.getElementById("message").style.display="none";
		document.getElementById("undo").style.display="none";
		document.getElementById("levelone").style.display="none";
		document.getElementById("leveltwo").style.display="none";
		document.getElementById("levelthree").style.display="none";
		document.getElementById("letter_contents").style.display="none";
		document.getElementById("tagBox").style.display="none";
		document.getElementById("statiscresult").style.display="none";
		document.getElementById("searchresult").style.display="";
		document.getElementById("searchresult").children[1].children[1].setAttribute("class", "active");
		for(var i=2;i<document.getElementById("searchresult").children[1].children.length-1;i++){
			document.getElementById("searchresult").children[1].children[i].setAttribute("class", "");
		}
		var ul = document.getElementById("ul");
		for(var i=0;i<ul.children.length-1;i++){
			ul.children[i].className='';
			ul.children[i].children[0].children[1].className='label label-warning pull-right';
		}
		document.getElementById("showSearch").setAttribute("class", "active");
		document.getElementById("showSearch").children[0].children[1].className='label label-primary pull-right';
		document.getElementById("showSearch").children[0].children[1].innerHTML='0';
	}

    function showTag(){
    	var ul = document.getElementById("tag");
    	for(var i=0;i<ul.children.length;){
    		ul.removeChild(ul.children[0]);
    	}

    	$.ajax({
    	    type     : "post",
    	    cache    : true,
    	    async    : true,
    	    dataType : "json",
    	    data	 : "tags=1-3-6-7-11-13",
    	    url      : "http://"+document.location.host+"/JWLetter/tags" ,
    	    success  : function(res){

    	    	for(var j =0;j<res.length;j++){
    	    		var t = res[j];
    	    		var name= t.tag_name;
    	    		var cl = t.tag_class;
    	    		var id = t.tag_id;
    				 var li=document.createElement("li");
    				 var lia = document.createElement("a");
    				 var i = document.createElement("i");
    				 var font= document.createElement("font");
    				 lia.setAttribute("href", "#");
    				 lia.setAttribute("onclick","tagsArt("+id+",'"+name+"')");
    				 i.setAttribute("class", cl);
    				 font.innerHTML=name;
    				 lia.appendChild(i);
    				 lia.appendChild(font);
    				 li.appendChild(lia);
    				 ul.appendChild(li);
    			}

    	    }
    	});
    }

    function tagsArt(id,name){
    	var result;
    	$.ajax({
    	    type     : "post",
    	    cache    : true,
    	    async    : true,
    	    dataType : "json",
    	    data	 : "tag="+id,
    	    url      : "http://"+document.location.host+"/JWLetter/tagsArt" ,
    	    success  : function(res){
    	    	document.getElementById("message").style.display="none";
    			document.getElementById("undo").style.display="none";
    			document.getElementById("levelone").style.display="none";
    			document.getElementById("leveltwo").style.display="none";
    			document.getElementById("levelthree").style.display="none";
    			document.getElementById("searchresult").style.display="none";
    			document.getElementById("letter_contents").style.display="none";
    			document.getElementById("statiscresult").style.display="none";
    			document.getElementById("tagBox").style.display="";
    			document.getElementById("tagBox").children[0].children[0].children[0].innerHTML="标签："+name;
    	    	result=res;
    	    	var table = document.getElementById("tagBox").children[0].children[1].children[1].children[0].children[0];
    	    	showTitle(table,result,1,"tagBox");
    	    	var index = document.getElementById("tagBox").children[1];
    			for(var i =0;i<index.children.length;){
    				index.removeChild(index.children[0]);
    			}
    			var pre=document.createElement("li");
    			var prea = document.createElement("a");
    			prea.setAttribute("href", "#");
    			prea.setAttribute("onclick", "minus(this)");
    			prea.innerHTML="&laquo;";
    			pre.appendChild(prea);
    			index.appendChild(pre);
    			var len;
    			if((result.length/lines+1)>5){
    				len =6;
    			}else{
    				len = result.length/lines+2;
    			}
    			for(var i =1;i<len;i++){
    				 var li=document.createElement("li");
    				 var lia = document.createElement("a");
    				 lia.setAttribute("href", "#");
    				 lia.setAttribute("onclick","page(this)");
    				 lia.innerHTML=i;
    				 li.appendChild(lia);
    				 index.appendChild(li);
    			}
    			var end=document.createElement("li");
    			var enda = document.createElement("a");
    			enda.setAttribute("href", "#");
    			enda.setAttribute("onclick", "plus(this)");
    			enda.innerHTML="&raquo;";
    			end.appendChild(enda);
    			index.appendChild(end);
    			document.getElementById("tagBox").children[1].children[1].setAttribute("class", "active");
    			for(var i=2;i<document.getElementById("tagBox").children[1].children.length-1;i++){
    				document.getElementById("tagBox").children[1].children[i].setAttribute("class", "");
    			}
    			var side = document.getElementById("ul");
    			for(var i=0;i<side.children.length-1;i++){
    				side.children[i].className='';
    				side.children[i].children[0].children[1].className='label label-warning pull-right';
    			}
    	    }
    	});
    }


function showDetail(a,page_num,id){

//    	var index = a.getAttribute("name");
//    	var pId = a.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.getAttribute("id");
//    	var data;
//    	if(pId=="message"){
//    		data=all;
//    	}else if(pId=="undo"){
//    		data=undo;
//    	}else if(pId=="levelone"){
//    		data=levelOne;
//    	}else if(pId=="leveltwo"){
//    		data=levelTwo;
//    	}else if(pId=="levelthree"){
//    		data=levelThree;
//    	}
	$.ajax({
		type     : "post",
		cache    : true,
		async    : true,
		dataType : "json",
		data	 : "id="+a,
		url      : "http://"+document.location.host+"/JWLetter/letter" ,
		success  : function(res){

			node=res.node;
			link=res.link;
			content=res.letter[0];

			var title = document.getElementById("title");
			var pre = document.getElementById("title").parentNode.parentNode.children[0].children[1].children[0];
			var tid=id.getAttribute("id");
			pre.setAttribute("onclick", "pre("+page_num+","+tid+")");
			for(var i=0;i<title.children.length;){
				title.removeChild(title.children[0]);
			}
			var author = document.createElement("h3");
			author.innerHTML=content.attachments;
			var time = document.createElement("h5");
			var span1 = document.createElement("span");
			span1.innerHTML=content.author;
			var span2 = document.createElement("span");
			span2.innerHTML=content.submitDateTime;
			span2.setAttribute("class","mailbox-read-time pull-right");
			time.appendChild(span1);
			time.appendChild(span2);
			title.appendChild(author);
			title.appendChild(time);
			var con = document.getElementById("content");
			for(var i=0;i<con.children.length;){
				con.removeChild(con.children[0]);
			}
			var p = document.createElement("p");
			p.innerHTML=content.contents;
			con.appendChild(p);
			var chartTheme = null;
			var sumChart = null;
			var treeChart = null;
			var ech = null;
			require(['js/dist/theme/blue'],function(tarTheme){

				chartTheme = tarTheme;
				// 路径配置
				require.config({
					paths: {
						echarts: 'js/dist'
					}
				});
				// 使用
				require(
					[
						'echarts',
						'echarts/chart/bar',
						'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
						'echarts/chart/force',
						'echarts/chart/chord'
					],
					//将画多个图表的进行函数封装
					function drawCharts(ec) {
						ech=ec;
						//drawSumChart(ec);
						drawTChart(ec);
					}
				);
			})

			function drawTChart(ec){
				// 基于准备好的dom，初始化echarts图表
				var tmp = document.getElementById('let');
				treeChart = ec.init(tmp,'macarons');

				var ecConfig = require('echarts/config');
				treeChart.on(ecConfig.EVENT.CLICK, eConsole);
				var option = {
					title : {
						text: '',
						subtext: '',
						x:'right',
						y:'bottom'
					},
					tooltip : {
						trigger: 'item',
						formatter: '{a} : {b}'
					},
					toolbox: {
						show : true,
						feature : {
							restore : {show: true},
							magicType: {show: true, type: ['force', 'chord']},
							saveAsImage : {show: true}
						}
					},
					legend: {
						x: 'left',
						data:['人名','地名','组织机构','罪名','职务','诉讼日期','其他'],
						textStyle:{
							fontFamily : '微软雅黑'
						}
					},
					series : [
						{
							type:'force',
							name : "关联关系",
							ribbonType: false,
							clickable:true,
							categories : [
								{
									name: '关键词'
								},{
									name: '人名'
								},{
									name:'地名'
								}, {
									name:'组织机构'
								}, {
									name:'罪名'
								}, {
									name:'职务'
								}, {
									name:'诉讼日期'
								}, {
									name:'其他'
								}
							],

							itemStyle: {
								normal: {
									label: {
										show: true,
										textStyle: {
											color: '#eee'
										}
									},
									nodeStyle : {
										//color:'rgb(54,143,255)',
										brushType : 'both',
										borderColor : 'rgba(0,0,0,0)',
										borderWidth : 1
									},
									linkStyle: {
										type: 'curve',
										color:'rgb(145,146,148)',
										borderColor: '#919294'
									}
								},
								emphasis: {
									label: {
										show: false
										// textStyle: null      // 默认使用全局文本样式
									},
									nodeStyle : {
										//r: 30
									},
									linkStyle : {}
								}
							},
							useWorker: false,
							minRadius : 20,
							maxRadius : 35,
							gravity: 1,
							scaling: 1.6,
							roam: 'move',
							nodes:node,
							links:link
						}]};
				treeChart.setOption(option);

				treeChart.hideLoading();
			}
			function eConsole(param) {
				if (typeof param.data.source == 'undefined') {
					if (param.type == 'click') {

						window.location.href="/JWLetter/graph?word="+param.name;
					}
				}

			}

		}
	});
	document.getElementById("message").style.display="none";
	document.getElementById("undo").style.display="none";
	document.getElementById("levelone").style.display="none";
	document.getElementById("leveltwo").style.display="none";
	document.getElementById("levelthree").style.display="none";
	document.getElementById("searchresult").style.display="none";
	document.getElementById("letter_contents").style.display="";
	document.getElementById("tagBox").style.display="none";
	document.getElementById("statiscresult").style.display="none";
}


function search(){
    	var word = document.getElementById("word").value;
    	var button = document.getElementById("showSearch");
    	if(word!=""&&button.className!="active") {
			button.children[0].children[1].className = 'label label-warning pull-right';
			button.children[0].children[1].innerHTML = '1';
		}
		/*window.location.href="/JWLetter/graph?word="+word;*/
		document.location.href="/JWLetter/graph?word="+word;
		document.getElementById("toGraph").setAttribute("href", "graph?word="+word);
	}

    function showStatisc(){
    	document.getElementById("message").style.display="none";
		document.getElementById("undo").style.display="none";
		document.getElementById("levelone").style.display="none";
		document.getElementById("leveltwo").style.display="none";
		document.getElementById("levelthree").style.display="none";
		document.getElementById("letter_contents").style.display="none";
		document.getElementById("tagBox").style.display="none";
		document.getElementById("searchresult").style.display="none";
		document.getElementById("statiscresult").style.display="";

		var ul = document.getElementById("ul");
		for(var i=0;i<ul.children.length-1;i++){
			ul.children[i].className='';
			ul.children[i].children[0].children[1].className='label label-warning pull-right';
		}

    }

    function pre(page_num,id){
    	document.getElementById("letter_contents").style.display="none";
    	id.style.display="";
    }

	function showUpdate(id)
	{
		var index = id.substr("modify".length);

		var updateTable = document.getElementById("update-tab");
		var row = document.getElementById("item"+index);

		updateTable.rows[0].cells[1].children[0].innerHTML = row.children[1].children[0].innerHTML;

		updateTable.rows[1].cells[1].children[0].value = row.children[2].children[0].innerHTML;
		updateTable.rows[2].cells[1].children[0].value = row.children[3].children[0].innerHTML;
		updateTable.rows[3].cells[1].children[0].value = row.children[2].children[0].innerHTML;

		document.getElementById("select").style.display="none";
		document.getElementById("add").style.display="none";
		document.getElementById("update").style.display="";


	}
function graphOnclick(){
	var word=document.getElementById("word").value;
	document.location.href="/JWLetter/graph?word="+word;
}
function opinionsOnclick(){
	var word=document.getElementById("word").value;
	document.location.href="/JWLetter/opinions?word="+word;
}
function mapOnclick(){
	var word=document.getElementById("word").value;
	document.location.href="/JWLetter/map?word="+word;
}
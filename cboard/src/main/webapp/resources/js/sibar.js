var replyService = (function(){
   function add(reply, callback, error){
      $.ajax({
         type:"post",
         url:'/reply/writeReply',
         data : JSON.stringify(reply),
         contentType:"application/json; charset=utf-8",
         success:function(result , status , xhr){
            if(callback){
               callback(result);
            }
         },
         error:function(xhr,status,error){
            if(callback){
               callback(xhr.responseText);
            }
         }
      });
   }
   
   function getReplyList(replyBno,pageNum,callback){
	   $.ajax({
		 type:"get",
		 url:"/reply/getReplyList/"+replyBno+"/"+pageNum+".json",
		 success:function(data){
			 if(callback){
				 callback(data);
			 }
	     }
	   });
   }
   
   
   return {
      add:add,
      getReplyList:getReplyList
   };
})();
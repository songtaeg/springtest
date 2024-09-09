<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>view 기본 세팅 파일</title>
</head>
<style>
	table{
		margin : 10px;
	}
	table, tr, th, td{
		padding : 10px;
		border : 1px solid black;
		border-collapse : collapse;
		text-align : center;
	}
</style>
<body>
	<div id="app">
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>출판사</th>
				<th>가격</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<tr v-for="item in list">
                <td>{{item.bookId}}</td>
                <td>{{item.bookName}}</td>
                <td>{{item.publisher}}</td>
                <td>
                    <div v-if="mode == '1' || checkId != item.bookId">
                        {{ item.price }}
                    </div>
                    <div v-if="mode == '2' && checkId == item.bookId">
	                    <input type="text" placeholder="가격 입력"
	                    	v-model="price">
                    </div>	    
                </td>
                <td>
                	<div v-if="mode == '1' || checkId != item.bookId">
                    	<button @click="Change(item)">수정</button>
                    </div>
                    <div v-if="mode == '2' && checkId == item.bookId">
                    	<button @click="fnUpdateBook">수정</button>
                    </div>
                </td>
                <td>
                    <button @click="fnDeleteBook(item.bookId)">삭제</button>
                </td>
            </tr>
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list:[],
				mode:'1',
				checkId: null, //수정할 항목의 ID
				price:""	
            };
        },
        methods: {
        	Change(item){
				var self=this;
				self.mode = '2';
				self.checkId = item.bookId; 
        	},
			fnGetList(){
				var self=this;
				var nparmap = {bookId:self.bookId};
				$.ajax({
					url:"book.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
					}
				});
			},
			fnDeleteBook(bookId){
				var self=this;
				var nparmap = {bookId: bookId};
				$.ajax({
					url:"delete-book.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
						self.fnGetList();
					}
				});
			},
			fnUpdateBook(){
				var self = this;
				var nparmap = {
					price: self.price,
					bookId: self.checkId	
				};
				$.ajax({
					url:"update-book.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						//console.log(data);
						alert(data.message);
						self.fnGetList();
						self.mode = '1';  
                        self.checkId = null;
                        self.price = "";  
					}
				});
			}
        },
        mounted() {
			var self=this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>
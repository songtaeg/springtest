<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>테스트 샘플 파일</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<input type="text" placeholder="1~15 입력(pk)값" 
			v-model="productNo">
		</input>
		<button @click=fnGetList>검색</button>
			<div>
				{{list}}<br>
				<button @click=fnUpdate>수정</button>
				<button @click=fnDelete>삭제</button>
			</div>	
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list:[]
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = { productNo:self.productNo};
				$.ajax({
					url:"test.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list=data.list;
					}
				});
            },
			fnUpdate(){
				
			},
			fnDelete(){
				
			}
        },
        mounted() {
			var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>
​
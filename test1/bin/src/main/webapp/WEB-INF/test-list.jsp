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
				<!--{{test}}-->
				제품 번호: {{test.productNo}}<br>
				제품 이름: {{test.productName}}<br>
				<div v-if="mode=='1'">
				제품 가격: {{test.productPrice}}
				</div>
				<div v-if="mode=='2'">
					제품 가격: <input type="text" placeholder="가격입력" 
						v-model="productPrice">
					</input>
					<button @click=fnUpdate>저장</button>
				</div>
				<hr>
				<!--{{list}}-->
				<button @click="changes()">수정</button>
				<button @click=fnDelete(test.productNo)>삭제</button>
			</div>	
			<hr>
			<div>
				제품명:<input type="text" v-model="productName"></input><br>
				제품가격: <input type="text" v-model="productPrice"> </input><br>
				<button @click=fnInsert>저장</button>
			</div>	
	<!-- <template v-if="mode=='1'">
				11111
		</template>
		<template v-if="mode=='2'">
				2222
		</template>
		<button @click="change()">change</button>
	-->		
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
		//변수
        data() {
            return {
				test:{},
				list:[],
				productNo:"",
				productName:"",
				productPrice:"",
				mode:'1'
            };
        },
		//함수
        methods: {
			/*change(){
				var self=this;
				self.mode='2';
			},*/
			changes(){
				var self=this;
				self.mode='2';
			},
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
						self.test = data.test;
						//self.list=data.list;
					}
				});
            },
			fnUpdate(){
				var self=this;
				var nparmap={
					productPrice:self.productPrice,
					productNo:self.productNo
				};
				$.ajax({
					url:"update.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
					}
				});
			},
			fnDelete(productNo){
				var self = this;
				var nparmap={productNo : productNo};
				$.ajax({
					url:"delete.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
					}
				});
			},
			fnInsert(){
				var self = this;
				var nparmap={
					productName : self.productName,
					productPrice: self.productPrice
				};
				$.ajax({
					url:"insert.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
					}
				});
			}
        },
		//실행부
        mounted() {
			var self = this;
			//self.fnGetList();
        }
    });
    app.mount('#app');
</script>
​
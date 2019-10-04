<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
	
	
	
	<script>
		$(document).ready(function(){
			$('#send').click(function(){
				var msg = $('#msg').val();
				alert(msg);
			});
		})
	
	</script>
	
	<!-- Chat-launcher -->
	<div class="chat-launcher" id="chat-btn" ></div>
	<div class="chat-wrapper" id="chating-area" >
		<div class="card">
			<div class="header">
				<ul class="list-unstyled team-info margin-0">
					<li class="m-r-15"><h2>Sir Salah</h2></li>
					
				</ul>
			</div>
			<div class="body">
				<div class="chat-widget">
					<ul class="chat-scroll-list clearfix">
						<li class="left float-left"><img
							src="assets/images/xs/avatar3.jpg" class="rounded-circle" alt="">
							<div class="chat-info">
								<a class="name" href="javascript:void(0);">Alexanders</a> <span
									class="datetime">6:12</span> <span class="message">Hello,
									John </span>
							</div></li>
						<li class="right">
							<div class="chat-info">
								<span class="datetime">6:15</span> <span class="message">Hi,
									Alexander<br> How are you!
								</span>
							</div>
						</li>
						<li class="right">
							<div class="chat-info">
								<span class="datetime">6:16</span> <span class="message">There
									are many variations of passages of Lorem Ipsum available</span>
							</div>
						</li>
						<li class="left float-left"><img
							src="assets/images/xs/avatar2.jpg" class="rounded-circle" alt="">
							<div class="chat-info">
								<a class="name" href="javascript:void(0);">Elizabeth</a> <span
									class="datetime">6:25</span> <span class="message">Hi,
									Alexander,<br> John <br> What are you doing?
								</span>
							</div></li>
						<li class="left float-left"><img
							src="assets/images/xs/avatar1.jpg" class="rounded-circle" alt="">
							<div class="chat-info">
								<a class="name" href="javascript:void(0);">Michael</a> <span
									class="datetime">6:28</span> <span class="message">I
									would love to join the team.</span>
							</div></li>
						<li class="right">
							<div class="chat-info">
								<span class="datetime">7:02</span> <span class="message">Hello,
									<br>Michael
								</span>
							</div>
						</li>
					</ul>
				</div>
				
					
				<div class="input-group p-t-15">
				
				<input type="button" class="btn btn-success" value="Request for slots"
						  id="msg" >
					<input type="text" class="form-control"
						placeholder="Enter text here..."  id="msg" > <span
						class="input-group-addon"> <i class="zmdi zmdi-mail-send" id="send"></i>
					</span>
				</div>
			</div>
		</div>
	</div>

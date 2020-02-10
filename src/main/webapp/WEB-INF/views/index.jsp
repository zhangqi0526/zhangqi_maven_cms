<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${channel!=null?channel.name:'首页' }</title>
<link href="/public/css/bootstrap.min.css" rel="stylesheet">
<link href="/public/css/index.css" rel="stylesheet">
</head>
<body>
	<!-- 头部导航 -->
	<jsp:include page="./common/user/head-top.jsp"></jsp:include>

	<div class="container-fluid" style="margin-top: 6px;">
		<div class="row offset-1">
			<!-- 频道 -->
			<div class="col-1" style="padding-right: 5px;padding-left: 5px;">
				<h2>1710F</h2>
				<ul class="nav flex-column">
					<li class="nav-item "><a class="nav-link <c:if test="${channelId==null }">active</c:if>" href="/">热点</a></li>
					<c:forEach items="${channelList }" var="item">
						<c:if test="${channelId==item.id }">
							<li class="nav-item"><a class="nav-link active"   href="/${item.id }/0/1.html">${item.name }</a></li>
						</c:if>
						<c:if test="${channelId!=item.id }">
							<li class="nav-item"><a class="nav-link"  href="/${item.id }/0/1.html">${item.name }</a></li>
						</c:if>
					</c:forEach>
				</ul>

			</div>
			<div class="col-6">
				<!-- 轮播图 -->
				<c:if test="${channelId==null }">
					<div id="carouselExampleControls" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner">
							<c:forEach items="${slideList }" var="item" varStatus="status">
								<div class="carousel-item <c:if test="${status.index==0 }">active</c:if>">
									<a href="${item.url }" target="_blank"><img src="${item.picture }" height="386px;" class="d-block w-100" alt="..."></a>
								</div>
							</c:forEach>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleControls"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselExampleControls"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</c:if>
				<!-- 频道下的文章分类 -->
					<ul class="nav nav-tabs">
						<c:if test="${cateList!=null && cateList.size()>0 }">
							<li class="nav-item"><a class="nav-link <c:if test="${cateId==0 }">active</c:if>" href="/${channelId }/0/1.html">全部</a></li>
							<c:forEach items="${cateList }" var="item">
								<li class="nav-item"><a class="nav-link <c:if test="${cateId==item.id }">active</c:if>" href="/${channelId }/${item.id}/1.html">${item.name }</a></li>
							</c:forEach>
						</c:if>
					</ul>
				
				<!-- 文章列表 -->
				<div style="margin-top: 18px;">
					<c:forEach items="${pageInfo.list }" var="item" varStatus="status">
					  	<div class="media">
					  		<a href="/article/detail/${item.id}.html" target="_blank">
						  		<img src="${item.picture }" class="mr-3" style="height: 108px; width: 175px;">
						  	</a>
						  <div class="media-body">
						    <h4 class="mt-1">
						    	<a href="/article/detail/${item.id}.html" target="_blank">${item.title }</a>
						    </h4>
						    <p style="color: #999;">${item.nickname } <fmt:formatDate value="${item.created }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
						  </div>
						</div>
					</c:forEach>
				</div>
				<!-- 分页 -->
				<jsp:include page="./common/page.jsp"></jsp:include>
			</div>
			<!-- 首页右侧 -->
			<div class="col-3">
				<div class="right">
					<div>最新文章</div>
					<ul class="list-unstyled">
						<li class="media"><img
							src="http://p1.pstatp.com/large/pgc-image/4ab237b9682f4c0286da5c5e6823dc87"
							style="height: 72px; width: 72px;" class="mr-3" alt="...">
							<div class="media-body">
								<h5 class="mt-0 mb-1">电子眼全面升级，新增5项功能！</h5>
							</div></li>
						<li class="media"><img
							src="http://p1.pstatp.com/large/pgc-image/4ab237b9682f4c0286da5c5e6823dc87"
							style="height: 72px; width: 72px;" class="mr-3" alt="...">
							<div class="media-body">
								<h5 class="mt-0 mb-1">电子眼全面升级，新增5项功能！</h5>
							</div></li>
						<li class="media"><img
							src="http://p1.pstatp.com/large/pgc-image/4ab237b9682f4c0286da5c5e6823dc87"
							style="height: 72px; width: 72px;" class="mr-3" alt="...">
							<div class="media-body">
								<h5 class="mt-0 mb-1">电子眼全面升级，新增5项功能！</h5>
							</div></li>
					</ul>
				</div>
				<div class="right">
					<div>最热文章</div>
					<ul class="list-unstyled">
						<li class="media"><img
							src="http://p1.pstatp.com/large/pgc-image/4ab237b9682f4c0286da5c5e6823dc87"
							style="height: 72px; width: 72px;" class="mr-3" alt="...">
							<div class="media-body">
								<h5 class="mt-0 mb-1">电子眼全面升级，新增5项功能！</h5>
							</div></li>
						<li class="media"><img
							src="http://p1.pstatp.com/large/pgc-image/4ab237b9682f4c0286da5c5e6823dc87"
							style="height: 72px; width: 72px;" class="mr-3" alt="...">
							<div class="media-body">
								<h5 class="mt-0 mb-1">电子眼全面升级，新增5项功能！</h5>
							</div></li>
						<li class="media"><img
							src="http://p1.pstatp.com/large/pgc-image/4ab237b9682f4c0286da5c5e6823dc87"
							style="height: 72px; width: 72px;" class="mr-3" alt="...">
							<div class="media-body">
								<h5 class="mt-0 mb-1">电子眼全面升级，新增5项功能！</h5>
							</div></li>
					</ul>
				</div>
			</div>

		</div>
	</div>
	<script src="/public/js/jquery.min.1.12.4.js"></script>
	<script src="/public/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var channelId = '${channelId}';
		var cateId = '${cateId}';
		function gotoPage(pageNum){
			if(channelId==''){
				location.href = '/hot/'+pageNum+'.html';
			}else{
				location.href = '/'+channelId+'/'+cateId+'/'+pageNum+'.html';
			}
			
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form class="form-inline" id="queryForm">
	<div class="form-group mx-sm-3 mb-2">
		<input type="text" class="form-control" id="nickname" name="nickname" value="${user.nickname }" placeholder="请输入昵称">
	</div>
	<input type="hidden" id="pageNum" name="pageNum" value="${pageInfo.pageNum }">
	<button type="button" class="btn btn-primary mb-2" onclick="query();">查询</button>
</form>
<table class="table">
	<thead>
		<tr>
			<th scope="col"><input type="checkbox" id="chkALL"></th>
			<th scope="col">#</th>
			<th scope="col">昵称</th>
			<th scope="col">头像</th>
			<th scope="col">登录名称</th>
			<th scope="col">禁用</th>
			<th scope="col">注册时间</th>
			<th scope="col">操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${pageInfo.list }" var="item">
			<tr>
				<th scope="col"><input type="checkbox" value="${item.id }" name="chk_list"></th>
				<th scope="col">${item.id }</th>
				<th scope="row">${item.nickname }</th>
				<td><img src="${item.headimg }" height="36px;"></td>
				<td>${item.username }</td>
				<th scope="row">${item.locked==1?'禁用':'启用' }</th>
				<td><fmt:formatDate value="${item.create_time }" pattern="yyyy-MM-dd"/> </td>
				
				<td><input type="button" class="btn btn-primary" onclick="updateLocked(${item.id})" value="${item.locked==1?'启用':'禁用' }"></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="row">
	<!-- <div class="col-3">
		<button type="button" class="btn btn-primary mb-2" onclick="delAlert();">删除</button>
	</div> -->
	<div class="col-9">
		<jsp:include page="../common/page.jsp"></jsp:include>
	</div>
</div>
<div class="alert alert-success" role="alert" style="display: none"></div>

<div class="modal" tabindex="-1" role="dialog" id="deleteModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">确认框</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>你确认删除文章吗？</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="del();">确认删除</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src="/public/js/checkbox.js" ></script>

<script type="text/javascript">
	function delAlert(){
		var ids = getCheckboxIds();
		if(ids==null || ids==""){
			$(".alert").html("请选择文章");
			$(".alert").show();
			return;
		}
		$("#deleteModal").modal('show');
	}
	
	function query(){
		var params = $("#queryForm").serialize();
		reload(params)
	}
	
	function gotoPage(pageNum){
		$("#pageNum").val(pageNum);
		query();
	}
	
	function updateLocked(id){
		console.log(id);
		$.post('/admin/updateLocked',{id:id},function(res){
			if(res.result){
				query();
			}
		})
	}
	
</script>

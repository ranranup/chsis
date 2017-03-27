<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-lg-12 text-center">
		<!-- 大于1页才显示组件 -->
		<c:if test="${totalPages>1}">
			<nav class="text-center">
				<ul class="pagination">
					<!-- 如果当前页是首页,那么首页按钮和前一页按钮禁用 -->
					<c:choose>
						<c:when test="${pageIndex==1 }">
							<li class="disabled"><a href="javascript:void(0);">首页</a></li>
							<li class="disabled"><a href="javascript:void(0);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${url}page=1">首页</a></li>
							<li><a href="${url}page=${pageIndex-1 }" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						</c:otherwise>
					</c:choose>
					
					<!-- 如果页数小于6页,显示所有页码 -->
					<c:if test="${totalPages<6 }">
						<c:forEach var="i" begin="1" end="${totalPages }">
							<c:if test="${pageIndex == i }">
								<li class="active"><a href="${url}page=${i }">${i }<span class="sr-only">(current)</span></a></li>
							</c:if>
							<c:if test="${pageIndex != i }">
								<li><a href="${url}page=${i }">${i }</a></li>
							</c:if>
						</c:forEach>
					</c:if>

					<!-- 如果页数大于6页且显示的不是首页也开始,显示指定的中间5页 -->
					<c:if test="${(totalPages >= 6)&&(pageIndex > 2)&&(pageIndex < totalPages-2) }">
						<li><a href="${url}page=${pageIndex-2 }">${pageIndex-2 }</a></li>
						<li><a href="${url}page=${pageIndex-1 }">${pageIndex-1 }</a></li>
						<li class="active"><a href="${url}page=${pageIndex }">${pageIndex }<span class="sr-only">(current)</span></a></li>
						<li><a href="${url}page=${pageIndex+1 }">${pageIndex+1 }</a></li>
						<li><a href="${url}page=${pageIndex+2 }">${pageIndex+2 }</a></li>
					</c:if>

					<!-- 如果页数大于6页且显示的不是从手也开始,显示前5页 -->
					<c:if test="${(totalPages>=6)&&(pageIndex<=2) }">
						<c:forEach var="i" begin="1" end="5">
							<c:if test="${pageIndex == i }">
								<li class="active"><a href="${url}page=${i }">${i }<span class="sr-only">(current)</span></a></li>
							</c:if>
							<c:if test="${pageIndex != i }">
								<li><a href="${url}page=${i }">${i }</a></li>
							</c:if>
						</c:forEach>
					</c:if>

					<!-- 如果当前页到最后页小于5页,显示这几个页码 -->
					<c:if test="${(totalPages>=6)&&(pageIndex>=totalPages-2) }">
						<c:forEach var="i" begin="${totalPages - 4 }" end="${totalPages }">
							<c:if test="${pageIndex == i }">
								<li class="active"><a href="${url}page=${i }">${i }<span class="sr-only">(current)</span></a></li>
							</c:if>
							<c:if test="${pageIndex != i }">
								<li><a href="${url}page=${i }">${i }</a></li>
							</c:if>
						</c:forEach>
					</c:if>

					<!-- 如果是最后一页,则禁用尾页和向后页的标签 -->
					<c:choose>
						<c:when test="${pageIndex==totalPages }">
							<li class="disabled"><a href="javascript:void(0);" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>
							<li class="disabled"><a href="javascript:void(0);">尾页</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${url}page=${pageIndex+1 }" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>
							<li><a href="${url}page=${totalPages }">尾页</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</c:if>
	</div>
</div>
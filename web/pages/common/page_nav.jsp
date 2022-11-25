<%--
  Created by IntelliJ IDEA.
  User: zhazha
  Date: 2022/6/19
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="page_nav">
    <c:if test="${requestScope.pageNo>1}">
        <a href="${pageContext.request.contextPath}${requestScope.url}&pageNo=1">首页</a>
        <a href="${pageContext.request.contextPath}${requestScope.url}&pageNo=${requestScope.pageNo-1}">上一页</a>
    </c:if>

    <%--页码输出的开始--%>
    <c:choose>
        <%--页码输出的第一种情况--%>
        <c:when test="${requestScope.pageTotal<=5}">
            <c:forEach begin="1" end="${requestScope.pageTotal}" var="i">
                <c:if test="${i==requestScope.pageNo}">
                    【${i}】
                </c:if>
                <c:if test="${i!=requestScope.pageNo}">
                    <a href="${pageContext.request.contextPath}${requestScope.url}&pageNo=${i}">${i}</a>
                </c:if>
            </c:forEach>
        </c:when>
        <%--页码输出的第二种情况--%>
        <c:when test="${requestScope.pageTotal>5}">
            <c:choose>
                <%--2.1种情况--%>
                <c:when test="${requestScope.pageNo<=3}">
                    <c:forEach begin="1" end="5" var="i">
                        <c:if test="${i==requestScope.pageNo}">
                            【${i}】
                        </c:if>
                        <c:if test="${i!=requestScope.pageNo}">
                            <a href="${pageContext.request.contextPath}${requestScope.url}&pageNo=${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                </c:when>
                <%--2.2种情况--%>
                <c:when test="${requestScope.pageNo>=requestScope.pageTotal-3}">
                    <c:forEach begin="${requestScope.pageTotal-4}" end="${requestScope.pageTotal}" var="i">
                        <c:if test="${i==requestScope.pageNo}">
                            【${i}】
                        </c:if>
                        <c:if test="${i!=requestScope.pageNo}">
                            <a href="${pageContext.request.contextPath}${requestScope.url}&pageNo=${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                </c:when>
                <%--2.3种情况--%>
                <c:otherwise>
                    <c:forEach begin="${requestScope.pageNo-2}" end="${requestScope.pageNo+2}" var="i">
                        <c:if test="${i==requestScope.pageNo}">
                            【${i}】
                        </c:if>
                        <c:if test="${i!=requestScope.pageNo}">
                            <a href="${pageContext.request.contextPath}${requestScope.url}&pageNo=${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </c:when>
    </c:choose>
    <%--页码输出的结束--%>
    <c:if test="${requestScope.pageNo < requestScope.pageTotal}">
        <a href="${pageContext.request.contextPath}${requestScope.url}&pageNo=${requestScope.pageNo+1}">下一页</a>
        <a href="${pageContext.request.contextPath}${requestScope.url}&pageNo=${requestScope.pageTotal}">末页</a>
    </c:if>

    共${requestScope.pageTotal}页，一共有${requestScope.pageTotalCount}条记录 到第<input  name="pn" id="pn_input"/>页
    <input id=searchPageBtn type="button" value="确定">
    <script type="text/javascript">
        $(function (){
            $("#searchPageBtn").click(function (){
                var pageNo = $("#pn_input").val();
                if(pageNo>${requestScope.pageTotal}){
                    alert("你需要跳转的页数超过总页数，已为你跳转至尾页")
                    location.href="${pageContext.request.contextPath}${requestScope.url}&pageNo=${requestScope.pageTotal}"
                };

                if(pageNo<1){
                    alert("你需要跳转的页数不正确，已为你跳转至首页")
                    location.href="${pageContext.request.contextPath}${requestScope.url}&pageNo=1";
                };

            })
        });
    </script>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- start: Header -->
        <nav class="navbar navbar-default header navbar-fixed-top">
          <div class="col-md-12 nav-wrapper">
            <div class="navbar-header" style="width:100%;">
              <div class="opener-left-menu is-open">
                <span class="top"></span>
                <span class="middle"></span>
                <span class="bottom"></span>
              </div>
                <a href="/admin/" class="navbar-brand"> 
                 <b>Vongether</b>
                </a>


              <ul class="nav navbar-nav navbar-right user-nav">
                <li class="user-name"><span><c:if test="${userInfo != null }"> ${userInfo.mName } </c:if></span></li>
                  <li class="dropdown avatar-dropdown">
                   <img src="/resources/admin/img/avatar.jpg" class="img-circle avatar" alt="user name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"/>
                   <ul class="dropdown-menu user-dropdown">
                     <li>
                      <ul>
                        <li><a href="/admin/logout.do"><span class="fa fa-power-off "></span>로그아웃</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </nav>
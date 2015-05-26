<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="resources/bootstrap.min.css" >

        <title><tiles:insertAttribute name="title" ignore="true" /></title>
        
        <style type='text/css'>
            .error {
                color: red;
            }
        </style>
        
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <tiles:insertAttribute name="header" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <tiles:insertAttribute name="menu" />
                </div>
                <div class="col-md-9">
                    <tiles:insertAttribute name="body" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <tiles:insertAttribute name="footer" />
                </div>
            </div>
        </div>

        <!-- JS START -->
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="resources/bootstrap.min.js"></script>
        <!-- JS END -->

    </body>
</html>

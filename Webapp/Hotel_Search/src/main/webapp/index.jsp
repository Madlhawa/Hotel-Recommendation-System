<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="no-js h-100" lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Searchit | Home</title>
    <meta name="description" content="Search for any online items and services across multiple sri lankan online stores">
	<meta property="og:title" content="SearchIt">
	<meta property="og:description" content="Search for any online items and services across multiple sri lankan online stores. ">
	<meta property="og:image" content="http://www.searchit.fun/images/LOGO.PNG">
	<meta property="og:url" content="http://www.searchit.lk/">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" id="main-stylesheet" data-version="1.1.0" href="styles/shards-dashboards.1.1.0.min.css">
    <link rel="stylesheet" href="styles/extras.1.1.0.min.css">
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <style>
       @-webkit-keyframes AnimationName {
          0%{background-position:0% 50%}
          50%{background-position:100% 50%}
          100%{background-position:0% 50%}
      }
      @-moz-keyframes AnimationName {
          0%{background-position:0% 50%}
          50%{background-position:100% 50%}
          100%{background-position:0% 50%}
      }
      @keyframes AnimationName { 
          0%{background-position:0% 50%}
          50%{background-position:100% 50%}
          100%{background-position:0% 50%}
      }
    </style>
    <%@ page import="java.io.IOException"%>
	<%@ page import="org.apache.solr.client.solrj.SolrQuery"%>
	<%@ page import="org.apache.solr.client.solrj.SolrServerException"%>
	<%@ page import="org.apache.solr.client.solrj.impl.HttpSolrClient"%>
	<%@ page import="org.apache.solr.client.solrj.impl.XMLResponseParser"%>
	<%@ page import="org.apache.solr.client.solrj.response.QueryResponse"%>
	<%@ page import="org.apache.solr.client.solrj.request.QueryRequest"%>
	<%@ page import="org.apache.solr.common.SolrDocument"%>
	<%@ page import="org.apache.solr.common.SolrDocumentList"%>
	<%@ page import="org.apache.solr.client.solrj.response.FacetField"%>
	<%@ page import="java.util.List"%>
	<%@ page import="java.util.Map"%>
  </head>
  <body class="h-100">
    <div class="container-fluid" style="height:100%">
      <div class="row" style="
      height:100%;
      /*background-color:aliceblue;*/
      background: linear-gradient(211deg, #89f7fe, #66a6ff);
      background-size: 400% 400%;
      
      -webkit-animation: AnimationName 11s ease infinite;
      -moz-animation: AnimationName 11s ease infinite;
      animation: AnimationName 11s ease infinite;
      ">
      
      <%
      	String urlString = "http://104.155.42.236/solr/reviewCore";
		HttpSolrClient solr = new HttpSolrClient.Builder(urlString).build();
		solr.setParser(new XMLResponseParser());
		
		SolrQuery query = new SolrQuery();
		FacetField hotelField= null;
		query.set("q", "*");
		query.set("df", "review_content");
		query.setFacet(true);
		query.addFacetField("hotel_name_str");
		query.setRows(500);
		QueryResponse res;
		try {
			QueryRequest qr = new QueryRequest(query);
			qr.setBasicAuthCredentials("user","nNMG5iGKqQwM");
			res = qr.process(solr);
			hotelField = (FacetField) res.getFacetField("hotel_name_str");
		} catch (SolrServerException e) {
			e.printStackTrace();
		}
      %>
      
        <main class="main-content col-lg-8 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">
          <div class="error" style="height:100%">
            <div class="error__content" style="width:88%">
              <h2 style="color:#384158;font-size:80px;padding-bottom:1%">Review<span style="color:#14bdee">Search</span></h2>
              <!-- <p style="font-weight:200;font-size:20px;margin-bottom:2%">Find anything you want</p>  -->
			<form style="width:100%" method="post" action="search">
              <div class="input-group mb-3" style="margin-bottom:2%">
                <input type="text" name="squery" class="form-control" style="height:45px;font-size:19px" placeholder="Find anything..." aria-label="Recipient's username" aria-describedby="basic-addon2" required>
                <select name="hotel" class="form-control" style="height:45px;font-size:19px" placeholder="Select a Hotel" aria-label="Recipient's username" aria-describedby="basic-addon2" required>
                	<%for(int j=0;j<hotelField.getValueCount();j++){ %>
                		<option value='<%=hotelField.getValues().get(j) %>'><%=hotelField.getValues().get(j) %></option>
					<%} %>
                </select>
                <div class="input-group-append">
                  <button class="btn btn-white" type="submit">Search</button>
                </div>
              </div>
              </form>
            
            </div>
            <!-- / .error_content -->
          </div>
          <!-- / .error -->
        </main>
      </div>
    </div>
    <!--<footer class="main-footer d-flex p-2 px-3 bg-white border-top">
      <ul class="nav">
        <li class="nav-item">
          <a class="nav-link" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Blog</a>
        </li>
      </ul>
      <span class="copyright ml-auto my-auto mr-2">Copyright � 2018
        <a href="https://designrevision.com" rel="nofollow">DesignRevision</a>
      </span>
    </footer>-->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script src="https://unpkg.com/shards-ui@latest/dist/js/shards.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Sharrre/2.0.1/jquery.sharrre.min.js"></script>
    <script src="scripts/extras.1.1.0.min.js"></script>
    <script src="scripts/shards-dashboards.1.1.0.min.js"></script>
  </body>
</html>
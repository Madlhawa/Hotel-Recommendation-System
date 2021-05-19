package main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.XMLResponseParser;
import org.apache.solr.client.solrj.request.QueryRequest;
import org.apache.solr.client.solrj.response.FacetField;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.JsonObject;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//connecting to solr instance
		System.out.println("\nConnecting to solr");
		String urlString = "http://104.155.42.236/solr/reviewCore";
		HttpSolrClient solr = new HttpSolrClient.Builder(urlString).build();
		solr.setParser(new XMLResponseParser());
		System.out.println("Done connecting");
		
		System.out.println("\nExecuting solr query..");
		SolrQuery query = new SolrQuery();
		query.set("q", "*:*");
		query.set("df", "hotel_name_str");
		query.set("defType", "edismax"); 
		query.set("mm", 2);
		
		System.out.println("\nGetting results from solr");
		QueryResponse res;
		
		try {
			QueryRequest qr = new QueryRequest(query);
			qr.setBasicAuthCredentials("user","nNMG5iGKqQwM");
			res = qr.process(solr);
			SolrDocumentList docList = res.getResults();
			
			for (int i = 0; i < docList.size(); ++i) {
				SolrDocument doc = docList.get(i);
				System.out.println(doc.getFieldValue("hotel_name"));
				}
			} catch (SolrServerException | IOException e) {
			e.printStackTrace();
		}
		
	}

}

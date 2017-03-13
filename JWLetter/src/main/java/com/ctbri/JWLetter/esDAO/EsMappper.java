package com.ctbri.JWLetter.esDAO;

import com.ctbri.JWLetter.pojo.Letter;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.xpack.client.PreBuiltXPackTransportClient;

import java.net.InetAddress;
import java.util.Iterator;

/**
 * Created by Administrator on 2017/3/10.
 */
public class EsMappper {

    private class Conn{
        public Iterator getConn(String queryStringQuery,String field){
            TransportClient client = null;
            Settings settings = Settings.builder().put("cluster.name", "DeepSearch&")
                    .put("xpack.security.user", "elastic:YangZC*#03").build();
            try {
                client = new PreBuiltXPackTransportClient(settings)
                        .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("124.127.117.108"), 9300));
            } catch (Exception e) {
                e.printStackTrace();
            }
            Iterator it=null;
            if (queryStringQuery == null) {

            }else if (field.trim()==null ||field.equals("")){
                SearchResponse sr = client.prepareSearch("articles")
                        .setQuery(QueryBuilders.queryStringQuery(queryStringQuery))
                        .get();
                 it = sr.getHits().iterator();
            }else if (queryStringQuery.trim()!=null&&field.trim()!=null){
                SearchResponse sr = client.prepareSearch("articles")
                        .setQuery(QueryBuilders.queryStringQuery(queryStringQuery).field(field))
                        .get();
                it = sr.getHits().iterator();
            }else {

            }
            // on shutdown
            client.close();
            return it;
        }
    }
    /* Letter_ID,ID,SubmitDatetime,Author,Contents,Title */
    public Letter selectByPrimaryKey(String word){
        Conn conn=new Conn();
        Iterator it = conn.getConn(word, "id");
        SearchHit sh=null;
        Letter letter=new Letter();
        while (it.hasNext()){
            sh = (SearchHit)it.next();
            letter.setLetter_id((Integer) sh.getSource().get("id"));
            letter.setContents((String) sh.getSource().get("contents"));
            letter.setAuthor((String) sh.getSource().get("author"));
            letter.setSubmitDateTime((String) sh.getSource().get("submiteDatetime"));
            letter.setAttachments((String) sh.getSource().get("attachments"));
           // System.out.println(sh.getSource().get("id"));
        }
        return letter;
    }
}

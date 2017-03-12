package com.ctbri.JWLetter.esMapper;

import com.ctbri.JWLetter.pojo.Letter;
import com.ctbri.JWLetter.pojo.LetterTitle;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.xpack.client.PreBuiltXPackTransportClient;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Created by Administrator on 2017/3/10.
 */
public class EsMappper {

    private class Conn {
        public TransportClient getConn() {
            TransportClient client = null;
            Settings settings = Settings.builder().put("cluster.name", "DeepSearch&")
                    .put("xpack.security.user", "elastic:YangZC*#03").build();
            try {
                client = new PreBuiltXPackTransportClient(settings)
                        .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("124.127.117.108"), 9300));
            } catch (Exception e) {
                e.printStackTrace();
            }
            return client;
        }
    }

    /* Letter_ID,ID,SubmitDatetime,Author,Contents,Title */
    public Letter selectByPrimaryKey(String word) {
        System.out.println("进入了selectByPrimaryKey");
        System.out.println("word:" + word);
        Conn conn = new Conn();
        TransportClient client = conn.getConn();
        SearchResponse sr = client.prepareSearch("articles")
                .setQuery(QueryBuilders.queryStringQuery(word).field("id"))
                .get();
        Iterator it = sr.getHits().iterator();
        SearchHit sh = null;
        Letter letter = new Letter();
        while (it.hasNext()) {
            sh = (SearchHit) it.next();
            letter.setLetter_id((Integer) sh.getSource().get("id"));
            letter.setContents((String) sh.getSource().get("contents"));
            System.out.println("contents:"+(String) sh.getSource().get("contents"));
            letter.setAuthor((String) sh.getSource().get("author"));
            letter.setSubmitDateTime((String) sh.getSource().get("submiteDatetime"));
            letter.setAttachments((String) sh.getSource().get("title"));

            // System.out.println(sh.getSource().get("id"));
        }
        return letter;
    }

    public ArrayList<LetterTitle> selectTitles() {
        Conn conn = new Conn();
        TransportClient client = conn.getConn();
        SearchResponse sr = client.prepareSearch("articles").setSize(20).get();
        Iterator it = sr.getHits().iterator();
        SearchHit sh = null;
        ArrayList<LetterTitle> allRes = new ArrayList<>();
        while (it.hasNext()) {
            sh = (SearchHit) it.next();
            LetterTitle letterTitle = new LetterTitle();
            letterTitle.setLetter_id((Integer) sh.getSource().get("id"));
            //System.out.println("id"+(Integer) sh.getSource().get("id"));
            letterTitle.setName((Integer) sh.getSource().get("categoryname"));
            letterTitle.setAuthor((String) sh.getSource().get("author"));
            letterTitle.setIfRead((Integer) sh.getSource().get("readornot"));
            letterTitle.setAttachments((String) sh.getSource().get("title"));
            letterTitle.setSubmitDateTime((String) sh.getSource().get("submiteDatetime"));
            allRes.add(letterTitle);

        }
        return allRes;
    }
}

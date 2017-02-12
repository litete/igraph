package com.ctbri.JWLetter.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ctbri.JWLetter.impl.CategoryServiceImpl;
import com.ctbri.JWLetter.impl.LetterServiceImpl;
import com.ctbri.JWLetter.impl.StatusServiceImpl;
import com.ctbri.JWLetter.impl.TagServiceImpl;
import com.ctbri.JWLetter.pojo.*;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.elasticsearch.action.search.MultiSearchResponse;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.filters.Filters;
import org.elasticsearch.search.aggregations.bucket.filters.FiltersAggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.histogram.DateHistogramBuilder;
import org.elasticsearch.search.aggregations.bucket.histogram.DateHistogramInterval;
import org.elasticsearch.search.aggregations.bucket.histogram.Histogram;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.Terms.Order;
import org.elasticsearch.search.aggregations.bucket.terms.TermsBuilder;
import org.elasticsearch.search.sort.SortOrder;
import org.elasticsearch.search.sort.SortParseElement;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import static org.elasticsearch.index.query.QueryBuilders.queryStringQuery;

@Controller
public class BHController {


//	private static PrintStream ps=null;
//	static{
//		 try {
//			 File file = new File("D:/log");
//			ps = new PrintStream("D:/log");
//		} catch (FileNotFoundException e) {
//			// TODO 自动生成的 catch 块
//			e.printStackTrace();
//		}
//		 System.setOut(ps);
//	}
	
	private static Integer count=0;
	private static HashMap<String, String> view = new HashMap<String, String>();
	static {
		view.put("百度", "knowledge_baidu");
		view.put("马云", "knowledge_mayun");
		view.put("人工智能", "knowledge_rengongzhineng");
		view.put("电信", "knowledge_dianxin");
	}

	static {
		try {
			Class.forName("org.neo4j.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String ulogin(HttpServletRequest request, Model model)
			throws JsonParseException, JsonMappingException, IOException,
			SQLException {
		try {

			if (request.getParameter("word") == null
					|| request.getParameter("word").equals("")) {
				System.out.println(request.getParameter("word"));
				return "search";
			}
			request.setCharacterEncoding("UTF-8");
			String word = request.getParameter("word");
			System.out.println(word);
			ObjectMapper mapper = new ObjectMapper();

			Settings settings = Settings.settingsBuilder()
					.put("cluster.name", "elasticsearch").build();
			Client client = TransportClient
					.builder()
					.settings(settings)
					.build()
					.addTransportAddress(
							new InetSocketTransportAddress(InetAddress
									.getByName("124.127.117.207"), 9733));
			QueryBuilder qb = queryStringQuery("content:" + word)
					.analyzeWildcard(true).field("*");

			SearchRequestBuilder sbuilder = client.prepareSearch("zhongjiwei")
					.addSort(SortParseElement.SCORE_FIELD_NAME, SortOrder.DESC)
					.setScroll(new TimeValue(60000)).setQuery(qb).setSize(30)
					.addField("_source");

			// 进行多搜索
			MultiSearchResponse sr = client.prepareMultiSearch().add(sbuilder)
					.execute().actionGet();
			MultiSearchResponse.Item searchItem = sr.getResponses()[0];

			SearchResponse searchResp = searchItem.getResponse();
			List<SearchItem> items = new ArrayList<SearchItem>();
			Integer number = 1;
			for (SearchHit hit : searchResp.getHits().getHits()) {
				JSONObject obj = JSONObject
						.parseObject(hit.getSourceAsString());
				String url = obj.getString("url");
				String body = obj.getJSONObject("result").getString("body");
				String title = obj.getJSONObject("result").getString("title");
				// String title = hit.getSource().get("title").toString();
				SearchItem tmp = new SearchItem(body, url, word, title);
				if (tmp.getContent().length() < 10)
					continue;
				tmp.setTitle(number + "、" + tmp.getTitle());
				items.add(tmp);
				number++;
			}
			List<GzItem> gzItems = new ArrayList<GzItem>();
			Integer gzNumber = 1;

			model.addAttribute("title", word + "关系图谱");
			model.addAttribute("keyword", word);
			model.addAttribute("items", items);
			model.addAttribute("gzitems", gzItems);
			return "";

		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
			return "";
		}

	}

	@RequestMapping(value = "/owledge", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String uPreStatic(HttpServletRequest request, Model model) {
		try {

			if (view.containsKey(request.getParameter("word"))) {
				request.setCharacterEncoding("UTF-8");
				String word = request.getParameter("word");
				Client client = TransportClient
						.builder()
						.build()
						.addTransportAddress(
								new InetSocketTransportAddress(InetAddress
										.getByName("124.127.117.208"), 9735));
				QueryBuilder wfQB = queryStringQuery("result.body:" + word)
						.field("*").analyzeWildcard(true);

				TermsBuilder wfAggs = AggregationBuilders
						.terms("wf")
						.field("result.body")
						.exclude(
								"者|两个|鲜|当然|7|这里|没|一次|因|如何|内容|日|发生|来源|至|一起|影响|吃|工作|曾|各种|直接|继续|其实|生活|其他|要求|6|目前|因此|选择|金|表示|当时|之一|起|只是|之间|除了|您|打|吗|主要|出了|希望|自|家|得|所有|吧|地方|那么|二|这一|任何|一直|正|对于|它|非常|想|如|知道|不会|称|那|成|由于|发现|甚至|发|一种|第一|10|其中|成了|支持|点|每天|有的|进入|最后|点击|4|一样|虽然|包括|出现|国|更多|面的|过|之后|什么|以及|时候|好|高|看到|而且|5|大家|发展|需要|所以|呢|请|为了|们|可能|重要|很多|出|万|三|认为|看|所|只有|只|最大|前|但是|一些|这种|同时|不能|时间|个|现在|去|的人|到了|2|再|进行|3|作为|通过|做|之|提供|今天|多|详情|问题|美|开始|新|向|原文|其|1|更|成为|可|已设置|如果|都是|下|这是|他们|这些|用|里|还是|不是|小|精选|能|筛选|这个|也是|人|写|会|作者|显示|地|还有|来|需|已经|这样|因为|他|才|这|最|就是|文章|将|你|到|没有|了解|要|大|自己|以上|说|时|一扫|中|介绍|信|信号|公众|关注|功能|加载|号|已|微|我|扫|投诉|提交|留言|该|阅读|和|后|有|为|也|可以|我们|一个|一|都|不|由|上")
						.size(30).order(Order.count(false));
				SearchRequestBuilder wfSB = client
						.prepareSearch("pyspider")
						.addAggregation(wfAggs)
						.addSort(SortParseElement.SCORE_FIELD_NAME,
								SortOrder.DESC).setScroll(new TimeValue(60000))
						.setQuery(wfQB).setSize(0);
				// 词语出现次数查询
				QueryBuilder wcQB = queryStringQuery(
						"result.body:\"" + word + "\"").analyzeWildcard(true);
				DateHistogramInterval interval = new DateHistogramInterval("7D");
				QueryBuilder wcQB1 = queryStringQuery(word).analyzeWildcard(
						true).queryName(word);
				FiltersAggregationBuilder wcFilter = AggregationBuilders
						.filters("filter").filter(word, wcQB1);
				DateHistogramBuilder wcAggs = AggregationBuilders
						.dateHistogram("trend").field("result.issuedate")
						.interval(interval).timeZone("Asia/Shanghai")
						.minDocCount(1).subAggregation(wcFilter)
						.order(Histogram.Order.KEY_ASC);
				SearchRequestBuilder wcSB = client.prepareSearch("pyspider")
						.addAggregation(wcAggs).setScroll(new TimeValue(60000))
						.setQuery(wcQB).setSize(0);
				// 进行多搜索
				MultiSearchResponse sr = client.prepareMultiSearch().add(wcSB)
						.add(wfSB).execute().actionGet();
				MultiSearchResponse.Item wcItem = sr.getResponses()[0];
				MultiSearchResponse.Item wfItem = sr.getResponses()[1];
				ObjectMapper mapper = new ObjectMapper();
				// 统计趋势
				SearchResponse wcSR = wcItem.getResponse();
				List<String> period = new ArrayList<String>();
				List<Long> word1Count = new ArrayList<Long>();
				Histogram trend = wcSR.getAggregations().get("trend");
				for (Histogram.Bucket entry : trend.getBuckets()) {
					String keyAsString = entry.getKeyAsString();
					// 按月时间
					String time = keyAsString.substring(0, 10);
					if (Integer.parseInt(time.substring(0, 4)) < 2016)
						continue;
					period.add("\"" + time + "\"");
					Filters fa = entry.getAggregations().get("filter");
					for (Filters.Bucket ent : fa.getBuckets()) {
						// 关键字
						String city = ent.getKeyAsString();
						// 出现次数
						long docCount = ent.getDocCount();
						word1Count.add(docCount);
					}

				}

				// 统计关联词
				SearchResponse wfSR = wfItem.getResponse();
				long all = wfSR.getHits().getTotalHits();
				List<String> nodes = new ArrayList<String>();
				List<String> links = new ArrayList<String>();
				Terms agg = wfSR.getAggregations().get("wf");

				Nodes cnode = new Nodes();
				cnode.setCategory(0);
				cnode.setName("关键字-" + word);
				cnode.setValue(all);
				String center = mapper.writeValueAsString(cnode);
				nodes.add(center);
				for (Terms.Bucket entry : agg.getBuckets()) {
					String key = (String) entry.getKey(); // bucket key
					long docCount = entry.getDocCount();
					if (docCount != all) {
						Nodes node = new Nodes();
						node.setCategory(1);
						node.setName(key);
						node.setValue(docCount);
						String tmp1 = mapper.writeValueAsString(node);
						nodes.add(tmp1);
						Links link = new Links();
						link.setF(1.5);
						link.setSource("关键字-" + word);
						link.setTarget(key);
						link.setWeight(docCount);
						String tmp2 = mapper.writeValueAsString(link);
						links.add(tmp2);
					}
				}
				List<String> legend = new ArrayList<String>();
				Legend wordLeg = new Legend();
				wordLeg.setName(word);

				String wordStr = mapper.writeValueAsString(wordLeg);
				legend.add(wordStr);
				model.addAttribute("title", word + "的关键词热度");
				model.addAttribute("period", period.toString());
				model.addAttribute("word1Count", word1Count.toString());
				model.addAttribute("links", links.toString());
				model.addAttribute("nodes", nodes.toString());
				model.addAttribute("word1", word);
				model.addAttribute("word2Count", "[]");
				model.addAttribute("legend", legend.toString());
				model.addAttribute("keyword", word);
				return view.get(request.getParameter("word"));
			}

			if (request.getParameter("word") == null
					|| request.getParameter("word").equals("")) {
				System.out.println(request.getParameter("word"));
				return "knowledge";
			}
			request.setCharacterEncoding("UTF-8");
			String word = request.getParameter("word");
			Client client = TransportClient
					.builder()
					.build()
					.addTransportAddress(
							new InetSocketTransportAddress(InetAddress
									.getByName("124.127.117.208"), 9735));
			if (word.split(",").length > 1) {
				String word1 = word.split(",")[0];
				String word2 = word.split(",")[1];
				// 关联词查询
				QueryBuilder wfQB = queryStringQuery("result.body:" + word1)
						.field("*").analyzeWildcard(true);

				TermsBuilder wfAggs = AggregationBuilders
						.terms("wf")
						.field("result.body")
						.exclude(
								"者|两个|鲜|当然|7|这里|没|一次|因|如何|内容|日|发生|来源|至|一起|影响|吃|工作|曾|各种|直接|继续|其实|生活|其他|要求|6|目前|因此|选择|金|表示|当时|之一|起|只是|之间|除了|您|打|吗|主要|出了|希望|自|家|得|所有|吧|地方|那么|二|这一|任何|一直|正|对于|它|非常|想|如|知道|不会|称|那|成|由于|发现|甚至|发|一种|第一|10|其中|成了|支持|点|每天|有的|进入|最后|点击|4|一样|虽然|包括|出现|国|更多|面的|过|之后|什么|以及|时候|好|高|看到|而且|5|大家|发展|需要|所以|呢|请|为了|们|可能|重要|很多|出|万|三|认为|看|所|只有|只|最大|前|但是|一些|这种|同时|不能|时间|个|现在|去|的人|到了|2|再|进行|3|作为|通过|做|之|提供|今天|多|详情|问题|美|开始|新|向|原文|其|1|更|成为|可|已设置|如果|都是|下|这是|他们|这些|用|里|还是|不是|小|精选|能|筛选|这个|也是|人|写|会|作者|显示|地|还有|来|需|已经|这样|因为|他|才|这|最|就是|文章|将|你|到|没有|了解|要|大|自己|以上|说|时|一扫|中|介绍|信|信号|公众|关注|功能|加载|号|已|微|我|扫|投诉|提交|留言|该|阅读|和|后|有|为|也|可以|我们|一个|一|都|不|由|上")
						.size(30).order(Order.count(false));
				SearchRequestBuilder wfSB = client
						.prepareSearch("pyspider")
						.addAggregation(wfAggs)
						.addSort(SortParseElement.SCORE_FIELD_NAME,
								SortOrder.DESC).setScroll(new TimeValue(60000))
						.setQuery(wfQB).setSize(0);
				// 词语出现次数查询

				QueryBuilder wcQB = queryStringQuery(
						"result.body:\"" + word1 + "\" OR result.body:\""
								+ word2 + "\"").analyzeWildcard(true);
				DateHistogramInterval interval = new DateHistogramInterval("7D");
				QueryBuilder wcQB1 = queryStringQuery(word1).analyzeWildcard(
						true).queryName(word1);
				QueryBuilder wcQB2 = queryStringQuery(word2).analyzeWildcard(
						true).queryName(word2);
				FiltersAggregationBuilder wcFilter = AggregationBuilders
						.filters("filter").filter(word2, wcQB2)
						.filter(word1, wcQB1);
				DateHistogramBuilder wcAggs = AggregationBuilders
						.dateHistogram("trend").field("result.issuedate")
						.interval(interval).timeZone("Asia/Shanghai")
						.minDocCount(1).subAggregation(wcFilter)
						.order(Histogram.Order.KEY_ASC);
				SearchRequestBuilder wcSB = client.prepareSearch("pyspider")
						.addAggregation(wcAggs).setScroll(new TimeValue(60000))
						.setQuery(wcQB).setSize(0);
				// 进行多搜索
				MultiSearchResponse sr = client.prepareMultiSearch().add(wcSB)
						.add(wfSB).execute().actionGet();
				MultiSearchResponse.Item wcItem = sr.getResponses()[0];
				MultiSearchResponse.Item wfItem = sr.getResponses()[1];
				ObjectMapper mapper = new ObjectMapper();
				// 统计趋势
				SearchResponse wcSR = wcItem.getResponse();
				List<String> period = new ArrayList<String>();
				List<Long> word1Count = new ArrayList<Long>();
				List<Long> word2Count = new ArrayList<Long>();
				Histogram trend = wcSR.getAggregations().get("trend");
				for (Histogram.Bucket entry : trend.getBuckets()) {
					String keyAsString = entry.getKeyAsString();
					// 按月时间
					String time = keyAsString.substring(0, 10);
					if (Integer.parseInt(time.substring(0, 4)) < 2016)
						continue;
					period.add("\"" + time + "\"");
					Filters fa = entry.getAggregations().get("filter");
					for (Filters.Bucket ent : fa.getBuckets()) {
						// 关键字
						String city = ent.getKeyAsString();
						// 出现次数
						long docCount = ent.getDocCount();
						if (city.equals(word1)) {
							word1Count.add(docCount);
						} else {
							word2Count.add(docCount);
						}

					}
				}
				// 统计关联词
				SearchResponse wfSR = wfItem.getResponse();

				List<String> nodes = new ArrayList<String>();
				List<String> links = new ArrayList<String>();
				long all = wfSR.getHits().getTotalHits();
				Terms agg = wfSR.getAggregations().get("wf");
				Nodes cnode = new Nodes();
				cnode.setCategory(0);
				cnode.setName("关键字-" + word1);
				cnode.setValue(all);
				String center = mapper.writeValueAsString(cnode);
				nodes.add(center);
				for (Terms.Bucket entry : agg.getBuckets()) {
					String key = (String) entry.getKey(); // bucket key
					long docCount = entry.getDocCount();
					if (docCount != all) {
						Nodes node = new Nodes();
						node.setCategory(1);
						node.setName(key);
						node.setValue(docCount);
						String tmp1 = mapper.writeValueAsString(node);
						nodes.add(tmp1);
						Links link = new Links();
						link.setF(1.5);
						link.setSource("关键字-" + word1);
						link.setTarget(key);
						link.setWeight(docCount);
						String tmp2 = mapper.writeValueAsString(link);
						links.add(tmp2);
					}
				}
				List<String> legend = new ArrayList<String>();
				Legend word1Leg = new Legend();
				word1Leg.setName(word1);
				Legend word2Leg = new Legend();
				word2Leg.setName(word2);
				String word1Str = mapper.writeValueAsString(word1Leg);
				legend.add(word1Str);
				String word2Str = mapper.writeValueAsString(word2Leg);
				legend.add(word2Str);
				model.addAttribute("title", word1 + "和" + word2 + "的关键词热度");
				model.addAttribute("period", period.toString());
				model.addAttribute("word1Count", word1Count.toString());
				model.addAttribute("word2Count", word2Count.toString());
				model.addAttribute("links", links.toString());
				model.addAttribute("nodes", nodes.toString());
				model.addAttribute("word1", word1);
				model.addAttribute("word2", word2);
				model.addAttribute("legend", legend.toString());
				model.addAttribute("keyword", word);
				return "knowledge_bak";
			} else {
				// 一个关键字
				// 关联词查询
				QueryBuilder wfQB = queryStringQuery("result.body:" + word)
						.field("*").analyzeWildcard(true);

				TermsBuilder wfAggs = AggregationBuilders
						.terms("wf")
						.field("result.body")
						.exclude(
								"者|两个|鲜|当然|7|这里|没|一次|因|如何|内容|日|发生|来源|至|一起|影响|吃|工作|曾|各种|直接|继续|其实|生活|其他|要求|6|目前|因此|选择|金|表示|当时|之一|起|只是|之间|除了|您|打|吗|主要|出了|希望|自|家|得|所有|吧|地方|那么|二|这一|任何|一直|正|对于|它|非常|想|如|知道|不会|称|那|成|由于|发现|甚至|发|一种|第一|10|其中|成了|支持|点|每天|有的|进入|最后|点击|4|一样|虽然|包括|出现|国|更多|面的|过|之后|什么|以及|时候|好|高|看到|而且|5|大家|发展|需要|所以|呢|请|为了|们|可能|重要|很多|出|万|三|认为|看|所|只有|只|最大|前|但是|一些|这种|同时|不能|时间|个|现在|去|的人|到了|2|再|进行|3|作为|通过|做|之|提供|今天|多|详情|问题|美|开始|新|向|原文|其|1|更|成为|可|已设置|如果|都是|下|这是|他们|这些|用|里|还是|不是|小|精选|能|筛选|这个|也是|人|写|会|作者|显示|地|还有|来|需|已经|这样|因为|他|才|这|最|就是|文章|将|你|到|没有|了解|要|大|自己|以上|说|时|一扫|中|介绍|信|信号|公众|关注|功能|加载|号|已|微|我|扫|投诉|提交|留言|该|阅读|和|后|有|为|也|可以|我们|一个|一|都|不|由|上")
						.size(30).order(Order.count(false));
				SearchRequestBuilder wfSB = client
						.prepareSearch("pyspider")
						.addAggregation(wfAggs)
						.addSort(SortParseElement.SCORE_FIELD_NAME,
								SortOrder.DESC).setScroll(new TimeValue(60000))
						.setQuery(wfQB).setSize(0);
				// 词语出现次数查询
				QueryBuilder wcQB = queryStringQuery(
						"result.body:\"" + word + "\"").analyzeWildcard(true);
				DateHistogramInterval interval = new DateHistogramInterval("7D");
				QueryBuilder wcQB1 = queryStringQuery(word).analyzeWildcard(
						true).queryName(word);
				FiltersAggregationBuilder wcFilter = AggregationBuilders
						.filters("filter").filter(word, wcQB1);
				DateHistogramBuilder wcAggs = AggregationBuilders
						.dateHistogram("trend").field("result.issuedate")
						.interval(interval).timeZone("Asia/Shanghai")
						.minDocCount(1).subAggregation(wcFilter)
						.order(Histogram.Order.KEY_ASC);
				SearchRequestBuilder wcSB = client.prepareSearch("pyspider")
						.addAggregation(wcAggs).setScroll(new TimeValue(60000))
						.setQuery(wcQB).setSize(0);
				// 进行多搜索
				MultiSearchResponse sr = client.prepareMultiSearch().add(wcSB)
						.add(wfSB).execute().actionGet();
				MultiSearchResponse.Item wcItem = sr.getResponses()[0];
				MultiSearchResponse.Item wfItem = sr.getResponses()[1];
				ObjectMapper mapper = new ObjectMapper();
				// 统计趋势
				SearchResponse wcSR = wcItem.getResponse();
				List<String> period = new ArrayList<String>();
				List<Long> word1Count = new ArrayList<Long>();
				Histogram trend = wcSR.getAggregations().get("trend");
				for (Histogram.Bucket entry : trend.getBuckets()) {
					String keyAsString = entry.getKeyAsString();
					// 按月时间
					String time = keyAsString.substring(0, 10);
					if (Integer.parseInt(time.substring(0, 4)) < 2016)
						continue;
					period.add("\"" + time + "\"");
					Filters fa = entry.getAggregations().get("filter");
					for (Filters.Bucket ent : fa.getBuckets()) {
						// 关键字
						String city = ent.getKeyAsString();
						// 出现次数
						long docCount = ent.getDocCount();
						word1Count.add(docCount);
					}

				}

				// 统计关联词
				SearchResponse wfSR = wfItem.getResponse();
				long all = wfSR.getHits().getTotalHits();
				List<String> nodes = new ArrayList<String>();
				List<String> links = new ArrayList<String>();
				Terms agg = wfSR.getAggregations().get("wf");

				Nodes cnode = new Nodes();
				cnode.setCategory(0);
				cnode.setName("关键字-" + word);
				cnode.setValue(all);
				String center = mapper.writeValueAsString(cnode);
				nodes.add(center);
				for (Terms.Bucket entry : agg.getBuckets()) {
					String key = (String) entry.getKey(); // bucket key
					long docCount = entry.getDocCount();
					if (docCount != all) {
						Nodes node = new Nodes();
						node.setCategory(1);
						node.setName(key);
						node.setValue(docCount);
						String tmp1 = mapper.writeValueAsString(node);
						nodes.add(tmp1);
						Links link = new Links();
						link.setF(1.5);
						link.setSource("关键字-" + word);
						link.setTarget(key);
						link.setWeight(docCount);
						String tmp2 = mapper.writeValueAsString(link);
						links.add(tmp2);
					}
				}
				List<String> legend = new ArrayList<String>();
				Legend wordLeg = new Legend();
				wordLeg.setName(word);

				String wordStr = mapper.writeValueAsString(wordLeg);
				legend.add(wordStr);
				model.addAttribute("title", word + "的关键词热度");
				model.addAttribute("period", period.toString());
				model.addAttribute("word1Count", word1Count.toString());
				model.addAttribute("links", links.toString());
				model.addAttribute("nodes", nodes.toString());
				model.addAttribute("word1", word);
				model.addAttribute("word2Count", "[]");
				model.addAttribute("legend", legend.toString());
				model.addAttribute("keyword", word);
				return "knowledge_bak";
			}
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
			return "";
		} catch (JsonProcessingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return "";
		} catch (UnknownHostException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return "";
		} catch (JsonGenerationException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return "";
		} catch (JsonMappingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return "";
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return "";
		}

	}

	@RequestMapping(value = "/knowledge", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String uStatic(HttpServletRequest request, Model model)
			throws SQLException {
		try {

			if (request.getParameter("word") == null
					|| request.getParameter("word").equals("")) {
				System.out.println(request.getParameter("word"));
				return "knowledge";
			}
			request.setCharacterEncoding("UTF-8");
			String word = request.getParameter("word");
			Settings settings = Settings.settingsBuilder()
					.put("cluster.name", "deepsearch").build();
			Client client = TransportClient
					.builder()
					.build()
					.addTransportAddress(
							new InetSocketTransportAddress(InetAddress
									.getByName("124.127.117.208"), 9735));
			if (word.split(",").length > 1) {
				String word1 = word.split(",")[0];
				String word2 = word.split(",")[1];
				// 词语出现次数查询

				QueryBuilder wcQB = queryStringQuery(
						"result.body:\"" + word1 + "\" OR result.body:\""
								+ word2 + "\"").analyzeWildcard(true);
				DateHistogramInterval interval = new DateHistogramInterval("7D");
				QueryBuilder wcQB1 = queryStringQuery(word1).analyzeWildcard(
						true).queryName(word1);
				QueryBuilder wcQB2 = queryStringQuery(word2).analyzeWildcard(
						true).queryName(word2);
				FiltersAggregationBuilder wcFilter = AggregationBuilders
						.filters("filter").filter(word2, wcQB2)
						.filter(word1, wcQB1);
				DateHistogramBuilder wcAggs = AggregationBuilders
						.dateHistogram("trend").field("result.issuedate")
						.interval(interval).timeZone("Asia/Shanghai")
						.minDocCount(1).subAggregation(wcFilter)
						.order(Histogram.Order.KEY_ASC);
				SearchRequestBuilder wcSB = client.prepareSearch("pyspider")
						.addAggregation(wcAggs).setScroll(new TimeValue(60000))
						.setQuery(wcQB).setSize(0);
				// 进行多搜索
				MultiSearchResponse sr = client.prepareMultiSearch().add(wcSB)
						.execute().actionGet();
				MultiSearchResponse.Item wcItem = sr.getResponses()[0];
				ObjectMapper mapper = new ObjectMapper();
				// 统计趋势
				SearchResponse wcSR = wcItem.getResponse();
				List<String> period = new ArrayList<String>();
				List<Long> word1Count = new ArrayList<Long>();
				List<Long> word2Count = new ArrayList<Long>();
				Histogram trend = wcSR.getAggregations().get("trend");
				for (Histogram.Bucket entry : trend.getBuckets()) {
					String keyAsString = entry.getKeyAsString();
					// 按月时间
					String time = keyAsString.substring(0, 10);
					if (Integer.parseInt(time.substring(0, 4)) < 2016)
						continue;
					period.add("\"" + time + "\"");
					Filters fa = entry.getAggregations().get("filter");
					for (Filters.Bucket ent : fa.getBuckets()) {
						// 关键字
						String city = ent.getKeyAsString();
						// 出现次数
						long docCount = ent.getDocCount();
						if (city.equals(word1)) {
							word1Count.add(docCount);
						} else {
							word2Count.add(docCount);
						}

					}
				}
				// 统计关联词
				Connection con = DriverManager.getConnection(
						"jdbc:neo4j://27.148.153.187:7474/", "neo4j", "nlp4");
				String query = "MATCH (n {content:'" + word1.toLowerCase()
						+ "'} )-[r]->(f) "
						+ "RETURN n as node, r as dis ,f as nextlayer "
						+ "ORDER by r.weight DESC limit 20 " + "UNION "
						+ "MATCH (n {content:'" + word1.toLowerCase()
						+ "'} )-[r]->(f) "
						+ "WITH r.weight as weight, f as layer1 "
						+ "ORDER by weight DESC limit 20 "
						+ "MATCH (layer1)-[r]->(f2) "
						+ "return layer1 as node,r as dis , f2 as nextlayer "
						+ "ORDER by layer1.content, r.weight DESC limit 200";
				PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
				ResultSet rs = null;
				List<String> nodes = new ArrayList<String>();
				List<String> links = new ArrayList<String>();
				Node center = new Node();
				center.setCategory(0);
				center.setLabel(word);
				center.setValue(1);
				center.setName(word);
				String centerStr = mapper.writeValueAsString(center);
				nodes.add(centerStr);
				try {
					stmt = con.prepareStatement(query);
					// stmt.setString(1,"John");
					// stmt.setInt(1, 14);
					rs = stmt.executeQuery();
					while (rs.next()) {
						double value = 0;
						// 加入一条边
						JSONObject linkJson = JSONObject.parseObject(rs
								.getString(2));
						Link link = new Link();
						link.setName(linkJson.getDouble("weight").toString());
						link.setSource(linkJson.getString("from"));
						value = linkJson.getDouble("weight");
						link.setTarget(linkJson.getString("to"));
						link.setWeight(1);
						String linkStr = mapper.writeValueAsString(link);
						links.add(linkStr);
						// 加入一个点
						JSONObject nodeJson = JSONObject.parseObject(rs
								.getString(3));
						Node node = new Node();
						node.setCategory(nodeJson.getString("category"));
						node.setValue(1);
						node.setName(nodeJson.getString("content"));
						String nodeStr = mapper.writeValueAsString(node);
						nodes.add(nodeStr);
						// + "  "+ rs.getFloat("r.weight")
						// + "  " +rs.getString("f.content"));
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (null != rs) {
						rs.close();
					}
					if (null != stmt) {
						stmt.close();
					}
				}
				List<String> legend = new ArrayList<String>();
				Legend wordLeg = new Legend();
				wordLeg.setName(word);

				model.addAttribute("title", word1 + "和" + word2 + "的关键词热度");
				model.addAttribute("period", period.toString());
				model.addAttribute("word1Count", word1Count.toString());
				model.addAttribute("word2Count", word2Count.toString());
				model.addAttribute("links", links.toString());
				model.addAttribute("nodes", nodes.toString());
				model.addAttribute("word1", word1);
				model.addAttribute("word2", word2);
				model.addAttribute("legend", legend.toString());
				model.addAttribute("keyword", word);
				return "knowledge";
			} else {
				// 一个关键字
				// 关联词查询

				// 词语出现次数查询
				QueryBuilder wcQB = queryStringQuery(
						"result.body:\"" + word + "\"").analyzeWildcard(true);
				DateHistogramInterval interval = new DateHistogramInterval("7D");
				QueryBuilder wcQB1 = queryStringQuery(word).analyzeWildcard(
						true).queryName(word);
				FiltersAggregationBuilder wcFilter = AggregationBuilders
						.filters("filter").filter(word, wcQB1);
				DateHistogramBuilder wcAggs = AggregationBuilders
						.dateHistogram("trend").field("result.issuedate")
						.interval(interval).timeZone("Asia/Shanghai")
						.minDocCount(1).subAggregation(wcFilter)
						.order(Histogram.Order.KEY_ASC);
				SearchRequestBuilder wcSB = client.prepareSearch("pyspider")
						.addAggregation(wcAggs).setScroll(new TimeValue(60000))
						.setQuery(wcQB).setSize(0);
				// 进行多搜索
				MultiSearchResponse sr = client.prepareMultiSearch().add(wcSB)
						.execute().actionGet();
				MultiSearchResponse.Item wcItem = sr.getResponses()[0];
				ObjectMapper mapper = new ObjectMapper();
				// 统计趋势
				SearchResponse wcSR = wcItem.getResponse();
				List<String> period = new ArrayList<String>();
				List<Long> word1Count = new ArrayList<Long>();
				Histogram trend = wcSR.getAggregations().get("trend");
				for (Histogram.Bucket entry : trend.getBuckets()) {
					String keyAsString = entry.getKeyAsString();
					// 按月时间
					String time = keyAsString.substring(0, 10);
					if (Integer.parseInt(time.substring(0, 4)) < 2016)
						continue;
					period.add("\"" + time + "\"");
					Filters fa = entry.getAggregations().get("filter");
					for (Filters.Bucket ent : fa.getBuckets()) {
						// 关键字
						String city = ent.getKeyAsString();
						// 出现次数
						long docCount = ent.getDocCount();
						word1Count.add(docCount);
					}

				}

				// 统计关联词

				Connection con = DriverManager.getConnection(
						"jdbc:neo4j://27.148.153.187:7474/", "neo4j", "nlp4");
				String query = "MATCH (n {content:'" + word.toLowerCase()
						+ "'} )-[r]->(f) "
						+ "RETURN n as node, r as dis ,f as nextlayer "
						+ "ORDER by r.weight DESC limit 20 " + "UNION "
						+ "MATCH (n {content:'" + word.toLowerCase()
						+ "'} )-[r]->(f) "
						+ "WITH r.weight as weight, f as layer1 "
						+ "ORDER by weight DESC limit 20 "
						+ "MATCH (layer1)-[r]->(f2) "
						+ "return layer1 as node,r as dis , f2 as nextlayer "
						+ "ORDER by layer1.content, r.weight DESC limit 200";
				PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
				ResultSet rs = null;
				List<String> nodes = new ArrayList<String>();
				List<String> links = new ArrayList<String>();
				Node center = new Node();
				center.setCategory(0);
				center.setLabel(word.toLowerCase());
				center.setValue(1);
				center.setName(word.toLowerCase());
				String centerStr = mapper.writeValueAsString(center);
				nodes.add(centerStr);
				try {
					stmt = con.prepareStatement(query);
					// stmt.setString(1,"John");
					// stmt.setInt(1, 14);
					rs = stmt.executeQuery();
					while (rs.next()) {
						double value = 0;
						// 加入一条边
						JSONObject linkJson = JSONObject.parseObject(rs
								.getString(2));
						Link link = new Link();
						link.setName(linkJson.getDouble("weight").toString());
						link.setSource(linkJson.getString("from"));
						value = linkJson.getDouble("weight");
						link.setTarget(linkJson.getString("to"));
						link.setWeight(1);
						String linkStr = mapper.writeValueAsString(link);
						links.add(linkStr);
						// 加入一个点
						JSONObject nodeJson = JSONObject.parseObject(rs
								.getString(3));
						Node node = new Node();
						node.setCategory(nodeJson.getString("category"));
						node.setValue(1);
						node.setName(nodeJson.getString("content"));
						String nodeStr = mapper.writeValueAsString(node);
						nodes.add(nodeStr);
						System.out.println(rs.getString(3));
						// + "  "+ rs.getFloat("r.weight")
						// + "  " +rs.getString("f.content"));
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (null != rs) {
						rs.close();
					}
					if (null != stmt) {
						stmt.close();
					}
				}
				List<String> legend = new ArrayList<String>();
				Legend wordLeg = new Legend();
				wordLeg.setName(word);

				model.addAttribute("title", word + "的关键词热度");
				model.addAttribute("period", period.toString());
				model.addAttribute("word1Count", word1Count.toString());
				model.addAttribute("links", links.toString());
				model.addAttribute("nodes", nodes.toString());
				model.addAttribute("word1", word);
				model.addAttribute("word2Count", "[]");
				model.addAttribute("legend", legend.toString());
				model.addAttribute("keyword", word);
				return "knowledge";
			}
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
			return "";
		} catch (JsonProcessingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return "";
		} catch (UnknownHostException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return "";
		} catch (JsonGenerationException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return "";
		} catch (JsonMappingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return "";
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return "";
		}

	}

	@RequestMapping(value = "/letter", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody
	HashMap<String, ArrayList<?>> letter(HttpServletRequest request, Model model)
			throws SQLException, JsonGenerationException, JsonMappingException,
			IOException {
		String word = request.getParameter("id");

		// 统计关联词
		Connection con = DriverManager.getConnection(
				"jdbc:neo4j://27.148.153.1:7474/", "neo4j", "nlp4");
		PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
		ResultSet rs = null;
		ArrayList<Node> nodes = new ArrayList<Node>();
		ArrayList<Link> links = new ArrayList<Link>();
		ArrayList<Letter> content = new ArrayList<Letter>();
		HashSet<String> centers = new HashSet<String>();
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, ArrayList<?>> tmp = new HashMap<String, ArrayList<?>>();

		try {

			// String query = "MATCH(n:person) "
			// + "WHERE n.article =~'.* "
			// + word
			// + ".*' OR n.article =~ '\\\\["
			// + word
			// + ".*' "
			// + "WITH n "
			// + "MATCH p = (n:person)-[r]-(m) "
			// +
			// "WHERE r.times > 1 and (m.category = 'crime' or m.category = 'institution' or m.category = 'location' or m.category = 'position') "
			// + "return p as path, r.times as confidence";
			//通过id查询文章
			String query = "MATCH (article:other {content:'["
					+ word
					+ "]'})-[]->(n:person) "
					+ "WITH n "
					+ "MATCH p = (n:person)-[r]->(m) "
					+ "WHERE r.times > 1 and (m.category = 'crime' or m.category = 'institution' or m.category = 'location' or m.category = 'position') and ( m.article =~'.* "
					+ word + ",.*' OR m.article =~ '\\\\[" + word + ",.*') "
					+ "return p as path, r.times as confidence";

			stmt = con.prepareStatement(query);
			// stmt.setString(1,"John");
			// stmt.setInt(1, 14);
			rs = stmt.executeQuery();

			while (rs.next()) {
				JSONArray json = JSONObject.parseArray(rs.getString(1));
				// 加入一个中心
				JSONObject centerJsos = json.getJSONObject(0);
				if (!centers.contains(centerJsos.getString("content"))) {
					centers.add(centerJsos.getString("content"));
					Node center = new Node();
					center.setCategory(centerJsos.getString("category"));
					center.setLabel(centerJsos.getString("content"));
					center.setValue(5);
					center.setName(centerJsos.getString("content"));
					// String centerStr = mapper.writeValueAsString(center);
					nodes.add(center);
				}
				// 加入一条边
				JSONObject linkJson = json.getJSONObject(1);
				if (!centers.contains(linkJson.getString("from") + "_"
						+ linkJson.getString("to"))
						&& !centers.contains(linkJson.getString("to") + "_"
								+ linkJson.getString("from"))) {
					centers.add(linkJson.getString("from") + "_"
							+ linkJson.getString("to"));
					Link link = new Link();
					link.setName(linkJson.getInteger("times").toString());
					link.setSource(linkJson.getString("from"));
					link.setTarget(linkJson.getString("to"));
					link.setWeight(1);
					// String linkStr = mapper.writeValueAsString(link);
					links.add(link);
				}
				// 加入一个点
				JSONObject nodeJson = json.getJSONObject(2);
				if (!centers.contains(nodeJson.getString("content"))) {
					centers.add(nodeJson.getString("content"));
					Node node = new Node();
					node.setCategory(nodeJson.getString("category"));
					node.setValue(1);
					node.setName(nodeJson.getString("content"));
					// String nodeStr = mapper.writeValueAsString(node);
					nodes.add(node);
				}
				// + "  "+ rs.getFloat("r.weight")
				// + "  " +rs.getString("f.content"));
			}

			tmp.put("node", nodes);
			System.out.println(nodes.size());
			tmp.put("link", links);
			System.out.println(links.size());
			LetterServiceImpl ls = new LetterServiceImpl();
			Letter letter = ls.selectByPrimaryKey(word.trim());

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date date = new Date(Long.parseLong(letter.getSubmitDateTime()
					+ "000"));
			String time = sdf.format(date);
			letter.setSubmitDateTime(time);
			content.add(letter);
			tmp.put("letter", content);

			return tmp;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (null != rs) {
				rs.close();
			}
			if (null != stmt) {
				stmt.close();
			}

		}

	}

	@RequestMapping(value = "/agg", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String uAgg(HttpServletRequest request, Model model)
			throws UnknownHostException {
		try {

			if (request.getParameter("word") == null
					|| request.getParameter("word").equals("")) {
				System.out.println(request.getParameter("word"));
				return "knowledge";
			}
			request.setCharacterEncoding("UTF-8");
			String word = request.getParameter("word");
			Client client = TransportClient
					.builder()
					.build()
					.addTransportAddress(
							new InetSocketTransportAddress(InetAddress
									.getByName("124.127.117.207"), 9736));
			String word1 = "北京";
			String word2 = "巴黎";
			QueryBuilder qb = queryStringQuery(
					"result.body:\"" + word1 + "\" OR result.body:\"" + word2
							+ "\"").analyzeWildcard(true);
			DateHistogramInterval interval = new DateHistogramInterval("1M");
			QueryBuilder qb1 = queryStringQuery("北京").analyzeWildcard(true)
					.queryName("北京");
			QueryBuilder qb2 = queryStringQuery("巴黎").analyzeWildcard(true)
					.queryName("巴黎");
			FiltersAggregationBuilder filter = AggregationBuilders.filters("3")
					.filter("巴黎", qb2).filter("北京", qb1);
			DateHistogramBuilder aggs = AggregationBuilders.dateHistogram("2")
					.field("result.issuedate").interval(interval)
					.timeZone("Asia/Shanghai").minDocCount(1)
					.subAggregation(filter);
			SearchRequestBuilder sbuilder = client.prepareSearch("pyspider")
					.addAggregation(aggs).setScroll(new TimeValue(60000))
					.setQuery(qb).setSize(0);
			SearchResponse scrollResp = sbuilder.execute().actionGet();
			List<SearchItem> items = new ArrayList<SearchItem>();
			Histogram agg = scrollResp.getAggregations().get("2");
			for (Histogram.Bucket entry : agg.getBuckets()) {
				String keyAsString = entry.getKeyAsString();
				// 按月时间
				String time = keyAsString.substring(0, 10);
				Filters fa = entry.getAggregations().get("3");
				for (Filters.Bucket ent : fa.getBuckets()) {
					// 关键字
					String city = ent.getKeyAsString();
					// 出现次数
					long docCount = ent.getDocCount();
				}
			}
			model.addAttribute("keyword", word);
			model.addAttribute("items", items);
			return "knowledge";
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
			return "";
		}

	}

	@RequestMapping(value = "/vsearch")
	public String phone() {
		return "";
	}

	@RequestMapping(value = "/log")
	public String point(HttpServletRequest request) {
		String username = request.getParameter("username");
		request.setAttribute("userName", username);
		return "business";
	}

	@RequestMapping(value = "/insert")
	public String insert(HttpServletRequest request, Model model)
			throws UnknownHostException, ParseException {

		ObjectMapper mapper = new ObjectMapper();

		Settings settings = Settings.settingsBuilder()
				.put("cluster.name", "elasticsearch").build();
		Client client = TransportClient
				.builder()
				.settings(settings)
				.build()
				.addTransportAddress(
						new InetSocketTransportAddress(InetAddress
								.getByName("124.127.117.207"), 9733));
		QueryBuilder qb = queryStringQuery("content:*").analyzeWildcard(true)
				.field("*");

		SearchRequestBuilder sbuilder = client.prepareSearch("zhongjiwei")
				.addSort(SortParseElement.SCORE_FIELD_NAME, SortOrder.DESC)
				.setScroll(new TimeValue(60000)).setQuery(qb).setSize(600)
				.addField("_source");

		// 进行多搜索
		MultiSearchResponse sr = client.prepareMultiSearch().add(sbuilder)
				.execute().actionGet();
		MultiSearchResponse.Item searchItem = sr.getResponses()[0];

		SearchResponse searchResp = searchItem.getResponse();
		List<SearchItem> items = new ArrayList<SearchItem>();
		Integer number = 1;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cl = Calendar.getInstance();
		Random ran = new Random();
		int i = 0;
		for (SearchHit hit : searchResp.getHits().getHits()) {
			JSONObject obj = JSONObject.parseObject(hit.getSourceAsString());
			String id = hit.getId();
			String time = obj.getString("date");
			Date date = sdf.parse(time);
			cl.setTime(date);
			long second = cl.getTimeInMillis();
			String content = obj.getString("content");
			String author = obj.getString("publisher");
			String title = obj.getString("title");
			int read = ran.nextInt(2);
			int cate = ran.nextInt(3);
			LetterServiceImpl ls = new LetterServiceImpl();
			Letter letter = new Letter();
			letter.setSubmitDateTime(String.valueOf(second));
			letter.setAuthor(author);
			letter.setAttachments(title);
			letter.setContents(content);
			ls.insert(letter);
			StatusServiceImpl ss = new StatusServiceImpl();
			Status status = new Status();
			status.setIfRead(read);
			ss.insert(status);
			CategoryServiceImpl cs = new CategoryServiceImpl();
			Category category = new Category();
			category.setName(cate);
			cs.insert(category);
			i++;
			// String title = hit.getSource().get("title").toString();
		}
		System.out.println(i);
		return "index";
	}

	@RequestMapping(value = "/select", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody
	HashMap<String, ArrayList<LetterTitle>> select(HttpServletRequest request,
			Model model) throws ParseException, JsonGenerationException,
			JsonMappingException, IOException {

		LetterServiceImpl ls = new LetterServiceImpl();
		ArrayList<LetterTitle> allRes = ls.selectTitles();
		ArrayList<LetterTitle> undo = new ArrayList<LetterTitle>();
		ArrayList<LetterTitle> levelOne = new ArrayList<LetterTitle>();
		ArrayList<LetterTitle> levelTwo = new ArrayList<LetterTitle>();
		ArrayList<LetterTitle> levelThree = new ArrayList<LetterTitle>();
		HashMap<String, ArrayList<LetterTitle>> tmp = new HashMap<String, ArrayList<LetterTitle>>();
		for (int i = 0; i < allRes.size(); i++) {
			LetterTitle letter = allRes.get(i);
			if (letter.getIfRead() == 0) {
				undo.add(letter);
			}
			if (letter.getName() == 0) {
				levelOne.add(letter);
			} else if (letter.getName() == 1) {
				levelTwo.add(letter);
			} else if (letter.getName() == 2) {
				levelThree.add(letter);
			}
		}
		tmp.put("all", allRes);
		tmp.put("undo", undo);
		tmp.put("levelOne", levelOne);
		tmp.put("levelTwo", levelTwo);
		tmp.put("levelThree", levelThree);
		return tmp;
	}

	@RequestMapping(value = "/tags", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody
	ArrayList<TagCount> tags(HttpServletRequest request, Model model)
			throws ParseException, JsonGenerationException,
			JsonMappingException, IOException {
		String param = request.getParameter("tags");
		String[] ids = param.split("-");
		TagServiceImpl ts = new TagServiceImpl();
		ArrayList<TagCount> res = new ArrayList<TagCount>();
		for (int i = 0; i < ids.length; i++) {
			TagCount tag = ts.selectCountByPrimaryKey(Integer.parseInt(ids[i]));
			res.add(tag);
		}

		return res;
	}

	@RequestMapping(value = "/tagsArt", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody
	ArrayList<LetterResult> tagsArt(HttpServletRequest request, Model model)
			throws ParseException, JsonGenerationException,
			JsonMappingException, IOException {
		String id = request.getParameter("tag");
		LetterServiceImpl ls = new LetterServiceImpl();
		ArrayList<LetterResult> res = ls.selectByTagId(Integer.parseInt(id));

		return res;
	}

	@RequestMapping(value = "/article", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody
	HashMap<String, ArrayList<Letter>> article(HttpServletRequest request,
			Model model) throws ParseException, JsonGenerationException,
			JsonMappingException, IOException {

		String word1 = request.getParameter("article");
		System.out.println("word1:" + word1);
		String word = word1.substring(1, word1.length() - 1);
		System.out.println("word:" + word);
		String[] ids = word.split(",");
		LetterServiceImpl ls = new LetterServiceImpl();
		ArrayList<Letter> article = new ArrayList<Letter>();
		HashMap<String, ArrayList<Letter>> tmp = new HashMap<String, ArrayList<Letter>>();
		for (int i = 0; i < ids.length; i++) {
			Letter letter = ls.selectByPrimaryKey(ids[i].trim());
			article.add(letter);
		}
		tmp.put("article", article);
		return tmp;
	}

	@RequestMapping(value = "/category", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody
	String getWordTypeOfArticle(HttpServletRequest request, Model model)
			throws SQLException {
		String id = "1";
		String res = "";
		String query = "match(article{content:'["
				+ id
				+ "]'})-[]-(node) "
				+ "where "
				+ "(node.category = 'person' OR node.category = 'location' OR node.category = 'institution') "
				+ "return node";

		// 节点和关系
		// String query = "MATCH (n{content:'百度'})-[r*2]->(f) RETURN f.content";
		PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
		ResultSet rs = null;
		Connection con = DriverManager.getConnection(
				"jdbc:neo4j://27.148.153.1:7474/", "neo4j", "nlp4");
		try {
			stmt = con.prepareStatement(query);
			// stmt.setString(1,"John");
			// stmt.setInt(1, 14);
			rs = stmt.executeQuery();
			System.out.println(rs.getFetchSize());
			while (rs.next()) {
				JSONObject obj = JSONObject.parseObject(rs.getString(1));
				System.out.println(rs.getString(1));
				res = res + rs.getString(1);
				String word = obj.getString("content");
				String type = obj.getString("category");
				System.out.println(word + ":" + type);
				// + "  "+ rs.getFloat("r.weight")
				// + "  " +rs.getString("f.content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != rs) {
				rs.close();
			}
			if (null != stmt) {
				stmt.close();
			}

		}
		return res;
	}

	@RequestMapping(value = "/test", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody
	String ulogin(HttpServletRequest request) {

		Integer id = Integer.parseInt(request.getParameter("id"));
		String password = request.getParameter("key");

		return "0";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String index(HttpServletRequest request, Model model) {
		if (request.getParameter("word") == null
				|| request.getParameter("word").equals("")) {
			return "index";
		}

		String word = request.getParameter("word");
		model.addAttribute("keyword", word);
		LetterServiceImpl ls = new LetterServiceImpl();
		Letter letter = ls.selectByPrimaryKey("1");
		System.out.println(letter.getAttachments());
		return "index";
	}

	@RequestMapping(value = "/graph", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String graph(HttpServletRequest request, Model model)
			throws SQLException, JsonGenerationException, JsonMappingException,
			IOException {
		if (request.getParameter("word") == null
				|| request.getParameter("word").equals("")) {
			return "graph";
		}

		String word = request.getParameter("word");

		Connection con = DriverManager.getConnection(
				"jdbc:neo4j://27.148.153.1:7474/", "neo4j", "nlp4");
		PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
		ResultSet rs = null;
		ObjectMapper mapper = new ObjectMapper();
		List<String> nodes = new ArrayList<String>();
		List<String> links = new ArrayList<String>();
		// String
		// query="MATCH (n {content:'"+word+"'} )-[r]->(f) RETURN n as node, r as dis ,f as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 0 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 10 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 1 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 2 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 3 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 4 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 5 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 6 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 7 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 8 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 9 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 10 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 11 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 12 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 13 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 14 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 15 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 16 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 17 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 18 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 UNION MATCH (n {content:'"+word+"'} )-[r]->(f) WITH r.weight as weight, f as layer1 ORDER by weight DESC skip 19 limit 1 MATCH (layer1)-[r]->(f2) RETURN layer1 as node,r as dis , f2 as nextlayer ORDER by r.weight DESC limit 20 ";

		try {
			if (word.indexOf(" ") < 0) {
				//通过关键字查图
				String query = "MATCH  (n{content:'"
						+ word
						+ "'})-[r]->(node1:person) "
						+ "RETURN n as node, r as dis, node1 as nextlayer "
						+ "UNION "
						+ "MATCH (n{content:'"
						+ word
						+ "'} )-[r]->(node1) "
						+ "WHERE node1.category = 'institution' OR node1.category = 'location' "
						+ "RETURN  n as node,r as dis, node1 as nextlayer "
						+ "ORDER by r.times DESC limit 20 "
						+ "UNION "
						+ "MATCH (n{content:'"
						+ word
						+ "'} )-[r]->(node1) "
						+ "WHERE node1.category = 'institution' OR node1.category = 'location' "
						+ "WITH  node1 as layer1 "
						+ "ORDER by r.times DESC limit 20 "
						+ "MATCH (layer1)-[r]->(node2:person) "
						+ "WITH layer1,node2 "
						+ "ORDER BY r.times DESC "
						+ "WITH layer1,collect(node2)[0..5] as list "
						+ "ORDER BY id(layer1) "
						+ "MATCH (layer1)-[r]->(layer2) "
						+ "WHERE layer2 in list "
						+ "RETURN layer1 as node, r as dis, layer2 as nextlayer";
				System.out.println("word.indexOf( )");
				Node center = new Node();
				center.setCategory(0);
				center.setLabel(word.toLowerCase());
				center.setValue(10);
				center.setName(word.toLowerCase());
				String centerStr = mapper.writeValueAsString(center);
				nodes.add(centerStr);
				stmt = con.prepareStatement(query);
				// stmt.setString(1,"John");
				// stmt.setInt(1, 14);

				rs = stmt.executeQuery();
				while (rs.next()) {
					Integer value = 0;
					// 加入一条边
					JSONObject linkJson = JSONObject.parseObject(rs
							.getString(2));
					Link link = new Link();
					link.setName(linkJson.getString("article"));
					link.setSource(linkJson.getString("from"));
					value = linkJson.getInteger("times");
					link.setTarget(linkJson.getString("to"));
					link.setWeight(linkJson.getInteger("times"));
					String linkStr = mapper.writeValueAsString(link);
					links.add(linkStr);
					// 加入一个点
					JSONObject nodeJson = JSONObject.parseObject(rs
							.getString(3));
					Node node = new Node();
					node.setCategory(nodeJson.getString("category"));
					node.setValue(value);
					node.setName(nodeJson.getString("content"));
					String nodeStr = mapper.writeValueAsString(node);
					nodes.add(nodeStr);
					// + "  "+ rs.getFloat("r.weight")
					// + "  " +rs.getString("f.content"));
					System.out.println("else之前的底部");
				}
			} else {
				HashSet<String> centers = new HashSet<String>();
				String[] words = word.split(" ");
				System.out.println("words0"+words[0]);
				//两个关键字
				String query = "MATCH p = allShortestPaths( (node1 {content : '"
						+ words[0]
						+ "'})-[r*1..4]-(node2 {content : '"
						+ words[1]
						+ "'}) ) "
						+ "WITH node1, node2, COLLECT(p) AS paths "
						+ "WITH node1, node2, paths, LENGTH(paths) AS totalPaths "
						+ "UNWIND paths AS p "
						+ "RETURN node1, node2, totalPaths, p, reduce(times = 0, rel IN rels(p)| times + rel.times) AS weight "
						+ "ORDER BY weight DESC " + "LIMIT 25";
				for (int i = 0; i < words.length; i++) {
					centers.add(words[i]);
					Node center = new Node();
					center.setCategory(0);
					center.setLabel(words[i]);
					center.setValue(i * 5 + 5);
					center.setName(words[i]);
					String centerStr = mapper.writeValueAsString(center);
					nodes.add(centerStr);
				}
				System.out.println("nodes"+nodes);
				stmt = con.prepareStatement(query);
				// stmt.setString(1,"John");
				// stmt.setInt(1, 14);
				rs = stmt.executeQuery();

				while (rs.next()) {
					JSONArray json = JSONObject.parseArray(rs.getString(4));
					// 0加入一个中心点
					JSONObject node1 = json.getJSONObject(0);
					if (!centers.contains(node1.getString("content"))) {
						centers.add(node1.getString("content"));
						Node center = new Node();
						center.setCategory(node1.getString("category"));
						center.setLabel(node1.getString("content"));
						center.setValue(1);
						center.setName(node1.getString("content"));
						String centerStr = mapper.writeValueAsString(center);
						nodes.add(centerStr);
					}
					// 1加入一条边
					JSONObject link1 = json.getJSONObject(1);
					if (!centers.contains(link1.getString("from") + "_"
							+ link1.getString("to"))
							&& !centers.contains(link1.getString("to") + "_"
									+ link1.getString("from"))) {
						centers.add(link1.getString("from") + "_"
								+ link1.getString("to"));
						Link link = new Link();
						link.setName(link1.getString("article"));
						link.setSource(link1.getString("from"));
						link.setTarget(link1.getString("to"));
						link.setWeight(1);
						String linkStr = mapper.writeValueAsString(link);
						links.add(linkStr);
					}
					// 2 加入一个点
					JSONObject node2 = json.getJSONObject(2);
					if (!centers.contains(node2.getString("content"))) {
						centers.add(node2.getString("content"));
						Node node = new Node();
						node.setCategory(node2.getString("category"));
						node.setLabel(node2.getString("content"));
						node.setValue(1);
						node.setName(node2.getString("content"));
						String nodeStr = mapper.writeValueAsString(node);
						nodes.add(nodeStr);
					}
					// 4 加入一个点
					JSONObject node3 = json.getJSONObject(4);
					if (!centers.contains(node3.getString("content"))) {
						centers.add(node3.getString("content"));
						Node node = new Node();
						node.setCategory(node3.getString("category"));
						node.setLabel(node3.getString("content"));
						node.setValue(1);
						node.setName(node3.getString("content"));
						String nodeStr = mapper.writeValueAsString(node);
						nodes.add(nodeStr);
					}

					// 3加入一条边
					JSONObject link2 = json.getJSONObject(3);

					if (!centers.contains(link2.getString("from") + "_"
							+ link2.getString("to"))
							&& !centers.contains(link2.getString("to") + "_"
									+ link2.getString("from"))) {
						centers.add(link2.getString("from") + "_"
								+ link2.getString("to"));
						Link line = new Link();
						line.setName(link2.getString("article"));
						line.setSource(link2.getString("from"));
						line.setTarget(link2.getString("to"));
						line.setWeight(1);
						String lineStr = mapper.writeValueAsString(line);
						links.add(lineStr);
					}
					// if(links.size()>40) break;
					// + "  "+ rs.getFloat("r.weight")
					// + "  " +rs.getString("f.content"));
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != rs) {
				rs.close();
			}
			if (null != stmt) {
				stmt.close();
			}
		}

		model.addAttribute("links", links.toString());
		model.addAttribute("nodes", nodes.toString());
		model.addAttribute("keyword", word);
		System.out.println("links:"+links);
		return "graph";
	}

	@RequestMapping(value = "/vknowledge")
	public String rpoint() {
		return "knowledge";
	}

	@RequestMapping(value = "/marketing")
	public String task(HttpServletRequest request, Model model) {
		if (request.getParameter("word") == null
				|| request.getParameter("word").equals("")) {
			System.out.println(request.getParameter("word"));
			return "marketing";
		}
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		String word = request.getParameter("word");
		model.addAttribute("keyword", word);
		return "marketing";
	}

	@RequestMapping(value = "/updateDatabase")
	public static void updateDatabase() throws SQLException {

		count=0;
		LetterServiceImpl ls = new LetterServiceImpl();
		ArrayList<Letter> letters = ls.select();
		for(int i=0;i<letters.size();i++){
			updateLetter(letters.get(i));
			ls.updateByPrimaryKey(letters.get(i));
		}
		System.out.println(letters.size());
	}
	
	public static void updateLetter(Letter letter) throws SQLException{
		HashMap<String,HashSet<String>> typeWords = getWordTypeOfArticle(String.valueOf(letter.getLetter_id()));
		updateLetterWithHTML(typeWords,letter);
	}
	
	public static void updateLetterWithHTML(HashMap<String,HashSet<String>> typeWords,Letter letter){
		HashSet<String> tmp = typeWords.get("person");
		for(String word:tmp){
			System.out.println(word);
			letter.setContents(letter.getContents().replaceAll(word, "<a href=\"graph?word="+word+"\" target=\"_blank\" style=\"color:#009abf\">"+word+"</a>"));
		}
		tmp = typeWords.get("location");
		for(String word:tmp){
			System.out.println(word);
			letter.setContents(letter.getContents().replaceAll(word, "<a href=\"graph?word="+word+"\" target=\"_blank\" style=\"color:#008548\">"+word+"</a>"));
		}
		tmp = typeWords.get("institution");
		for(String word:tmp){
			System.out.println(word);
			letter.setContents(letter.getContents().replaceAll(word, "<a href=\"graph?word="+word+"\" target=\"_blank\" style=\"color:#c37d0e\">"+word+"</a>"));
		}
		System.out.println(letter.getLetter_id()+":"+letter.getContents());
		count++;
		System.out.println("modyfied:"+count);
	}
	
	public static HashMap<String,HashSet<String>> getWordTypeOfArticle(String id) throws SQLException {
		//通过id查询文章关键字
		String query = "match(article{content:'["
				+ id
				+ "]'})-[]-(node) "
				+ "where "
				+ "(node.category = 'person' OR node.category = 'location' OR node.category = 'institution') "
				+ "return node.category as category,node.content as content";
		Connection con = DriverManager.getConnection(
				"jdbc:neo4j://27.148.153.1:7474/", "neo4j", "nlp4");
		PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
		ResultSet rs = null;
		

		HashMap<String,HashSet<String>> res = new HashMap<String,HashSet<String>>();
		HashSet<String> person = new HashSet<String>();
		HashSet<String> location = new HashSet<String>();
		HashSet<String> institution = new HashSet<String>();
		res.put("person", person);
		res.put("location", location);
		res.put("institution", institution);
		HashSet<String> tmp = new HashSet<String>();
		try {
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				tmp = res.get(rs.getString(1));
				insertOneWordType(tmp,rs.getString(2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != rs) {
				rs.close();
			}
			if (null != stmt) {
				stmt.close();
			}
		}
		
		return res;

	}

	public static void insertOneWordType(HashSet<String> allWords,String word){
		Iterator<String> iterator = allWords.iterator();
		while(iterator.hasNext()){
			String oneWord = iterator.next();
			if(oneWord.equals(oneWord)){
				return;
			}
			if(oneWord.indexOf(word)>-1){
				iterator.remove();
			}
			if(word.indexOf(oneWord)>-1){
				return;
			}
		}
		
		allWords.add(word);
	}
	
	@RequestMapping(value = "/search_institution")
	public String institution() {
		return "search_institution";
	}
	
	@RequestMapping(value = "/more")
	public String getMore() {
		return "more";
	}
	
	@RequestMapping(value = "/search_person")
	public String person() {
		return "search_person";
	}

	@RequestMapping(value = "/search_place")
	public String place() {
		return "search_place";
	}

	@RequestMapping(value = "/search_table")
	public String table() {
		return "search_table";
	}

	@RequestMapping(value = "/toutiao")
	public String toutiao(HttpServletRequest request, Model model) {
		if (request.getParameter("word") == null
				|| request.getParameter("word").equals("")) {
			System.out.println(request.getParameter("word"));
			return "toutiao";
		}
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		String word = request.getParameter("word");
		model.addAttribute("keyword", word);
		return "toutiao";
	}

	@RequestMapping(value = "/")
	public String root() {
		return "index";
	}
}

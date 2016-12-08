package com.ctbri.JWLetter.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;

import org.neo4j.jdbc.Driver;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ctbri.JWLetter.impl.LetterServiceImpl;
import com.ctbri.JWLetter.pojo.Letter;
import com.ctbri.JWLetter.pojo.Link;
import com.ctbri.JWLetter.pojo.Node;

public class neo4jJdbc {

	private static Connection con;

	static {
		try {
			Class.forName("org.neo4j.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:neo4j://27.148.153.1:7474/", "neo4j", "nlp4");
		} catch (ClassNotFoundException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

	}

	public static void getCategory(String word) throws SQLException {

		// String query = "match(a{content:'" + word + "'}) return a.category";
		// int id = 428;
		// String query =
		// "MATCH (article:other {content:'["+id+"]'})-[]-(n:person)"
		// +"MATCH p = (n:person)-[r]-(m)"
		// +"WHERE r.times > 1 and (m.category = 'crime' or m.category = 'institution' or m.category = 'location' or m.category = 'position')"
		// +"return p as path, r.times as confidence";
		// String name = "郑培钦";
		// String query = "MATCH  (n{content:'"+name+"'})-[r]->(node1:person) "
		// +"RETURN n as node, r as dis, node1 as nextlayer "
		// +"UNION "
		// +"MATCH (n{content:'"+name+"'} )-[r]->(node1) "
		// +"WHERE node1.category = 'institution' OR node1.category = 'location' "
		// +"RETURN  n as node,r as dis, node1 as nextlayer "
		// +"ORDER by r.times DESC limit 20 "
		// +"UNION "
		// +"MATCH (n{content:'"+name+"'} )-[r]->(node1) "
		// +"WHERE node1.category = 'institution' OR node1.category = 'location' "
		// +"WITH  node1 as layer1 "
		// +"ORDER by r.times DESC limit 20 "
		// +"MATCH (layer1)-[r]->(node2:person) "
		// +"WITH layer1,node2 "
		// +"ORDER BY r.times DESC "
		// +"WITH layer1,collect(node2)[0..5] as list "
		// +"ORDER BY id(layer1) "
		// +"MATCH (layer1)-[r]->(layer2) "
		// +"WHERE layer2 in list "
		// +"RETURN layer1 as node, r as dis, layer2 as nextlayer";
		String a = "你好 再见";
		String[] b = a.split(" ");
		String id = "1473";
		// String query= "MATCH(n:person) "
		// +"WHERE n.article =~'.* "+id+".*' OR n.article =~ '\\\\["+id+".*' "
		// +"WITH n "
		// +"MATCH p = (n:person)-[r]-(m) "
		// +"WHERE r.times > 1 and (m.category = 'crime' or m.category = 'institution' or m.category = 'location' or m.category = 'position') "
		// +"return p as path, r.times as confidence";
		String query = "MATCH p = allShortestPaths( (node1 {content : '孙甲勇'})-[r*1..4]-(node2 {content : '苗茂臣'}) ) "
				+ "WITH node1, node2, COLLECT(p) AS paths "
				+ "WITH node1, node2, paths, LENGTH(paths) AS totalPaths "
				+ "UNWIND paths AS p "
				+ "RETURN node1, node2, totalPaths, p, reduce(times = 0, rel IN rels(p)| times + rel.times) AS weight "
				+ "ORDER BY weight DESC " + "LIMIT 25";

		HashSet<String> centers = new HashSet<String>();
		PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(query);
			// stmt.setString(1,"John");
			// stmt.setInt(1, 14);
			rs = stmt.executeQuery();

			while (rs.next()) {
				// JSONArray json = JSONObject.parseArray(rs.getString(1));
				JSONObject json = JSONObject.parseObject(rs.getString(1));
				JSONObject json2 = JSONObject.parseObject(rs.getString(2));
				Object json3 = JSONObject.parse(rs.getString(3));
				JSONArray json4 = JSONObject.parseArray(rs.getString(4));
				Object json5 = JSONObject.parse(rs.getString(5));
				// 加入一个中心
				JSONObject centerJsos = json;
				if (!centers.contains(centerJsos.getString("content"))) {
					centers.add(centerJsos.getString("content"));
					Node center = new Node();
					center.setCategory(centerJsos.getString("category"));
					center.setLabel(centerJsos.getString("content"));
					center.setValue(5);
					center.setName(centerJsos.getString("content"));
					// String centerStr = mapper.writeValueAsString(center);
				}
				// 加入一条边
				JSONObject linkJson = json;
				Link link = new Link();
				// link.setName(linkJson.getInteger("times").toString());
				link.setSource(linkJson.getString("from"));
				link.setTarget(linkJson.getString("to"));
				link.setWeight(1);
				// String linkStr = mapper.writeValueAsString(link);
				// 加入一个点
				JSONObject nodeJson = json;
				if (!centers.contains(nodeJson.getString("content"))) {

					Node node = new Node();
					node.setCategory(nodeJson.getString("category"));
					node.setValue(1);
					node.setName(nodeJson.getString("content"));
					centers.add(nodeJson.getString("content"));
					// String nodeStr = mapper.writeValueAsString(node);
				}
			}
			System.out.println(centers.size());
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
	}

	public static void searchKnowledge(String word) throws SQLException {
		String query = "MATCH (n {content:'" + word + "'} )-[r1]->(f1) "
				+ "where f1.category = 'person' "
				+ "RETURN r1 as dis, f1 as layernode "
				+ "ORDER BY r1.weight DESC limit 2 " + "UNION "
				+ "MATCH (n{content:'" + word + "'})-[r2]->(f2) "
				+ "where f2.category = 'location' "
				+ "RETURN r2 as dis, f2 as layernode "
				+ "ORDER BY r2.weight DESC limit 2 " + "UNION "
				+ "MATCH (n{content:'" + word + "'})-[r3]->(f3) "
				+ "where f3.category = 'institution' "
				+ "RETURN r3 as dis, f3 as layernode "
				+ "ORDER BY r3.weight DESC limit 2";
		PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(query);
			// stmt.setString(1,"John");
			// stmt.setInt(1, 14);
			rs = stmt.executeQuery();
			System.out.println();
			while (rs.next()) {
				System.out.println(rs.getString(1) + rs.getString(2));
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
	}

	public static void knowledgeRelation(String word) throws SQLException {

		String query = "MATCH (n {content:'"
				+ word
				+ "'} )-[r]->(f) "
				+ "where f.category = 'person' or f.category = 'location' or f.category = 'institution' or f.category = 'technology' "
				+ "RETURN n as node, r as dis ,f as nextlayer "
				+ "ORDER by r.weight DESC limit 20 "
				+ "UNION "
				+ "MATCH (n {content:'"
				+ word
				+ "'} )-[r]->(f) "
				+ "where f.category = 'person' or f.category = 'location' or f.category = 'institution' or f.category = 'technology' "
				+ "WITH r.weight as weight,f as layer1 "
				+ "ORDER by weight DESC limit 20 "
				+ "MATCH (layer1)-[r]->(f2) "
				+ "where f2.category = 'person' or f2.category = 'location' or f2.category = 'institution' or f2.category = 'technology' "
				+ "return layer1 as node,r as dis , f2 as nextlayer "
				+ "ORDER by layer1.content, r.weight DESC limit 200";
		PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(query);
			// stmt.setString(1,"John");
			// stmt.setInt(1, 14);
			rs = stmt.executeQuery();
			System.out.println();
			while (rs.next()) {
				JSONObject obj = JSONObject.parseObject(rs.getString(1));
				String node = obj.getString("node");
				String category = obj.getString("category");
				String content = obj.getString("content");
				System.out.println(rs.getString(1) + rs.getString(2)
						+ rs.getString(3));
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
	}

	public static void m() throws SQLException {
		// String query = "MATCH (n:Person) RETURN n.name";
//		String baidu = "百度";
//		String query = "MATCH (n {content:'" + baidu
//				+ "'} )-[r*..2]->(f) RETURN f,r";// ORDER BY r.weight desc";
		String word ="110";
		String query = "MATCH (article:other {content:'["+word+"]'})-[]->(n:person) "
				+"WITH n "
				+"MATCH p = (n:person)-[r]->(m) "
				+"WHERE r.times > 1 and (m.category = 'crime' or m.category = 'institution' or m.category = 'location' or m.category = 'position') and ( m.article =~'.* "+word+",.*' OR m.article =~ '\\\\["+word+",.*') "
				+"return p as path, r.times as confidence";

		// 节点和关系
		// String query = "MATCH (n{content:'百度'})-[r*2]->(f) RETURN f.content";
		PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(query);
			// stmt.setString(1,"John");
			// stmt.setInt(1, 14);
			rs = stmt.executeQuery();
			System.out.println(rs.getRow());
			while (rs.next()) {
				System.out.println(rs.getString(1));
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

	}

	public static void updateDatabase(){
		
		LetterServiceImpl ls = new LetterServiceImpl();
		ArrayList<Letter> letters = ls.select();
		System.out.println(letters.size());
	}
	
	public static void getWordTypeOfArticle(String id) throws SQLException {
		String query = "MATCH (article:other {content:'["+id+"]'})-[]->(n:person) " 
				+"MATCH (article:other {content:'["+id+"]'})-[]->(m) " 
				+"WITH n, m "
				+"MATCH (n:person)-[r]->(m) "
				+"WHERE (m.category = 'crime' or m.category = 'institution' or m.category = 'location' or m.category = 'position') and r.times >1 "
				+"return  n as person, r as connection, m as nextnode, r.times as confidence";

		PreparedStatement stmt = null; // 采用预编译，和关系数据库不一样的是,参数需要使用{1},{2},而不是?
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			System.out.println(rs.getFetchSize());
			while (rs.next()) {
				System.out.println(rs.getString(1)+":"+rs.getString(2));
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

	}

	/**
	 * @param args
	 * @throws SQLException
	 */
	public static void main(String[] args) throws SQLException {
		// TODO 自动生成的方法存根
//		 getCategory("百度");
//		 m();
//		 searchKnowledge("中国");
//		 knowledgeRelation("SDN");
		getWordTypeOfArticle("155");
//		updateDatabase();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = new Date(Long.parseLong("1474939211000"));
		String time = sdf.format(date);
	}
}

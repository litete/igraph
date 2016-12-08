package com.ctbri.JWLetter.pojo;

import java.io.Serializable;

public class SearchItem implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7590728329774468038L;
	
	private String content = "";
	private String url = "";
	private String title = "";
	private String keyword = "";
	
	
	public SearchItem(String body, String url, String keyword,String title) {
		super();
		this.content = parseContent(body,keyword);
		this.url = url;
		this.title = toBold(title, keyword);
		this.keyword=keyword;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	private String parseContent(String body,String keyword){
		String[] res = body.split("\\n");
		String result = "";
		int i = 0;
		for(String tmp:res){
				result+=tmp.replaceAll("#", "").replaceAll("_","");
			if(result.length()>350) {
				result=result.substring(0, 330);
				break;
			} 
		}
		result = toBold(result,keyword);
		return result;
	}
	
//	private String parseTitle(String body,String keyword){
//		String oriTitle = "";
//		System.out.println(body);
//		System.out.println(keyword);
//		if(body.indexOf("nickname")>=0){
//			
//			oriTitle = body.substring(body.indexOf("title=")+6, body.indexOf("nickname", body.indexOf("title="))-2);
//		}else{
//			oriTitle = body.substring(body.indexOf("title=")+6, body.indexOf("}", body.indexOf("title=")));
//		}
//		return toBold(oriTitle,keyword);
//	}
	
	private String toBold(String content,String keyword){
		if(content.indexOf(keyword)>=0){
			return content.replace(keyword, "<strong>"+keyword+"</strong>");
		}else{
			return content;
		}
		
	}
}


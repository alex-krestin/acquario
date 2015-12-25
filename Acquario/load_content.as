// xml

import flash.net.URLRequest;

var xmlContentData: XML = new XML();
var xmlContentURL: URLRequest = new URLRequest("data/content.xml");
var xmlContentLoader: URLLoader = new URLLoader(xmlContentURL);

xmlContentLoader.addEventListener(Event.COMPLETE, contentFileLoaded);

function contentFileLoaded(e: Event): void {

	xmlContentData = XML(xmlContentLoader.data);

	var title = xmlContentData.page.(@id==page).title;
	var article = xmlContentData.page.(@id==page).article;

	content.txt1.text = title;
	
	// CSS Stile of text box
	
	var style:StyleSheet = new StyleSheet();
	style.parseCSS("h2{fontWeight:bold; fontSize:18; fontFamily:Calibri;}");
	
	content.txt2.multiline = true; 
    content.txt2.wordWrap = true; 
	content.txt2.styleSheet = style;
	content.txt2.htmlText = article;
	
	// article navigation
	main_menu = xmlContentData.page.(@id==page).@menu;
	prev_flag = (xmlContentData.page.(@id==page).@prev == 'true') ? true : false;
	next_flag = (xmlContentData.page.(@id==page).@next == 'true') ? true : false;
	
	content.chapter.addEventListener(MouseEvent.CLICK, gotoMainMenu);
	
if (prev_flag == true) {
		content.prev_article.visible=true;
		content.prev_article.addEventListener(MouseEvent.CLICK, gotoPreviousPage);}
	else {
	content.prev_article.visible=false;
	content.prev_article.removeEventListener(MouseEvent.CLICK, gotoPreviousPage);
	}

	if (next_flag == true) {
		content.next_article.visible=true;
		content.next_article.addEventListener(MouseEvent.CLICK, gotoNextPage);}
	else {
	content.next_article.visible=false;
	content.next_article.removeEventListener(MouseEvent.CLICK, gotoNextPage);}
	
}
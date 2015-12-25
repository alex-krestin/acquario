// xml

import flash.net.URLRequest;

var xmlCatalogData: XML = new XML();
var xmlCatalogURL: URLRequest = new URLRequest("data/fishes.xml");
var xmlCatalogLoader: URLLoader = new URLLoader(xmlCatalogURL);

xmlCatalogLoader.addEventListener(Event.COMPLETE, catalogFileLoaded);

function catalogFileLoaded(e: Event): void {

	xmlCatalogData = XML(xmlCatalogLoader.data);

	var title = xmlCatalogData.page.(@id==page).title;
	var article = xmlCatalogData.page.(@id==page).article;
	var description = xmlCatalogData.page.(@id==page).desc;
	var indole = xmlCatalogData.page.(@id==page).txt4;
	var pic = xmlCatalogData.page.(@id==page).image;

	var loader: Loader = new Loader();
	loader.load(new URLRequest(pic));

	content.imageContainer.addChild(loader);
	content.txt3.text = description;
	content.txt1.text = title;
	content.txt2.text = article;
	content.txt4.text = indole;
	
	// article navigation
	main_menu = xmlCatalogData.page.(@id==page).@menu;
	prev_flag = (xmlCatalogData.page.(@id==page).@prev == 'true') ? true : false;
	next_flag = (xmlCatalogData.page.(@id==page).@next == 'true') ? true : false;
	
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
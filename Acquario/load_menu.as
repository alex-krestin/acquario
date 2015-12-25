import flash.net.URLRequest;

var xmlMenuData: XML = new XML();
var xmlMenuURL: URLRequest = new URLRequest("data/menu.xml");
var xmlMenuLoader: URLLoader = new URLLoader(xmlMenuURL);

xmlMenuLoader.addEventListener(Event.COMPLETE, menuFileLoaded);

var links: Object = new Object(); // global variable, needs in goto functions

function menuFileLoaded(e: Event): void {

	xmlMenuData = XML(xmlMenuLoader.data);
	var title = xmlMenuData.page.(@id==page).title;
	var intro = xmlMenuData.page.(@id==page).intro;

	var labels: Object = new Object();
	var images: Object = new Object();
	var loaders: Array = new Array();
	
	content.txt1.text = title;
	
	if (page>4 && page <11) {
	content.txt2.text = intro;
	}

	for (var i: uint = 0; i < xmlMenuData.page.(@id==page).menu.length(); i++) {
		labels["label_" + i] = xmlMenuData.page.(@id==page).menu[i].label;
		images["image_" + i] = xmlMenuData.page.(@id==page).menu[i].image;
		var newLoader: Loader = new Loader();
		loaders.push(newLoader);
		loaders[i].load(new URLRequest(images["image_" + i]));
		links["link_" + i] = xmlMenuData.page.(@id==page).menu[i].link;
	}

	var menu_count: int = xmlMenuData.page.(@id==page).menu.length();

// It's terrible, but it works %:/ 	

	// Don't delete this if you have less then 6 menu_shapes on the stage!
	if (!Boolean(content.getChildByName('menu_shape3')))
		var menu_shape3;
	if (!Boolean(content.getChildByName('menu_shape4')))
		var menu_shape4;
	if (!Boolean(content.getChildByName('menu_shape5')))
		var menu_shape5;
	if (!Boolean(content.getChildByName('menu_shape6')))
		var menu_shape6;

	content.menu_shape1.image.addChild(loaders[0]);
	(content.menu_shape1.btn.upState as TextField).text = labels.label_0;
	(content.menu_shape1.btn.overState as TextField).text = labels.label_0;
	(content.menu_shape1.btn.downState as TextField).text = labels.label_0;
	
	content.menu_shape1.btn.addEventListener(MouseEvent.CLICK, menu_shape1_goto);

	content.menu_shape2.image.addChild(loaders[1]);
	(content.menu_shape2.btn.upState as TextField).text = labels.label_1;
	(content.menu_shape2.btn.overState as TextField).text = labels.label_1;
	(content.menu_shape2.btn.downState as TextField).text = labels.label_1;
	
	content.menu_shape2.btn.addEventListener(MouseEvent.CLICK, menu_shape2_goto);

	if (menu_count >= 3) {
		content.menu_shape3.image.addChild(loaders[2]);
		(content.menu_shape3.btn.upState as TextField).text = labels.label_2;
		(content.menu_shape3.btn.overState as TextField).text = labels.label_2;
		(content.menu_shape3.btn.downState as TextField).text = labels.label_2;
		
		content.menu_shape3.btn.addEventListener(MouseEvent.CLICK, menu_shape3_goto);

		if (menu_count >= 4) {
			content.menu_shape4.image.addChild(loaders[3]);
			(content.menu_shape4.btn.upState as TextField).text = labels.label_3;
			(content.menu_shape4.btn.overState as TextField).text = labels.label_3;
			(content.menu_shape4.btn.downState as TextField).text = labels.label_3;
			
			content.menu_shape4.btn.addEventListener(MouseEvent.CLICK, menu_shape4_goto);

			if (menu_count >= 5) {
				content.menu_shape5.image.addChild(loaders[4]);
				(content.menu_shape5.btn.upState as TextField).text = labels.label_4;
				(content.menu_shape5.btn.overState as TextField).text = labels.label_4;
				(content.menu_shape5.btn.downState as TextField).text = labels.label_4;

				content.menu_shape5.btn.addEventListener(MouseEvent.CLICK, menu_shape5_goto);
				
				if (menu_count == 6) {
					content.menu_shape6.image.addChild(loaders[5]);
					(content.menu_shape6.btn.upState as TextField).text = labels.label_5;
					(content.menu_shape6.btn.overState as TextField).text = labels.label_5;
					(content.menu_shape6.btn.downState as TextField).text = labels.label_5;
					
					content.menu_shape6.btn.addEventListener(MouseEvent.CLICK, menu_shape6_goto);
				}
			}
		}
	}
}

function menu_shape1_goto(event:MouseEvent):void
{
	fade_out();
	page=links.link_0;
}

function menu_shape2_goto(event:MouseEvent):void
{
	fade_out();
	page=links.link_1;
}

function menu_shape3_goto(event:MouseEvent):void
{
	fade_out();
	page=links.link_2;
}

function menu_shape4_goto(event:MouseEvent):void
{
	fade_out();
	page=links.link_3;
}

function menu_shape5_goto(event:MouseEvent):void
{
	fade_out();
	page=links.link_4;
}

function menu_shape6_goto(event:MouseEvent):void
{
	fade_out();
	page=links.link_5;
}
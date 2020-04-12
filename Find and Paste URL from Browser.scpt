JsOsaDAS1.001.00bplist00�Vscript_�var browserConfigs = {
	chrome: {
		name: "Google Chrome"
	},
	safari: {
		name: "Safari"
	}
};

// var browserConfig = browserConfigs.safari;
var browserConfig = browserConfigs.chrome;

var system = Application("System Events");
system.includeStandardAdditions = true;
var browser = Application(system.processes.whose({ _and:[{name:{_beginsWith: browserConfig.name}}, {visible:true}]})[0].name());
browser.includeStandardAdditions = true;

//For whatever reason this works wheres currentApplication does not.
var app = Application(system.processes.where({frontmost:true})[0].displayedName());
app.includeStandardAdditions = true;

function getTabByAbsoluteIndex(query) {
	var index;
	
	if (query > browser.windows[0].tabs.length) {
		query = query % browser.windows[0].tabs.length;
	}
	if ( query < 0 ) {
		index = browser.windows[0].tabs().length + query;
	} else {
		index = query - 1;
	}
	return [browser.windows[0].tabs[index].url()];
}

function getTabByRelativeIndex(query) {
	var currentTabIndex = browserConfig === browserConfigs.safari ? 
		browser.windows[0].currentTab().index() : 
		browser.windows[0].activeTabIndex();
	var relativeTabIndex = currentTabIndex-1 + query;
	if (relativeTabIndex >= browser.windows[0].tabs().length) {
		relativeTabIndex = relativeTabIndex - browser.windows[0].tabs().length;
	}
	return [browser.windows[0].tabs[relativeTabIndex].url()];
}

function getTabsWithUrlsThatContain(query) {
	var urls = [];
	browser.windows().forEach((window) => {
		var tabs = window.tabs.whose({ url:{ _contains: query }});
		tabs().forEach(function(tab) {
			urls.push(tab.url());
		});
	});
	return urls;
}

function getTabsWithTitlesThatContain(query) {
	var titles = [];
	browser.windows().forEach((window) => {
		var tabs = window.tabs.whose({ name:{ _contains: query }});
		tabs().forEach(function(tab) {
			titles.push(tab.url());
		});
	});
	return titles;
}
var formatCode = 'none';
var formatTemplates = [
	{ name: 'markdown', code: 'm', template: '[{TEXT}]({URL})' },
	{ name: 'html', code: 'h', template: '<a href="{URL}">{TEXT}</a>)' },
	{ name: 'reveal', code: 'r', template: '', action: (url) => {
		var win = browser.windows[0]; 
		if ( browserConfig.name === 'Safari' ) {
			var tab = win.tabs.whose({ url: url })[0];
			win.currentTab = tab;
		} else {
			for(let t=0; t < win.tabs().length; t++){
				if (win.tabs[t].url() === url) {
					matchingTab = win.tabs[t];
					matchingTabIndex = t;			
					win.activeTabIndex = matchingTabIndex+1;
					break;
				}
			}

		}
		browser.activate();
	}}
];

function runQuery(input) {
	var input = input.toString().split('!');
	var fullQuery = input[0];
	if(input.length > 1) {
		formatCode = input[input.length-1];
	}
	var queryCharacter = fullQuery.charAt(0);
	var	queryParameter =  fullQuery.substring(1);
	var queryCharacters = ['<','>'];
	var url;
	var urls = [];
	if (!isNaN(fullQuery) && fullQuery !== "") {
		urls = getTabByAbsoluteIndex(parseInt(fullQuery, 10));
	} else if (queryCharacters.indexOf(queryCharacter) >= 0) {
		switch(queryCharacter) {
			case ">":
				urls = getTabByRelativeIndex(parseInt(queryParameter, 10));
				break;
			case "<":
				urls = getTabByRelativeIndex(parseInt(queryParameter, 10)*-1);
				break;
		}
	} else if (/^((?!-))(xn--)?[a-z0-9][a-z0-9-_]{0,61}[a-z0-9]{0,1}\.(xn--)?([a-z0-9\-]{1,61}|[a-z0-9-]{1,30}\.[a-z]{2,})$/.test(fullQuery)) {
		urls = getTabsWithUrlsThatContain(fullQuery);
	} else if (fullQuery.length > 0) {
		urls = getTabsWithTitlesThatContain(fullQuery);
	} else {
		urls = getTabByRelativeIndex(0);
	}
	
	if(urls.length > 1) {
		var choice = app.chooseFromList(urls, {
			withTitle:"Multiple Matching URLs Found",
			withPrompt:"Select the desired matching URL",
			okButtonName:"Paste URL",
			cancelButton:"Cancel"});
			
			if(choice){
				url = choice.toString();
			} 
	} else {
		url = urls[0];
	}
	return url;
	
}
function pasteURL(url){
	var savedClipboard = app.theClipboard();
	app.setTheClipboardTo(url);
	system.keystroke('v',{using:["command down"]});
	delay(.5);
	app.setTheClipboardTo(savedClipboard);
}
var query = app.displayDialog(`Use text to find tabs by title.

Use domains to find tabs by URL. 
	
Use numbers to get a tab by absolute position (e.g. "1" for the leftmost tab and "-1" for the rightmost tab.)
	
Use numbers preceded by "<" or ">" to get a tab by relative position to current tab (e.g. "<1" for one tab left of current tab and ">1" one tab right of current tab.)
	
Leave empty to get the current tab.`, {
	withTitle:`Find and Paste URL from ${browserConfig.name}`,
	defaultAnswer:"",
	buttons:["Cancel", "Paste URL"],
	cancelButton: "Cancel",
	defaultButton:"Paste URL"
});
var url = runQuery(query.textReturned); 

if (formatCode !== 'none') {
	var formatting = formatTemplates.find(formatTemplate => formatTemplate.code === formatCode);
	if (formatting.template.indexOf('{url}') >= 0) {
		url = formatting.template.replace('{URL}', url);
		var charsToTextInsertion = url.split('').reverse().join('').indexOf('}TXET{');
		url = url.replace('{TEXT}', '');
		pasteURL(url);
		for (let i = 0; i < charsToTextInsertion; i++) {
			system.keyCode(123);
		}
	} else if (formatting.action && typeof formatting.action === 'function') {
		formatting.action(url);
	}
	
} else {
	pasteURL(url);
}
//                               � jscr  ��ޭ
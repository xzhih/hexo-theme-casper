/*
* @Author: xzhih
* @Date:   2018-11-04 23:25:09
* @Last Modified by:   xzhih
* @Last Modified time: 2018-12-04 04:43:06
* 在非 service workers 场景下
*/

// 保存搜索数据
var keepSearchData = function (siteRoot) {
    fetch(siteRoot + 'searchData.json')
    .then(function(response) {
        return response.json();
    })
    .then(function(resData) {
        localStorage.setItem('searchData', JSON.stringify(resData));
    })
}

// 检查和获取搜索数据
var checkAndGetData = function (siteRoot) {
    fetch(siteRoot + 'searchVersion.txt?t=' + (+new Date()))
    .then(function(response) {
        return response.text();
    })
    .then(function(resVersion) {
        if (localStorage.getItem('searchVersion') !== resVersion) {
            localStorage.setItem('searchVersion', resVersion);
            keepSearchData(siteRoot)
        }
    })
}

// 监听搜索
var searchFunc = function(siteRoot) {
    checkAndGetData(siteRoot)
    var localSearchData = localStorage.getItem("searchData");
    var datas = JSON.parse(localSearchData);
    var input = document.getElementById("local-search-input");
    if (!input) return;
    var resultContent = document.getElementById("local-search-result");
    input.addEventListener("input", function() {
        if (typeof(localSearchData) !== 'string') {
            localSearchData = localStorage.getItem("searchData");
            datas = JSON.parse(localSearchData);
        }
        printRs(this, datas, resultContent)
    });
};

// 监听搜索(SW)
var searchFuncSW = function(siteRoot) {
    fetch(siteRoot + 'searchData.json')
    .then(function(response) {
        return response.json();
    })
    .then(function(resData) {
        var localSearchData = JSON.stringify(resData);
        var datas = JSON.parse(localSearchData);
        var input = document.getElementById("local-search-input");
        if (!input) return;
        var resultContent = document.getElementById("local-search-result");
        input.addEventListener("input", function() {
            printRs(this, datas, resultContent)
        });
    });
};

// 打印结果
var printRs = function (input, datas, resultContent) {
    var str = '<ul class="search-result-list">';
    var keywords = input.value.trim().toLowerCase().split(/[\s\-]+/);
    resultContent.innerHTML = "";
    if (input.value.trim().length <= 0) {
        return;
    }
    datas.forEach(function(data) {
        var isMatch = true;
        var content_index = [];
        if (!data.title || data.title.trim() === "") {
            data.title = "Untitled";
        }
        var data_title = data.title.trim().toLowerCase();
        var data_content = data.content.trim().replace(/<[^>]+>/g, "").toLowerCase();
        var data_url = data.url;
        var index_title = -1;
        var index_content = -1;
        var first_occur = -1;
        if (data_content !== "") {
            keywords.forEach(function(keyword, i) {
                index_title = data_title.indexOf(keyword);
                index_content = data_content.indexOf(keyword);
                if (index_title < 0 && index_content < 0) {
                    isMatch = false;
                } else {
                    if (index_content < 0) {
                        index_content = 0;
                    }
                    if (i == 0) {
                        first_occur = index_content;
                    }
                }
            });
        } else {
            isMatch = false;
        }
        if (isMatch) {
            str += "<li><a href='" + data_url + "' class='search-result-title'>" + data_title + "</a>";
            var content = data.content.trim().replace(/<[^>]+>/g, "");
            if (first_occur >= 0) {
                var start = first_occur - 20;
                var end = first_occur + 80;
                if (start < 0) {
                    start = 0;
                }
                if (start == 0) {
                    end = 100;
                }
                if (end > content.length) {
                    end = content.length;
                }
                var match_content = content.substr(start, end);
                keywords.forEach(function(keyword) {
                    var regS = new RegExp(keyword, "gi");
                    match_content = match_content.replace(regS, '<em class="search-keyword">' + keyword + "</em>");
                });
                str += '<p class="search-result">' + match_content + "...</p>";
            }
            str += "</li>";
        }
    });
    str += "</ul>";
    resultContent.innerHTML = str;
}
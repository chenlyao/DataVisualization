var dataone=[//根据N元素计算的植物
    {value:"eastwheat",name:"东小麦",},{value:"springwheat",name:"春小麦"},
    {value:"barley",name:"大麦"},{value:"buckwheat",name:"荞麦"},
    {value:"maize",name:"玉米"},{value:"oilseedrape",name:"油菜"},
    {value:"millet",name:"谷子"},{value:"sorghum",name:"高粱"},
    {value:"rice",name:"水稻"},{value:"cotton",name:"棉花"},
    {value:"cigarettesandtobacco",name:"烟草"},{value:"sesame",name:"芝麻"},
    {value:"peanut",name:"花生"},{value:"soybean",name:"大豆"},
    {value:"sweetpotato",name:"甘薯"},{value:"potato",name:"马铃薯"},
    {value:"beet",name:"甜茶"}
];


var datatwo=[//根据P元素计算的植物
    {value:"rice",name:"水稻"},
    {value:"millet",name:"谷子"},{value:"sorghum",name:"高粱"},
    {value:"buckwheat",name:"荞麦"},{value:"barley",name:"大麦"},
    {value:"cotton",name:"棉花"},{value:"OilseedRape",name:"油菜"},
    {value:"soybean",name:"大豆"},{value:"apple",name:"苹果"},
    {value:"peach",name:"桃子"},{value:"citrus",name:"柑橘"},
    {value:"grape",name:"葡萄"},{value:"banana",name:"香蕉"},
    {value:"litchi",name:"荔枝"},{value:"ChineseCabbage",name:"大白菜"},
    {value:"CauliflowerBroccoli",name:"花椰菜"},{value:"spinach",name:"菠菜"},
    {value:"tomato",name:"番茄"},{value:"pepper",name:"辣椒"},
    {value:"radish",name:"萝卜"},{value:"carrot",name:"胡萝卜"},
    {value:"celery",name:"西芹"},{value:"FloweringCabbage",name:"菜心"},
    {value:"GreenChineseOnion",name:"大葱"},{value:"garlic",name:"大蒜"},
    {value:"cabbage",name:"卷心菜"},{value:"eggplant",name:"茄子"},
    {value:"cucumber",name:"黄瓜"},{value:"onion",name:"洋葱"},
    {value:"SeedMelon",name:"籽瓜"},{value:"WaxGourd",name:"冬瓜"},
    {value:"kale",name:"甘蓝"},{value:"asparagus",name:"芦笋"},
    {value:"lettuce",name:"生菜"},{value:"FreshGinger",name:"生姜"},
    {value:"LeafMustard",name:"芥菜"},{value:"BitterGourd",name:"苦瓜"},
    {value:"AsparagusLettuce",name:"莴苣"},{value:"KidneyBean",name:"菜豆"},
    {value:"GreenBean",name:"豆角"},{value:"pumpkin",name:"南瓜"},
    {value:"GreenVegetables",name:"青菜"},{value:"CucurbitaPepoL",name:"西葫芦"},
    {value:"taro",name:"芋头"},{value:"ChineseYam",name:"山药"},
    {value:"pear",name:"梨"},{value:"persimmon",name:"柿子"},
    {value:"watermelon",name:"西瓜"},{value:"pineapple",name:"菠萝"},
    {value:"RedDates",name:"红枣"},{value:"melon",name:"甜瓜"},
    {value:"strawberry",name:"草莓"},{value:"Citrus",name:"柑"},
    {value:"longan",name:"龙眼"},{value:"cherry",name:"樱桃"},
    {value:"HamiMelon",name:"哈密瓜"},{value:"KiwiFruit",name:"猕猴桃"},
    {value:"mango",name:"芒果"},{value:"waxberry",name:"杨梅"},
    {value:"pawpaw",name:"木瓜"},{value:"peanut",name:"花生"},
    {value:"tobacco",name:"烟草"},{value:"sesame",name:"芝麻"},
    {value:"beet",name:"甜菜"},{value:"sugarcane",name:"甘蔗"},
    {value:"sunflower",name:"向日葵"},{value:"BroadBean",name:"蚕豆"},
    {value:"flax",name:"胡麻"},{value:"CastorOilPlant",name:"蓖麻"},
    {value:"cassava",name:"木薯"},{value:"MungBean",name:"绿豆"},
    {value:"pea",name:"豌豆"},{value:"AtractylodesMacrocephala",name:"白术"},
    {value:"mulberry",name:"桑"},{value:"LigusticumWallichii",name:"川芎"}
];

var datathree=[//根据K元素计算的植物
    {value:"NortheastRice",name:"东北水稻"},{value:"SouthernRice",name:"南方水稻"},
    {value:"wheat",name:"小麦"},{value:"SpringCorn",name:"春玉米"},
    {value:"SummerMaize",name:"夏玉米"}, {value:"millet",name:"谷子"},
    {value:"buckwheat",name:"荞麦"}
];

function reclassification(a,b){//GP重分类方法
    if(a=="N"){
        switch (b) {
            case "eastwheat": //东小麦
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"3"};
            case "springwheat": //春小麦
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"3"};
            case "barley"://大麦
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"2.7"};
            case "buckwheat"://荞麦
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"3.3"};
            case "maize"://玉米
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"2.68"};
            case "oilseedrape"://油菜
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"5.8"};
            case "millet"://谷子
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"2.5"};
            case "sorghum"://高粱
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"2.6"};
            case "rice"://水稻
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"2.1"};
            case "cotton"://棉花
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"5"};
            case "cigarettesandtobacco"://烟草
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"4.1"};
            case "sesame"://芝麻
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"8.23"};
            case "peanut"://花生
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"6.8"};
            case "soybean"://大豆
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"7.2"};
            case "sweetpotato"://甘薯
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"0.35"};
            case "potato"://马铃薯
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"0.5"};
            case "beet"://甜茶
                return {Reclassification:"0 0.6 1;0.6 0.9 2;0.9 1.2 3;1.2 10 4",need:"0.4"};
        }
    }else
    if(a=="P"){
        switch(b){
            case "rice"://水稻
                return {Reclassification:"0 7 1;7 15 2;15 20 3;20 1000 4",need:"4.88"};
            case "millet"://谷子
                return {Reclassification:"0 5 1;5 10 2;10 20 3;20 40 4;40 1000 5",need:"1.25"};
            case "sorghum"://高粱
                return {Reclassification:"0 5 1;5 10 2;10 20 3;20 40 4;40 1000 5",need:"1.3"};
            case "buckwheat"://荞麦
                return {Reclassification:"0 5 1;5 10 2;10 20 3;20 40 4;40 1000 5",need:"1.6"};
            case "barley"://大麦
                return {Reclassification:"0 5 1;5 10 2;10 20 3;20 40 4;40 1000 5",need:"0.9"};
            case "cotton"://棉花
                return {Reclassification:"0 10 1;10 15 2;10 20 3;20 40 4;40 1000 5",need:"1.8"};
            case "OilseedRape"://油菜
                return {Reclassification:"0 6 1;6 12 2;12 25 3;25 30 4;30 1000 5",need:"2.5"};
            case "soybean"://大豆
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"1.8"};
            case "apple"://苹果
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.08"};
            case "peach"://桃子
                return {Reclassification:"0 10 1;10 20 2;20 40 3;40 60 4;60 1000 5",need:"0.2"};
            case "citrus"://柑橘
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 1000 4",need:"0.11"};
            case "grape"://葡萄
                return {Reclassification:"0 5 1;5 15 2;15 30 3;30 40 4;40 1000 5",need:"0.4"};
            case "banana"://香蕉
                return {Reclassification:"0 7 1;7 20 2;20 30 3;30 45 4;45 1000 5",need:"0.12"};
            case "litchi"://荔枝
                return {Reclassification:"0 25 1;25 40 2;40 45 3;45 1000 4",need:"1.03"};
            case "ChineseCabbage"://大白菜
                return {Reclassification:"0 20 1;20 40 2;40 60 3;60 90 4;90 1000 5",need:"0.06"};
            case "CauliflowerBroccoli"://花椰菜
                return {Reclassification:"0 20 1;20 40 2;40 60 3;60 90 4;90 1000 5",need:"0.26"};
            case "spinach"://菠菜
                return {Reclassification:"0 20 1;20 40 2;40 60 3;60 80 4;80 1000 5",need:"0.08"};
            case "tomato"://番茄
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.15"};
            case "pepper"://辣椒
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.48"};
            case "radish"://萝卜
                return {Reclassification:"0 10 1;10 20 2;20 40 3;40 50 4;50 1000 5",need:"0.31"};
            case "carrot"://胡萝卜
                return {Reclassification:"0 10 1;10 20 2;20 40 3;40 50 4;50 1000 5",need:"0.1"};
            case "celery": //西芹
                return {Reclassification:"0 20 1;20 40 2;40 60 3;60 80 4;80 1000 5",need:"0.08"};
            case "FloweringCabbage"://菜心
                return {Reclassification:"0 10 1;10 30 2;30 50 3;50 120 4;120 1000 5",need:"0.2"};
            case "GreenChineseOnion"://大葱
                return {Reclassification:"0 20 1;20 45 2;45 70 3;70 90 4;90 1000 5",need:"0.12"};
            case "garlic": //大蒜
                return {Reclassification:"0 25 1;25 45 2;45 65 3;65 90 4;90 1000 5",need:"0.23"};
            case "cabbage"://卷心菜
                return {Reclassification:"0 20 1;20 40 2;40 60 3;60 90 4;90 1000 5",need:"0.05"};
            case "eggplant"://茄子
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.1"};
            case "cucumber"://黄瓜
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.35"};
            case "onion"://洋葱
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.12"};
            case "SeedMelon"://籽瓜
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"5.6"};
            case "WaxGourd"://冬瓜
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.05"};
            case "kale"://甘蓝
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.11"};
            case "asparagus"://芦笋
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"1.13"};
            case "lettuce"://生菜
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.12"};
            case "FreshGinger"://生姜
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.21"};
            case "LeafMustard"://芥菜
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.11"};
            case "BitterGourd"://苦瓜
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.07"};
            case "AsparagusLettuce"://莴苣
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.06"};
            case "KidneyBean"://菜豆
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.51"};
            case "GreenBean"://豆角
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"1.86"};
            case "pumpkin"://南瓜
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.19"};
            case "GreenVegetables"://青菜
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.12"};
            case "CucurbitaPepoL"://西葫芦
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.22"};
            case "taro"://芋头
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.32"};
            case "ChineseYam"://山药
                return {Reclassification:"0 7 1;7 20 2;20 40 3;40 70 4;70 1000 5",need:"0.26"};
            case "pear"://梨
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.23"};
            case "persimmon"://柿子
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.14"};
            case "watermelon"://西瓜
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.02"};
            case "pineapple"://菠萝
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.11"};
            case "RedDates"://红枣
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.9"};
            case "melon"://甜瓜
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.62"};
            case "strawberry"://草莓
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.27"};
            case "Citrus"://柑
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.05"};
            case "longan"://龙眼
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"1.03"};
            case "cherry"://樱桃
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.25"};
            case "HamiMelon"://哈密瓜
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.16"};
            case "KiwiFruit"://猕猴桃
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.21"};
            case "mango"://芒果
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.06"};
            case "waxberry"://杨梅
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.01"};
            case "pawpaw"://木瓜
                return {Reclassification:"0 15 1;15 30 2;30 50 3;50 90 4;90 1000 5",need:"0.23"};
            case "peanut"://花生
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"1.3"};
            case "tobacco"://烟草
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"1"};
            case "sesame"://芝麻
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"2.07"};
            case "beet"://甜菜
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"0.15"};
            case "sugarcane"://甘蔗
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"0.07"};
            case "sunflower"://向日葵
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"1.75"};
            case "BroadBean"://蚕豆
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"1.61"};
            case "flax"://胡麻
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"0.78"};
            case "CastorOilPlant"://蓖麻
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"2.66"};
            case "cassava"://木薯
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"0.5"};
            case "MungBean"://绿豆
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"0.56"};
            case "pea"://豌豆
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"2.1"};
            case "AtractylodesMacrocephala"://白术
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"0.91"};
            case "mulberry"://桑
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"0.41"};
            case "LigusticumWallichii"://川芎
                return {Reclassification:"0 10 1;10 20 2;20 35 3;35 45 4;45 1000 5",need:"1.88"};
        }
    }else
    if (a="K") {
        switch(b){
            case "NortheastRice"://东北水稻
                return {Reclassification:"0 60 1;60 120 2;120 150 3;150 1000 4",need:"3.13"};
            case "SouthernRice"://南方水稻
                return {Reclassification:"0 50 1;50 80 2;80 110 3;110 140 4;140 1000 5",need:"2.53"};
            case "wheat"://小麦
                return {Reclassification:"0 90 1;90 120 2;120 150 3;150 1000 4",need:"1.8"};
            case "SpringCorn"://春玉米
                return {Reclassification:"0 60 1;60 120 2;120 160 3;160 1000 4",need:"2.36"};
            case "SummerMaize"://夏玉米
                return {Reclassification:"0 90 1;90 120 2;120 150 3;150 1000 4",need:"1.8"};
            case "millet"://谷子
                return {Reclassification:"0 50 1;50 100 2;100 150 3;150 200 4;200 1000 5",need:"1.75"};
            case "buckwheat"://荞麦
                return {Reclassification:"0 50 1;50 100 2;100 150 3;150 200 4;200 1000 5",need:"4.3"};
        }
    }
}
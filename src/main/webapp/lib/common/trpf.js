    //选择氮元素的作物方法
 var select_N= {
     s:null,
     a:null,
     //东小麦
     eastwheat : function (content,output) {
         a=3;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //春小麦
     springwheat : function (content,output) {
         a=3;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //大麦
     barley : function (content,output) {
         a=2.7;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //荞麦
     buckwheat : function (content,output) {
         a=3.3;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //玉米
     maize : function (content,output) {
         a=2.68;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //油菜
     oilseedrape : function (content,output) {
         a=5.8;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //谷子
     millet : function (content,output) {
         a=2.5;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //高粱
     sorghum : function (content,output) {
         a=2.6;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //水稻
     rice : function (content,output) {
         a=2.1;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //棉花
     cotton : function (content,output) {
         a=5;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //烟草
     cigarettesandtobacco : function (content,output) {
         a=4.1;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //芝麻
     sesame : function (content,output) {
         a=8.23;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //花生
     peanut : function (content,output) {
         a=6.8;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //大豆
     soybean : function (content,output) {
         a=7.2;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //甘薯
     sweetpotato : function (content,output) {
         a=0.35;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //马铃薯
     potato : function (content,output) {
         a=0.5;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //甜菜
     beet : function (content,output) {
         a=0.4;
         if(content<0.6){
             s=a*1.5*output^0.95;
         }else if
         (0.6<=content<0.9){
             s=a*1.3*output^0.95;
         }else if
         (0.9<=content<1.2) {
             s=a*output^0.95;
         }else if
         (content>=1.2) {
             s=a*0.7*output^0.95;
         }
         return s;
     }
 };
 //选择磷元素的作物方法
 var select_P={
        s:null,
        a:null,
     //水稻
     rice : function (content,output) {
         a=4.88;
         if(content<7){
             s=a*1.5*output^0.95;
         }else if
         (7<=content<15){
             s=a*1.3*output^0.95;
         }else if
         (15<=content<20){
             s=a*output^0.95;
         }else if
         (content>=20) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //谷子
     millet : function (content,output) {
            a=1.25;
        if(content<5){
            s=a*1.7*output^0.95;
        }else if
        (5<=content<10){
             s=a*1.5*output^0.95;
         }else if
        (10<=content<20){
            s=a*1.3*output^0.95;
        }else if
        (20<=content<40) {
            s=a*output^0.95;
        }else if
        (content>=40) {
            s=a*0.7*output^0.95;
        }
        return s;
     },
     //高粱
     sorghum:function (content,output) {
            a=1.3;
         if(content<5){
             s=a*1.7*output^0.95;
         }else if
         (5<=content<10){
             s=a*1.5*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.3*output^0.95;
         }else if
         (20<=content<40) {
             s=a*output^0.95;
         }else if
         (content>=40) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //荞麦
     buckwheat:function (content,output) {
             a=1.6;
         if(content<5){
             s=a*1.7*output^0.95;
         }else if
         (5<=content<10){
             s=a*1.5*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.3*output^0.95;
         }else if
         (20<=content<40) {
             s=a*output^0.95;
         }else if
         (content>=40) {
             s=a*0.7*output^0.95;
         }
         return s;
    },
     //大麦
     barley:function (content,output) {
         a=0.9;
         if(content<5){
             s=a*1.7*output^0.95;
         }else if
         (5<=content<10){
             s=a*1.5*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.3*output^0.95;
         }else if
         (20<=content<40) {
             s=a*output^0.95;
         }else if
         (content>=40) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //棉花
     cotton:function (content,output) {
         a=1.8;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<15){
             s=a*1.5*output^0.95;
         }else if
         (15<=content<20){
             s=a*1.3*output^0.95;
         }else if
         (20<=content<40) {
             s=a*output^0.95;
         }else if
         (content>=40) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //油菜
     OilseedRape:function (content,output) {
            a=2.5;
         if(content<6){
             s=a*1.7*output^0.95;
         }else if
         (6<=content<12){
             s=a*1.5*output^0.95;
         }else if
         (12<=content<25){
             s=a*1.3*output^0.95;
         }else if
         (25<=content<30) {
             s=a*output^0.95;
         }else if
         (content>=30) {
             s=a*0.7*output^0.95;
         }
         return s;
    },
    //大豆
     soybean:function (content,output) {
            a=1.8;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //苹果
     apple:function (content,output) {
            a=0.08;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //桃子
     peach:function (content,output) {
         a=0.2;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<60) {
             s=a*output^0.95;
         }else if
         (content>=60) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //柑橘
     citrus:function (content,output) {
         a=0.11;
         if(content<15){
             s=a*1.5*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.3*output^0.95;
         }else if
         (30<=content<50){
             s=a*output^0.95;
         }else if
         (content>50) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //葡萄
     grape:function (content,output) {
         a=0.4;
         if(content<5){
             s=a*1.7*output^0.95;
         }else if
         (5<=content<15){
             s=a*1.5*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.3*output^0.95;
         }else if
         (30<=content<40) {
             s=a*output^0.95;
         }else if
         (content>=40) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //香蕉
     banana:function (content,output) {
         a=0.12;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<30){
             s=a*1.3*output^0.95;
         }else if
         (30<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //荔枝
     litchi:function (content,output) {
         a=1.03;
         if(content<25){
             s=a*1.5*output^0.95;
         }else if
         (25<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //大白菜
     ChineseCabbage:function (content,output) {
         a=0.06;
         if(content<20){
             s=a*1.7*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.5*output^0.95;
         }else if
         (40<=content<60){
             s=a*1.3*output^0.95;
         }else if
         (60<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //花椰菜
     CauliflowerBroccoli:function (content,output) {
        a=0.26;
        if(content<20){
            s=a*1.7*output^0.95;
        }else if
        (20<=content<40){
            s=a*1.5*output^0.95;
        }else if
        (40<=content<60){
            s=a*1.3*output^0.95;
        }else if
        (60<=content<90) {
            s=a*output^0.95;
        }else if
        (content>=90) {
            s=a*0.7*output^0.95;
        }
        return s;
    },
     //菠菜
     spinach:function (content,output) {
         a=0.08;
         if(content<20){
             s=a*1.7*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.5*output^0.95;
         }else if
         (40<=content<60){
             s=a*1.3*output^0.95;
         }else if
         (60<=content<80) {
             s=a*output^0.95;
         }else if
         (content>=80) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //番茄
     tomato:function (content,output) {
         a=0.15;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //辣椒
     pepper:function (content,output) {
         a=0.48;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //萝卜
     radish:function (content,output) {
         a=0.31;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<50) {
             s=a*output^0.95;
         }else if
         (content>=50) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //胡萝卜
     carrot:function (content,output) {
         a=0.10;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<50) {
             s=a*output^0.95;
         }else if
         (content>=50) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //西芹
     celery:function (content,output) {
         a=0.08;
         if(content<20){
             s=a*1.7*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.5*output^0.95;
         }else if
         (40<=content<60){
             s=a*1.3*output^0.95;
         }else if
         (60<=content<80) {
             s=a*output^0.95;
         }else if
         (content>=80) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //菜心
     FloweringCabbage:function (content,output) {
         a=0.2;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<120) {
             s=a*output^0.95;
         }else if
         (content>=120) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //大葱
     GreenChineseOnion:function (content,output) {
        a=0.12;
        if(content<20){
            s=a*1.7*output^0.95;
        }else if
        (20<=content<45){
            s=a*1.5*output^0.95;
        }else if
        (45<=content<70){
            s=a*1.3*output^0.95;
        }else if
        (70<=content<90) {
            s=a*output^0.95;
        }else if
        (content>=90) {
            s=a*0.7*output^0.95;
        }
        return s;
    },
     //大蒜
     garlic:function (content,output) {
         a=0.23;
         if(content<25){
             s=a*1.7*output^0.95;
         }else if
         (25<=content<45){
             s=a*1.5*output^0.95;
         }else if
         (45<=content<65){
             s=a*1.3*output^0.95;
         }else if
         (65<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //卷心菜
     cabbage:function (content,output) {
         a=0.05;
         if(content<20){
             s=a*1.7*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.5*output^0.95;
         }else if
         (40<=content<60){
             s=a*1.3*output^0.95;
         }else if
         (60<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //茄子
     eggplant:function (content,output) {
         a=0.10;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //黄瓜
     cucumber:function (content,output) {
         a=0.35;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //洋葱
     onion:function (content,output) {
         a=0.12;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //籽瓜
     SeedMelon:function (content,output) {
         a=5.6;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //冬瓜
     WaxGourd:function (content,output) {
         a=0.05;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //甘蓝
     kale:function (content,output) {
         a=0.11;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //芦笋
     asparagus:function (content,output) {
         a=1.13;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //生菜
     lettuce:function (content,output) {
         a=0.12;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //生姜
     FreshGinger:function (content,output) {
         a=0.21;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //芥菜
     LeafMustard:function (content,output) {
         a=0.11;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //苦瓜
     BitterGourd:function (content,output) {
         a=0.07;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //莴苣
     AsparagusLettuce:function (content,output) {
         a=0.06;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //菜豆
     KidneyBean:function (content,output) {
         a=0.51;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //豆角
     GreenBean:function (content,output) {
         a=1.86;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //南瓜
     pumpkin:function (content,output) {
         a=1.86;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //青菜
     GreenVegetables:function (content,output) {
         a=0.12;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //西葫芦
     CucurbitaPepoL:function (content,output) {
         a=0.22;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //芋头
     taro:function (content,output) {
         a=0.32;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //山药
     ChineseYam:function (content,output) {
         a=0.26;
         if(content<7){
             s=a*1.7*output^0.95;
         }else if
         (7<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<40){
             s=a*1.3*output^0.95;
         }else if
         (40<=content<70) {
             s=a*output^0.95;
         }else if
         (content>=70) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //梨
     pear:function (content,output) {
         a=0.23;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //柿
     persimmon:function (content,output) {
         a=0.14;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //西瓜
     watermelon:function (content,output) {
         a=0.02;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //菠萝
     pineapple:function (content,output) {
         a=0.11;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //红枣
     RedDates:function (content,output) {
         a=0.9;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //甜瓜
     melon:function (content,output) {
         a=0.62;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //草莓
     strawberry:function (content,output) {
         a=0.27;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //柑
     Citrus:function (content,output) {
         a=0.05;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //龙眼
     longan:function (content,output) {
         a=1.03;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //樱桃
     cherry:function (content,output) {
         a=0.25;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //哈密瓜
     HamiMelon:function (content,output) {
         a=0.16;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //猕猴桃
     KiwiFruit:function (content,output) {
         a=0.21;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //芒果
     mango:function (content,output) {
         a=0.06;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //杨梅
     waxberry:function (content,output) {
         a=0.01;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //木瓜
     pawpaw:function (content,output) {
         a=0.23;
         if(content<15){
             s=a*1.7*output^0.95;
         }else if
         (15<=content<30){
             s=a*1.5*output^0.95;
         }else if
         (30<=content<50){
             s=a*1.3*output^0.95;
         }else if
         (50<=content<90) {
             s=a*output^0.95;
         }else if
         (content>=90) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //花生
     peanut:function (content,output) {
         a=1.3;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //烟草
     tobacco:function (content,output) {
         a=1;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //芝麻
     sesame:function (content,output) {
         a=2.07;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //甜菜
     beet:function (content,output) {
         a=0.15;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //甘蔗
     sugarcane:function (content,output) {
         a=0.07;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //向日葵
     sunflower:function (content,output) {
         a=1.75;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //蚕豆
     BroadBean:function (content,output) {
         a=1.61;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //胡麻
     flax:function (content,output) {
         a=0.78;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //蓖麻
     CastorOilPlant:function (content,output) {
         a=2.66;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //木薯
     cassava:function (content,output) {
         a=0.5;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //绿豆
     MungBean:function (content,output) {
         a=0.56;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //豌豆
     pea:function (content,output) {
         a=2.1;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //白术
     AtractylodesMacrocephala:function (content,output) {
         a=0.91;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //桑
     mulberry:function (content,output) {
         a=0.41;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //川芎
     LigusticumWallichii:function (content,output) {
         a=1.88;
         if(content<10){
             s=a*1.7*output^0.95;
         }else if
         (10<=content<20){
             s=a*1.5*output^0.95;
         }else if
         (20<=content<35){
             s=a*1.3*output^0.95;
         }else if
         (35<=content<45) {
             s=a*output^0.95;
         }else if
         (content>=45) {
             s=a*0.7*output^0.95;
         }
         return s;
     }
 };
 //选择钾元素的作物方法
 var select_K={
     s:null,
     a:null,
     //东北水稻
     NortheastRice:function (content,output) {
         a=3.13;
         if(content<60){
             s=a*1.5*output^0.95;
         }else if
         (60<=content<120){
             s=a*1.3*output^0.95;
         }else if
         (120<=content<150){
             s=a*output^0.95;
         }else if
         (content>=150) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //南方水稻
     SouthernRice:function (content,output) {
        a=2.53;
        if(content<50){
            s=a*1.7*output^0.95;
        }else if
        (50<=content<80){
            s=a*1.5*output^0.95;
        }else if
        (80<=content<110){
            s=a*1.3*output^0.95;
        }else if
        (110<=content<140) {
            s=a*output^0.95;
        }else if
        (content>=140) {
            s=a*0.7*output^0.95;
        }
        return s;
    },
     //小麦
     wheat:function (content,output) {
         a=1.8;
         if(content<90){
             s=a*1.5*output^0.95;
         }else if
         (90<=content<120){
             s=a*1.3*output^0.95;
         }else if
         (120<=content<150){
             s=a*output^0.95;
         }else if
         (content>=150) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //春玉米
     SpringCorn:function (content,output) {
         a=2.36;
         if(content<60){
             s=a*1.5*output^0.95;
         }else if
         (60<=content<120){
             s=a*1.3*output^0.95;
         }else if
         (120<=content<160){
             s=a*output^0.95;
         }else if
         (content>=160) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //夏玉米
     SummerMaize:function (content,output) {
         a=1.8;
         if(content<90){
             s=a*1.5*output^0.95;
         }else if
         (90<=content<120){
             s=a*1.3*output^0.95;
         }else if
         (120<=content<150){
             s=a*output^0.95;
         }else if
         (content>=150) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //谷子
     millet:function (content,output) {
         a=1.75;
         if(content<50){
             s=a*1.7*output^0.95;
         }else if
         (50<=content<100){
             s=a*1.5*output^0.95;
         }else if
         (100<=content<150){
             s=a*1.3*output^0.95;
         }else if
         (150<=content<200) {
             s=a*output^0.95;
         }else if
         (content>=200) {
             s=a*0.7*output^0.95;
         }
         return s;
     },
     //荞麦
     buckwheat:function (content,output) {
         a=4.3;
         if(content<50){
             s=a*1.7*output^0.95;
         }else if
         (50<=content<100){
             s=a*1.5*output^0.95;
         }else if
         (100<=content<150){
             s=a*1.3*output^0.95;
         }else if
         (150<=content<200) {
             s=a*output^0.95;
         }else if
         (content>=200) {
             s=a*0.7*output^0.95;
         }
         return s;
     }
 };
    // alert(select_P.millet(20,20));
    // alert(select_P.sorghum(20,20));
  //   alert(SoilFormula("K",20,"NortheastRice",20));
  //  alert(SoilFormula("P",20,"LigusticumWallichii",20));
 function SoilFormula(element,content,crop,output){//元素，土壤元素含量，农作物，预计产量
     if(element=="N"){
            switch (crop) {
                case "eastwheat": //东小麦
                return   select_N.eastwheat(content,output);
                case "springwheat": //春小麦
                return   select_N.springwheat(content,output);
                case "barley"://大麦
                return   select_N.barley(content,output);
                case "buckwheat"://荞麦
                return   select_N.buckwheat(content,output);
                case "maize"://玉米
                return   select_N.maize(content,output);
                case "oilseedrape"://油菜
                return   select_N.oilseedrape(content,output);
                case "millet"://谷子
                return   select_N.millet(content,output);
                case "sorghum"://高粱
                return   select_N.sorghum(content,output);
                case "rice"://水稻
                return   select_N.rice(content,output);
                case "cotton"://棉花
                return   select_N.cotton(content,output);
                case "cigarettesandtobacco"://烟草
                return   select_N.cigarettesandtobacco(content,output);
                case "sesame"://芝麻
                return   select_N.sesame(content,output);
                case "peanut"://花生
                return    select_N.peanut(content,output);
                case "soybean"://大豆
                return     select_N.soybean(content,output);
                case "sweetpotato"://甘薯
                return     select_N.sweetpotato(content,output);
                case "potato"://马铃薯
                return      select_N.potato(content,output);
                case "beet"://甜茶
                return    select_N.beet(content,output);
            }
     }else
     if(element=="P"){
         switch(crop){
             case  "rice"://水稻
              return   select_P.rice(content,output);
             case "millet"://谷子
              return   select_P.millet(content,output);
             case "sorghum"://高粱
              return   select_P.sorghum(content,output);
             case "buckwheat"://荞麦
              return   select_P.buckwheat(content,output);
             case "barley"://大麦
              return   select_P.barley(content,output);
             case "cotton"://棉花
              return   select_P.cotton(content,output);
             case "OilseedRape"://油菜
              return   select_P.OilseedRape(content,output);
             case "soybean"://大豆
              return   select_P.soybean(content,output);
             case "apple"://苹果
              return   select_P.apple(content,output);
             case "peach"://桃子
              return   select_P.peach(content,output);
             case "citrus"://柑橘
              return   select_P.citrus(content,output);
             case "grape"://葡萄
              return   select_P.grape(content,output);
             case "banana"://香蕉
              return   select_P.banana(content,output);
             case "litchi"://荔枝
              return   select_P.litchi(content,output);
             case "ChineseCabbage"://大白菜
              return   select_P.ChineseCabbage(content,output);
             case "CauliflowerBroccoli"://花椰菜
              return   select_P.CauliflowerBroccoli(content,output);
             case "spinach"://菠菜
              return   select_P.spinach(content,output);
             case "tomato"://番茄
              return    select_P.tomato(content,output);
             case "pepper"://辣椒
              return    select_P.pepper(content,output);
             case "radish"://萝卜
              return    select_P.radish(content,output);
             case "carrot"://胡萝卜
              return     select_P.carrot(content,output);
             case "celery": //西芹
              return     select_P.celery(content,output);
             case "FloweringCabbage"://菜心
              return     select_P.FloweringCabbage(content,output);
             case "GreenChineseOnion"://大葱
              return     select_P.GreenChineseOnion(content,output);
             case "garlic": //大蒜
              return     select_P.garlic(content,output);
             case "cabbage"://卷心菜
              return     select_P.cabbage(content,output);
             case "eggplant"://茄子
              return     select_P.eggplant(content,output);
             case "cucumber"://黄瓜
              return     select_P.cucumber(content,output);
             case "onion"://洋葱
              return     select_P.onion(content,output);
             case "SeedMelon"://籽瓜
              return     select_P.SeedMelon(content,output);
             case "WaxGourd"://冬瓜
              return     select_P.WaxGourd(content,output);
             case "kale"://甘蓝
              return     select_P.kale(content,output);
             case "asparagus"://芦笋
              return     select_P.asparagus(content,output);
             case "lettuce"://生菜
              return      select_P.lettuce(content,output);
             case "FreshGinger"://生姜
              return      select_P.FreshGinger(content,output);
             case "LeafMustard"://芥菜
              return      select_P.LeafMustard(content,output);
             case "BitterGourd"://苦瓜
              return      select_P.BitterGourd(content,output);
             case "AsparagusLettuce"://莴苣
              return      select_P.AsparagusLettuce(content,output);
             case "KidneyBean"://菜豆
              return     select_P.KidneyBean(content,output);
             case "GreenBean"://豆角
              return     select_P.GreenBean(content,output);
             case "pumpkin"://南瓜
             return      select_P.pumpkin(content,output);
             case "GreenVegetables"://青菜
              return     select_P.GreenVegetables(content,output);
             case "CucurbitaPepoL"://西葫芦
              return     select_P.CucurbitaPepoL(content,output);
             case "taro"://芋头
              return    select_P.taro(content,output);
             case "ChineseYam"://山药
             return     select_P.ChineseYam(content,output);
             case "pear"://梨
             return     select_P.pear(content,output);
             case "persimmon"://柿子
             return     select_P.persimmon(content,output);
             case "watermelon"://西瓜
              return     select_P.watermelon(content,output);
             case "pineapple"://菠萝
              return     select_P.pineapple(content,output);
             case "RedDates"://红枣
              return     select_P.RedDates(content,output);
             case "melon"://甜瓜
              return     select_P.melon(content,output);
             case "strawberry"://草莓
              return     select_P.strawberry(content,output);
             case "Citrus"://柑
              return     select_P.Citrus(content,output);
             case "longan"://龙眼
              return      select_P.longan(content,output);
             case "cherry"://樱桃
             return       select_P.cherry(content,output);
             case "HamiMelon"://哈密瓜
             return       select_P.HamiMelon(content,output);
             case "KiwiFruit"://猕猴桃
             return       select_P.KiwiFruit(content,output);
             case "mango"://芒果
              return     select_P.mango(content,output);
             case "waxberry"://杨梅
              return     select_P.waxberry(content,output);
             case "pawpaw"://木瓜
              return     select_P.pawpaw(content,output);
             case "peanut"://花生
              return     select_P.peanut(content,output);
             case "tobacco"://烟草
              return     select_P.tobacco(content,output);
             case "sesame"://芝麻
              return     select_P.sesame(content,output);
             case "beet"://甜菜
              return     select_P.beet(content,output);
             case "sugarcane"://甘蔗
              return     select_P.sugarcane(content,output);
             case "sunflower"://向日葵
              return     select_P.sunflower(content,output);
             case "BroadBean"://蚕豆
             return      select_P.BroadBean(content,output);
             case "flax"://胡麻
             return      select_P.flax(content,output);
             case "CastorOilPlant"://蓖麻
              return     select_P.CastorOilPlant(content,output);
             case "cassava"://木薯
             return      select_P.cassava(content,output);
             case "MungBean"://绿豆
              return     select_P.MungBean(content,output);
             case "pea"://豌豆
             return      select_P.pea(content,output);
             case "AtractylodesMacrocephala"://白术
             return  select_P.AtractylodesMacrocephala(content,output);
             case "mulberry"://桑
             return select_P.mulberry(content,output);
             case "LigusticumWallichii"://川芎
              return   select_P.LigusticumWallichii(content,output);
         }
     }else
     if (element="K") {
         switch(crop){
             case "NortheastRice"://东北水稻
                 return select_K.NortheastRice(content,output);
             case "SouthernRice"://南方水稻
                 return select_K.SouthernRice(content,output);
             case "wheat"://小麦
                 return select_K.wheat(content,output);
             case "SpringCorn"://春玉米
                 return select_K.SpringCorn(content,output);
             case "SummerMaize"://夏玉米
                 return select_K.SummerMaize(content,output);
             case "millet"://谷子
                 return select_K.millet(content,output);
             case "buckwheat"://荞麦
                 return select_K.buckwheat(content,output);
         }
     }
 }

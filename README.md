# MY RECIPE（レシピ登録&献立作成サイト）

<img width="1435" alt="MY RECIPE" src="https://user-images.githubusercontent.com/81369773/130522654-f2e84340-fd9d-45da-a749-b2be223785ee.png">


## サイト概要
MY RECIPEは、自分のレシピを登録して作る献立作成サイトです。
このサイトひとつで、レシピの確認から買い物で必要な材料一覧確認、献立作りまで一貫して行うことができます。


【使い方】
１.自分が作れる料理のレシピ（作りたいもののレシピでも可）や材料、手順などを登録します。            
２.レシピ一覧の中から献立に組み込みたいレシピを選択し、直感的に献立を作成できます。             
       
レシピ一覧ではジャンルごとにレシピを確認することが可能です。               
また、材料一覧から、お買い物リストを確認することもできます。      
          

### サイトテーマ
食事作りにまつわるストレスを包括的に軽減するためのサイト     


### テーマを選んだ理由
理由として、以下の３点が挙げられます。     
        
- 日常生活を便利にしたり、ストレスを軽減するようなサイトを作りたかったため。         
       
- 現在、新型コロナ感染症の流行により自宅での食事機会が増加しており、食事作りの負担が増えることに伴って        
  "献立作成サイト"に一定のニーズがあると考えたため。               
           
  >2021年にアイランド株式会社が行った「コロナ禍における2020年の家庭料理の振り返りおよび2021年の展望調査」*によると、         
  >前年に比べて自宅で料理をする機会が増えた人は64％。       
  >その内 料理をする際にストレスを感じる人は44％。         
  >さらに、その内「献立を考えるのが面倒」という人は38.8％とトップを記録。          
  >*参考サイト：https://prtimes.jp/main/html/rd/p/000000017.000001653.html          
         
- 既存サイトは、予めサイトに登録されているレシピから献立を組むものが主流となっており、        
  レシピの難易度が高く作る気が起きなかったり、好みでないレシピが多く活用しにくかった。        
  そのため、自身が作れるレシピのみを登録し、その中から献立を作成するスタイルをとることで、         
       
　- 自分自身が作れる料理だけを集めたレシピ集ができ、献立はその中から組み合わせるだけでよいことから、          
　　料理の工程で最もストレスのかかる"献立作り"が簡単に行える          
        
　- 買い物リストを作成したり、料理を作る際にいちいちレシピを検索する手間も省ける      
       
　といった「食事づくりへのストレス軽減」に対して包括的なアプローチができると考えたため。          



### ターゲットユーザ
- 20-30代の夫婦。二人暮らしで共働き。           
- 食べること自体は好きだが料理を作るのはそこまで得意じゃなく、         
 「パートナーがいるから」という理由でなんとか日々食事を作っている感じ。          
- ひとりごはんの時は何を作ろうか考えあぐねている内に面倒くさくなり、          
  結局納豆ご飯で済ませてしまうことも多い。             
- 外食やコンビニご飯中心では食費も嵩む上、なにかとハイカロリーで栄養面も偏ってしまう…             
  そう頭では分かっていながら、仕事が忙しく帰宅時間も遅くなりがち。          
  疲れた時は思考停止状態でコンビニへ。           

…そんな人の助けになればと、このサイトを作成しました。


### 主な利用シーン
- 献立を考える時
- レシピを参照したい時
- 献立に必要な食材を買いに行く時

## 設計書
- 機能一覧
<img width="675" alt="機能一覧" src="https://user-images.githubusercontent.com/81369773/130998911-e4663177-4eea-4e64-81f7-71902b266add.png">        
    
 
- ER図

<img width="474" alt="ER図" src="https://user-images.githubusercontent.com/81369773/130998658-f1b66bf3-4f5d-416c-bdc9-0067b2619c6b.png">          
  

- テーブル定義書

https://www.icloud.com/numbers/0P9p4sC-kTNE95ulhf_pCbjmQ                 
    
 
- アプリケーション詳細設計書

<img width="565" alt="アプリケーション詳細設計図" src="https://user-images.githubusercontent.com/81369773/130998717-d42d87bb-8f6d-4734-821d-a185cad7aedc.png">                  
![使用gem一覧](https://user-images.githubusercontent.com/81369773/130998950-2ad5e3a0-d2e0-4e48-8309-78c04ac4e97c.jpg)      

## チャレンジ要素一覧
https://docs.google.com/spreadsheets/d/1B2UUvImMW1hhfa6NOclQCB_xTi98W4ZMobh7ehn3Ki0/edit?usp=sharing                 

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
- ロゴ素材：Canva https://www.canva.com/ja_jp/

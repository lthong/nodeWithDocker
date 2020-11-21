## Node with Docker
### 序
此專案為使用 Dockerfile 與 Docker 指令的簡易練習，學習 Docker 幾日以來的心得是，每個 Docker Container 就像小王子中各自一個個的小星球，所有服務或應用需要的環境或套件，都會在這個星球上被安裝建立，讓每個星球的服務可以正常運作，比如星星A是賣衣服的商店，星星B是賣食物的商店...

每個商店就像是一個個的軟體應用或服務，讓整個宇宙的居民可以快樂的生活在一起，究竟 Docker 是如何建立這些服務呢?讓我們一起來趟學習之旅吧～

### 第一章
當 build 完本例的 Dockerfile 後便會建立一個容器，該容器包含一個 node 環境，並透過該環境建立了一個簡易的 Web Server，
容器的建置流程如下所述：

```
$ docker build .
```
該指令透過 Dockerfile 去建立一個 image，「.」代表 Dockerfile 所在路徑，執行完成會得到一個 image_id

---

```
$ docker run {image_id}
```
透過 image_id 去啟動一個容器，但如果想透過瀏覽器連接該容器內的 Web Server，則需使用下方指令去 mapping #port 
該指令執行完就會看到我們的 node 已成功運行一個 Web Server 了

---

```
$ docker run -p {browser #port}:{Container #port} {image_id}
```
為了能讓瀏覽器可以連接上容器內的 Web Server，要記得 mapping #port  
此時就能開啟瀏覽器網址 localhost:9000，便能看到「Hello Docker and Node!」 在畫面上囉！

### 第二章
其他相關 Docker 指令參考如下

```
$ docker run -it {image_id} sh
```
此指令可以會透過 image_id 去啟一個容器，sh 參數會在此容器內開起 terminal，同時允許對其輸入 linux commands，範例指令如下
    
```
# ls
查看目前路徑下的檔案或資料夾名稱

# cd usr
切去 usr 目錄下查看是否有 app資料夾，此路徑為本專案設定的工作目錄，裡面應包含 package.json, index.js

# exit
離開 terminal
```

---

```
$ docker logs {Container_id}
```
此指令可以查看 Container 曾經在 terminal 印出的內容，如上方linux commands： # ls 得出的結果

---

```
$ docker ps
```
此指令可以查看目前正在運行 Container 的相關資料

---

```
$ docker ps -a
```
此指令可以查看曾建立過的 Container 的相關資料

---

```
$ docker system prune
```
此指令可以刪除所有 image and Container
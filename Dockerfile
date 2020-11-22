# 使用 node 作為基底 image
FROM node:12.19.1-alpine3.10

# 設定 WORKDIR {路徑}為後續的 RUN、CMD、ENTRYPOINT 指令指定工作目錄為 /usr/app
WORKDIR /usr/app

# 把當前目錄下的 package.json 複製一份到 image 中工作目錄（即上方設定的 /usr/app）
# 只複製這個檔案的目的在於避免 index.js 更新時，重 build Dockerfile 都要重新 npm install ㄧ次，
# 只要 package.json 或此行指令之前幾步的 Dockerfile 指令沒更新，則此行就會使用上次 build 過的快取
# 而只要此行使用快取，則代表 package.json 沒有改變，RUN npm install 也會使用快取不會重 build
COPY ./package.json ./

# 建立 image 時如果執行到 RUN <command>，則代表要使用 shell 去執行該 <command>
# 以下為執行 npm install 去安裝 package.json 中的套件，讓未來建立出的 container 擁有執行服務所需的套件
RUN npm install

# 把當前目錄（根據 build image 時指定的路徑所得到的根目錄）
# 檔案都複製一份到容器的工作目錄的根目錄下，此例的工作目錄即上方設定的 /usr/app
COPY ./ ./

# 設定在未來啟動的容器內執行 npm start，npm start 會執行 node index.js 指令，啟動一個 web server
CMD ["npm", "start"]

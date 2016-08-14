# 添加物暴露量計算表 Tfaim

使用Ruby與Sinatra實作的添加物暴露量計算表

可用來計算各種食物與年齡層的攝食量

## 實作
* 苯甲酸暴露量計算
* 各種食物攝取量的輸入與計算
* 各年齡層暴露量計算
* ADI EDI計算

## 使用

### 基本使用

首先確保Ruby版本於2.3或以上

```bash
$ ruby -v
```

接著必須安裝bundler這個gem

```bash
$ gem install bundler
```

透過bundler安裝所需的gem

```bash
$ bundle install
```

最後

```bash
$ ruby tfaim_web.rb
```

就可以透過 [localhost:4567](localhost:4567) 開啟網頁

### 額外設定

可安裝Thin當做開啟的server

```bash
$ gem install thin
```

加上參數`-p`即可在執行時選擇要使用port

```bash
$ ruby tfaim_web.rb -p 1111
```
如此網址即是 [localhost:1111](localhost:1111)


若需要對外開放則需加上參數`-o 0.0.0.0`

```bash
$ ruby tfaim_web.rb -o 0.0.0.0
```

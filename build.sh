set -e

cat << EOF > $1
 <!DOCTYPE html>
 <html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Expires" content="0">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Cache-control" content="no-cache">
        <meta http-equiv="Cache" content="no-cache">
  <title>x老师端 APP下载</title>
 </head>
 <body>

 <center>
  <br><br><br>
  <h1>${app_name}</h1><br>
  <h2>>>> <a href="itms-services://?action=download-manifest&url==https://github.com/wyxuan/IPA_PLIST/blob/master/LBOC_Student_Adhoc.plist">点击下载</a > <<<</h2>
  <h6>版本：1.0.0.${BUILD_NUMBER}</h6>
  <h6>文件大小：${fileSize}</h6>
  <h6>更新时间：${current_time}</h6>
  <br><br><br>
 </center>

 </body>
 </html>
EOF

git add .
git commit -m "test"
git push origin master

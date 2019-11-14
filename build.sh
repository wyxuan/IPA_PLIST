set -e

cat << EOF > student.html
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

#plist
cat << EOF > student.plist
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>items</key>
        <array>
            <dict>
                <key>assets</key>
                <array>
                    <dict>
                        <key>kind</key>
                        <string>software-package</string>
                        <key>url</key>
                        <string>http://10.240.15.83/UB_Student.ipa</string>
                    </dict>
                </array>
                <key>metadata</key>
                <dict>
                    <key>title</key>
                    <string>乐•Adhoc</string>
                    <key>bundle-version</key>
                    <string>1</string>
                    <key>kind</key>
                    <string>software</string>
                    <key>bundle-identifier</key>
                    <string>com.dfyb.test.LBOCStudent</string>
                </dict>
            </dict>
        </array>
    </dict>
    </plist>
EOF


git add .
git commit -m "test"
git push origin master

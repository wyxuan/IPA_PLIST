set -e

ipaName=$1
plistHref=""
fileName=""
i=0
for file in `ls -l -h | awk '{print $9}'`
do
   fileName=${file}
   current_time=`ls -l -h build.sh | awk '{print $6, $7, $8}'`
   fileSize=`ls -l -h build.sh | awk '{print $5}'`
   build_version=${fileName:0:11}
   if [[ ${fileName:0:11} == "student_ipa" ]] && [ ${i} -lt 4 ];
   then
     add='<center><br><br><br><h1>乐播课</h1><br><h2>>>> <a href="itms-services://?action=download-manifest&url=https://raw.githubusercontent.com/wyxuan/IPA_PLIST/master/'$fileName'.plist">点击下载</a > <<<</h2><h6>版本：'${fileName}'</h6><h6>文件大小：'${fileSize}'</h6><h6>更新时间：'${current_time}'</h6></center>'
     plistHref=${plistHref}${add}
   fi
done
cat << EOF > student.html
 <!DOCTYPE html>
 <html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Expires" content="0">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Cache-control" content="no-cache">
        <meta http-equiv="Cache" content="no-cache">
  <title>学生端 APP下载</title>
 </head>
 <body>
      ${plistHref}
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
                        <string>http://10.240.15.83/$ipaName.ipa</string>
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
git commit -m "${ipaName}"
git push origin master

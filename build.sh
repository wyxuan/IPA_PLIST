set -e

ipaName=$1
newVersion=$2
plistHref=""
fileName=""
i=0

#${file%.*}
echo "app: ${ipaName} v:  ${newVersion}"
for file in `ls -lt -h | awk '{print $9}'`
do
   fileName=${file}
   current_time=`ls -l -h ${file} | awk '{print $6, $7, $8}'`
   fileSize=`ls -l -h ${file} | awk '{print $5}'`
   build_version=${fileName:0:11}
   if [[ ${fileName} == ${ipaName}"_"*.ipa ]] && [ ${i} -lt 4 ];
   then
     add='<center><br><br><br><h1>乐播课</h1><br><h2>>>> <a href="itms-services://?action=download-manifest&url=https://raw.githubusercontent.com/wyxuan/IPA_PLIST/master/'${fileName%.*}'.plist">点击下载</a > <<<</h2><h6>版本：'${fileName}'</h6><h6>文件大小：'${fileSize}'</h6><h6>更新时间：'${current_time}'</h6></center>'
     plistHref=${plistHref}${add}
   fi
done
cat << EOF > ${ipaName}.html
 <!DOCTYPE html>
 <html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Expires" content="0">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Cache-control" content="no-cache">
        <meta http-equiv="Cache" content="no-cache">
  <title> APP下载 </title>
 </head>
 <body>
      ${plistHref}
 </body>
 </html>
EOF


#plist UB_Student LBOC_Teacher

if [[ ${ipaName} == "LBOC_Teacher" ]];
then
cat << EOF > LBOC_Teacher_${newVersion}.plist
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
                    <string>http://10.240.15.83/LBOC_Teacher_${newVersion}.ipa</string>
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
                    <string>com.dfyb.test.LBOCTeacher</string>
                </dict>
            </dict>
        </array>
    </dict>
    </plist>
EOF
else
cat << EOF > UB_Student_${newVersion}.plist
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
                    <string>http://10.240.15.83/UB_Student_${newVersion}.ipa</string>
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
fi

cp ${ipaName}_${newVersion}.plist /Users/dfub/.jenkins/workspace/IPA_PLIST/${ipaName}_${newVersion}.plist

#git add .
#git commit -m "${ipaName}"
#git push origin master

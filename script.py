import os
date = input("Enter the date of data you want to restore in YYYY-MM-DD format : ")
path = "/var/spool/voipmonitor/"+date
os.mkdir(path)
for i in range(24):
    if i < 10:
        j = str(i)
        j = "0"+j
    else:
        j = str(i)
 
    path2 = path
    path2 = path2+'/'+j
    os.mkdir(path2)
 
    for k in range(60):
        if k < 10:
            l = str(k)
            l = "0"+l
        else:
            l = str(k)
 
        path3 = path2
        path3 = path3+'/'+l
        os.mkdir(path3)
 
for i in range(24):
    if i < 10:
        j = str(i)
        j = "0"+j
    else:
        j = str(i)
 
    for k in range(60):
        if k < 10:
            l = str(k)
            l = "0"+l
        else:
            l = str(k)
         
        try:
            path = "aws s3 cp s3://cas-pcap-recordings/"+date+"/" + j + "/" + l + "/ /var/spool/voipmonitor/"+date+"/" + j + "/" + l + "/ --recursive"
            print(path)
            os.system(path)
        except ClientException as e:
            print(e.response["Error"]["Code"])


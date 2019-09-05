import paramiko

client = paramiko.SSHClient()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
client.connect('10.40.1.10', username='vagrant', password='vagrant')

stdin, stdout, stderr = client.exec_command('touch heelo')

#for line in stdout:
 #   print line.strip('\n')

client.close()

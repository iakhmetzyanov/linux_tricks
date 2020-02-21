import subprocess
import smtplib
from email.mime.text import MIMEText

threshold = 95
partition = "/dev"
partitions = ("/","/mnt/data")
adresses= ("myemail@myemailserver.com","anotheremail@emailserver.org")

def report_via_email():
 for adress in adresses:
  msg = MIMEText("Server is running out of disk space")
  msg["Subject"] = "Low disk space warning"
  msg["From"] = "from_user_allowed_by_email_gate@emailserver_gate.com"
  msg["To"] = adress
  server=smtplib.SMTP("smtp.gateserver.com")
  server.sendmail("from_user_allowed_by_email_gate@emailserver_gate.com",adress,msg.as_string())
  server.quit()

def check_once():
 df = subprocess.Popen(["df","-h"], stdout=subprocess.PIPE)
 for line in df.stdout:
   splitline = line.split()
   for disk in partitions:
    if disk == splitline[5]:
     if int(splitline[4][:-1]) > threshold:
      print splitline[3] +" "+ splitline[4] +" "+ splitline[5]
      report_via_email()
check_once()

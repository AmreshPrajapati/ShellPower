import os

name = input("Enter employee name :-   ")
ip = input("Enter IP Address :-   ")
name1 = name.replace(" ", ".")
un = name1.lower()
print("\n    " + name + "\n    IP Address      : " +  ip + """
    Subnetmask      : 255.255.0.0/16
    Default gateway : 192.168.1.10
    Primary DNS     : 192.168.1.21
    Secondary DNS   : 192.168.1.10
    Email Address   : """+ un +"""@coditas.com
---------------------------------------------
    Sophos Credentials
    Username        : """+ un + """
    Password        : admin""")

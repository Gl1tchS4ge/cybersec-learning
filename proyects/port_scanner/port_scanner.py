import socket
import threading

url = input("What address do u want to scan?: ")
ip_address = socket.gethostbyname(url)
common_ports = [21, 22, 80, 443, 8080]

print("Note: \
      there are 65,536 port available starting from 0")
print("Start port should be smaller than the end port")
scan_type = int(input("What scan option do u want to do? \
                  1 = Common Ports \
                  2 = Manual Input of ports "))

if scan_type == 1: 
    scan_port = common_ports
else: 
    s_port = int(input("From what port do u want to scan? "))
    e_port = int(input("Until what port do u want to scan? "))
    scan_port = range(s_port, e_port + 1)

def scanning(ip, port):
    s = None
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(1)
        result = s.connect_ex((ip, port))
        if result == 0:
            print(f"Port {port} is open")
    finally:
        if s is not None:
            s.close()

thread_list = []

for p in scan_port:
    scan_thread = threading.Thread(target=scanning, args=(ip_address, p))
    scan_thread.start()
    thread_list.append (scan_thread)
for t in thread_list:
    t.join()


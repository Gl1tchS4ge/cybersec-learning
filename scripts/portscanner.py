import socket
url = input("What address do u want to scan?: ")
ip_address = socket.gethostbyname(url)

for i in range(1, 100):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    result = s.connect_ex((ip_address, i))
    if result == 0:
        print(f"{i} open") 
    s.close()

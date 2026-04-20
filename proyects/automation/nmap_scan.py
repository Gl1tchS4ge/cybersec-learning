import subprocess 

## This is my first attemtp on automating a nmap scan 
print("What type of scan do you want to do? ");

scan_type = input("full or fast: ")
target = input("Give me the IP of the target: ")
print("Startint Starting")
output_file = input("Give me the name of the file you want the output: ");
if scan_type == "full": 
    scan = subprocess.run(["nmap", "-sV", "-sC", "-T5", "-p-", "-o", f"{scan_type}", f"{output_file}", f"{target}" ]);
    with open(f"{output_file}", "r", enconding="utf-8") as f:
        content = f.read
    print(content);
else: 
    scan = subprocess.run(["nmap", "-sV", "-sC", "-T5", "-F", "-o", f"{scan_type}", f"{output_file}", f"{target}" ]);
    with open(f"{output_file}", "r", enconding="utf-8") as f:
        content = f.read
    print(content);


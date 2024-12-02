import socket

def start_client():
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    host = "127.0.0.1" 
    port = 12345       
    client_socket.connect((host, port))
    print(f"Connected to server at {host}:{port}")

    
    while True:
        
        client_message = input("You: ")
        client_socket.send(client_message.encode())
        if client_message.lower() == "exit":
            print("Closing connection.")
            break

        
        server_message = client_socket.recv(1024).decode()
        if not server_message:
            print("Server disconnected.")
            break

        print(f"Server: {server_message}")

   
    client_socket.close()

if __name__ == "__main__":
    start_client()

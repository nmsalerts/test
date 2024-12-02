import socket

def start_server():
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    host = "127.0.0.1"  
    port = 12345       
    server_socket.bind((host, port))

    
    server_socket.listen(1)
    print(f"Server started at {host}:{port}")
    print("Waiting for a client to connect...")

    
    client_socket, addr = server_socket.accept()
    print(f"Client connected from {addr}")

    while True:
        
        client_message = client_socket.recv(1024).decode()
        if not client_message or client_message.lower() == "exit":
            print("Client disconnected.")
            break

        print(f"Client: {client_message}")

        server_message = input("You: ")
        client_socket.send(server_message.encode())
        if server_message.lower() == "exit":
            print("Closing connection.")
            break

    client_socket.close()
    server_socket.close()

if __name__ == "__main__":
    start_server()


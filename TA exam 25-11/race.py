import threading

# Shared resource
counter = 0

def increment(n):
    for _ in range(n):
        counter += 1
    return counter

# Create two threads
thread1 = threading.Thread(target=increment)
thread2 = threading.Thread(target=increment)

# Start threads
thread1.start()
thread2.start()

# Wait for threads to finish
thread1.join()
thread2.join()

n = int(input("Enter a number: "))

print("Final counter value:", counter)

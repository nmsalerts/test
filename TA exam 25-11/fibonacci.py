def fibonacci(n):
    fib_seq = []
    a, b = 0, 1
    for _ in range(n):
        fib_seq.append(a)
        a, b = b, a + b
    return fib_seq

n = int(input("Enter the terms:"))

print("fibonacci sequence: ", fibonacci(n))
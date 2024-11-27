def is_prime(num):  # Function to check if a number is prime
    if num <= 1:  # 1 or below is not prime
        return False
    for i in range(2, int(num**0.5) + 1):  # Check divisors up to square root of number
        if num % i == 0:  # If divisible, it's not prime
            return False
    return True  # If no divisors found, it's prime

num = int(input("Number:"))

print(is_prime(num))  # Example usage

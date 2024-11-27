def compute_hcf(x, y):
    while y:
        x, y = y, x % y
    return x
    
def compute_lcm(x, y):
    hcf = compute_hcf(x, y)
    return (x * y) // hcf

num1 = int(input("Enter the First number: "))
num2 = int(input("Enter the second number: "))

hcf = compute_hcf(num1, num2)    
lcm = compute_lcm(num1, num2)

print(f"HCF of {num1} and {num2} is : {hcf}")    
print(f"LCM of {num1} and {num2} is : {lcm}")    
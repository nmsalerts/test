import csv
import os
import string
import random
import subprocess
import sys
def main(arg):
   try:
      PWD_SIZE = 20
      #opens CSV file of desired new users
      f = open(arg)
      csv_f = csv.reader(f)
      notAddedUsers = []
      #reads csv line by line, with the syntax [First,Last,Email,Role1,...,RoleX]
      for row in csv_f:
         try:
            #creates a 20 char long random alphanumeric password
            pwd = generate_temp_password(PWD_SIZE)
            firstname = row[0].strip()
            lastname = row[1].strip()
            username = firstname+"."+lastname
            email = row[2].strip()
            #creates an array containing all the roles
            groups = row[3:]
            #command to add the user to free ipa with username, first name, last name and email
            addUserCommand = ("ipa user-add " + username + " --first " + firstname + \
                              " --last " + lastname + " --email " + email)
            #command to set password for the user created in the previous step
            setUserPassCommand = ("ipa passwd " + username + " " + pwd)
            #try-except block to check if user is already in the system.
            #If the user is in the system, subprocess.CalledProcessError exception is thrown.
            #If it's a new user, the user is added and password is initialized. Then, the user is emailed with username and password
            try:
               subprocess.check_output(addUserCommand, stderr=subprocess.STDOUT, shell=True)
               subprocess.call(setUserPassCommand, shell=True)
               for group in groups:
               #attempts to add user to a role by role name or role id with allowing spaces in role names
                  try:
                     setUserRoleCommand = ("ipa group-add-member '" + group.strip() + "' --user " + username)
                     subprocess.check_output(setUserRoleCommand, stderr=subprocess.STDOUT, shell=True)
                     print(username + " has been added to the group: " + group.strip())
                  except(subprocess.CalledProcessError):
                     print("WARNING!!! " + username + " not added to " + group.strip())
               #using mutt to send email
               emailCommand = ("echo 'Hi " + firstname + " " + lastname + ", Your account has been created in free ipa. Your username is : " + \
                               username + " and password is " + pwd + ". You will be prompted to change your password after logging in initially.' | mutt -s 'Freeipa User Account Created' " + email)
               subprocess.call(emailCommand, shell=True)
               print(username + " created successfully")
               print("------------------------------")
            except(subprocess.CalledProcessError):
               print("WARNING!!!! " + username + " already exists")
               notAddedUsers.append(username)
         except(IndexError):
            print("Index out of range error")
            notAddedUsers.append(username)
      print "Users that were not added: " + ', '.join(notAddedUsers)
   except(IOError):
      print("Error opening file. Exiting program...")
 
#function to create a secure password
def generate_temp_password(length):
   chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"
   return "".join(chars[ord(c) % len(chars)] for c in os.urandom(length))
if __name__ == '__main__':
   main(sys.argv[1])

#TRUTHY AND FALSY

#----------------------------------------------------------
# 1 =True and 0 = False

#Checking
#print(bool([])) #Output: False (Empty lists return false)
#print(bool((None))) #Output: False
#print(bool([200])) #Output: True


# Practical example: Checking for users
#users: dict = {1: "Mario", 2: "Luigi", 3: "James" }

#if users: #Truthy value =TRUE
   # for k, v in users.items():
        #print(k, v, sep=': ')
  
#else:
   # print("No data found.")
#----------------------------------------------------------

# COMPARING FLOATS

print(.1 +.2 ==.3)
print(f'.1 +.2 ={.1 + .2}') 
#Output: .1 +.2 =0.30000000000000004
#Storing this will take up a lot of memory
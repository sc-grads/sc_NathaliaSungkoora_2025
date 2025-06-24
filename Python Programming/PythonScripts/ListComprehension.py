#LIST COMPREHENSION

numbers = [1, 3, 5]
doubled = [x * 2 for x in numbers]

# Practice with STRINGS

friends = ["Rolf", "Sam", "Samantha", "Saurabh", "Jen"]
starts_s = []

 #ADDing FOR LOOP with IF Statement and IN keyword
for friend in friends:
    if friend.startswith("S"):
        starts_s.append(friend)

print(starts_s)


#Make a new list with names that start with an "S"

friends = ["Rolf", "Sam", "Samantha", "Saurabh", "Jen"]
starts_s = [friend for friend in friends if friend.startswith("S")]

print(starts_s) #Output: ['Sam', 'Samantha', 'Saurabh']

#LIST COMPREHENSION

friends = ["Sam", "Samantha", "Saurabh"]
starts_s = [friend for friend in friends if friend.startswith("S")]
#Output (SAME as above): ['Sam', 'Samantha', 'Saurabh']

print(friends)
print(starts_s)
print(friends is starts_s) #Check if lists are the ame or not Output= False
print("friends: ", id(friends), " starts_s: ", id(starts_s)) #Output = friends:  2782069779904  starts_s:  2782069780032
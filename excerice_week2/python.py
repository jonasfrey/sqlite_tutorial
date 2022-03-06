def remove_duplicates(a_1): 
    return list(dict.fromkeys(a_1))

def equals(a_1, a_2): 
    a_1 = remove_duplicates(a_1)
    a_2 = remove_duplicates(a_2)

    b_equal = True
    for n in a_1: 
        if n not in a_2: 
            b_equal = False
            break

    if len(a_1) != len(a_2):
        b_equal = False

    return b_equal

a_1 = [1,3,5,6,5]
a_2 = [5,3,1,6,5]
print(f"{a_1} equals {a_2} : {equals(a_1, a_2)}")

a_1 = [3,3,3,1]
a_2 = [5,3,1,6,5]
print(f"{a_1} equals {a_2} : {equals(a_1, a_2)}")

a_1 = [2,3,4]
a_2 = [3,4,4]
print(f"{a_1} equals {a_2} : {equals(a_1, a_2)}")

a_1 = [4,4,2,2,11]
a_2 = [2,4,2,4,11]
print(f"{a_1} equals {a_2} : {equals(a_1, a_2)}")

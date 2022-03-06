

def union(a_booleans_s, a_booleans_t):
    a_booleans_bigger = a_booleans_t
    a_booleans_smaller = a_booleans_s
    if len(a_booleans_s) > len(a_booleans_t): 
        a_booleans_bigger = a_booleans_s
        a_booleans_smaller = a_booleans_t

    for index, b in enumerate(a_booleans_bigger): 
        if b == False: 
            if len(a_booleans_smaller)-1 >= index: 
                a_booleans_bigger[index] = a_booleans_smaller[index]

    return a_booleans_bigger


def subset(a_booleans_s, a_booleans_t):
    # return true if a_booleans_s is a subset of a_booleans_t
    b_is_subset = True
    b_first_value = False
    for index, b in enumerate(a_booleans_s): 
        if(b): 
            b_first_value = True
        if(b_first_value):
            if(a_booleans_t[index] != b):
                b_is_subset = False 
                break

    return b_is_subset


a_b_1 = [False, False, False, False, True, False, False, True] # {4,7}
a_b_2 = [False, True, False, True, True, False, False, True] # {1,3,4,7}
print(f"{a_b_1} subset {a_b_2} :\n {subset(a_b_1, a_b_2)}")



a_b_1 = [False, False, True, True, False, True] # {2, 3, 5}
a_b_2 = [False, True, True, False, False, False, True] # {1,2,6}
a_unioned = union(a_b_1, a_b_2) # [False, True, True, True, False, True, True] -> {1,2,3,5,6} 

print(f"{a_b_1} union {a_b_2} :\n {union(a_b_1, a_b_2)}")


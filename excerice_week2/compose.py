from re import L


def compose(a_2d_booleans_r, a_2d_booleans_t): 
    #a_2d_booleans_r after a_2d_booleans_t
    o_mapping_1 = {}
    for index_y, a_2d_booleans_t_x in enumerate(a_2d_booleans_t):
        for index_x, b in enumerate(a_2d_booleans_t_x):
            if(b):
                o_mapping_1[index_y] = index_x
    
    o_mapping_2 = {}
    for index_y, a_2d_booleans_r_x in enumerate(a_2d_booleans_r):
        for index_x, b in enumerate(a_2d_booleans_r_x):
            if(b):
                o_mapping_2[index_y] = index_x


    o_mapping_final = {}

    for key in o_mapping_1: 
        val = o_mapping_1[key]

        o_mapping_final[key] = o_mapping_2[int(val)]

    return o_mapping_final



a_2d_booleans_r = [
    [False, True, True, False],
    [True, True, False, False,],
    [False, False, False, True],
    [False, True, True, True]
]
a_2d_booleans_t = [
    [False, True, False, True],
    [True, True, False, False,],
    [False, True, False, False],
    [False, True, False, False]
]
o_mapping_final = compose(a_2d_booleans_r, a_2d_booleans_t)
print(
"""
a_2d_booleans_r = [
    [False, True, True, False],
    [True, True, False, False,],
    [False, False, False, True],
    [False, True, True, True]
]
composed with 
a_2d_booleans_t = [
    [False, True, False, True],
    [True, True, False, False,],
    [False, True, False, False],
    [False, True, False, False]
]
= """
)
print(
    o_mapping_final
)
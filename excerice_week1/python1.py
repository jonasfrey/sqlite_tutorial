def index_of(s_haystack, s_searchterm): 
    n_index = -1
    try: 
        n_index = s_haystack.index(s_searchterm) 
        return n_index
    except: 
        return -1

a_instructor_records = open("instructor.csv", "r").readlines()
a_result = list(filter(lambda s_record:  index_of(s_record, "22222,") == 0, a_instructor_records))
print("-----records-----")
print("\n".join(a_result))


a_results = []


a_instructor_records = open("instructor.csv", "r").readlines()
a_records_instructor = list(filter(lambda s_record: index_of(s_record, ",Einstein,") != -1,a_instructor_records))

a_instructor_columnnames = a_instructor_records[0].strip().split(",")


a_department_records = open("department.csv", "r").readlines()
a_department_columnnames = a_department_records[0].strip().split(",")
a_department_records_results = []
a_instructor_records_results = []


for s_instructor_record in a_records_instructor:
    a_recs =  list(filter(lambda s_record: (index_of(s_record, s_instructor_record.split(",")[a_instructor_columnnames.index("dept_name")]) != -1), a_department_records))
    if(len(a_recs) > 0): 
        a_department_records_results = a_department_records_results + a_recs
        a_instructor_records_results.append(s_instructor_record)


s_colname = "building"

print("---records instructor ---")
n_col_index = 0
try:
    n_col_index = a_instructor_columnnames.index(s_colname)
    for s_record in a_instructor_records_results:
        print(
            s_record.split(",")[n_col_index]
        )
except:
    print(s_colname+ ": column does not exist in instructor.csv")



# print(n_col_index = a_department_columnnames.index(s_colname))
print("---records department ---")
n_col_index = 0
try:
    n_col_index = a_department_columnnames.index(s_colname)

    for s_record in a_department_records_results:
        # print(s_record)
        print(s_record.split(",")[n_col_index])
except:
    print(s_colname+ ": column does not exist in department.csv")
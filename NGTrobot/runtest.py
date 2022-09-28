import os,sys
from subprocess import call
import time
from datetime import datetime
import os.path

timestamp = time.strftime('%Ihr-%Mmin')
current_month_text = datetime.now().strftime('%h')
current_year = datetime.now().strftime('%Y')
current_day = datetime.now().strftime('%d')


if __name__ == '__main__':
    cur_dir = os.path.dirname(os.path.realpath(__file__))
    result = cur_dir +"\\"+"output" + "\\" + current_year + "\\" + current_month_text + "-" + current_day + "\\" + timestamp
    #result = cur_dir +"\\"+"output"
    if not os.path.exists(result):
        #os.makedirs(result)
        pass
    if ".txt" in sys.argv[1] and sys.argv[2]:
        test_dir = cur_dir + "\\"+"Test\\TestSuite\\{}".format(sys.argv[2])
        tag_file = cur_dir + "\\" + "Test" + "\\" + "TestSuite" + "\\" + sys.argv[1]
        if os.path.isfile(tag_file):
            with open(tag_file) as f:
                tags = f.readlines()
                tags_to_run = [i.strip() for i in tags]
        else:
            print("File {} not found.".format(sys.argv[1]))
        for tag in tags_to_run:
            print("#############################")
            print("Running Tag : {}".format(tag))
            print("#############################")
            call(["robot", "--outputdir", "C:/NGTrobot/output/%date:~-4,4%%date:~-10,2%%date:~-7,2% --timestampoutputs"] + ["-i",tag] + [test_dir], shell=os.name=='nt')
    else:
        print("#####################################################")
        print("Running tests from Robot file : {}".format(sys.argv[1]))
        print("#####################################################")
        test_dir = "Test\\TestSuite\\{}".format(sys.argv[1])
        call(["robot", "--outputdir", result] + [test_dir], shell=os.name=='nt')
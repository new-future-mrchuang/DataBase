# coding = utf-8
last = 2**31+1;
for i in [30,28,28,28,26,26,26,20,14,14,14]:
    print "[", last-2**i,"  ,    ",last-1, "    ]"
    last = last-2**i;
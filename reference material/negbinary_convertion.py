# conversion to negbinary

x = int(input("Give a decimal number: "))
i = 0
while i < 16:
    x = i
    negbinary = []
    while x != 0:
        #print("Current x: %d"%x)
        r = x % -2
        negbinary.append(-1*r)
        x = x // -2
        #print("Step: x -> %d, r -> %d"%(x, r))
        if r < 0:
            r = r + 2
            x = x + 1
            #print("If accessed! : new r -> %d, new x -> %d"%(r, x))
    negbinary.reverse()

    print("\tNegbinary: "+" ".join(map(str,negbinary))+"->\tbinary size: "+str(len(negbinary)))
    i += 1


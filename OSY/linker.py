import sys

class linker:
    def __init__(self, args):
        self.file = args[0]
        self.output = ""
        self.coms = {"include": self.include}
        self.main(args)
        
        
    def main(self, args):
        lines =[]
       #if 
        with open(self.file) as f:
            lines = f.readlines()
        for line in lines:
            lin = line.split("//")
            if len(lin) >= 2:
                lin = lin[1:]
                li = ""
                for l in lin:
                    li += l
                
                line = li.split(" ")
                self.coms[line[0]](line[1:])
            else:
                self.output += line
                
        self.write()
        
    def write(self):
        fi = self.file.split(".")[0]
        ln = fi + ".lnkd"
        with open(ln, "w") as f:
            f.write(self.output)
    def include(self, args):
        print(args)
        nflag = False
        if args[0][-1:] == "\n":
            args[0] = args[0][:-1]
            nflag = True
        if args[0][-1:] == "\r":
            args[0] = args[0][:-1]
        with open(args[0]) as f:
            for l in f.readlines():
                self.output += l
            if nflag:
                self.output += "\n"

ker = linker(sys.argv[1:])

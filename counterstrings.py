import sys

def counter_string(target_length = 0, spacer="*"):
    pointer_length = target_length
    ret  = ""
    while target_length > len(ret):
        to_add = str(pointer_length)
        ret = to_add+spacer+ret
        pointer_length-=(len(to_add)+1)
        if pointer_length == 1:
            ret = spacer+ret
            break
    print "len is:", len(ret), "should be:",target_length
    #print ret

if __name__ == "__main__":
    counter_string(int(sys.argv[1]))
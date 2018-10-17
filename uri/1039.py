from math import sqrt


def input_int_list():
    return [int(i) for i in input().strip().split(' ')]


def obteu_flor(rc, xc, yc, rf, xf, yf):
    d = sqrt((xc - xf) ** 2 + (yc - yf) ** 2)

    return rc >= (rf + d)


def main():
    while True:
        try:
            rc, xc, yc, rf, xf, yf = input_int_list()
        except EOFError:
            return

        if obteu_flor(rc, xc, yc, rf, xf, yf):
            print('RICO')
        else:
            print('MORTO')


main()

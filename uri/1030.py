def input_int_list():
    return [int(i) for i in input().split(' ')]


def josephus(n, k):
    r = 0

    for i in range(2, n + 1):
        r = (r + k) % i

    return r + 1


def main():
    num_test_cases = int(input())

    for i in range(num_test_cases):
        n, k = input_int_list()

        r = josephus(n, k)

        print('Case {}: {}'.format(i + 1, r))


main()

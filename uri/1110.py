def throw_away(n):
    discarded = []
    deck = list(range(1, n + 1))

    while len(deck) > 1:
        discarded.append(deck.pop(0))
        moved = deck.pop(0)
        deck.append(moved)

    return discarded, deck[0]


def main():
    while True:
        n = int(input())

        if n <= 0:
            return

        discarded, remaining = throw_away(n)

        print('Discarded cards:', ', '.join(str(i) for i in discarded))
        print('Remaining card:', remaining)


main()

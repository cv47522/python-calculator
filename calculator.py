def add(first_val, second_val):
    print(first_val + second_val)
    return first_val + second_val


def subtract(first_val, second_val):
    print(first_val - second_val)
    return first_val - second_val


def multiply(first_val, second_val):
    print(first_val * second_val)
    return first_val * second_val


if __name__ == "__main__":
    import sys
    globals()[sys.argv[1]](int(sys.argv[2]), int(sys.argv[3]))

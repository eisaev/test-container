#!/usr/bin/env python3

"""Useless script"""

import sys


def main() -> int:
    """Don't do anything interesting, it just outputs 'Nothing!'"""
    print(f'Nothing! {sys.argv}')
    return 0


if __name__ == '__main__':
    sys.exit(main())

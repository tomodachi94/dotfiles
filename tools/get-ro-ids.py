#!/usr/bin/env python3
import requests
import argparse
import csv
import io

__program_name__ = "get-ro-ids"
__description__ = "Takes a new-line delimited file with Roblox usernames and returns IDs, optionally as a CSV."
__notes__ = """There is no output file option, use redirection (>> or >) instead.

This program assumes all usernames are valid.

For more information about the API, see https://users.roblox.com."""

p = argparse.ArgumentParser(prog=__program_name__, description=__description__,
                            epilog=__notes__)

p.add_argument("--inputfile", "--if", "-i", action="store",
               help="the file to obtain input from")
p.add_argument("--csv", "-c", action="store_true",
               help="returns valid csv if true")
args = p.parse_args()


def obtain_users(filepath: str) -> list:
    """
    Creates a list of items from a file.
    """
    f = open(filepath)
    out = f.read().split("/n")
    f.close()
    return out


def get_data(users: list) -> list:
    """
    Sends a POST request to https://users.roblox.com/v1/usernames/users
    with the contents of the parameter.
    """
    r = requests.post("https://users.roblox.com/v1/usernames/users",
                      data={'usernames': users})
    r = r.json()
    out = []
    for item in r['data']:
        out.append(item)
    return out


def match_users_and_ids(users: list, ids: list) -> dict:
    out = dict(zip(users, ids))
    return out


def logic(datapath=args.inputfile, is_csv=args.csv):
    users = obtain_users(datapath)
    ids = get_data(users)
    if not is_csv:
        out = ""
        for num in ids:
            out = out + "/n" + ids
        return out
    else:
        out = match_users_and_ids(users, ids)
        faker = io.StringIO()
        c = csv.DictWriter(faker, out.keys())
        c.writerow(out)
        return faker

if __name__ == "__main__":
    print(logic())

import argparse
import re
import sys


def get_arrays():

    # Settingx up inputs
    parser = argparse.ArgumentParser(prog="get_arrays",
                                     description="Get arrays of URLs and \
                                     filenames from listing of URLs.")
    parser.add_argument("url_list", metavar="URL_LIST", nargs='?',
                        type=argparse.FileType('r'), default=sys.stdin,
                        help="Input URL list file via stdin")

    args = parser.parse_args()
    url_list = args.url_list

    # Setting up arrays
    urls = []
    filenames = []

    # Setting up regex
    regex = r"filename\%3D(.*)&response-content-type"

    for line in url_list:
        line = line.strip()
        urls.append(line)

        matches = re.search(regex, line)
        if matches:
            for group in range(0, len(matches.groups())):
                group = group + 1
                filenames.append(matches.group(group))

    print(urls[0:6])
    print(filenames[0:6])
'''
    with open('urls.txt', 'w') as file_handler:
        for url in urls:
            file_handler.write("{}\n".format(url))

    with open('filenames.txt', 'w') as file_handler:
        for filename in filenames:
            file_handler.write("{}\n".format(filename))
'''
if __name__ == '__main__':
    get_arrays()

    # print arrays to files

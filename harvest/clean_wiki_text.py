# load given file
# clean the text
# save the cleaned text to a new file

import re
import sys
from io import StringIO
from html.parser import HTMLParser

in_file = sys.argv[1]

word_chars = r'[^a-zA-Z0-9ęĘóÓąĄśŚłŁżŻźŹćĆńŃ]'
allowed_chars = word_chars+r'[^\n\t]'

class MLStripper(HTMLParser):
    def __init__(self):
        super().__init__()
        self.reset()
        self.strict = False
        self.convert_charrefs= True
        self.text = StringIO()
    def handle_data(self, d):
        self.text.write(d)
    def get_data(self):
        return self.text.getvalue()
    
def strip_tags(html):
    s = MLStripper()
    s.feed(html)
    return s.get_data()


def clean_line(line):
    # # remove links of he form {{content}}
    # line = re.sub(r'\{\{(.*?)\}\}', '', line)
    # # '''<word>''' => <word>
    # line = re.sub(r"'''(.*?)'''", r'\1', line)
    # # [[<to_remove>|<word>]] => <word>
    # line = re.sub(r'\[\[(.*?)\|(.*?)\]\]', r'\2', line)
    # # remove html tags while retaining the inner content
    # line = strip_tags(line)
    # # remove multiple spaces
    # line = re.sub(r' +', ' ', line)

    # # remove html tags
    # text = re.sub(r'<.*?>', '', text)
    # replace special characters (except polish) with @#
    line = re.sub(r'[^a-zA-Z0-9\s\n\tęĘóÓąĄśŚłŁżŻźŹćĆńŃ]', '', line)
    
    return line

def main(in_filename):
    out_filename = f'{in_filename}.cleaned'
    # load the file
    with open(in_filename, 'r') as infile, open(out_filename, 'w') as outfile:
        for line in infile:
            # clean the line
            line = clean_line(line)
            # save the cleaned line to a new file
            outfile.write(line)

if __name__ == '__main__':
    main(in_file)
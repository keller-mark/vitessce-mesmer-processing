import argparse
from bs4 import BeautifulSoup

def add_channel_names(in_xml_file, out_xml_file):
  
  with open(in_xml_file) as f:
    in_xml = f.read()
  
  soup = BeautifulSoup(in_xml, 'xml')
  
  channel_els = soup.find_all('Channel')
  
  channel_names = [
    "Nuclear marker",
    "Cytoplasm marker",
  ]
  
  for name, el in zip(channel_names, channel_els):
    el['Name'] = name
    
  with open(out_xml_file, "w") as f:
    f.write(str(soup))

if __name__ == "__main__":
  parser = argparse.ArgumentParser()
  parser.add_argument(
    '-i',
    '--input',
    type=str,
    required=True,
    help='The input OME-XML file.'
  )
  parser.add_argument(
    '-o',
    '--output',
    type=str,
    required=True,
    help='The output OME-XML file.'
  )
  args = parser.parse_args()
  
  add_channel_names(
    args.input,
    args.output
  )
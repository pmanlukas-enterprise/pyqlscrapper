import graphene
import extraction
import requests


def extract(url):
    html = requests.get(url).text
    extracted_html = extraction.Extractor().extract(html, source_url=url)
    return extracted_html

print(extract("https://spiegel.de"))


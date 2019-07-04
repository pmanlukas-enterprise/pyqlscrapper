import requests

def scrape_site(url):
    q = """
        { 
        website(url: "{}") {
            title
            image
            description
        }
        }
        """.format(url)
    resp = requests.post("http://localhost:5000/", params={'query': q})
    return resp

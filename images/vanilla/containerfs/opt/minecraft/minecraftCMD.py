import urllib.request, urllib.error, urllib.parse
import json

def get_json_from_url(url):
    req = urllib.request.Request(url)
    opener = urllib.request.build_opener()
    f = opener.open(req)
    return json.loads(f.read())


def get_version_of_jar(ver,cat='server'):
    json = get_json_from_url("http://launchermeta.mojang.com/mc/game/version_manifest.json")
    for version in json['versions']:
        if version['id'] == ver:
            version_json = get_json_from_url(version['url'])
            return version_json['downloads'][cat]['url']

def get_latest_release():
    json = get_json_from_url("http://launchermeta.mojang.com/mc/game/version_manifest.json")
    return json['latest']['release']

latest_version = get_latest_release()
print(get_version_of_jar(latest_version))

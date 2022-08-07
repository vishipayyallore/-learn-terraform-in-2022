from urllib.request import urlopen
URL = 'https://cloudacademy.com'
TEXT = 'AWS'


def lambda_handler(event, context):
    print('Event: %s' % event)
    t = event.get('time') or "?"
    with urlopen(URL) as u:
        output = u.read().decode('utf-8')
        if output:
            if TEXT in output:
                return "SUCCESS at %s" % t
    print('%s not found in %s at %s' % (TEXT, URL, t))
    return "FAILURE"

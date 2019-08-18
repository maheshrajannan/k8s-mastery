from textblob import TextBlob
from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route("/analyse/sentiment", methods=['POST','GET'])
def analyse_sentiment():
    sentence = request.get_json()['sentence']
    print('sentence is:',sentence)
    polarity = TextBlob(sentence).sentences[0].polarity
    es_blob = TextBlob(sentence).translate(to='es')
    return jsonify(
        sentence=sentence,
        spanishTranslation=es_blob,
        polarity=polarity
    )


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

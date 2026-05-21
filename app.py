from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/', methods=['GET'])
def home():
    return jsonify({"message": "Hello DevSecOps!"})

@app.route('/api/health', methods=['GET'])
def health():
    return jsonify({"status": "healthy"})

@app.route('/api/echo', methods=['POST'])
def echo():
    data = request.get_json()
    return jsonify({"echo": data})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=False)
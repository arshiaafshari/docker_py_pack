from flask import Flask
import  numpy as np
import  pandas as pd

app = Flask(__name__)


@app.route('/')
def hello_world(): 
    return 'Hello World!'+str(np.array([1, 2, 3]))+str(pd.DataFrame({'a': [1, 2, 3]}))


if __name__ == '__main__':
    app.run()

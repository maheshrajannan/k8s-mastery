import React, {Component} from 'react';
import './App.css';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import TextField from 'material-ui/TextField';
import RaisedButton from 'material-ui/RaisedButton';
import Paper from 'material-ui/Paper';
import Polarity from "./components/Polarity";

const style = {
    marginLeft: 12,
};

class App extends Component {
    constructor(props) {
        super(props);
        this.state = {
            sentence: '',
            spanishTranslation: '',
            polarity: undefined
        };
    };

    analyzeSentence() {
        console.log("Contacting localhost:8080");
        fetch('http://localhost:8080/sentiment', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({sentence: this.textField.getValue()})
        })
            .then(response => response.json())
            .then(data => this.setState(data));
    }

    onEnterPress = e => {
        if (e.key === 'Enter') {
            this.analyzeSentence();
        }
    };

    render() {
        const polarityComponent = this.state.polarity !== undefined ?
            <Polarity sentence={this.state.sentence} polarity={this.state.polarity} spanishTranslation ={this.state.spanishTranslation}/> :
            null;

        return (
            <MuiThemeProvider>
                <div className="centerize">
                    <Paper zDepth={1} className="content">
                        <h2>Translator</h2>
                        <TextField id="yourSentenceId" ref={ref => this.textField = ref} onKeyUp={this.onEnterPress.bind(this)}
                                   hintText="Type your sentence."/>
                        <RaisedButton id="yourSentenceSendId" label="Send" style={style} onClick={this.analyzeSentence.bind(this)}/>
                        {polarityComponent}
                    </Paper>
                </div>
            </MuiThemeProvider>
        );
    }
}

export default App;

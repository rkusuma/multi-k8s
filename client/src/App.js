import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import Fib from './Fib'; 
import OtherPage from './OtherPage';

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <p>
              Welcome to React Version 2
            </p>
            <Link to="/">Home</Link>
            <Link to="/otherPage">Other Page</Link>
          </header>
          <div>
            <Route exact path="/" component={Fib}></Route>
            <Route path="/otherPage" component={OtherPage}></Route>
          </div>
        </div>
      </Router>
    );
  }
}

export default App;

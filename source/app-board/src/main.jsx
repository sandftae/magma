import ReactDOM from 'react-dom/client'
import './assets/index.css'
import React from 'react'
import App from './App'

/**
 * Application entry point.
 *
 * Initializes the React root element, injects global styles, and renders the
 * App component within StrictMode for highlighting potential development issues.
 */
ReactDOM.createRoot(document.getElementById('root')).render(
    <React.StrictMode>
        <App/>
    </React.StrictMode>,
)
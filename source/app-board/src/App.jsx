import {HashRouter, Routes, Route, Navigate} from 'react-router-dom';
import {Layout} from './components/Layout';
import Services from './pages/Services';
import Credentials from './pages/Credentials';

/**
 * Root application component.
 *
 * Configures the HashRouter and defines the primary navigation routes.
 * Wraps all page components within the global Layout to ensure consistent branding and navigation.
 *
 * Routes:
 *      - /         : Redirects to /services
 *      - /services  : Renders the service dashboard
 *      - /creds     : Renders the service credentials table
 *
 * @component
 *
 * @returns {JSX.Element} The application router and route definitions.
 */
function App() {
    return (
        <HashRouter>
            <Layout>
                <Routes>
                    <Route path="/" element={<Navigate to="/services" replace/>}/>
                    <Route path="/services" element={<Services/>}/>
                    <Route path="/creds" element={<Credentials/>}/>
                </Routes>
            </Layout>
        </HashRouter>
    );
}

export default App;
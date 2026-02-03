import {Link, useLocation} from 'react-router-dom';
import {FOOTER_QUOTES} from '../data/data';
import WarningBanner from './WarningBanner';

/**
 * Main application layout component.
 *
 * Provides a standardized structure including a global warning banner,
 * navigation header with active link highlighting, and a contextual footer.
 *
 * @param {Object} props - component props
 * @param {React.ReactNode} props.children - content to be rendered within the main container
 *
 * @returns {JSX.Element} the structured page layout
 */
export const Layout = ({children}) => {
    const location = useLocation();
    const isCreds = location.pathname === '/creds';

    /**
     * Determines footer quote based on the current route.
     *
     * @type {{text: string, cite: string}}
     */
    const quote = isCreds ? FOOTER_QUOTES.credentials : FOOTER_QUOTES.services;

    /**
     * Generates CSS classes for navigation links based on active state.
     *
     * @param {string} path - the route path to compare against current location
     *
     * @returns {string} combined class names
     */
    const getLinkClass = (path) => {
        const baseClass = "block p-[14px_13px] font-bold hover:bg-[#c9e0ff] text-[#222] transition-colors";
        return location.pathname === path ? `${baseClass} text-primary` : baseClass;
    };

    return (
        <div className="mx-auto max-w-[800px] px-1.5 my-2.5 font-mono text-[13px] text-[#222]">
            <WarningBanner/>
            <header className="border-b border-[#00649455] mb-5">
                <nav>
                    <ul className="flex list-none p-0">
                        <li><a href="/" className="block p-[14px_13px] font-bold hover:bg-[#c9e0ff] text-[#222]">Commerce
                            Instance</a></li>
                        <li><Link to="/services" className={getLinkClass('/services')}>Services</Link></li>
                        <li><Link to="/creds" className={getLinkClass('/creds')}>Credentials</Link></li>
                        <li>
                            <a href="https://github.com/sandftae"
                               target="_blank"
                               rel="noreferrer"
                               className="block p-[14px_13px] font-bold hover:bg-[#c9e0ff] text-[#222]">Author</a>
                        </li>
                    </ul>
                </nav>
            </header>
            <main className="min-h-[300px]">{children}</main>
            <footer className="text-center mt-10 opacity-80 italic pb-5">
                <code>
                    <p>"{quote.text}"</p>
                    <cite className="text-[11px] block mt-1 text-muted not-italic">{quote.cite}</cite>
                </code>
            </footer>
        </div>
    );
};
import {CREDENTIALS_DATA} from '../data/data';
import {CopyableCell} from '../components/CopyableCell';

/**
 * Credentials page component.
 *
 * Renders a data table displaying default access information for various services.
 * Features include zebra-striping, hover states, and copy-to-clipboard functionality
 * for sensitive fields via the CopyableCell component.
 *
 * @component
 *
 * @returns {JSX.Element} a container with a page title, description, and the credentials table
 */
export default function Credentials() {
    return (
        <div className="animate-in fade-in duration-500">
            <h1 className="text-primary text-xl font-bold mb-2.5">&gt; Credentials</h1>
            <p className="mb-5 leading-relaxed text-[#222]">
                A table of the service's creds you can use to get access into the service's dashboards.
                Please note that these are the default credentials for services. Your custom credentials will not be
                displayed here.
            </p>
            <div className="overflow-x-auto border border-[#00649455] shadow-sm">
                <table className="w-full border-collapse bg-white text-[13px]">
                    <thead>
                    <tr className="bg-[#dcebff] border-b-2 border-primary">
                        <th className="text-left p-3 text-primary font-bold">Service</th>
                        <th className="text-left p-3 text-primary font-bold">Username</th>
                        <th className="text-left p-3 text-primary font-bold">Password</th>
                        <th className="text-left p-3 text-primary font-bold">Note</th>
                    </tr>
                    </thead>
                    <tbody>
                    {
                        CREDENTIALS_DATA.map((item, idx) => (
                            <tr key={idx}
                                className={`${idx % 2 === 0 ? 'bg-white' : 'bg-[#f5faff]'} hover:bg-[#c9e0ff] transition-colors`}>
                                <td className="p-3 border-b border-[#00649422]"><strong
                                    className="text-primary">{item.service}</strong></td>
                                <CopyableCell text={item.user}/>
                                <CopyableCell text={item.pass}/>
                                <td className="p-3 border-b border-[#00649422] text-[#222]">{item.note}</td>
                            </tr>
                        ))
                    }
                    </tbody>
                </table>
            </div>
        </div>
    );
}
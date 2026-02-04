import {useState, useEffect} from 'react';
import {SERVICES_DATA} from '../data/data';
import {pingService} from '../services/health';
import ServiceGroup from '../components/ServiceGroup';

/**
 * Services page component that acts as the main dashboard.
 * It flattens service data to perform sequential ping requests and manages the global
 * status state passed down to ServiceGroup components.
 *
 * @component
 *
 * @returns {JSX.Element} a view containing service groups and a legend for link accessibility
 */
export default function Services() {
    /**
     * State object storing the health status of each service.
     * Keyed by service ID with boolean or undefined values.
     *
     * @type {Object.<string, boolean|undefined>}
     */
    const [statuses, setStatuses] = useState({});

    useEffect(() => {
        /**
         * A handler to check the availability of the services.
         * Iterates through all grouped service items and updates state sequentially.
         */
        const checkServices = async () => {
            const allItems = SERVICES_DATA.flatMap(group => group.items);
            for (const item of allItems) {
                const result = await pingService(item.href);
                setStatuses(prev => ({...prev, [item.id]: result}));
            }
        };
        checkServices();
    }, []);

    return (
        <div>
            <h1 className="text-primary text-xl font-bold mb-[21px]">&gt; Services</h1>
            <p className="mb-[21px] text-[#222]">A collection of services and tools that come with the environment.</p>

            {SERVICES_DATA.map((group, idx) => (<ServiceGroup key={idx} {...group} statuses={statuses}/>))}

            <aside className="mt-[42px] p-4 bg-[#00649408] border-l-4 border-primary shadow-sm">
                <h3 className="text-primary font-bold mb-2.5">&gt; Note</h3>
                <ul className="space-y-2.5 text-[12px]">
                    <li className="flex items-start"><span className="mr-2">•</span> <span>Links are clickable only if the service is running/installed.</span>
                    </li>
                </ul>
            </aside>
        </div>
    );
}
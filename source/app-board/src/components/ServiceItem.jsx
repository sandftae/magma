import StatusDot from './StatusDot';
import {STATUS_CONFIG} from '../data/statusConfig';

/**
 * Represents an individual service entry within a list.
 * Conditionally renders a link or a span based on the service's online status,
 * and displays associated status indicators and metadata.
 *
 * @param {Object} props - component props
 * @param {Object} props.item - service data object
 * @param {string} props.item.name - display name of the service
 * @param {string} props.item.href - target URL for the service link
 * @param {string} props.item.text - description text of the service
 * @param {string} [props.item.highlight] - optional text to be highlighted in code tags
 * @param {string|number} props.status - current status key used to retrieve configuration
 *
 * @returns {React.JSX.Element} a list item element with conditional navigation logic.
 */
const ServiceItem = ({item, status}) => {
    const config = STATUS_CONFIG[String(status)];

    return (
        <li className="flex items-center">
            <StatusDot status={status}/>
            {config.isOnline ?
                (<a href={item.href} target="_blank" rel="noreferrer"
                    className="text-secondary font-bold hover:underline">{item.name}</a>)
                : (<span className="text-slate-600 font-bold cursor-not-allowed">{item.name}</span>)
            }
            <span className="text-[#222] mx-2"> – </span>
            <span className="text-[#222]">{item.text}</span>
            {item.highlight && <code className="text-primary ml-1 font-bold">{item.highlight}</code>}
        </li>
    );
};

export default ServiceItem;
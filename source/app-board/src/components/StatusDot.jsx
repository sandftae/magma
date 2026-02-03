import {STATUS_CONFIG} from '../data/statusConfig';

/**
 * A visual indicator representing the current operational status of a service.
 * Renders a colored circle with a tooltip based on the status configuration.
 *
 * @param {Object} props - component props
 * @param {string|number} props.status - the status identifier used to look up configuration
 *
 * @returns {JSX.Element} a span element styled as a status indicator dot.
 */
const StatusDot = ({status}) => {
    const config = STATUS_CONFIG[String(status)];
    return (<span title={config.title} className={`inline-block w-2.5 h-2.5 rounded-full mr-2 transition-all duration-300 ${config.colorClass}`}></span>);
};

export default StatusDot;
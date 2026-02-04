import ServiceItem from './ServiceItem';

/**
 * Renders a categorized group of services with descriptions and a list of items.
 *
 * @param {Object} props - component props
 * @param {string} props.category - the title of the service category
 * @param {string} props.description - primary description text for the group
 * @param {string} [props.extraDesc] - optional additional italicized description text
 * @param {Array<Object>} props.items - array of service objects to be rendered
 * @param {Object} props.statuses - map of service statuses indexed by item ID
 *
 * @returns {React.JSX.Element} a section containing a header, descriptions, and a list of service items
 */
const ServiceGroup = ({category, description, extraDesc, items, statuses}) => (
    <section className="mb-[31.5px] animate-in fade-in slide-in-from-bottom-2 duration-500">
        <h2 className="text-primary text-lg font-bold mb-2.5">{category}</h2>
        <p className="mb-2.5 leading-relaxed text-[#222]">{description}</p>
        {extraDesc && <p className="mb-2.5 leading-relaxed text-[#222] italic opacity-90">{extraDesc}</p>}
        <ul className="list-none p-0 space-y-1">
            {items.map((item) => (
                <ServiceItem key={item.id} item={item} status={statuses[item.id]}/>
            ))}
        </ul>
    </section>
);

export default ServiceGroup;
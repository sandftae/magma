import {COMMON_TEXTS} from '../data/data';

/**
 * A static banner component that displays system warnings and notifications.
 * Retrieves content from the global COMMON_TEXTS configuration and applies
 * specific styling to emphasize badges and file references.
 *
 * @returns {JSX.Element} a div containing a styled warning message and badge
 */
const WarningBanner = () => {
    const {warning} = COMMON_TEXTS;

    return (
        <div className="bg-[#ffe0b2] border border-[#a00040] p-3 mb-5 text-[#4a4a4a] font-medium shadow-sm">
            <p>
                <span className="inline-block bg-[#a00040] text-white font-bold text-[10px] px-1.5 py-0.5 mr-2.5 rounded">{warning.badge}</span>
                {warning.text}
                <span className="text-primary font-bold">{warning.file}</span>
                {warning.suffix}
            </p>
        </div>
    );
};

export default WarningBanner;
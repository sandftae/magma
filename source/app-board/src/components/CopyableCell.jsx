import {useState} from 'react';

/**
 * A table cell component that copies its text content to the clipboard on click.
 * Displays a "copy" hint on hover and a "COPIED!" notification upon successful action.
 *
 * @param {Object} props - component props
 * @param {string} props.text - the string content to be displayed and copied
 *
 * @returns {JSX.Element} a clickable table cell (td) element
 */
export const CopyableCell = ({text}) => {
    const [copied, setCopied] = useState(false);
    const baseClasses = "p-3 border-b border-[#00649422] relative group transition-colors";
    const isNone = text === "None";

    /** handles the clipboard copy operation */
    const handleCopy = () => {
        if (!text || text === "None") return;

        navigator.clipboard.writeText(text).then(() => {
            setCopied(true);
            setTimeout(() => setCopied(false), 1000);
        });
    };

    return (
        <td onClick={handleCopy}
            className={`${baseClasses} ${!isNone ? 'cursor-pointer hover:bg-[#c9e0ff]' : ''}`}>
            <code className={`${isNone ? 'italic text-muted' : 'text-primary font-bold'} bg-transparent`}>
                {isNone ? <em>None</em> : text}
            </code>
            {!isNone && !copied && (
                <span
                    className="absolute top-1 left-1/2 -translate-x-1/2 scale-0 group-hover:scale-100 text-[9px] text-muted uppercase transition-all duration-200">
                    copy
                </span>
            )}
            {copied && (
                <span
                    className="absolute -top-1 left-1/2 -translate-x-1/2 bg-[#a00040] text-white text-[10px] px-2 py-0.5 rounded shadow-md animate-bounce z-10">
                    COPIED!
                </span>
            )}
        </td>
    );
};
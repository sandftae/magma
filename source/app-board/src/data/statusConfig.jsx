/**
 * Configuration mapping for service operational states.
 * Defines visual styles, accessibility titles, and functional flags
 * indexed by the string representation of the status.
 *
 * @type {Object.<string, {colorClass: string, title: string, isOnline: boolean}>}
 *
 * @property {Object} true - configuration for active/healthy services
 * @property {Object} false - configuration for inactive or missing services
 * @property {Object} undefined - configuration for services currently being verified
 */
export const STATUS_CONFIG = {
    true: {
        colorClass: "bg-green-500 shadow-[0_0_5px_#22c55e]",
        title: "Everything is good",
        isOnline: true
    },
    false: {
        colorClass: "bg-red-500",
        title: "Down/Not Installed",
        isOnline: false
    },
    undefined: {
        colorClass: "bg-gray-400",
        title: "checking",
        isOnline: false
    }
};
/**
 * Tailwind CSS configuration.
 *
 * Defines the paths to all template files and extends the default design system with colors
 *
 * * @type {import('tailwindcss').Config}
 */
export default {
    /** array of paths to files that contain Tailwind class names */
    content: [
        "./index.html",
        "./src/**/*.{js,ts,jsx,tsx}",
    ],
    theme: {
        extend: {
            /** custom color palette extensions */
            colors: {
                primary: "#006494",
                secondary: "#003554",
                tertiary: "#051923",
            },
        },
    },
    plugins: [],
}
/**
 * PostCSS's configuration.
 *
 * Configures the CSS processing pipeline
 */
export default {
    plugins: {
        tailwindcss: {config: './config/tailwind.config.js'},
        autoprefixer: {},
    },
}
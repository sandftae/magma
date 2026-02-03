import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import { resolve } from 'path';

/** Vite build configuration */
export default defineConfig({
    /** standard React plugin */
    plugins: [react()],

    /** * sets the project root directory relative to the config file location */
    root: resolve(__dirname, '../'),

    /** base  url/path */
    base: '/devstack/',

    css: {
        /** path to the PostCSS configuration */
        postcss: resolve(__dirname, 'postcss.config.js'),
    },

    build: {
        /** output directory */
        outDir: resolve(__dirname, '../dist'),

        /** clears the output directory */
        emptyOutDir: true,
    }
});
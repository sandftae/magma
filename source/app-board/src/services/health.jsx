/**
 * Asynchronous utility to verify service availability via the Fetch API.
 * Uses a 'no-cors' request to bypass cross-origin restrictions common in local environments.
 * Note: In 'no-cors' mode, a successful response is opaque, but the absence of a
 * network error is treated as the service being reachable.
 *
 * @param {string} url - the full destination URL of the service to be pinged
 *
 * @returns {Promise<boolean>} resolves to true if the service responds within the timeout, false otherwise
 */
export const pingService = async (url) => {
    try {
        const controller = new AbortController();

        /** Set a hard timeout of 2000ms to prevent the dashboard from hanging on unreachable local services */
        const timeoutId = setTimeout(() => controller.abort(), 2000);

        await fetch(
            url,
            {
                mode: 'no-cors',
                signal: controller.signal,
                cache: 'no-cache'
            }
        );

        clearTimeout(timeoutId);
        return true;
    } catch {
        return false;
    }
};
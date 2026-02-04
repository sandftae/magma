/**
 * Static text content and configuration for the dashboard application.
 * Contains warning messages, footer quotes, service lists, and default credentials.
 */

/**
 * Global UI text constants.
 *
 * @type {Object}
 *
 * @property {Object} warning - configuration for the global warning banner
 * @property {string} warning.badge - short text for the badge (e.g., "WARNING")
 * @property {string} warning.text - primary warning message body
 * @property {string} warning.file - specific filename mentioned in the warning
 * @property {string} warning.suffix - ending text following the filename
 */
export const COMMON_TEXTS = {
    warning: {
        badge: "WARNING",
        text: "Make sure you don't use this dashboard for any production environments! To disable it, remove the ",
        file: "devstack_static.conf",
        suffix: " file from the nginx configuration."
    }
};

/**
 * Contextual quotes displayed in the page footer.
 *
 * @type {Object}
 *
 * @property {Object} services - quote shown on the services route
 * @property {Object} credentials - quote shown on the credentials route
 */
export const FOOTER_QUOTES = {
    services: {
        text: "Then God said, \"Let there be light\", and there was light.",
        cite: "Genesis 1:3"
    },
    credentials: {
        text: "Thy word is a lamp unto my feet, and a light unto my path.",
        cite: "Psalm 119:105"
    }
};

/**
 * Main registry of services displayed in the dashboard.
 *
 * @type {Array<Object>}
 *
 * @property {string} category - group heading for the services
 * @property {string} description - summary of the category's purpose
 * @property {string} [extraDesc] - optional secondary description or note
 * @property {Array<Object>} items - list of individual service objects
 * @property {string} items[].id - unique identifier used for status mapping
 * @property {string} items[].name - service display name
 * @property {string} items[].href - external link to the service interface
 * @property {string} items[].text - descriptive suffix for the service
 * @property {string} [items[].highlight] - optional technical keyword to emphasize
 */
export const SERVICES_DATA = [
    {
        category: "Data Management & Storage",
        description: "These services are primarily responsible for storing and providing access to data.",
        items: [
            {
                id: 'opensearch',
                name: "OpenSearch Dashboard",
                href: "http://localhost:5601",
                text: " the visualization and exploration interface for data stored in OpenSearch"
            },
            {
                id: 'php_my_admin',
                name: "phpMyAdmin",
                href: "http://localhost:8081",
                text: " a web-based administrative tool for managing",
                highlight: "MySQL"
            },
            {
                id: 'logs',
                name: "Logs",
                href: "http://localhost:8888",
                text: " used to monitor Docker container logs during runtime"
            }
        ]
    },
    {
        category: "Messaging & Email",
        description: "These services handle communication between different parts of the application stack.",
        items: [
            {
                id: 'rabbit_mq',
                name: "RabbitMQ",
                href: "http://localhost:15672",
                text: " a robust message broker that handles asynchronous messaging and task queues"
            },
            {
                id: 'mailpit',
                name: "Mailpit",
                href: "http://localhost:8025",
                text: " a lightweight, web-based tool for email testing/sending during development"
            }
        ]
    },
    {
        category: "Monitoring & Observability",
        description: "These services are required to monitor the health, performance, and resource usage of your services.",
        extraDesc: "At the same time, installation of these services is optional.",
        items: [
            {
                id: 'prometheus',
                name: "Prometheus",
                href: "http://localhost:9090",
                text: "a  monitoring system used to collect metrics from services"
            },
            {
                id: 'grafana',
                name: "Grafana",
                href: "http://localhost:3001",
                text: " a visual tool used to create dashboards, alerts, and allowing to monitor key metrics"
            },
            {
                id: 'cadvisor',
                name: "cAdvisor",
                href: "http://localhost:8082",
                text: " a tool that monitors and gathers resource usage and performance metrics of containers"
            }
        ]
    }
];

/**
 * Reference list of default access credentials for local services.
 *
 * @type {Array<Object>}
 *
 * @property {string} service - name of the target service
 * @property {string} user - default username or "None"
 * @property {string} pass - default password or "None"
 * @property {string} note - short description of the access level or port
 */
export const CREDENTIALS_DATA = [
    {
        service: "Commerce Admin Dashboard",
        user: "admin",
        pass: "admin12345",
        note: "The log/pass for the admin dashboard by default unless otherwise specified"
    },
    {service: "Grafana", user: "admin", pass: "admin", note: "Telemetry & Metrics"},
    {service: "phpMyAdmin", user: "root", pass: "root", note: "Database Management"},
    {service: "RabbitMQ", user: "guest", pass: "guest", note: "Message Queue GUI"},
    {service: "cAdvisor", user: "None", pass: "None", note: "Direct container stats"},
    {service: "OpenSearch", user: "admin", pass: "admin", note: "Search Engine Dashboard"},
    {service: "SFTP Server", user: "test", pass: "12345", note: "Port 2222"},
];
/**
 * Registry of the all services.
 * This list defines the mapping between service identifiers and their local access points.
 *
 * @type {Array<Object>}
 *
 * @property {string} id - unique service identifier used for status checks and component mapping
 * @property {string} name - the human-readable label for the service
 * @property {string} url - the local or network address where the service is hosted
 */
export const installedServices = [
    {
        id: 'opensearch',
        name: 'OpenSearch Dashboards',
        url: 'http://localhost:5601'
    },
    {
        id: 'php_my_admin',
        name: 'phpMyAdmin',
        url: 'http://localhost:8081/'
    },
    {
        id: 'logs',
        name: 'Container Logs',
        url: 'http://localhost:8888/'
    },
    {
        id: 'rabbit_mq',
        name: 'Rabbit MQ',
        url: 'http://localhost:15672/'
    },
    {
        id: 'mailpit',
        name: 'Mailpit',
        url: 'http://localhost:8025/'
    },
    {
        id: 'prometheus',
        name: 'Prometheus',
        url: 'http://localhost:9090/'
    },
    {
        id: 'grafana',
        name: 'Grafana',
        url: 'http://localhost:3001/'
    },
    {
        id: 'cadvisor',
        name: 'cAdvisor',
        url: 'http://localhost:8082/'
    }
];
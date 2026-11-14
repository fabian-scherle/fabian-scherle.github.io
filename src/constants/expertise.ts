/**
 * The four areas shown in the expertise section. Titles and descriptions are
 * translated (`about.areas.<id>.*`); the keywords are product names and stay
 * as they are in every locale.
 */
export const expertise = [
  {
    id: "development",
    keywords: [
      "Java",
      "Kotlin",
      "Spring Boot",
      "REST APIs",
      "TypeScript",
      "Angular",
      "React",
      "Flutter",
      "Python",
      "FastAPI",
      "Django",
      "JUnit",
      "Mockito",
      "Testcontainers",
      "Playwright",
    ],
  },
  {
    id: "cloud",
    keywords: [
      "Kubernetes",
      "Docker",
      "Helm",
      "ArgoCD",
      "CI/CD",
      "AWS",
      "Google Cloud",
      "OVH Cloud",
      "Apache Kafka",
      "Prometheus",
      "Grafana",
    ],
  },
  {
    id: "data",
    keywords: [
      "PostgreSQL",
      "Oracle DB",
      "Keycloak",
      "OAuth2",
      "OpenID Connect",
    ],
  },
  {
    id: "ai",
    keywords: [
      "Claude Code",
      "OpenCode",
      "AI Coding Agents",
      "GitHub Copilot",
      "MCP",
      "Prompt Engineering",
    ],
  },
] as const;

/** The band between the hero and the expertise section. */
export const stackBand = [
  "Spring Boot",
  "Kubernetes",
  "Apache Kafka",
  "Python",
  "FastAPI",
  "React",
  "Angular",
  "Flutter",
  "ArgoCD",
  "PostgreSQL",
  "Keycloak",
] as const;

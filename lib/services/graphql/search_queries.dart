String searchUsers = """
  query searchUsers(\$searchTerm: String!, \$limit: Int!) {
      search(query: \$searchTerm, type: USER, first: \$limit) {
      pageInfo {
        endCursor
        startCursor
      }
      userCount
      edges {
        node {
          ... on User {
            avatarUrl
            name
            bio
            company
            url
            followers {
              totalCount
            }
            following {
              totalCount
            }
            location
            repositories(first: 20, orderBy: {field: PUSHED_AT, direction: DESC}) {
              edges {
                node {
                  name
                  stargazerCount
                  visibility
                  description
                  updatedAt
                  languages(first: 10) {
                    edges {
                      size
                      node {
                        name
                        color
                      }
                    }
                  }
                  latestRelease {
                    name
                    createdAt
                    tagName
                  }
                }
              }
            }
          }
        }
      }
    }
  }
""";

String searchRepo = """
  query searchRepo(\$searchTerm: String!, \$limit: Int!) {
    search(query: \$searchTerm, type: REPOSITORY, first: \$limit) {
      pageInfo {
        endCursor
        startCursor
      }
      repositoryCount
      edges {
        node {
          ... on Repository {
            name
            stargazerCount
            description
            updatedAt
            visibility
            languages(first: 10) {
              edges {
                size
                node {
                  name
                  color
                }
              }
            }
            latestRelease {
              name
              createdAt
              tagName
            }
          }
        }
      }
    }
  }
""";

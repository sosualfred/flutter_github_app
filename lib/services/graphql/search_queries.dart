String searchUsers = """
  query searchUsers(\$searchTerm: String!, \$limit: Int!) {
      search(query: \$searchTerm, type: USER, first: \$limit) {
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
            location
            repositories(first: 100, orderBy: {field: PUSHED_AT, direction: DESC}) {
              edges {
                node {
                  name
                  stargazerCount
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

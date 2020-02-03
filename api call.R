{
  repository(owner: "zephyrproject-rtos", name: "zephyr") {
    pullRequests(first: 100) {
      edges {
        node {
          title
          databaseId
          url
          state
          changedFiles
          headRepository {
            url
          }
          participants{
            totalCount
          }
          comments{
            totalCount
          }
        }
      }
    }
  }
}
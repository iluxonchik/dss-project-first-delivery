getSC <- function(data, dataCluster) {
  dis <- dist(data)^2
  sc <- silhouette(dataCluster$cluster, dis)
  sum <- summary(sc)
  return(sum$avg.width)
}

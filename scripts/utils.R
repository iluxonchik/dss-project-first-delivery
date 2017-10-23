getSC <- function(data, dataCluster) {
  dis <- dist(data)^2
  sc <- silhouette(dataCluster$cluster, dis)
  sum <- summary(sc)
  return(sum$avg.width)
}

getDI <- function(data, dataCluster) {

    intraclust = c("complete","average","centroid")
    interclust = c("single", "complete", "average","centroid",
    "aveToCent", "hausdorff")
    df = as.data.frame(data)
    cls.scatt <- cls.scatt.data(df, dataCluster$cluster,
    dist="euclidean")
    dunn <- clv.Dunn(cls.scatt, c("average"), c("average"))
    return(dunn[1])
}

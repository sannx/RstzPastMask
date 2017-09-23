####################################################################################################
####################################################################################################
#'Claudinei Oliveira-Santos
#'LAPIP - Laboratorio de Processamento de Imagens e Geoprocessamento
#'Doutorando em Ciencias Ambientais - UFG
#'claudineisantosnx@gmail.com

###
###
#Descricao
#'Script para preparar as áreas amostrais escolhidas (pelo Adriano) paa serem reamostradas.
#'Para cada área escolhida foi recor
options(scipen = 999)
###
###
#pacotes
library(raster)
library(scales)
###
###
#files

#Grid 111 km
# shp <- shapefile("/hds/dados_work/GitHub/GridBrasil/gridbrasil/gridbrasilBrLim/Grid_BrLim_111_km_wgs84.shp")
#image ndvi BR
# Ndvi <- raster('/hds/dados_work/DATASAN/raster/NDVI/BRASIL/pa_br_ndvi_250_2017001_lapig.tif')
#pastagem v8 amazonia
am <- raster('/hds/dados_work/GitHub/RstzPastMask/raster_10_to_250m//Amazonia_past_id655_111km.tif')
#pastagem v8 mata atlantica
ma <- raster('/hds/dados_work/GitHub/RstzPastMask/raster_10_to_250m//M_Atlantica_past_id1227_111km.tif')
#pastagem v8 bhrv
bhrv <- raster('/hds/dados_work/GitHub/RstzPastMask/raster_10_to_250m/BHRV_past_id944_111km.tif')

#ndvi crop amazonia
# shpSub <- shp[shp$OBJECTID == 655, ]
# NdviAm <- crop(Ndvi, shpSub)
# writeRaster(NdviAm, filename = "/hds/dados_work/GitHub/RstzPastMask/raster_10_to_250m/NDVI_Amazonia_id665_111km.tif")
NdviAm <- raster("/hds/dados_work/GitHub/RstzPastMask/raster_10_to_250m/NDVI_Amazonia_id665_111km.tif")

#ndvi crop mata atlantica
# shpSub <- shp[shp$OBJECTID == 1227, ]
# NdviMa <- crop(Ndvi, shpSub)
# writeRaster(NdviMa, filename = "/hds/dados_work/GitHub/RstzPastMask/raster_10_to_250m/NDVI_MataAtlantica_id1227_111km.tif")
NdviMa <- raster("/hds/dados_work/GitHub/RstzPastMask/raster_10_to_250m/NDVI_MataAtlantica_id1227_111km.tif")

#ndvi crop mata atlantica
# shpSub <- shp[shp$OBJECTID == 944, ]
# ndviBhrv <- crop(Ndvi, shpSub)
# writeRaster(ndviBhrv, filename = "/hds/dados_work/GitHub/RstzPastMask/raster_10_to_250m/NDVI_BHRV_id944_111km.tif")
ndviBhrv <- raster("/hds/dados_work/GitHub/RstzPastMask/raster_10_to_250m/NDVI_BHRV_id944_111km.tif")

###
###
#resample amazonia
# ST <- Sys.time()
# amResamp <- projectRaster(from = am, to = NdviAm,
#                           filename = "/hds/dados_work/GitHub/RstzPastMask/raster_10_to_250m/Amazonia_Rsmp_250m_id655_111km.tif")
# Sys.time() - ST
# plot(stack(NdviAm, amResamp))

###
###
#resample mata atlantica
# ST <- Sys.time()
# maResamp <- projectRaster(from = ma, to = NdviMa,
#                           filename = "/hds/dados_work/GitHub/RstzPastMask/raster_10_to_250m/MataAtlantica_Rsmp_250m_id1227_111km.tif")
# Sys.time() - ST
# plot(stack(NdviMa, maResamp))

###
###
#resample bhrv
ST <- Sys.time()
bhrvResamp <- projectRaster(from = bhrv, to = ndviBhrv,
                          filename = "/hds/dados_work/GitHub/RstzPastMask/raster_10_to_250m/BHRV_Rsmp_250m_id944_111km.tif")
Sys.time() - ST
plot(stack(ndviBhrv, bhrvResamp))

################################################################################
################################################################################
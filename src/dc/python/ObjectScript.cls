Class dc.python.ObjectScript
{

ClassMethod Test() As %Status
{
    set a=42 
    write "It works!",!
    return a
}

ClassMethod IrradiationAnalysis() As %Status
{
	Set tSC = $System.Status.OK()

	Set tRetornoImagem = ..ExemploPython()
		
	Set tSaida = {}
    Do tSaida.%Set("arquivo",tRetornoImagem)
	Write tSaida
        
	Quit tSC
}

ClassMethod ExemploPython() As %Stream.GlobalCharacter [ Language = python ]
{

	import iris
	import pandas as pd
	from sklearn.cluster import KMeans
	import matplotlib.pyplot as plt
	from matplotlib.colors import Normalize
	import base64
	
	# Numbers of Clusters
	p = 5

	dataset = pd.read_csv('~/dev/src/dc/python/dataset.csv', sep=";")
	
	kmeans = KMeans(n_clusters=p, random_state=0)
	
	n = kmeans.n_clusters
	
	dataset['CLUSTER'] = kmeans.fit_predict(dataset[['LON', 'LAT']])
	
	cluster_subsets = {}
	
	i = 0
	lista = []
	
	while i < n:
		ki = dataset[dataset['CLUSTER'] == i]
		cluster_subsets[f'k{i}'] = ki
		mean_annual = ki['ANNUAL'].mean()
		lista.append(mean_annual)
		i = i + 1
		
	irr = dataset['ANNUAL'].tolist()
	
	scatter = plt.scatter(dataset['LON'], dataset['LAT'], c=irr, cmap='autumn_r', label='Southern region of Brazil')

	centers = kmeans.cluster_centers_

	plt.scatter(centers[:, 0], centers[:, 1], c='black', s=50, alpha=0.5)

	plt.legend()

	plt.colorbar(scatter, label='Global horizontal irradiance W/m²')
	
	plt.savefig('map.png', dpi=150)
	binary = open('map.png', 'rb').read()
	base64 = base64.b64encode(binary).decode('utf-8')

	retornoMapa = iris.cls('%Stream.GlobalCharacter')._New()
	retornoMapa.Rewind()
	retornoMapa.Write(retornoMapa)
	
	return retornoMapa
}

}

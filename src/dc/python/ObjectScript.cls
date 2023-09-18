Class dc.python.ObjectScript Extends (%CSP.REST, %REST.Impl)
{

ClassMethod Test() As %Status
{
    set a=42 
    write "It works!"_" "_a,!
    return a
}

ClassMethod IrradiationAnalysis() As %Status
{
	Set tSC = $System.Status.OK()

	Set tRetornoImagem = ..Python()
	
	Write tRetornoImagem
        
	Quit tSC
}

ClassMethod Python() As %String [ Language = python ]
{
 
	import iris
	import pandas as pd
	import os
	
	import base64 as bs
	import matplotlib.pyplot as plt
	from sklearn.cluster import KMeans
	from matplotlib.colors import Normalize
	pd.options.mode.chained_assignment = None

	os.environ["PYTHONIOENCODING"] = "utf-8"
	

	datasetSouth = pd.read_csv('~/dev/data/dataset.csv', sep = ';', encoding = 'utf-8')

	kmeans = KMeans(n_clusters=5, random_state=0)

	def buildSubset(state):
			
		subset = datasetSouth.loc[datasetSouth['UF']==state]
		subset['CLUSTER'] = kmeans.fit_predict(subset[['LON', 'LAT']])
		cluster_subsets = {}
		i = 0
		subList = []

		while i < 5:
			ki = subset[subset['CLUSTER'] == i]
			cluster_subsets[f'k{i}'] = ki
			mean_annual = ki['ANNUAL'].mean()
			subList.append(mean_annual)
			i = i + 1
		
		return(subset)

	def kmeansCenters(subset):
		kmeans = KMeans(n_clusters=5, random_state=0)
		n = kmeans.n_clusters
		kmeans.fit_predict(subset[['LON', 'LAT']])
		centers = kmeans.cluster_centers_
		return(centers)

	def irradiationList(state):
		irradiation = []
		irradiation = datasetSouth.loc[datasetSouth['UF']==state]['ANNUAL'].tolist()
		return(irradiation)

	def buildMap(dataset, labelState, irradiation, centers):
		scatter = plt.scatter(dataset['LON'], dataset['LAT'], c=irradiation, cmap='autumn_r', label=labelState)
		centers = centers
		plt.scatter(centers[:, 0], centers[:, 1], c='black', s=50, alpha=0.5)

		plt.legend()
		plt.colorbar(scatter, label='Global horizontal irradiance W/m²')
		plt.savefig('/home/irisowner/dev/src/'+labelState+'.png', dpi=150)
		print('Map done!')

	def buildBinary(label):
		base64_data = ''
		binary = open('/home/irisowner/dev/src/'+label+'.png', 'rb').read()
		base64_data = 'data:image/png;base64,'+bs.b64encode(binary).decode('utf-8')
		with open('/home/irisowner/dev/src/'+label+'.txt', 'w') as arquivo: arquivo.write(base64_data)
		print('Binary done!')

	labelPR = 'State of Parana'
	statePR = 'PR'
	subsetPR = buildSubset(statePR)
	irradiationPR = irradiationList(statePR)
	centersPR = kmeansCenters(subsetPR)

	labelSC = 'State of Santa Catarina'
	stateSC = 'SC'
	subsetSC = buildSubset(stateSC)
	irradiationSC = irradiationList(stateSC)
	centersSC = kmeansCenters(subsetSC)

	labelRS = 'State of Rio Grande do Sul'
	stateRS = 'RS'
	subsetRS = buildSubset(stateRS)
	irradiationRS = irradiationList(stateRS)
	centersRS = kmeansCenters(subsetRS)

	labelAll = 'Southern region of Brazil'
	irradiationAll = datasetSouth['ANNUAL'].tolist()
	centersAll = kmeansCenters(datasetSouth)

	buildMap(datasetSouth, labelAll, irradiationAll, centersAll)
	buildMap(subsetPR, labelPR, irradiationPR, centersPR)
	buildMap(subsetSC, labelSC, irradiationSC, centersSC)
	buildMap(subsetRS, labelRS, irradiationRS, centersRS)
	buildBinary(labelPR)
	buildBinary(labelSC)
	buildBinary(labelRS)
	buildBinary(labelAll) 
	
	return "Graphics and Binary files created"
}

}

# NYTimesDemo

Implemented Project usig MVVM

#Controllers
ViewController : responsible for showing available Articles
ArticlesListViewViewController: Responsible for showing selected artciles list
ArticlesSearchViewController: Responsole for Search user key in article 
BaseViewController: Based calls all viewcontroller inhertied from this Base

#ViewModels
HomeViewModel: Responssible for feeding ViewController woth data by communicating with Network  
               Layer and Loading data from json. all logic will handle here
               
ArticlesListViewModel: Responsible for giving Most Popular data to ArticlesListViewViewController and some business logic 

ArticlesSearchViewModel: Responsible for giving Search Result data to ArticlesListViewViewController :
ArtcilesListSearchViewModel: Responsible for getting search result based on user key 

#DataSources
HomeTableViewDataSource : TableView data source for ViewController
MostPopularDataSource : provides tableview with MostViewDataSource
SearchArticleDataSource: provides tableview with user Search DataSource

#Network Layer
NetworkClass: resposible for requesting response from server 

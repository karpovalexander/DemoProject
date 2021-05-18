//
//  HomeViewModel.swift
//  TestProject


import ReactiveSwift

protocol HomeViewModelProtocol {
    var offerSectionViewModels: [OfferSectionViewModel] { get }
    var categoryViewModel: CategoryTableCellViewModel? { get }
    var bannersViewModel: BannersTableCellViewModel? { get }
    func loadData() -> SignalProducer<Void, Error>
    func showInfo()
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private let router: HomeRouterProtocol
    private let offersService: OffersServiceProtocol
    private let bannersService: BannersServiceProtocol
    
    var offerSectionViewModels: [OfferSectionViewModel] = []
    var bannersViewModel: BannersTableCellViewModel? = nil
    var categoryViewModel: CategoryTableCellViewModel?
    
    init(router: HomeRouterProtocol,
         offersService: OffersServiceProtocol = OffersService(),
         bannersService: BannersServiceProtocol = BannersService()) {
        self.router = router
        self.offersService = offersService
        self.bannersService = bannersService
        
        createCategoryViewModels()
    }
    
    // MARK: - HomeViewModelProtocol
    
    func loadData() -> SignalProducer<Void, Error> {
        return loadBanners()
            .flatMap(.latest, loadOffers)
    }

    func showInfo() {
        self.router.showInfo()
    }
    
    // MARK: - Private
    
    private func loadOffers() -> SignalProducer<Void, Error> {
        return offersService.list()
        .flatMap(.latest, createOfferSectionViewModels)
    }
    
    private func loadBanners() -> SignalProducer<Void, Error> {
        return bannersService.list()
            .flatMap(.latest, createBannersViewModel)
    }
    
    private func createOfferSectionViewModels(offers: [Offer]) -> SignalProducer<Void, Error> {
        let grouppedOffers: [String: [Offer]] = Dictionary(grouping: offers, by: { $0.groupName })
        let sectionTitles = grouppedOffers.keys
        self.offerSectionViewModels = sectionTitles.map { title -> OfferSectionViewModel in
            return OfferSectionViewModel(title: title, offers: grouppedOffers[title] ?? [])
        }
        return SignalProducer(value: ())
    }
    
    private func createBannersViewModel(banners: [Banner]) -> SignalProducer<Void, Error> {
        self.bannersViewModel = BannersTableCellViewModel(banners: banners)
        return SignalProducer(value: ())
    }
    
    private func createCategoryViewModels() {
        let topItem = CategoryCollectionCellViewModel(title: L10n.Home.FilterCategory.top)
        let shopsItem = CategoryCollectionCellViewModel(title: L10n.Home.FilterCategory.shops)
        let productsItem = CategoryCollectionCellViewModel(title: L10n.Home.FilterCategory.products)
        categoryViewModel = CategoryTableCellViewModel(items: [topItem, shopsItem, productsItem])
    }
}

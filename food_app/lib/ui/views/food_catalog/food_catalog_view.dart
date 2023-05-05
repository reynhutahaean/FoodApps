import 'package:flutter/material.dart';
import 'package:food_app/network/api_manager.dart';
import 'package:food_app/ui/common/ui_helpers.dart';
import 'package:food_app/ui/views/food_catalog/food_catalog_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart' as BadgesPackage;

import 'food_catalog_viewmodel.dart';

@FormView(
  fields: [FormTextField(name: 'searchFormInput')],
)
class FoodCatalogView extends StackedView<FoodCatalogViewModel>
    with $FoodCatalogView {
  const FoodCatalogView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FoodCatalogViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue.shade600, size: 20),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.blue.shade600,
            ),
            ),
            horizontalSpaceSmall,
            Expanded(
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    Icon(Icons.search, color: Colors.blue.shade500),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: TextFormField(
                          onChanged: viewModel.onSearch,
                          controller: searchFormInputController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Cari Menu',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade600, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      padding:
                          const EdgeInsets.only(top: 30, left: 20, right: 20),
                      childAspectRatio: 4 / 7,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 15,
                      children: viewModel.foods.map((item) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(2, 2)),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (item.picture?.contains('localhost') == true ||
                                  item.picture == "") ...[
                                SizedBox(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    viewModel.defaultImage,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ] else ...[
                                Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Image.network(
                                    item.picture ?? viewModel.defaultImage,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: SizedBox(
                                    height: 40,
                                    child: Text(
                                      item.name?.toUpperCase() ?? 'NO NAME',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, right: 10, left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      viewModel
                                          .formatCurrency(item.price ?? '0'),
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blue.shade900),
                                    ),
                                    const Text(
                                      '  / porsi',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: ElevatedButton(
                                        onPressed: () => {
                                          viewModel.incrementCount(),
                                          viewModel.incrementPrice(
                                              int.parse(item.price ?? '0')),
                                          viewModel.incrementItem(),
                                          viewModel.setSelectedFood(item)
                                        },
                                        child: const Text('Order'),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.blue.shade900),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 35, left: 30, right: 30),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        BadgesPackage.Badge(
                            badgeContent: Text(
                              viewModel.messageCount,
                              style: const TextStyle(color: Colors.white),
                            ),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.blue.shade600,
                              size: 30,
                            )),
                        horizontalSpaceMedium,
                        Expanded(
                          child: Text(
                            viewModel.formatCurrency(viewModel.priceCount),
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 17),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue.shade900),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 80,
                            child: const Text('Charge'),
                          ),
                        )
                      ],
                    ),
                  ),
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxHeight: 100, minHeight: 0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const  EdgeInsets.only(
                              top: 20, right: 40, left: 40, bottom: 10),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.cyan,
                              ),
                              horizontalSpaceSmall,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(viewModel.selectedFoods[index].name ??
                                        ''),
                                    Text(viewModel.formatCurrency(
                                        viewModel.selectedFoods[index].price ??
                                            '0'))
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 40,
                                height: 25,
                                child: OutlinedButton(
                                  onPressed: () => {},
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        width: 1.0, color: Colors.blue.shade600),
                                  ),
                                  child: Text('-'),
                                ),
                              ),
                              horizontalSpaceSmall,
                              Text('${viewModel.selectedFoods.where((food) => food.id == viewModel.selectedFoods[index].id).length}'),
                              horizontalSpaceSmall,
                              SizedBox(
                                width: 40,
                                height: 25,
                                child: OutlinedButton(
                                  onPressed: () => {},
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        width: 1.0, color: Colors.blue.shade600),
                                  ),
                                  child: Text('+'),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: viewModel.itemCount,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  @override
  FoodCatalogViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FoodCatalogViewModel(
        apiManager: ApiManager(httpClient: http.Client()),
      )..fetchFoods();
}

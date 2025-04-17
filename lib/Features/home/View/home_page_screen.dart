import 'package:flutter/material.dart';
import 'package:quran/Core/Responsive/ui_component/info_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Home Page', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.bookmark_border, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              // search
            },
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              // more
            },
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Column(
            children: [
              Container(
                color: Colors.blueGrey,
                child: TabBar(
                  indicatorColor: Colors.white,
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                  tabs: const [
                    Tab(text: 'Surah'),
                    Tab(text: 'Juz'),
                    Tab(text: 'Bookmark'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      width: deviceInfo.screenWidth,
                      height: deviceInfo.screenHeight,
                      color: Colors.grey[900], // Changed to dark background
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: 114,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    if (index % 2 == 0 &&
                                        index != 0) //Todo evry 20 page add juz
                                      Container(
                                        color: Colors.grey[800],
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Juz' ${(index ~/ 20) + 1}",
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              "${index + 1}",
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ListTile(
                                      leading: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      title: Text(
                                        'Surah Name', // Replace with actual surah name
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Makki • ${(index) * 5} pages', // Replace with actual type and verse count
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                      trailing: Text(
                                        '${index + 1}', // Replace with Arabic numeral
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ), // Surah tab content
                    Container(
                      color: Colors.grey[900], // Changed to dark background
                    ), // Juz tab content
                    Container(
                      color: Colors.grey[900], // Changed to dark background
                    ), // Bookmark tab content
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

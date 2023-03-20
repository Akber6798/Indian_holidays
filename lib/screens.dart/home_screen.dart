import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:indian_holidays/screens.dart/detail_screen.dart';
import 'package:indian_holidays/services/api_service.dart';
import 'package:indian_holidays/services/colors.dart';
import 'package:indian_holidays/services/model_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final years = [
    1845,
    1846,
    1847,
    1848,
    1849,
    1850,
    1851,
    1852,
    1853,
    1854,
    1855,
    1856,
    1857,
    1858,
    1859,
    1860,
    1861,
    1862,
    1863,
    1864,
    1865,
    1866,
    1867,
    1868,
    1869,
    1870,
    1871,
    1872,
    1873,
    1874,
    1875,
    1876,
    1877,
    1878,
    1879,
    1880,
    1881,
    1882,
    1883,
    1884,
    1885,
    1886,
    1887,
    1888,
    1889,
    1890,
    1891,
    1892,
    1893,
    1894,
    1895,
    1896,
    1897,
    1898,
    1899,
    1900,
    1901,
    1902,
    1903,
    1904,
    1905,
    1906,
    1907,
    1908,
    1909,
    1910,
    1911,
    1912,
    1913,
    1914,
    1915,
    1916,
    1917,
    1918,
    1919,
    1920,
    1921,
    1922,
    1923,
    1924,
    1925,
    1926,
    1927,
    1928,
    1929,
    1930,
    1931,
    1932,
    1933,
    1934,
    1935,
    1936,
    1937,
    1938,
    1939,
    1940,
    1941,
    1942,
    1943,
    1944,
    1945,
    1946,
    1947,
    1948,
    1949,
    1950,
    1951,
    1952,
    1953,
    1954,
    1955,
    1956,
    1957,
    1958,
    1959,
    1960,
    1961,
    1962,
    1963,
    1964,
    1965,
    1966,
    1967,
    1968,
    1969,
    1970,
    1971,
    1972,
    1973,
    1974,
    1975,
    1976,
    1977,
    1978,
    1979,
    1980,
    1981,
    1982,
    1983,
    1984,
    1985,
    1986,
    1987,
    1988,
    1989,
    1990,
    1991,
    1992,
    1993,
    1994,
    1995,
    1996,
    1997,
    1998,
    1999,
    2000,
    2001,
    2002,
    2003,
    2004,
    2005,
    2006,
    2007,
    2008,
    2009,
    2010,
    2011,
    2012,
    2013,
    2014,
    2015,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023,
    2024,
    2025,
    2026,
    2027,
    2028,
    2029,
    2030,
    2031,
    2032,
    2033,
    2034,
    2035,
    2036,
    2037,
    2038,
    2039,
    2040,
    2041,
    2042,
    2043,
    2044,
    2045,
    2046,
    2047,
    2048,
    2049,
    2050,
    2051,
    2052,
    2053,
    2054,
    2055,
    2056,
    2057,
    2058,
    2059,
    2060,
    2061,
    2062,
    2063,
    2064,
    2065,
    2066,
    2067,
    2068,
    2069,
    2070,
    2071,
    2072,
    2073,
    2074,
    2075,
    2076,
    2077,
    2078,
    2079,
    2080,
    2081,
    2082,
    2083,
    2084,
    2085,
    2086,
    2087,
    2088,
    2089,
    2090,
    2091,
    2092,
    2093,
    2094,
    2095,
    2096,
    2097,
    2098,
    2099,
    2100
  ];
  var selctedYears = 2023;
  final getData = ApiService();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showAppClosDialogue();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('INDIA'), actions: [
          Image(
              height: 40.h,
              width: 40.w,
              image: const AssetImage('assets/india.png')),
          SizedBox(
            width: 20.w,
          )
        ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Select Year',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    DropdownButton(
                        iconEnabledColor: AppColors.textColor,
                        dropdownColor: AppColors.scaffoldColor,
                        elevation: 4,
                        value: selctedYears,
                        items: years.map((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(
                              value.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: AppColors.secondaryColor,
                                      fontSize: 16.sp),
                            ),
                          );
                        }).toList(),
                        onChanged: ((newValue) {
                          setState(() {
                            selctedYears = newValue!;
                          });
                        })),
                  ],
                ),
                const SizedBox(height: 10),
                FutureBuilder<HolidayModel>(
                    future: getData.getHolidays(selctedYears),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                            separatorBuilder: ((context, index) =>
                                SizedBox(height: 5.h)),
                            itemCount: snapshot.data!.response.holidays.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: ((context, index) {
                              var value =
                                  snapshot.data!.response.holidays[index];
                              String date = value.date.iso;
                              String formatDate = date.substring(0, 10);
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(PageRouteBuilder<
                                          void>(
                                      pageBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double>
                                              secondaryAnimation) {
                                        return AnimatedBuilder(
                                          animation: animation,
                                          builder: (context, Widget? child) {
                                            return Opacity(
                                              opacity: animation.value,
                                              child: DetailScreen(
                                                  name: value.name,
                                                  description:
                                                      value.description,
                                                  type: value.type.last,
                                                  date: formatDate),
                                            );
                                          },
                                        );
                                      },
                                      transitionDuration:
                                          const Duration(milliseconds: 500)));
                                },
                                child: Container(
                                  height: 100.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFFF7901),
                                            Color(0xFFeffae8),
                                            Color(0XFF44de39),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, right: 8),
                                        child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              formatDate,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6!
                                                  .copyWith(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontSize: 14.sp),
                                            )),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        value.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!,
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }));
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.textColor,
                          ),
                        );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> showAppClosDialogue() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return AlertDialog(
            backgroundColor: AppColors.scaffoldColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
            title: Text('Do you want to exit an App?',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.w500)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondaryColor))),
              TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text('Yes',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondaryColor))),
            ],
          );
        }));
    return Future.value(false);
  }
}

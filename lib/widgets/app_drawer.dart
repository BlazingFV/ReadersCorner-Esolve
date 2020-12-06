import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  var expand = false;

  Map<String, bool> categroiesValues = {
    'كتب عربية': false,
    'متجر صفقة': false,
    'الهدايا و الاشياء الثابتة': false,
    'المجموعات ومجموعات الهدايا': false,
    'للاطفال و الشباب': false,
    'التاريخ و علم الاثار': false,
    'تطوير الذات': false,
    'خيال علمي': false,
  };
  Map<String, bool> authorsValues = {
    'Scholastic': false,
    'Danielle Steel': false,
    'نجيب محفوظ': false,
    'احمد مراد': false,
    'عمر طاهر': false,
    'احمد خالد مصطفي': false,
    'Roald dahl': false,
  };
  Map<String, bool> languagesValues = {
    'الانجليزية': false,
    'العربية': false,
    'الفرنسية': false,
    'الاسبانية': false,
    'الايطالية': false,
  };

  Map<String, bool> agesValues = {
    '0-3': false,
    '3-5': false,
    '5-7': false,
    '7-12': false,
    'المراهقين و الشباب': false,
  };
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
              child: Container(
                child: Center(
                  child: Image.asset('assets/images/deer.png'),
                ),
              ),
            ),
            Center(
              child: ListTile(
                title: Center(
                  child: Text('Kathren Joud', style: TextStyle(fontSize: 18)),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
                  child: Text('\$ 22.0',
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ExpansionTile(
                backgroundColor: Colors.grey[100],
                childrenPadding: EdgeInsets.all(2),
                initiallyExpanded: expand,
                title: Text('التصنيفات'),
                children: [
                  ...buildExpandingTile(categroiesValues),
                  buildFilterButton(),
                ]),
            Divider(),
            ExpansionTile(
                childrenPadding: EdgeInsets.all(2),
                initiallyExpanded: expand,
                title: Text('المؤلفون'),
                children: [
                  ...buildExpandingTile(authorsValues),
                  buildFilterButton(),
                ]),
            Divider(),
            ExpansionTile(
              childrenPadding: EdgeInsets.all(2),
              initiallyExpanded: expand,
              title: Text('اللغات'),
              children: [
                ...buildExpandingTile(languagesValues),
                buildFilterButton(),
              ],
            ),
            Divider(),
            ExpansionTile(
              childrenPadding: EdgeInsets.all(2),
              initiallyExpanded: expand,
              title: Text('الاعمار'),
              children: [
                ...buildExpandingTile(agesValues),
                buildFilterButton(),
              ],
            ),
            Divider(),
            buildListTileOfTexts('تاريخ الطلب', Icons.calendar_today),
            Divider(),
            buildListTileOfTexts('قائمة الرغبات', Icons.favorite_border),
            Divider(),
            buildListTileOfTexts('عناوين الشحن', Icons.home_work_outlined),
            Divider(),
            buildListTileOfTexts('نقاطي', Icons.point_of_sale_sharp),
            Divider(),
            buildListTileOfTexts('تسجيل الخروج', Icons.exit_to_app),
            SizedBox(
              height: 65,
            ),
            buildFilterButton(),
          ],
        ),
      ),
    );
  }

  Padding buildFilterButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        width: double.infinity,
        child: RaisedButton(
            elevation: 5,
            color: Colors.teal[300],
            onPressed: () {},
            child: Text(
              'تطبيق المرشحات',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }

  buildListTileOfTexts(String text, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
    );
  }

  List buildExpandingTile(Map<String, bool> values) {
    return values.keys.map((String key) {
      buildFilterButton();
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
        child: Container(
          color: Colors.grey[200],
          child: CheckboxListTile(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              subtitle: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  key,
                  softWrap: true,
                ),
              ),
              activeColor: Colors.black12,
              checkColor: Colors.black,
              value: values[key],
              onChanged: (bool newValue) {
                setState(() {
                  values[key] = newValue;
                });
              }),
        ),
      );
    }).toList();
  }
}

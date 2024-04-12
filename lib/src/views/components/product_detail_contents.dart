import 'package:flutter/material.dart';
import 'package:tkgapp/src/common/common.dart';
import 'package:tkgapp/src/models/product_detail.dart';
import 'package:tkgapp/src/views/components/label_title_contents.dart';
import 'package:tkgapp/src/views/components/product_item_contents.dart';

class ProductDetailContents extends StatelessWidget {
  ProductDetailContents({super.key, required this.detail});

  final ProductDetail detail;

  final zaikoTtl = ['', '現在庫', '在庫点', '過剰在庫', '受注残数', '発注残数'];

  List<DataColumn> getZaikoColumns() {
    return zaikoTtl
        .map((ttl) =>
            DataColumn(label: Text(ttl, style: const TextStyle(fontSize: 12))))
        .toList();
  }

  DataCell getItemCell(String dispCell, bool isNum) {
    return DataCell(
      Container(
        alignment: isNum ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(
          dispCell,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }

  List<DataRow> getZaikoRows() {
    List<DataRow> rows = [];
    for (int i = 0; i <= 1; i++) {
      rows.add(
        DataRow(
          cells: [
            getItemCell(i == 0 ? '支店' : '全社', false),
            getItemCell(
                Common.getNumberFormat(i == 0 ? detail.zaikos : detail.zaikoz),
                true),
            getItemCell(
                Common.getNumberFormat(
                    i == 0 ? detail.zaikotens : detail.zaikotenz),
                true),
            getItemCell(
                Common.getNumberFormat(
                    i == 0 ? detail.kajozaikos : detail.kajozaikoz),
                true),
            getItemCell(
                Common.getNumberFormat(i == 0 ? detail.jzans : detail.jzanz),
                true),
            getItemCell(
                Common.getNumberFormat(i == 0 ? detail.hzans : detail.hzanz),
                true),
          ],
        ),
      );
    }

    return rows;
  }

  List<DataColumn> getJissekiColumns() {
    final jissekiTtl = [
      '',
      '${detail.nendo3}年度',
      '${detail.nendo2}年度',
      '${detail.nendo1}年度',
      '累計',
      '月平均',
    ];

    return jissekiTtl
        .map((ttl) =>
            DataColumn(label: Text(ttl, style: const TextStyle(fontSize: 12))))
        .toList();
  }

  List<DataRow> getJissekiRows() {
    List<DataRow> rows = [];
    DataRow row;

    row = DataRow(
      cells: [
        getItemCell('支店（売上）', false),
        getItemCell(Common.getNumberFormat(detail.usuryo3s), true),
        getItemCell(Common.getNumberFormat(detail.usuryo2s), true),
        getItemCell(Common.getNumberFormat(detail.usuryo1s), true),
        getItemCell(Common.getNumberFormat(detail.usuryosums), true),
        getItemCell(Common.getNumberFormat(detail.usuryoavgs), true),
      ],
    );
    rows.add(row);

    row = DataRow(
      cells: [
        getItemCell('全社（売上）', false),
        getItemCell(Common.getNumberFormat(detail.usuryo3z), true),
        getItemCell(Common.getNumberFormat(detail.usuryo2z), true),
        getItemCell(Common.getNumberFormat(detail.usuryo1z), true),
        getItemCell(Common.getNumberFormat(detail.usuryosumz), true),
        getItemCell(Common.getNumberFormat(detail.usuryoavgz), true),
      ],
    );
    rows.add(row);

    row = DataRow(
      cells: [
        getItemCell('支店（仕入）', false),
        getItemCell(Common.getNumberFormat(detail.ssuryo3s), true),
        getItemCell(Common.getNumberFormat(detail.ssuryo2s), true),
        getItemCell(Common.getNumberFormat(detail.ssuryo1s), true),
        getItemCell(Common.getNumberFormat(detail.ssuryosums), true),
        getItemCell(Common.getNumberFormat(detail.ssuryoavgs), true),
      ],
    );
    rows.add(row);

    row = DataRow(
      cells: [
        getItemCell('全社（仕入）', false),
        getItemCell(Common.getNumberFormat(detail.ssuryo3z), true),
        getItemCell(Common.getNumberFormat(detail.ssuryo2z), true),
        getItemCell(Common.getNumberFormat(detail.ssuryo1z), true),
        getItemCell(Common.getNumberFormat(detail.ssuryosumz), true),
        getItemCell(Common.getNumberFormat(detail.ssuryoavgz), true),
      ],
    );
    rows.add(row);

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const LabelTitleContents(title: '商品情報'),
                const SizedBox(height: 8),
                ProductItemContents(lblTitle: '商品CD', lblData: detail.code),
                ProductItemContents(lblTitle: '商品番号', lblData: detail.kataban),
                ProductItemContents(lblTitle: '商品分類', lblData: detail.bunrui),
                ProductItemContents(
                    lblTitle: '環境対応区分', lblData: detail.kankyokbn),
                const SizedBox(height: 36),
                const LabelTitleContents(title: '在庫情報'),
                SizedBox(
                  height: 150,
                  child: CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            DataTable(
                              columns: getZaikoColumns(),
                              rows: getZaikoRows(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                const LabelTitleContents(title: '実績情報'),
                SizedBox(
                  height: 300,
                  child: CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            DataTable(
                              columns: getJissekiColumns(),
                              rows: getJissekiRows(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

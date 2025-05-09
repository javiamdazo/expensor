import 'package:expensor/data/entity/transaction_type_entity.dart';
import 'package:expensor/data/repositories/transaction_type_repository.dart';
import 'package:expensor/provider/model/transaction_type.dart';
import 'package:flutter/material.dart';

class TransactionsTypeProvider extends ChangeNotifier{
  final TransactionTypeRepository _transactionTypeRepository =
      TransactionTypeRepository.instance;

  List<TransactionType> _transactionTypes = [];

  TransactionsTypeProvider() {
    loadTransactionTypes();
  }

  List<TransactionType> get transactionTypesList => _transactionTypes;

  Future<void> loadTransactionTypes() async {
    final transactionTypes = await _transactionTypeRepository.list();

    _transactionTypes = [];
    transactionTypes.forEach((transactionType) {
      _transactionTypes.add(TransactionType.fromMap(transactionType));
    });

    notifyListeners();
  }

  void add(String name){
    _transactionTypeRepository.add(name);
    loadTransactionTypes();
  }

  void delete(int transactionTypeId) {
    _transactionTypeRepository.delete(transactionTypeId);
    loadTransactionTypes();
  }

  void update(int transactionTypeId, String name){
    _transactionTypeRepository.update(transactionTypeId, name);
    loadTransactionTypes();
  }

  Future<TransactionType> read(int transactionTypeId) async {
    TransactionTypeEntity? transactionType = await _transactionTypeRepository.read(transactionTypeId);
    if (transactionType == null) {
      throw Exception();
    }

    return TransactionType.fromMap(transactionType);
  }
}

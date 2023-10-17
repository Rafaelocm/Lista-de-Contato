class listContatoList {
  List<ListaDeContato> listaContato = [];

  listContatoList(this.listaContato);

  listContatoList.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      listaContato = <ListaDeContato>[];
      json['results'].forEach((v) {
        listaContato.add(ListaDeContato.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = listaContato.map((v) => v.toJson()).toList();
    return data;
  }
}
class ListaDeContato {
  String? _objectId;
  String? _nome;
  String? _telefone;

  ListaDeContato({String? objectId, String? nome, String? telefone}) {
    if (objectId != null) {
      this._objectId = objectId;
    }
    if (nome != null) {
      this._nome = nome;
    }
    if (telefone != null) {
      this._telefone = telefone;
    }
  }

  String? get objectId => _objectId;
  set objectId(String? objectId) => _objectId = objectId;
  String? get nome => _nome;
  set nome(String? nome) => _nome = nome;
  String? get telefone => _telefone;
  set telefone(String? telefone) => _telefone = telefone;

  ListaDeContato.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _nome = json['nome'];
    _telefone = json['telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this._objectId;
    data['nome'] = this._nome;
    data['telefone'] = this._telefone;
    return data;
  }
}

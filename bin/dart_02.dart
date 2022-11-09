import 'dart:io';

void main() {
  String? inputNome;
  String? inputIdade;
  String? inputCpf;
  String? inputAltura;
  String? inputKg;
  String? inputpoupanca;
  String? inputcorrente;

  print("digite seu nome");
  inputNome = stdin.readLineSync();

  print("digite seu idade");
  inputIdade = stdin.readLineSync();

  print("digite seu cpf");
  inputCpf = stdin.readLineSync();

  print("1) para cadastrar na academia\n2) para cadastrar no banco");
  String? inputEscolhaprincipal = stdin.readLineSync();

  if (inputEscolhaprincipal == "1") {
    print("digite seu altura em cm");
    inputAltura = stdin.readLineSync();

    print("digite seu peso em kg");
    inputKg = stdin.readLineSync();
  } else if (inputEscolhaprincipal == "2") {
    print("digite o saldo na conta poupança");
    inputpoupanca = stdin.readLineSync();

    print("digite seu saldo da conta corrente");
    inputcorrente = stdin.readLineSync();
  }

  if (inputNome != null || inputIdade != null || inputCpf != null) {
    String nome = inputNome!;
    String cpf = inputCpf!;
    int idade = int.parse(inputIdade!);
    double? altura;
    double? peso;
    double? corrente;
    double? poupanca;

    Academia? pessoaAcademia1;
    Banco? pessoaBanco1;

    if (inputAltura != null || inputKg != null) {
      altura = double.parse(inputAltura!);
      peso = double.parse(inputKg!);
      pessoaAcademia1 = Academia(
        nome,
        idade,
        cpf,
        altura,
        peso,
      );
      pessoaAcademia1.mostrardados(pessoaAcademia1.nome, pessoaAcademia1.idade,
          pessoaAcademia1.cpf, pessoaAcademia1.altura, pessoaAcademia1.peso);
    } else if (inputcorrente != null || inputpoupanca != null) {
      corrente = double.parse(inputcorrente!);
      poupanca = double.parse(inputpoupanca!);

      pessoaBanco1 = Banco(nome, idade, cpf, corrente, poupanca);

      pessoaBanco1.mostrardados(
          pessoaBanco1.nome,
          pessoaBanco1.idade,
          pessoaBanco1.cpf,
          pessoaBanco1.contaCorrente,
          pessoaBanco1.contaPoupanca);
    } else {
      print("error");
    }
  }
}

class Pessoa {
  Pessoa(this.nome, this.idade, this.cpf);

  String cpf;
  int idade;
  String nome;
}

class Academia extends Pessoa {
  Academia(
    String nome,
    int idade,
    String cpf,
    this.altura,
    this.peso,
  ) : super(nome, idade, cpf);

  double altura;
  double peso;

  double calcularImc(
    double altura,
    double peso,
  ) {
    double imc = peso / (altura / 100);

    return imc;
  }

  String nivelDeObsidade(imc) {
    if (imc < 18.5) {
      return "seu imc é: $imc. classificação: Magreza. Nivel de obsidade: 0\n";
    } else if (imc >= 18.5 || imc <= 24.9) {
      return "seu imc é: $imc. classificação: Normal. Nivel de obsidade: 0\n";
    } else if (imc >= 25 || imc <= 29.9) {
      return "seu imc é: $imc. classificação: Sobrepeso. Nivel de obsidade: 1\n";
    } else if (imc >= 30 || imc <= 39.9) {
      return "seu imc é: $imc. classificação: Obsidade. Nivel de obsidade: 2\n";
    } else if (imc >= 40) {
      return "seu imc é: $imc. classificação: Obsidade Grave. Nivel de obsidade: 3\n";
    }
    return "error";
  }

  mostrardados(String nome, int idade, String cpf, double altura, double peso) {
    print(
        " seu nome é $nome\n sua idade é $idade\n seu cpf é $cpf\n sua altura é $altura\n seu peso é $peso seu imc é ${calcularImc(altura, peso)}\n seus dados sao ${nivelDeObsidade(calcularImc(altura, peso))} ");
  }
}

class Banco extends Pessoa {
  Banco(String nome, int idade, String cpf, this.contaCorrente,
      this.contaPoupanca)
      : super(nome, idade, cpf);

  double contaCorrente;
  double contaPoupanca;

  mostrardados(
      String nome, int idade, String cpf, double corrente, double poupanca) {
    print(
        "seu nome é $nome\n sua idade é $idade\n seu cpf é $cpf\no valor em sua conta corrente é $corrente\no valor em sua conta poupança é $poupanca");
  }
}

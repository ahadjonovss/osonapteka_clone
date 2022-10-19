import 'drug_model.dart';

class Purchase{
  Set<Drugs> data={};
  num promo_code=0;
  num service=0;
  Purchase(this.data);

  num getcost(){
    num res=0;
    data.forEach((element) {
      res+=element.price*element.count;
    });
    return res;
  }

  num getDiscount(){
    return getcost()*0.03;
  }

  num getAllCost(){
    return getcost()-getDiscount()+this.service-this.promo_code;

  }


}
void main(){
List arr=[5,3,6,7,8,8];
print(mult(arr, 0));
}


mult(List array,int index){
    if (index>=array.length) {
      return 1;
    }

    return array[index]*mult(array, index+1);
}
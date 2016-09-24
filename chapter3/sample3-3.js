
const getLine = ()=>new Promise(
  (resolve,reject)=>{
    process.stdin.resume();
    process.stdin.setEncoding('utf-8');

    process.stdin.on('data', chunk=>{
      process.stdin.pause();
      resolve( chunk.substr(0,chunk.length-1) );
    });
    process.stdin.on('end', ()=>{
      reject(new Error("End Of Input"));
    });
  }
)

const pushP = x=>xs=>new Promise(
  resolve=>{
    xs.push(x);
    resolve(xs);
  }
)
const head = arr=>arr[0]
const tail = arr=>arr.slice(1)

const print = txt=>Promise.resolve( console.log(txt) );

const forP_ = xs=>pf=>
  Promise.all( xs.map( e=>pf(e) ) )


forP = xs=>pf=>res=>new Promise(
  (resolve,reject)=>{
    if( xs.length == 0 ){
      resolve(res);
    }

    else{
      forP(tail(xs))(pf)(res)
      .then(_res=>
        pf(head(xs))
        .then(_x=>pushP(_x)(_res) ))
    }
  }
)

forP([1,2])(getLine)([])
.then(print)
.catch(print)

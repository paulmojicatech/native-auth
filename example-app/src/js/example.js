import { NativeAuth } from '@paulmojicatech&#x2F;native-auth';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    NativeAuth.echo({ value: inputValue })
}

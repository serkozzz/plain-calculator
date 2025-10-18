// Calculator.js
//


function evaluate(expr) {
    
    // Пример вызова Swift-функции
    if (typeof Bridge !== 'undefined' && Bridge.swiftFunc) {
        Bridge.swiftFunc();
    }
    
    if (typeof expr !== 'string') {
        return '';
    }

    // Разрешаем цифры, + - * / % ( ) . и пробелы
    var allowed = /^[0-9+\-*/%().\s]+$/;
    if (!allowed.test(expr)) {
        return '';
    }

    try {
        var result = eval(expr);
        return String(result);
    } catch (e) {
        return '';
    }
}

import UIKit

var str = "Hello, playground"

// Массивы

var newArray1: [String] = []

var newArray2 = [Int]()

print(newArray1)
print(newArray2)

newArray1.count

newArray1.capacity

newArray1.hashValue

newArray2.insert(100, at: 0)

newArray2.remove(at: 0)

type(of: newArray2)

// Наборы

var mySet: Set<Int> = [1,2,3]

var mySet2 = Set(arrayLiteral: 4,5,6)

mySet.hashValue

mySet.contains(3)

mySet.insert(4)

// к наборам приминимы все теже методы что применимы к массивам ( тк по-сути набор это это массив но без индксов )

// Словари

Dictionary(dictionaryLiteral: (100, "Сто"), (200, "Двести"), (300, "Триста"))


// базовая коллекция кортежей (пар значений)
let baseCollection = [(2, 5), (3, 6), (1, 4)]
// создание словаря на основе базовой коллекции
let newDictionary = Dictionary(uniqueKeysWithValues: baseCollection)
newDictionary //[3: 6, 2: 5, 1: 4]


// массив звезд
let nearestStarNames = ["Proxima Centauri", "Alpha Centauri A", "Alpha Centauri B"]
// массив расстояний до звезд
let nearestStarDistances = [4.24, 4.37, 4.37]

let temp = zip(nearestStarNames, nearestStarDistances)
print(temp.underestimatedCount)
// получение словаря, содержащего пары значений
let starDistanceDict = Dictionary(uniqueKeysWithValues: temp)
starDistanceDict // ["Proxima Centauri": 4.24, "Alpha Centauri B": 4.37, "Alpha Centauri A": 4.37]


var countryDict = ["RUS":"Россия", "BEL": "Беларусь", "UKR":"Украина"] // получаем значение элемента
var countryName = countryDict["BEL"]
countryName // "Беларусь"
// изменяем значение элемента
countryDict["RUS"] = "Российская Федерация"
countryDict // ["RUS": "Российская Федерация", "BEL": "Беларусь", "UKR": "Украина"]

var oldValueOne = countryDict.updateValue("Республика Белоруссия", forKey: "BEL")
// в переменной записано старое измененное значение элемента oldValueOne //"Беларусь"
var oldValueTwo = countryDict.updateValue("Эстония", forKey: "EST") // в переменной записан nil, так как элемента с таким ключом
// не существует
oldValueTwo //nil


//Операторы управления (утверждения assert, if, while, repeat while, for, guard и switch)

var someVar = 101, anotherVar = 10
// утверждение с двумя аргументами
assert( someVar > 100, "Данные неверны" ) // утверждение с одним аргументом
assert( anotherVar <= 10 )


//if
var userName = "Alex"
if userName == "Alex"{
    print("Привет, администратор")
}

if !false {
    print("true")
}

userName = "Georgy"
if userName == "Alex"{
    print("Привет, администратор")
} else {
    print("Пока, незнакомец")
}

//Тернарный оператор условия
var x = 1000
var y = ( x > 100 ? 100 : 50 )

let a = 1
let b = 2

a >= b ? print("А меньше или равно Б") : print("А больше Б")

//while и repeate while

// начальное значение
var i = 1, resultSum = 0
// хранилище результата сложения var resultSum = 0
// цикл для подсчета суммы
while i <= 10 {
    resultSum += i
    i += 1
}
resultSum // 55
resultSum = 0

// начальное значение
var z = 1
// хранилище результата сложения var result = 0
// цикл для подсчета суммы
repeat {
    resultSum += z
    z += 1
} while z <= 10
resultSum // 55

//оператор повторения for

// массив целых чисел
let numArray: Array<Int> = [1, 2, 3, 4, 5]
// в данной переменной будет храниться
// сумма элементов массива numArray
var result: Int = 0

// цикл подсчета суммы
for number in numArray {
    result += number
}
result //15

print("")
for letter in "Swift" {
    print(letter)
}

print("\nSAA -> SAA")


var res: Int = 0
for xx in 1...15 {
    res += xx
}


print("Проверка Вопрос #17, результат:")
let errorCode = 300

switch errorCode {
case 0..<300:
    print("1")
case 300...400:
    print("2")
case 0...300:
    print("3")
default:
    print("4")
}

// Функции

func sumTwoInt(num1 a: Int, num2 b: Int){
print("Результат операции - \(a+b)") }
sumTwoInt(num1: 10, num2: 12)

func sumTwoInt1(_ a: Int, _ b: Int){
print("Результат операции - \(a+b)") }
sumTwoInt1(11, 14)

func sumTwoInt2(_ a: Int, _ b: Int) -> Int{
    let result = a + b
    print("Результат операции - \(result)")
    return result
}
var result1 = sumTwoInt2(10, 12) // 22

//вложенная функция

func oneStep( coordinates: inout (Int, Int), stepType: String ) {
    func right( coords: inout (Int, Int)) {
        coords = (coords.0+1, coords.1)
    }
    func up( coords: inout (Int, Int)) {
        coords = (coords.0, coords.1+1)
    }
    func left( coords: inout (Int, Int)) {
        coords = (coords.0-1, coords.1)
    }
    func down( coords: inout (Int, Int)) {
        coords = (coords.0, coords.1-1)
    }
    switch stepType {
    case "up":
        up(coords: &coordinates)
    case "right":
        right(coords: &coordinates)
    case "down":
        down(coords: &coordinates)
    case "left":
        left(coords: &coordinates)
    default:
        break;
    }
}
var coordinates = (10, -5)
print(coordinates)
oneStep(coordinates: &coordinates, stepType: "up")
oneStep(coordinates: &coordinates, stepType: "right")
print(coordinates)
oneStep(coordinates: &coordinates, stepType: "down")
for _ in stride(from: 1, through: 5, by: 1){
    oneStep(coordinates: &coordinates, stepType: "up")
}
print(coordinates)

for _ in stride(from: 1, through: 10, by: 1){
    oneStep(coordinates: &coordinates, stepType: "left")
}
print(coordinates)

//перегрузка функций

func cry() -> String {
    return "one"
}
func cry() -> Int {
    return 1
}

//let testingConst = cry() (без явного определения типа константы выдаст ошибку)
let testingConst1: Int = cry()
let testingConst2: String = cry()

//рекурсия

func factorial(num n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return n * factorial(num: n - 1)
}

factorial(num: 5)

var aa = 1

for i in stride(from: 1, to: 10, by: 1){
    print(i)
    
//    aa = aa + 2 * i + 1
}

let languages: [String?] = [nil, "Python", nil, "Swift", "CPP"]

if let firstLang = languages.first {
    print(firstLang)
}

var Age: Int? = 0
print("Age = \(String(Age!))")

//let numbers: [Int] = [1,2,3,nil,5]


let g = 3
let d = 5
var ress = 1
for i in 1...5{

    guard i%2 == 1 else {
        continue
    }
    ress *= g
}
print(ress)

type(of:round(7.5))

//protocol Person {
//    var Name: String?
//    var Surname: String?
//}


// Дополнительные возможности

// map(_:)

var myArray = [2, 4, 5, 7]
var newArray = myArray.map{$0}
newArray // [2, 4, 5, 7]

var newArray3 = newArray.map({
    (value: Int) -> Int in
    return value
})

var newArray4 = newArray.map({$0*$0})
newArray4

let milesToDest = ["Moscow":120.0,"Dubai":50.0,"Paris":70.0]
var kmToDest = milesToDest.map { name,miles in [name:miles * 1.6093] }
kmToDest // [["Dubai": 80.465], ["Paris": 112.651], ["Moscow": 193.116]]

// mapValues(_:)

var mappedCloseStars = ["Proxima Centauri": 4.24, "Alpha Centauri A": 4.37]
var newCollection = mappedCloseStars.mapValues{ $0+1 }
newCollection // ["Proxima Centauri": "5.24", "Alpha Centauri A": "5.37]

// filter(_:)

let numArray6 = [1, 4, 10, 15]
let even = numArray.filter{ $0 % 2 == 0 }
even // [4, 10]

// zip(_:_:)

let collectionOne = [1, 2, 3]
let collectionTwo = [4, 5, 6]
var zipSequence = zip(collectionOne ,collectionTwo)
type(of: zipSequence) // Zip2Sequence<Array<Int>, Array<Int>>.Type // генерация массива из сформированной последовательности
Array(zipSequence) // [(.0 1, .1 4), (.0 2, .1 5), (.0 3, .1 6)] // генерация словаря на основе последовательности пар значений
let newDictionary1 = Dictionary(uniqueKeysWithValues: zipSequence)
newDictionary1 // [1: 4, 3: 6, 2: 5]

//Ленивые вычисления
// Замыкания в ленивых вычислениях

var arrayOfNames = ["Helga", "Bazil", "Alex"]
print(arrayOfNames.count)
let nextName = { arrayOfNames.remove(at: 0) }
arrayOfNames.count // 3
nextName() // Удаление элемента массива произходит только после обращения к константе, в которую записано замыкание
arrayOfNames.count // 2

// Введение в разработку приложений

// Перечисления enum

enum testEnum {
    case first
    case second
    case third
}

enum testEnum1 {
    case first, second, third
}

var varForEnum: testEnum = .first
var varForEnum1 = testEnum.first

// Ассоциированные параметры


enum AdvancedCurrencyUnit {
    case rouble(сountries: [String], shortName: String)
    case euro(сountries: [String], shortName: String)
}

var testEnum2: AdvancedCurrencyUnit = .euro(сountries: ["France", "Germany"] , shortName: "EUR")

//Вложенные перечисления

enum AdvancedCurrencyUnit1 {
    enum DollarCountries {
        case usa
        case canada
        case australia
    }
    case rouble(сountries: [String], shortName: String)
    case euro(сountries: [String], shortName: String)
    case dollar(сountries: DollarCountries, shortName: String)
}

var testEnum3: AdvancedCurrencyUnit1 = .dollar(сountries: .usa, shortName: "USD")

var australia: AdvancedCurrencyUnit1.DollarCountries = .australia

// Связанные значения

enum Smile: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"
}

var emotion = Smile.laugh

emotion.self
emotion.rawValue

//Свойства перечислений

enum Smile1: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"
    var description: String {return self.rawValue}
}
//Методы перечислений
enum Smile2: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"
    var description: String {return self.rawValue}
    func about(){
        print("Перечисление содержит список смайликов ")
    }
}

var otherSmile = Smile2.joy
otherSmile.about()

//Рекурсивные перечисления

enum ArithmeticExpression{
    case addition(Int, Int)
    case substraction(Int, Int)
    func evaluate() -> Int {
        switch self{
            case .addition(let left, let right):
                return left+right
            case .substraction(let left, let right):
                return left-right
        }
    }
}
var expr = ArithmeticExpression.addition(10, 14)
expr.evaluate() // 24

//Структуры
struct PlayerInChess {
    var name: String = ""
    var wins: UInt = 0
    //инициализатор
    init(name: String){
        self.name = name
    }
}

var harry = PlayerInChess(name: "Гарри")

//Методы в структурах

struct PlayerInChess1 {
var name: String = "Игрок"
    var wins: UInt = 0
    init(name: String){
        self.name = name }
    func description(){
        print("Игрок \(self.name) имеет \(self.wins) побед")
    }
}
var andrey = PlayerInChess1(name: "Андрей")
andrey.description()

//Классы
class Chessman {
    enum ChessManType {
        case king, queen, bishop, pawn, knight, castle
    }
    enum ChessColor {
        case white, black
    }
    // тип фигуры
    let type: ChessManType
    // цвет фигуры
    let color: ChessColor
    //координаты фигуры
    var coordinates: (String, Int)? = nil
    // символ, соответствующий фигуре
    let figureSymbol: Character
    // инициализатор
    init(type: ChessManType, color: ChessColor, figure: Character){
        self.type = type
        self.color = color
        self.figureSymbol = figure
    }
    init(type: ChessManType, color: ChessColor, figure: Character,
        coordinates: (String, Int)){
        self.type = type
        self.color = color
        self.figureSymbol = figure
        self.setCoordinates(char: coordinates.0, num: coordinates.1)
    }
    func setCoordinates(char c: String, num n: Int){
        self.coordinates = (c, n)
    }
    func kill() {
        self.coordinates = nil
    }
}
// создаем экземпляр фигуры
var kingWhite = Chessman(type: .king, color: .white, figure: "\u{2654}")
kingWhite.figureSymbol
var kingBlack = Chessman(type: .king, color: .black, figure: "\u{2654}")
kingBlack.figureSymbol

kingWhite.setCoordinates(char: "E", num: 1)

var queenBlack = Chessman(type: .queen, color: .black, figure:
"\u{2655}", coordinates: ("A", 6))

//в классе так же можно вкладывать различные типы данных, например перечисления

//Свойства

class AboutMan {
    var firstName = "Имя"
    var secondName = "Фамилия"
    
    func generateFullName() -> String {
        return self.firstName + " " + self.secondName
    }
    
    lazy var fullName: String = self.generateFullName()
    
    init(name: String, secondName: String) {
        (self.firstName, self.secondName) = (name, secondName)
    }
}

var Me = AboutMan(name: "Алекс", secondName: "Сав")

Me.fullName

//Используем замыкание заключенное в свойство класса для доступа к другим свойствам и методам в этом классе
//Используемое ключевое слово lazy является lazy-by-name (Вычисляется по обращению)
class AboutMan1 {
    var firstName = "Имя"
    var secondName = "Фамилия"
    
    lazy var fullName: () -> String = {"\(self.firstName) \(self.secondName)"}
    
    init(name: String, secondName: String) {
        (self.firstName, self.secondName) = (name, secondName)
    }
}

var Me1 = AboutMan1(name: "Дилан", secondName: "Пол")

Me1.fullName()
Me1.firstName = "Борис"
Me1.fullName()


//Вычисляемые свойства

class AboutMan2{
    var firstName = "Имя"
    var secondName = "Фамилия"
    var wholeName: String { return "\(self.firstName) \(self.secondName)" }
    init(name: String, secondName: String){
        ( self.firstName, self.secondName ) = ( name, secondName )
    }
}
var otherMan = AboutMan2(name: "Алексей", secondName:"Олейник")
otherMan.wholeName // "Алексей Олейник"
otherMan.secondName = "Дуров"
otherMan.wholeName // "Алексей Дуров"

//Контроль значений свойств (get-set конструкция)

struct Circle {
    var coordinates: (x: Int, y: Int)
    var radius: Float {
        willSet(newValueOfRadius) {
            print("Вместо значения \(self.radius) будет установленно значение \(newValueOfRadius)")
        }
        didSet(oldValueOfRadius) {
            print("Вместо значения \(oldValueOfRadius) было установленно значение \(self.radius)")
        }
    }
    var perimiter: Float {
        get{
            return 2.0*3.14*self.radius
        }
        set(newPerimiter){
            self.radius = newPerimiter / (2*3.14)
        }
    }
}

var newCircle = Circle(coordinates: (0, 0), radius: 10)
newCircle.perimiter
newCircle.perimiter = 31.2
newCircle.radius

//Наблюдатели (для невычислямых свойств) willset и didset


//Свойства для типов (static)

struct AudioChannel {
    static var maxVolume = 5
    var volume: Int {
        didSet {
            if volume > AudioChannel.maxVolume {
                volume = AudioChannel.maxVolume
            }
        }
    }
}
var LeftChannel = AudioChannel(volume: 2)
var RightChannel = AudioChannel(volume: 3)
RightChannel.volume = 6
RightChannel.volume // 5
AudioChannel.maxVolume // 5
AudioChannel.maxVolume = 10
AudioChannel.maxVolume // 10
RightChannel.volume = 8
RightChannel.volume // 8


class GameDesk {
    var desk: [Int:[String:Chessman]] = [:]
    init(){
        for i in 1...8 {
            desk[i]=[:]
        }
    }
    
    subscript(alpha: String, number: Int) -> Chessman? {
        get{
            return self.desk[number]![alpha]
        }
        set{
            if let chessman = newValue {
                self.setChessman(chess: chessman, coordinates:(alpha, number))
            }else{
                self.desk[number]![alpha] = nil
            }
        }
    }
    
    func setChessman(chess: Chessman, coordinates: (String, Int)) {
        let rowRang = 1...8
        let colRang = "A"..."Z"
        if rowRang.contains(coordinates.1) && colRang.contains(coordinates.0) {
            self.desk[coordinates.1]![coordinates.0] = chess
            chess.setCoordinates(char: coordinates.0, num: coordinates.1)
        } else {
            print("Coordinates out of range!")
        }
    }
}

var game = GameDesk()
game.setChessman(chess: queenBlack, coordinates: ("B", 2))
queenBlack.coordinates
game.setChessman(chess: queenBlack, coordinates: ("A", 8))
queenBlack.coordinates

game["A", 8]?.coordinates // если поле зянято, возвращается фигура, елси никого нет, возвращается nil

game["D", 2]
kingBlack.coordinates = ("C", 2)
kingBlack.coordinates
game["D", 2] = kingBlack

kingBlack.coordinates

// Наследование

class SuperClass {
    // тело суперкласса
}
class SubClass: SuperClass {
    // тело подкласса
}

// суперкласс
class Quadruped { var type = ""
    var name = ""
    func walk(){
        print("walk")
    }
}
// подкласс
class Dog: Quadruped {
    func bark(){
        print("woof")
    }
}
var dog = Dog()
dog.type = "dog"
dog.walk() // выводит walk
dog.bark() // выводит woof


//Протоколы

protocol NewProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol FullyName {
    var fullName: String {get set }
}
struct person: FullyName {
    var fullName: String
}

let John = person(fullName: "John Bowl")

print(John.fullName)

protocol RandomNumberGenerator {
    func random() -> Double
    static func getRandomString()
    mutating func changeValue(newValue: Double)
}


let value = "a"

switch value{
case "a":
    print("a")
    fallthrough
case "b":
    print("b")

default:
    print("")
}
let days: [String?] = ["Monday", nil, "Wensday", nil, "Sunday"]
var days1: [String] = ["Monday"]

days.forEach {
    print($0)
}

if let day = days.randomElement() {
    print(day)
}
  
days

//days += ["Tuesday", "Wensday"]

var aaddff: String = "Mark"

print(aaddff.uppercased())

var agge: Int!

print("Age \(agge ?? 20)")

let someLet: String = String(describing: String.self)
print(someLet)


let someLet2 = [1,2,3].flatMap {[$0,$0]}

print(someLet2)

newFunc()

func newFunc(){
    print("Some Text")
}

newFunc()


protocol Node: class {
var value: String { get set }
}



let bar = 0x10
print(bar)

enum techys: Int {
    case techP = 1
    case techT
    case techS
    case techPolis
}

let proj = techys(rawValue: 3)
print(type(of: proj))

var dayz: String? = "John"

let pass: Bool? = false

if !pass! {
    print("f")
} else {
    print("g")
}

days1.append(contentsOf: ["tea", "kls"])
var techproj = [String]()

techproj.reserveCapacity(1)

let gff: String?

print("hello, \(gff)!")

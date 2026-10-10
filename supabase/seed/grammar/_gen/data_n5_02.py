G = [
dict(
n=11,
jp="が",
rd="ga",
tr="Marca o sujeito / Quem / O que",
ex="""が é a partícula que marca o sujeito da frase, ou seja, quem faz a ação ou aquilo que está sendo descrito.

Ela é usada principalmente quando a informação é nova ou quando queremos destacar exatamente quem ou o que. Por isso, palavras de pergunta como 誰 e 何 vêm sempre com が quando são o sujeito, e a resposta também usa が.

Também usamos が para descrever o que acontece ou o que vemos, como fenômenos da natureza e cenas que acabamos de notar.

Alguns verbos e adjetivos pedem が para indicar o "objeto" do sentimento ou da capacidade, como gostar, querer, entender e saber fazer algo. Nesses casos, a coisa de que se gosta ou que se entende é marcada com が, e não com を.

A diferença entre が e は é um dos pontos mais importantes do japonês: は apresenta o tema da conversa ("falando de..."), enquanto が aponta o sujeito específico, muitas vezes com destaque.""",
st="""Substantivo + が + Verbo
Substantivo + が + Adjetivo
Palavra interrogativa (誰 / 何 / どれ) + が
Lugar + に + Substantivo + が + ある / いる
Substantivo + が + 好き / 嫌い / 上手 / 下手 / わかる / ほしい
Tema + は + Parte + が + Adjetivo""",
no="""Na estrutura de dois sujeitos, は indica o tema geral e が indica uma parte ou característica dele. É assim que o japonês expressa ideias como "o elefante tem a tromba comprida".

が também pode ser usado como conjunção no meio da frase, com sentido de "mas". Esse uso é mais educado que けど e aparece bastante em frases formais.

Quando se responde a uma pergunta que usou が, a resposta deve usar が também. Trocar por は soa estranho nesse contexto.""",
bf="が",
rx="が",
tk=["が"],
va=["が"],
E=[
("猫がいます。", "ねこがいます。", "Tem um gato."),
("誰が来ましたか。", "だれがきましたか。", "Quem veio?"),
("雨が降っています。", "あめがふっています。", "Está chovendo."),
("このケーキは私が作りました。", "このケーキはわたしがつくりました。", "Fui eu que fiz este bolo."),
("象は鼻が長い。", "ぞうははながながい。", "O elefante tem a tromba comprida."),
],
R=[
("空____青いです。", "O céu está azul.", ["が"]),
("誰____窓を開けましたか。", "Quem abriu a janela?", ["が"]),
("机の上に本____あります。", "Tem um livro em cima da mesa.", ["が"]),
("「誰が掃除しましたか。」「私____しました。」", "\"Quem fez a limpeza?\" \"Fui eu.\"", ["が"]),
("妹は目____大きいです。", "Minha irmã mais nova tem olhos grandes.", ["が"]),
],
),
dict(
n=12,
jp="〜があります",
rd="ga arimasu",
tr="Ter / Haver / Existir",
ex="""があります é usado para dizer que alguma coisa existe ou está em algum lugar. Equivale a "tem", "há" ou "existe".

O verbo ある é usado para coisas que não se movem sozinhas: objetos, plantas, prédios e lugares. Para pessoas e animais, usa-se いる.

ある também serve para dizer que você tem ou não tem algo, como tempo, dinheiro ou uma ideia, e para falar de eventos que vão acontecer ou aconteceram, como provas, reuniões e festas.

Quando ある indica a localização de um objeto, o lugar é marcado com に. Mas quando ある indica um evento, o lugar onde ele acontece é marcado com で, porque um evento é algo que "acontece" em um lugar.""",
st="""Lugar + に + Coisa + があります
Substantivo + があります (possuir algo / ter um evento)
Lugar + で + Evento + があります

Negativo: がありません
Passado: がありました
Passado negativo: がありませんでした

Informal: がある / がない / があった / がなかった""",
no="""A forma negativa informal de ある é ない, e não あらない. É um dos poucos verbos com negativo irregular.

Quando a frase pergunta "onde está" algo já conhecido, a ordem muda: a coisa vem com は e o lugar com に, como em uma resposta sobre a localização de um objeto específico.

Na pergunta, 何かありますか significa "tem alguma coisa?", e a resposta negativa natural é 何もありません.""",
bf="ある",
rx="があります|がありません|がありました|がありませんでした|がある|があった|がない|がなかった",
tk=["が", "ある"],
va=["があります", "がありません", "がありました", "がありませんでした", "がある", "がない", "があった", "がなかった"],
E=[
("机の上に本があります。", "つくえのうえにほんがあります。", "Tem um livro em cima da mesa."),
("駅の近くに大きいスーパーがあります。", "えきのちかくにおおきいスーパーがあります。", "Perto da estação tem um supermercado grande."),
("明日、テストがあります。", "あした、テストがあります。", "Amanhã tem prova."),
("今日は時間がありません。", "きょうはじかんがありません。", "Hoje não tenho tempo."),
("昨日、家の近くで火事がありました。", "きのう、いえのちかくでかじがありました。", "Ontem houve um incêndio perto de casa."),
],
R=[
("部屋にテレビ____。", "Tem uma TV no quarto.", ["があります", "がある"]),
("この町には病院____。", "Nesta cidade não tem hospital.", ["がありません", "がない"]),
("来週、大事な会議____。", "Semana que vem tem uma reunião importante.", ["があります", "がある"]),
("財布にお金____。", "Não tem dinheiro na carteira.", ["がありません", "がない"]),
("先週、学校でお祭り____。", "Semana passada teve um festival na escola.", ["がありました", "があった"]),
],
),
dict(
n=13,
jp="〜がほしい",
rd="ga hoshii",
tr="Querer (algo) / Desejar",
ex="""がほしい é usado para dizer que você quer alguma coisa, como um objeto, um animal, tempo ou uma pessoa na sua vida.

O ponto principal é que ほしい é um adjetivo い, e não um verbo. Por isso, a coisa desejada é marcada com が, e a conjugação segue as regras dos adjetivos い: ほしくない para o negativo e ほしかった para o passado.

ほしい serve para coisas (substantivos). Para dizer que você quer fazer uma ação, a gramática é outra: a forma たい do verbo.

ほしい expressa um desejo interno de quem fala. Por isso, em afirmações, ele é usado normalmente para "eu quero" e, em perguntas, para "você quer?". Para falar do desejo de outra pessoa, o japonês prefere outras formas, como citar o que ela disse ou usar ほしがっている.""",
st="""Substantivo + が + ほしい
Substantivo + が + ほしいです (educado)

Negativo: ほしくない / ほしくないです / ほしくありません
Passado: ほしかった / ほしかったです

Escrita: ほしい / 欲しい""",
no="""Na frase negativa, é comum trocar が por は, porque は dá um tom de contraste: "isso, eu não quero".

Perguntar diretamente a um superior se ele quer algo com ほしいですか pode soar invasivo. Em situações educadas, prefere-se oferecer, com expressões como いかがですか.

Hoje em dia, ほしい é escrito mais em hiragana, mas o kanji 欲しい também é muito usado.

Para falar do desejo de outra pessoa, usa-se 欲しがっている, e nesse caso o objeto passa a ser marcado com を.""",
bf="ほしい",
rx="がほしい|が欲しい|がほしく|が欲しく|がほしかった|が欲しかった",
tk=["が", "ほしい"],
va=["がほしい", "が欲しい", "がほしいです", "が欲しいです", "がほしくない", "が欲しくない", "がほしかった", "が欲しかった"],
E=[
("新しい車がほしいです。", "あたらしいくるまがほしいです。", "Quero um carro novo."),
("誕生日に何が欲しい？", "たんじょうびになにがほしい？", "O que você quer de aniversário?"),
("今は少し時間がほしいです。", "いまはすこしじかんがほしいです。", "Agora eu queria um pouco de tempo."),
("子供のころ、犬がほしかったです。", "こどものころ、いぬがほしかったです。", "Quando era criança, eu queria um cachorro."),
("もっと友達がほしいなあ。", "もっとともだちがほしいなあ。", "Queria ter mais amigos..."),
],
R=[
("冷たい水が____。", "Quero água gelada.", ["ほしい", "欲しい", "ほしいです", "欲しいです"]),
("私は新しいくつ____です。", "Eu quero sapatos novos.", ["がほしい", "が欲しい"]),
("誕生日に何____ですか。", "O que você quer de aniversário?", ["がほしい", "が欲しい"]),
("子供のころ、自転車が____。", "Quando era criança, eu queria uma bicicleta.", ["ほしかった", "欲しかった", "ほしかったです", "欲しかったです"]),
("弟は新しいゲームが____と言っています。", "Meu irmão mais novo diz que quer um jogo novo.", ["ほしい", "欲しい"]),
],
),
dict(
n=14,
jp="〜がいます",
rd="ga imasu",
tr="Ter / Haver / Estar (seres vivos)",
ex="""がいます é usado para dizer que um ser vivo existe ou está em algum lugar. Equivale a "tem", "há" ou "está".

O verbo いる é usado para pessoas e animais, ou seja, seres que se movem por conta própria. Para objetos e plantas, usa-se ある.

Além de indicar onde alguém está, いる também serve para dizer que você tem alguém na sua vida, como irmãos, filhos, amigos, namorado ou um animal de estimação.

O lugar onde o ser vivo está é marcado com に. A pessoa ou o animal é marcado com が quando a informação é nova.""",
st="""Lugar + に + Ser vivo + がいます
Pessoa + (に) は + Ser vivo + がいます (ter família, amigos, animais)

Negativo: がいません
Passado: がいました
Passado negativo: がいませんでした

Informal: がいる / がいない / がいた / がいなかった""",
no="""Às vezes a escolha entre いる e ある depende de como a coisa é vista. Um táxi ou ônibus parado com motorista, esperando passageiros, costuma ser tratado com いる, porque a ideia é de alguém ali.

Robôs e personagens também podem ser tratados com いる quando são vistos como "seres".

Quando se diz quantas pessoas há, o número costuma vir entre が e います, com contadores como 人.""",
bf="いる",
rx="がいます|がいません|がいました|がいませんでした|がいる|がいた|がいない|がいなかった",
tk=["が", "いる"],
va=["がいます", "がいません", "がいました", "がいませんでした", "がいる", "がいない", "がいた", "がいなかった"],
E=[
("公園に子供がいます。", "こうえんにこどもがいます。", "Tem crianças no parque."),
("私には姉がいます。", "わたしにはあねがいます。", "Eu tenho uma irmã mais velha."),
("木の上に鳥がいます。", "きのうえにとりがいます。", "Tem um pássaro em cima da árvore."),
("教室に先生がいません。", "きょうしつにせんせいがいません。", "O professor não está na sala de aula."),
("昔、この家には猫がいました。", "むかし、このいえにはねこがいました。", "Antigamente, havia um gato nesta casa."),
],
R=[
("池に魚____。", "Tem peixes no lago.", ["がいます", "がいる"]),
("私は兄弟____。", "Eu não tenho irmãos.", ["がいません", "がいない"]),
("部屋に誰____か。", "Tem alguém no quarto?", ["がいます"]),
("昨日、庭に大きい犬____。", "Ontem havia um cachorro grande no quintal.", ["がいました", "がいた"]),
("駅の前にタクシー____。", "Tem táxis em frente à estação.", ["がいます", "がいる"]),
],
),
dict(
n=15,
jp="〜ほうがいい",
rd="hou ga ii",
tr="É melhor / Deveria / Seria bom",
ex="""ほうがいい é usado para dar conselhos e recomendações. Equivale a "é melhor..." ou "você deveria...".

A palavra ほう significa "lado" ou "opção". A ideia é comparar: entre fazer e não fazer, "o lado de fazer é melhor". Por isso, o conselho soa bem claro e direto.

Para aconselhar a fazer algo, o mais comum é usar o verbo no passado (forma た), mesmo que a ação seja no futuro. Para aconselhar a não fazer algo, usa-se a forma ない.

Como o conselho é direto, ele pode soar forte quando dito a um superior. Para suavizar, os japoneses costumam acrescentar と思います ou よ no final.""",
st="""Verbo na forma た + ほうがいい
Verbo na forma ない + ほうがいい

Educado: ほうがいいです
Mais suave: ほうがいいと思います

Escrita: ほうがいい / 方がいい
Forma escrita mais formal: ほうがよい""",
no="""Usar a forma de dicionário em vez da forma た também é possível, mas a forma た soa mais natural e é a mais usada quando se dá um conselho direto a alguém.

Com a forma ない, nunca se usa o passado: o correto é ないほうがいい, e não なかったほうがいい.

A palavra ほう aqui é a mesma de より〜ほうが, usada para comparações. Lembrar dessa ligação ajuda a entender por que o conselho tem um tom de escolha entre duas opções.""",
bf="ほうがいい",
rx="ほうがいい|方がいい|ほうがよい|方がよい",
tk=["ほう", "が", "いい"],
va=["ほうがいい", "方がいい", "ほうがいいです", "方がいいです", "ほうがよい", "方がよい"],
E=[
("早く寝たほうがいいですよ。", "はやくねたほうがいいですよ。", "É melhor você dormir cedo."),
("傘を持っていったほうがいい。", "かさをもっていったほうがいい。", "É melhor levar guarda-chuva."),
("あまりお酒を飲まないほうがいいです。", "あまりおさけをのまないほうがいいです。", "É melhor não beber muito."),
("熱があるなら、病院に行った方がいいよ。", "ねつがあるなら、びょういんにいったほうがいいよ。", "Se você está com febre, é melhor ir ao hospital."),
("この道は夜は危ないから、通らないほうがいいと思います。", "このみちはよるはあぶないから、とおらないほうがいいとおもいます。", "Esta rua é perigosa à noite, então acho melhor não passar por ela."),
],
R=[
("疲れているなら、休んだ____よ。", "Se você está cansado, é melhor descansar.", ["ほうがいい", "方がいい", "ほうがいいです", "方がいいです"]),
("冬の北海道は寒いから、コートを着た____です。", "Hokkaido no inverno é frio, então é melhor usar casaco.", ["ほうがいい", "方がいい"]),
("夜遅くに一人で歩かない____。", "É melhor não andar sozinho tarde da noite.", ["ほうがいい", "方がいい", "ほうがいいです", "方がいいです"]),
("風邪なら、薬を飲んだ____ですよ。", "Se for resfriado, é melhor você tomar o remédio.", ["ほうがいい", "方がいい"]),
("先生に聞いた____と思います。", "Acho que é melhor perguntar ao professor.", ["ほうがいい", "方がいい"]),
],
),
dict(
n=16,
jp="い形容詞",
rd="i-keiyoushi",
tr="Adjetivo い / Adjetivo terminado em い",
ex="""Os adjetivos い são adjetivos que terminam em い na forma básica e que se conjugam sozinhos, quase como verbos. Eles mostram qualidades, sensações e estados, como grande, frio, gostoso e divertido.

Diferente do português, em japonês o próprio adjetivo muda para indicar negativo e passado. Para isso, tira-se o い final e acrescenta-se uma terminação: くない para o negativo, かった para o passado e くなかった para o passado negativo.

Para deixar a frase educada, basta colocar です depois da forma conjugada. Não se usa だ com adjetivos い.

Antes de um substantivo, o adjetivo い fica na forma básica, sem mudança nenhuma. Para ligar dois adjetivos, troca-se o い por くて.

O adjetivo いい, que significa "bom", é irregular: nas conjugações ele vira よ, formando よくない, よかった e よくなかった.""",
st="""Afirmativo: Adjetivo い
Negativo: Adjetivo sem い + くない
Passado: Adjetivo sem い + かった
Passado negativo: Adjetivo sem い + くなかった

Educado: forma conjugada + です
Negativo educado alternativo: sem い + くありません / くありませんでした

Antes de substantivo: Adjetivo い + Substantivo
Ligando adjetivos: sem い + くて

Irregular: いい → よくない / よかった / よくなかった""",
no="""Algumas palavras terminam em い, mas não são adjetivos い. As mais famosas são きれい e 嫌い, que são adjetivos な. Elas formam o negativo com じゃない, e não com くない.

Um erro comum de iniciantes é usar でした com adjetivos い, como おいしいでした. O passado educado correto é おいしかったです: o passado fica no adjetivo, e です só deixa a frase educada.

A forma くありません soa um pouco mais formal que くないです, mas as duas são corretas e muito usadas.""",
bf="い",
rx="いです|くない|かった|くなかった|くありません",
tk=["い", "くない", "かった", "くなかった"],
va=["い", "くない", "かった", "くなかった", "くありません", "くありませんでした", "くて"],
E=[
("この本はおもしろいです。", "このほんはおもしろいです。", "Este livro é interessante."),
("今日はあまり寒くない。", "きょうはあまりさむくない。", "Hoje não está muito frio."),
("昨日の映画は楽しかったです。", "きのうのえいがはたのしかったです。", "O filme de ontem foi divertido."),
("旅行はあまりよくなかった。", "りょこうはあまりよくなかった。", "A viagem não foi muito boa."),
("このラーメンは安くて、おいしいです。", "このラーメンはやすくて、おいしいです。", "Este ramen é barato e gostoso."),
],
R=[
("このかばんはあまり高____。", "Esta bolsa não é muito cara.", ["くない", "くないです", "くありません"]),
("昨日はとても寒____。", "Ontem estava muito frio.", ["かった", "かったです"]),
("先週のテストは難し____。", "A prova da semana passada não foi difícil.", ["くなかった", "くなかったです", "くありませんでした"]),
("この部屋は広____です。", "Este quarto é amplo.", ["い"]),
("昨日のパーティーはとても____です。", "A festa de ontem foi muito boa.", ["よかった"]),
],
),
dict(
n=17,
jp="一番",
rd="ichiban",
tr="O mais / Número um / Primeiro lugar",
ex="""一番 é usado para formar o superlativo, ou seja, para dizer que algo é "o mais" de um grupo. Literalmente, significa "número um".

Ele vem antes de um adjetivo, de um advérbio ou de expressões como 好き, mostrando que aquilo está no grau máximo: o mais alto, o mais barato, o que eu mais gosto.

Muitas vezes, o grupo de comparação é indicado antes, com expressões como の中で ("entre") ou com um lugar seguido de で, como "no Japão" ou "na turma".

一番 também pode ser usado como substantivo, com o sentido de "primeiro lugar".""",
st="""一番 + Adjetivo
一番 + Advérbio / 好き / 嫌い
[Grupo] + の中で + [A] + が + 一番 + Adjetivo
[Lugar] + で + 一番 + Adjetivo + Substantivo
一番 + Substantivo (primeiro lugar)

Escrita: 一番 / いちばん""",
no="""Para perguntar "qual é o mais...", usa-se uma palavra interrogativa com が, como 何が, 誰が, どこが ou いつが, seguida de 一番.

Quando a comparação é entre exatamente duas coisas, o japonês não usa 一番, e sim a estrutura com より e ほうが.

Na escrita do dia a dia, いちばん em hiragana é muito comum, principalmente quando funciona como advérbio.""",
bf="一番",
rx="一番|いちばん",
tk=["一番"],
va=["一番", "いちばん"],
E=[
("富士山は日本で一番高い山です。", "ふじさんはにほんでいちばんたかいやまです。", "O Monte Fuji é a montanha mais alta do Japão."),
("果物の中でりんごが一番好きです。", "くだもののなかでりんごがいちばんすきです。", "De todas as frutas, a que eu mais gosto é maçã."),
("一番近い駅はどこですか。", "いちばんちかいえきはどこですか。", "Qual é a estação mais próxima?"),
("クラスで誰が一番背が高いですか。", "クラスでだれがいちばんせがたかいですか。", "Quem é o mais alto da turma?"),
("朝、学校に一番早く来たのは田中さんでした。", "あさ、がっこうにいちばんはやくきたのはたなかさんでした。", "Quem chegou mais cedo à escola de manhã foi o Tanaka."),
],
R=[
("家族の中で父が____背が高いです。", "Na minha família, quem é mais alto é meu pai.", ["一番", "いちばん"]),
("一年で____寒い月は何月ですか。", "Qual é o mês mais frio do ano?", ["一番", "いちばん"]),
("スポーツの中で何が____好きですか。", "De todos os esportes, qual você mais gosta?", ["一番", "いちばん"]),
("この店で____人気があるのはこのケーキです。", "O mais popular desta loja é este bolo.", ["一番", "いちばん"]),
("マラソン大会で____になりました。", "Fiquei em primeiro lugar na maratona.", ["一番", "いちばん"]),
],
),
dict(
n=18,
jp="一緒に",
rd="issho ni",
tr="Juntos / Junto com",
ex="""一緒に significa "juntos". Ele mostra que duas ou mais pessoas fazem a mesma ação ao mesmo tempo, ou no mesmo lugar.

Ele funciona como um advérbio, então vem antes do verbo. Para dizer com quem a ação é feita, usa-se a pessoa seguida da partícula と antes de 一緒に.

É muito comum em convites. Junto com ませんか ou ましょう, ele forma convites naturais para fazer algo com alguém.

Quando o "com quem" já está claro pela conversa, a pessoa pode ser omitida, e 一緒に sozinho já entende-se como "comigo" ou "com a gente".""",
st="""一緒に + Verbo
Pessoa + と + 一緒に + Verbo
一緒に + Verbo ませんか (convite)
一緒に + Verbo ましょう (proposta)

Escrita: 一緒に / いっしょに""",
no="""A palavra 一緒 sozinha significa "juntos" ou "o mesmo". Por isso, a expressão 一緒です pode significar "é igual" ou "estamos juntos", dependendo do contexto.

Dizer só と, sem 一緒に, também é possível, mas 一緒に reforça a ideia de que a ação foi compartilhada.

Em grupos, o japonês costuma usar みんなで antes de 一緒に para dizer "todos juntos".""",
bf="一緒に",
rx="一緒に|いっしょに",
tk=["一緒", "に"],
va=["一緒に", "いっしょに"],
E=[
("一緒に帰りましょう。", "いっしょにかえりましょう。", "Vamos voltar juntos."),
("友達と一緒に映画を見ました。", "ともだちといっしょにえいがをみました。", "Vi um filme junto com um amigo."),
("週末、一緒に買い物に行きませんか。", "しゅうまつ、いっしょにかいものにいきませんか。", "Quer ir fazer compras comigo no fim de semana?"),
("毎朝、犬と一緒に公園を散歩します。", "まいあさ、いぬといっしょにこうえんをさんぽします。", "Toda manhã, passeio no parque junto com o cachorro."),
("今は家族と一緒に住んでいます。", "いまはかぞくといっしょにすんでいます。", "Agora moro junto com a minha família."),
],
R=[
("明日、____勉強しませんか。", "Amanhã, quer estudar junto comigo?", ["一緒に", "いっしょに"]),
("母と____料理を作りました。", "Fiz comida junto com a minha mãe.", ["一緒に", "いっしょに"]),
("みんなで____歌いましょう。", "Vamos todos cantar juntos.", ["一緒に", "いっしょに"]),
("いつか彼女と____旅行に行きたいです。", "Algum dia quero viajar junto com a minha namorada.", ["一緒に", "いっしょに"]),
("子供のころ、よく祖父と____釣りに行きました。", "Quando era criança, eu ia muito pescar junto com meu avô.", ["一緒に", "いっしょに"]),
],
),
dict(
n=19,
jp="いつも",
rd="itsumo",
tr="Sempre / Normalmente / De costume",
ex="""いつも significa "sempre". Ele mostra que algo acontece toda vez, de forma constante ou como hábito.

Como é um advérbio, ele normalmente aparece antes do verbo ou do adjetivo, e pode ficar no começo da frase ou logo depois do tema.

Com verbos no presente, いつも expressa hábitos e rotinas. Com adjetivos ou descrições, mostra uma característica que aparece o tempo todo.

Quando vem antes de の e de um substantivo, いつもの quer dizer "o de sempre", "o de costume". E, em comparações com より, いつも funciona como "o normal", o padrão do dia a dia.""",
st="""いつも + Verbo (hábito)
いつも + Adjetivo / Substantivo + です
いつもの + Substantivo (o de sempre)
いつも + より (comparado com o normal)""",
no="""A expressão いつもありがとうございます é um agradecimento muito comum, usado para agradecer por tudo o que a pessoa faz normalmente, e não por algo específico.

いつも indica uma frequência quase total. Para frequências menores, o japonês usa palavras como よく (com frequência), 時々 (às vezes) e あまり〜ない (não muito).

いつも é diferente de ずっと: いつも fala de algo que se repete, enquanto ずっと fala de algo contínuo, sem interrupção.""",
bf="いつも",
rx="いつも",
tk=["いつも"],
va=["いつも"],
E=[
("私はいつも七時に起きます。", "わたしはいつもしちじにおきます。", "Eu sempre acordo às sete."),
("田中さんはいつも元気ですね。", "たなかさんはいつもげんきですね。", "O Tanaka está sempre animado, né?"),
("いつもの店で会いましょう。", "いつものみせであいましょう。", "Vamos nos encontrar no lugar de sempre."),
("朝はいつもコーヒーを飲みます。", "あさはいつもコーヒーをのみます。", "De manhã, sempre tomo café."),
("いつもありがとうございます。", "いつもありがとうございます。", "Obrigado por sempre me ajudar."),
],
R=[
("父は____新聞を読んでいます。", "Meu pai está sempre lendo jornal.", ["いつも"]),
("姉は____忙しいです。", "Minha irmã mais velha está sempre ocupada.", ["いつも"]),
("昼ご飯は____会社の食堂で食べます。", "Sempre almoço no refeitório da empresa.", ["いつも"]),
("今日は____より早く起きました。", "Hoje acordei mais cedo do que de costume.", ["いつも"]),
("すみません、____のコーヒーをください。", "Com licença, me dê o café de sempre.", ["いつも"]),
],
),
dict(
n=20,
jp="〜じゃない・〜ではない",
rd="ja nai / dewa nai",
tr="Não é / Não está / Não ser",
ex="""じゃない e ではない são a forma negativa de だ e です. Eles servem para dizer que algo "não é" alguma coisa.

São usados depois de substantivos e de adjetivos な (sem o な). Com adjetivos い, o negativo é diferente: usa-se くない.

A diferença entre as duas formas é o tom. ではない é a forma completa e soa mais formal e mais adequada à escrita. じゃない é a contração falada de では e é a mais comum nas conversas.

Para deixar educado, existem duas opções: じゃありません / ではありません, que são mais formais, e じゃないです / ではないです, que são educadas mas um pouco mais leves.

Com entonação de pergunta, じゃない também pode ser usado para confirmar algo que a pessoa acha que é verdade, como "não é o Tanaka?".""",
st="""Substantivo + じゃない / ではない
Adjetivo な (sem な) + じゃない / ではない

Educado: じゃありません / ではありません / じゃないです / ではないです
Passado: じゃなかった / ではなかった
Passado educado: じゃありませんでした / ではありませんでした / じゃなかったです / ではなかったです""",
no="""Na escrita formal, como relatórios e textos acadêmicos, prefere-se ではない. Na fala cotidiana, じゃない aparece muito mais.

O uso de じゃない como confirmação depende da entonação: subindo no final, a frase vira uma pergunta do tipo "não é?". Esse uso também aparece com verbos e adjetivos, como em "não é bom?".

Um erro comum é usar じゃない com adjetivos い, como dizer 高いじゃない querendo dizer "não é caro". O correto é 高くない.""",
bf="ではない",
rx="じゃない|ではない|じゃありません|ではありません|じゃなかった|ではなかった",
tk=["じゃ", "では", "ない"],
va=["じゃない", "ではない", "じゃありません", "ではありません", "じゃないです", "ではないです", "じゃなかった", "ではなかった"],
E=[
("私は医者じゃない。", "わたしはいしゃじゃない。", "Eu não sou médico."),
("これは私の傘ではありません。", "これはわたしのかさではありません。", "Este não é o meu guarda-chuva."),
("この町はあまり静かじゃないです。", "このまちはあまりしずかじゃないです。", "Esta cidade não é muito tranquila."),
("昨日は休みじゃなかった。", "きのうはやすみじゃなかった。", "Ontem não foi folga."),
("野菜はあまり好きではありません。", "やさいはあまりすきではありません。", "Não gosto muito de verdura."),
],
R=[
("彼は学生____。", "Ele não é estudante.", ["じゃない", "ではない", "じゃありません", "ではありません", "じゃないです", "ではないです"]),
("この部屋はあまりきれい____。", "Este quarto não está muito limpo.", ["じゃない", "ではない", "じゃありません", "ではありません", "じゃないです", "ではないです"]),
("今日は月曜日____。火曜日です。", "Hoje não é segunda-feira. É terça.", ["じゃありません", "ではありません", "じゃないです", "ではないです"]),
("昨日のテストは簡単____。", "A prova de ontem não foi fácil.", ["じゃなかった", "ではなかった", "じゃありませんでした", "ではありませんでした", "じゃなかったです", "ではなかったです"]),
("「あれ、田中さん____？」「うん、そうだよ。」", "\"Ei, aquele não é o Tanaka?\" \"É, sim.\"", ["じゃない"]),
],
),
]

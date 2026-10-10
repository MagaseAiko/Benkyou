G = [
dict(
n=111,
jp="〜そうもない・〜そうにない",
rd="sou mo nai / sou ni nai",
tr="Não parece que vai / Pelo jeito não vai / Sem chance de",
ex="""そうもない e そうにない são usados para dizer que, pelo que se vê ou se sente, algo provavelmente não vai acontecer. Equivalem a "não parece que vai...", "pelo jeito não vai..." ou "sem chance de...".

Elas são a forma negativa da そうだ de aparência. Em vez de dizer "parece que vai acontecer", dizem "não parece que vai acontecer".

A estrutura junta o verbo na forma ます sem ます com そうもない ou そうにない. As duas formas têm o mesmo sentido; そうもない é um pouco mais enfática.

É muito usada com verbos potenciais e com verbos de mudança, como terminar, parar e chegar. Por exemplo, "este trabalho não parece que vai terminar hoje" ou "a chuva não dá sinal de parar".""",
st="""Verbo na forma ます sem ます + そうもない / そうにない
Verbo potencial sem ます + そうもない / そうにない

Educado: そうもありません / そうにありません""",
no="""A forma "Verbo + そうではない" existe, mas soa menos natural para esse sentido. そうもない e そうにない são as formas mais usadas.

Para adjetivos, a negação da aparência é diferente: おいしくなさそう (não parece gostoso).

Essa estrutura expressa uma previsão pessimista, muitas vezes com um pouco de frustração.""",
bf="そうもない",
rx="そうもない|そうにない|そうもありません|そうにありません",
tk=["そう", "も", "ない"],
va=["そうもない", "そうにない", "そうもありません", "そうにありません"],
E=[
("この仕事は今日中に終わりそうもない。", "このしごとはきょうじゅうにおわりそうもない。", "Este trabalho não parece que vai terminar hoje."),
("雨はやみそうにない。", "あめはやみそうにない。", "A chuva não dá sinal de parar."),
("この問題は難しくて、解けそうもない。", "このもんだいはむずかしくて、とけそうもない。", "Esta questão é difícil, e pelo jeito não vou conseguir resolver."),
("もう八時だ。彼は来そうにありません。", "もうはちじだ。かれはきそうにありません。", "Já são oito horas. Pelo jeito, ele não vem."),
("一人では運べそうもないので、手伝ってください。", "ひとりではこべそうもないので、てつだってください。", "Sozinho não vou conseguir carregar, então me ajude, por favor."),
],
R=[
("今日は忙しくて、早く帰れ____。", "Hoje estou ocupado, e pelo jeito não vou conseguir sair cedo.", ["そうもない", "そうにない"]),
("この渋滞では、約束の時間に間に合い____。", "Com este congestionamento, não parece que vou chegar a tempo.", ["そうもない", "そうにない"]),
("あんなに怒っていたから、彼女は許してくれ____。", "Ela estava tão brava que pelo jeito não vai me perdoar.", ["そうもない", "そうにない"]),
("この量は一人では食べ切れ____。", "Esta quantidade, sozinho, não parece que vou conseguir comer tudo.", ["そうもない", "そうにない"]),
("雪はまだやみ____ですね。", "A neve ainda não parece que vai parar, né?", ["そうにない", "そうもない"]),
],
),
dict(
n=112,
jp="すでに",
rd="sude ni",
tr="Já / Anteriormente / A esta altura",
ex="""すでに é um advérbio que significa "já". Ele indica que algo aconteceu antes de certo momento, ou que uma situação já está estabelecida.

Ele tem o mesmo sentido básico de もう, mas soa mais formal e objetivo. Por isso, é muito comum em textos escritos, notícias, avisos, e-mails de trabalho e explicações formais.

Ele é usado principalmente com o verbo no passado ou na forma ている / ていた, para indicar algo concluído: "quando cheguei, a reunião já tinha começado".

Também aparece em avisos de esgotamento ou encerramento: "os ingressos já estão esgotados", "as inscrições já foram encerradas".""",
st="""すでに + Verbo no passado
すでに + Verbo て + いる / いた
すでに + Substantivo + だ / です

Escrita: すでに / 既に""",
no="""Comparando: もう é comum na conversa; すでに é mais formal e escrito.

すでに não é usado com o sentido de "mais" (como もう一つ), só com o sentido de "já".

Em e-mails de trabalho, すでにご存じかと思いますが ("como talvez já saiba...") é uma expressão educada.""",
bf="すでに",
rx="すでに|既に",
tk=["すでに"],
va=["すでに", "既に"],
E=[
("会場に着いたとき、会議はすでに始まっていた。", "かいじょうについたとき、かいぎはすでにはじまっていた。", "Quando cheguei ao local, a reunião já tinha começado."),
("その本はすでに読みました。", "そのほんはすでによみました。", "Esse livro eu já li."),
("申し訳ありませんが、チケットはすでに売り切れです。", "もうしわけありませんが、チケットはすでにうりきれです。", "Desculpe, mas os ingressos já estão esgotados."),
("彼はすでに家を出たそうです。", "かれはすでにいえをでたそうです。", "Dizem que ele já saiu de casa."),
("その問題については、すでに説明しました。", "そのもんだいについては、すでにせつめいしました。", "Sobre esse problema, já dei explicações anteriormente."),
],
R=[
("駅に着いたとき、電車は____出ていた。", "Quando cheguei à estação, o trem já tinha saído.", ["すでに", "既に"]),
("申し込みは____締め切られました。", "As inscrições já foram encerradas.", ["すでに", "既に"]),
("そのことは____知っています。", "Disso eu já sei.", ["すでに", "既に"]),
("店に行ったら、____閉まっていた。", "Quando fui à loja, ela já estava fechada.", ["すでに", "既に"]),
("彼は____新しい仕事を見つけたらしい。", "Parece que ele já encontrou um novo emprego.", ["すでに", "既に"]),
],
),
dict(
n=113,
jp="すなわち",
rd="sunawachi",
tr="Ou seja / Isto é / Quer dizer",
ex="""すなわち é uma conjunção usada para explicar, definir ou dizer a mesma coisa com outras palavras. Equivale a "ou seja", "isto é" ou "quer dizer".

Ela é usada para:
• Esclarecer quem ou o que é algo: "a irmã mais velha da minha mãe, ou seja, minha tia".
• Dar uma equivalência: "uma semana, isto é, sete dias".
• Tirar uma conclusão lógica: "ele passou na prova. Quer dizer, a partir do ano que vem é universitário".

すなわち é bem formal e aparece principalmente em textos escritos, discursos, livros e explicações acadêmicas.

Na conversa do dia a dia, os japoneses preferem つまり, que tem o mesmo sentido.""",
st="""A、 + すなわち + B (A, ou seja, B)
Frase 1 (com ponto final) + すなわち、 + Conclusão / Explicação

Escrita: すなわち / 即ち""",
no="""つまり é a forma mais comum na fala; すなわち soa literário e formal.

すなわち costuma ligar duas coisas que são exatamente equivalentes, enquanto つまり pode também resumir de forma mais livre.

Em textos de filosofia e em provérbios, すなわち aparece para definir ideias.""",
bf="すなわち",
rx="すなわち|即ち",
tk=["すなわち"],
va=["すなわち", "即ち"],
E=[
("日本の首都、すなわち東京は人口が多い。", "にほんのしゅと、すなわちとうきょうはじんこうがおおい。", "A capital do Japão, ou seja, Tóquio, tem uma grande população."),
("母の姉、すなわち私のおばは先生です。", "ははのあね、すなわちわたしのおばはせんせいです。", "A irmã mais velha da minha mãe, ou seja, minha tia, é professora."),
("彼は試験に合格した。すなわち、来年から大学生だ。", "かれはしけんにごうかくした。すなわち、らいねんからだいがくせいだ。", "Ele passou na prova. Quer dizer, a partir do ano que vem é universitário."),
("夏には一週間、すなわち七日間の休みがある。", "なつにはいっしゅうかん、すなわちなのかかんのやすみがある。", "No verão há uma semana, isto é, sete dias de folga."),
("学ぶことは、すなわち生きることだ。", "まなぶことは、すなわちいきることだ。", "Aprender é, ou seja, viver."),
],
R=[
("父の弟、____私のおじは医者だ。", "O irmão mais novo do meu pai, ou seja, meu tio, é médico.", ["すなわち"]),
("来月の一日、____四月一日から新学期が始まる。", "No dia primeiro do mês que vem, ou seja, primeiro de abril, começa o novo semestre.", ["すなわち"]),
("彼は返事をしなかった。____、反対だということだ。", "Ele não respondeu. Quer dizer, ele é contra.", ["すなわち"]),
("地球の衛星、____月について調べた。", "Pesquisei sobre o satélite da Terra, isto é, a Lua.", ["すなわち"]),
("「時は金なり」とは、____時間は大切だという意味だ。", "\"Tempo é dinheiro\" significa, ou seja, que o tempo é precioso.", ["すなわち"]),
],
),
dict(
n=114,
jp="数量＋は",
rd="suuryou + wa",
tr="Pelo menos / No mínimo",
ex="""Quando a partícula は vem depois de uma quantidade, ela indica o mínimo esperado ou estimado. Equivale a "pelo menos" ou "no mínimo".

Por exemplo, 二十分はかかります significa "leva pelo menos vinte minutos". A ideia é que o número real pode ser igual ou maior, mas não menor.

É usado para estimativas ("esta bolsa deve custar pelo menos cinquenta mil ienes"), metas pessoais ("procuro estudar pelo menos uma hora por dia") e avisos sobre tempo ou custo.

Para reforçar, é comum acrescentar 少なくとも (pelo menos) no começo da frase.""",
st="""Quantidade + は + Verbo (かかる / する / 必要だ / 来る)
少なくとも + Quantidade + は + …""",
no="""Esse uso de は é diferente do は que marca o tema. Aqui, ele vem logo depois de um número com contador.

Com も, o sentido é o oposto: 二時間もかかった destaca que é muito; 二時間はかかる indica o mínimo.

Em conversas sobre planos e orçamentos, essa estrutura é muito útil para dar estimativas realistas.""",
bf="は",
rx="は",
tk=["は"],
va=["は"],
E=[
("この仕事は、少なくとも三日はかかる。", "このしごとは、すくなくともみっかはかかる。", "Este trabalho vai levar pelo menos três dias."),
("駅まで歩くと、二十分はかかります。", "えきまであるくと、にじゅっぷんはかかります。", "A pé, até a estação leva pelo menos vinte minutos."),
("毎日一時間は勉強するようにしている。", "まいにちいちじかんはべんきょうするようにしている。", "Procuro estudar pelo menos uma hora todos os dias."),
("あの店には、一日に百人は客が来る。", "あのみせには、いちにちにひゃくにんはきゃくがくる。", "Aquela loja recebe pelo menos cem clientes por dia."),
("このブランドのかばんは、五万円はするだろう。", "このブランドのかばんは、ごまんえんはするだろう。", "Uma bolsa desta marca deve custar pelo menos cinquenta mil ienes."),
],
R=[
("休みの日は、一日に八時間____寝たい。", "Nos dias de folga, quero dormir pelo menos oito horas.", ["は"]),
("東京まで、車で三時間____かかる。", "Até Tóquio leva pelo menos três horas de carro.", ["は"]),
("彼は一日に二リットル____水を飲む。", "Ele bebe pelo menos dois litros de água por dia.", ["は"]),
("この料理を作るには、一時間____必要だ。", "Para fazer esta comida, é preciso pelo menos uma hora.", ["は"]),
("その時計は十万円____すると思う。", "Acho que esse relógio custa pelo menos cem mil ienes.", ["は"]),
],
),
dict(
n=115,
jp="〜たものだ",
rd="ta mono da",
tr="Costumava / Era comum (eu) fazer",
ex="""たものだ é usado para relembrar, com nostalgia, algo que a pessoa costumava fazer no passado. Equivale a "costumava" ou "era comum eu fazer".

Ele é formado pelo verbo na forma た + ものだ. A ideia é olhar para trás com saudade, lembrando de hábitos da infância, da juventude ou de uma época especial.

É muito comum junto com palavras como よく (com frequência), 毎日, 昔, 子供のころ e 学生時代.

O tom é emocional e reflexivo, diferente de simplesmente usar o passado ou ていた, que só informam o fato.

Na fala casual, ものだ costuma virar もんだ.""",
st="""Verbo na forma た + ものだ / ものです
よく / 昔 / 子供のころ + … + Verbo た + ものだ

Fala casual: たもんだ""",
no="""ものだ tem outros usos: com a forma de dicionário, indica uma verdade geral ou um dever ("as pessoas são assim", "deve-se fazer assim"). Esses usos aparecem no N2.

たものだ aparece muito em conversas de pessoas mais velhas lembrando o passado.

Para hábitos passados sem nostalgia, basta usar ていた.""",
bf="たものだ",
rx="たものだ|たものです|たもんだ|だものだ|だものです|だもんだ",
tk=["た", "もの", "だ"],
va=["たものだ", "たものです", "たもんだ"],
E=[
("子供のころ、よくこの川で泳いだものだ。", "こどものころ、よくこのかわでおよいだものだ。", "Quando eu era criança, costumava nadar muito neste rio."),
("学生時代は、毎晩遅くまで友達と話したものです。", "がくせいじだいは、まいばんおそくまでともだちとはなしたものです。", "Na época de estudante, eu costumava conversar com os amigos até tarde toda noite."),
("昔はよく父に叱られたものだ。", "むかしはよくちちにしかられたものだ。", "Antigamente, eu levava muita bronca do meu pai."),
("若いころは、よく一人で旅行したものだ。", "わかいころは、よくひとりでりょこうしたものだ。", "Quando era jovem, costumava viajar muito sozinho."),
("小さいころ、この公園で毎日遊んだもんだ。", "ちいさいころ、このこうえんでまいにちあそんだもんだ。", "Quando eu era pequeno, brincava todo dia neste parque."),
],
R=[
("子供のころは、よく外で遊んだ____。", "Quando criança, eu costumava brincar muito lá fora.", ["ものだ", "ものです"]),
("学生のころは、試験の前によく徹夜し____。", "Na época de estudante, eu costumava virar a noite antes das provas.", ["たものだ"]),
("昔はこの道を毎日歩いて学校に行った____。", "Antigamente, eu ia para a escola andando por esta rua todo dia.", ["ものだ"]),
("若いころは、よく夜まで踊った____。", "Quando era jovem, costumava dançar até tarde da noite.", ["ものです", "ものだ"]),
("祖母はよく昔の話をしてくれた____。", "Minha avó costumava me contar histórias antigas.", ["ものだ"]),
],
),
dict(
n=116,
jp="〜たとたん",
rd="ta totan",
tr="Assim que / No exato momento em que / Mal",
ex="""たとたん é usado para dizer que, no instante em que uma ação terminou, outra coisa aconteceu imediatamente. Equivale a "assim que", "no exato momento em que" ou "mal...".

Ele é formado pelo verbo na forma た + とたん (途端). A ideia é de algo muito rápido e, geralmente, inesperado.

Por exemplo, "mal saí de casa, começou a chover" ou "assim que me levantei, fiquei tonto".

A segunda parte costuma ser um acontecimento que fugiu ao controle de quem fala, muitas vezes uma surpresa. Por isso, ela não pode ser uma ação intencional ou um pedido, como "assim que chegar, me ligue".

Com verbos cuja forma た termina em だ, usa-se だとたん.""",
st="""Verbo na forma た + とたん(に)、 + Acontecimento inesperado

Escrita: とたん / 途端""",
no="""Para ações planejadas, como "assim que chegar, ligue", usa-se たらすぐ ou 次第 (N2), e não たとたん.

とたんに, com に, tem o mesmo sentido e é um pouco mais enfático.

A estrutura destaca a surpresa. Por isso, é muito comum em narrativas e relatos de acontecimentos inesperados.""",
bf="たとたん",
rx="たとたん|た途端|だとたん|だ途端",
tk=["た", "とたん"],
va=["たとたん", "た途端", "だとたん", "たとたんに"],
E=[
("家を出たとたん、雨が降り出した。", "いえをでたとたん、あめがふりだした。", "Mal saí de casa, começou a chover."),
("急に立ち上がったとたん、めまいがした。", "きゅうにたちあがったとたん、めまいがした。", "Assim que me levantei de repente, fiquei tonto."),
("彼は部屋に入ったとたん、寝てしまった。", "かれはへやにはいったとたん、ねてしまった。", "Mal entrou no quarto, ele caiu no sono."),
("ドアを開けたとたん、猫が飛び出してきた。", "ドアをあけたとたん、ねこがとびだしてきた。", "No exato momento em que abri a porta, o gato saiu correndo."),
("その薬を飲んだとたん、気分がよくなった。", "そのくすりをのんだとたん、きぶんがよくなった。", "Assim que tomei esse remédio, me senti melhor."),
],
R=[
("電車に乗っ____、ドアが閉まった。", "Mal entrei no trem, as portas se fecharam.", ["たとたん", "た途端"]),
("母の顔を見____、子供は泣き出した。", "Assim que viu o rosto da mãe, a criança começou a chorar.", ["たとたん", "た途端"]),
("外に出____、強い風が吹いてきた。", "Mal saí, começou a soprar um vento forte.", ["たとたん", "た途端"]),
("席に座っ____、電話が鳴った。", "No exato momento em que me sentei, o telefone tocou.", ["たとたん", "た途端"]),
("お酒を飲ん____、顔が赤くなった。", "Assim que bebi, meu rosto ficou vermelho.", ["だとたん", "だ途端"]),
],
),
dict(
n=117,
jp="〜たびに",
rd="tabi ni",
tr="Toda vez que / Sempre que / A cada",
ex="""たびに é usado para dizer que, toda vez que algo acontece, outra coisa também acontece. Equivale a "toda vez que", "sempre que" ou "a cada".

Ele vem depois do verbo na forma de dicionário ou de um substantivo com の. Por exemplo, "toda vez que ouço esta música, lembro da minha terra" ou "a cada viagem, ele traz lembrancinhas".

A segunda parte mostra uma reação, um hábito ou uma mudança que se repete. Muitas vezes, envolve lembranças, sentimentos ou mudanças graduais.

度 significa "vez". Por isso, a ideia é literalmente "a cada vez".""",
st="""Verbo na forma de dicionário + たびに + Frase
Substantivo + の + たびに + Frase

Escrita: たびに / 度に""",
no="""たびに é parecido com ごとに e com と (sempre que), mas destaca a repetição a cada ocasião.

Com verbos de percepção, como 見る e 聞く, たびに aparece muito para falar de lembranças.

Não confunda com 旅 (たび), que significa "viagem". Aqui, たび significa "vez".""",
bf="たびに",
rx="たびに|度に",
tk=["たび", "に"],
va=["たびに", "度に"],
E=[
("この歌を聞くたびに、故郷を思い出す。", "このうたをきくたびに、こきょうをおもいだす。", "Toda vez que ouço esta música, me lembro da minha terra natal."),
("彼は会うたびに、背が高くなっている。", "かれはあうたびに、せがたかくなっている。", "Toda vez que o encontro, ele está mais alto."),
("父は旅行のたびに、お土産を買ってくる。", "ちちはりょこうのたびに、おみやげをかってくる。", "A cada viagem, meu pai traz lembrancinhas."),
("雨が降るたびに、この道は水でいっぱいになる。", "あめがふるたびに、このみちはみずでいっぱいになる。", "Sempre que chove, esta rua fica alagada."),
("この写真を見るたびに、楽しかった日々を思い出す。", "このしゃしんをみるたびに、たのしかったひびをおもいだす。", "Toda vez que vejo esta foto, lembro dos dias felizes."),
],
R=[
("祖母は会う____、お小遣いをくれる。", "Toda vez que a encontro, minha avó me dá uns trocados.", ["たびに"]),
("出張の____、新しい町を見るのが楽しみだ。", "A cada viagem a trabalho, adoro conhecer cidades novas.", ["たびに"]),
("この写真を見る____、笑ってしまう。", "Toda vez que vejo esta foto, acabo rindo.", ["たびに"]),
("彼は電話する____、違うことを言う。", "Toda vez que ligo, ele diz uma coisa diferente.", ["たびに"]),
("試験の____、緊張して眠れない。", "A cada prova, fico tão nervoso que não consigo dormir.", ["たびに"]),
],
),
dict(
n=118,
jp="〜ために",
rd="tame ni",
tr="Para / A fim de / Por causa de",
ex="""ために tem dois usos principais.

O primeiro é indicar objetivo ou finalidade: "para", "a fim de". A pessoa faz algo com uma intenção clara. Por exemplo, "estudo japonês para trabalhar no Japão" ou "trabalho duro pela minha família". Nesse uso, ele vem depois de verbos de ação na forma de dicionário, ou de substantivos com の.

O segundo é indicar causa: "por causa de", "devido a". Por exemplo, "por causa da neve, os trens pararam". Nesse uso, ele soa formal e aparece muito em avisos e notícias. Ele vem depois de substantivos com の e de verbos no passado ou na forma simples.

No uso de objetivo, o sujeito das duas partes costuma ser o mesmo, e o verbo antes de ために indica uma ação controlável. Para verbos de possibilidade ou estados, usa-se ように.

Antes de um substantivo, usa-se ための: 日本語を勉強するための本 (um livro para estudar japonês).""",
st="""Objetivo:
Verbo na forma de dicionário + ために + Ação
Substantivo + の + ために + Ação
… + ための + Substantivo

Causa (formal):
Substantivo + の + ために + Resultado
Verbo (forma simples) + ために + Resultado""",
no="""A diferença entre ために e ように é importante: ために é para ações intencionais (comprar, estudar, ir); ように é para resultados que não dependem só da vontade (conseguir, poder, não esquecer).

No uso de causa, ために soa mais formal que から ou ので, e é comum em anúncios de atraso.

Para pessoas, のために expressa dedicação: "fazer algo pela família".""",
bf="ために",
rx="ために|為に|ための",
tk=["ため", "に"],
va=["ために", "ための", "為に"],
E=[
("日本で働くために、日本語を勉強している。", "にほんではたらくために、にほんごをべんきょうしている。", "Estou estudando japonês para trabalhar no Japão."),
("家族のために、一生懸命働いている。", "かぞくのために、いっしょうけんめいはたらいている。", "Trabalho duro pela minha família."),
("健康のために、毎朝走っています。", "けんこうのために、まいあさはしっています。", "Corro toda manhã pela saúde."),
("大雪のために、電車が止まった。", "おおゆきのために、でんしゃがとまった。", "Por causa da nevasca, os trens pararam."),
("病気のために、学校を休みました。", "びょうきのために、がっこうをやすみました。", "Faltei à escola por causa de uma doença."),
],
R=[
("車を買う____、お金を貯めている。", "Estou juntando dinheiro para comprar um carro.", ["ために"]),
("子供の____、おもちゃを買った。", "Comprei um brinquedo para o meu filho.", ["ために"]),
("試験に合格する____、毎日勉強している。", "Estudo todo dia para passar na prova.", ["ために"]),
("台風の____、試合が中止になった。", "Por causa do tufão, a partida foi cancelada.", ["ために"]),
("事故があった____、道が混んでいる。", "Por causa de um acidente, o trânsito está ruim.", ["ために"]),
],
),
dict(
n=119,
jp="確かに",
rd="tashika ni",
tr="Realmente / De fato / Com certeza / É verdade",
ex="""確かに é um advérbio com dois usos principais.

O primeiro é concordar com algo: "realmente", "de fato", "é verdade". Muitas vezes, a pessoa concorda em parte e depois apresenta uma ressalva, com けど ou が: "realmente é caro, mas a qualidade é boa".

O segundo é afirmar com certeza que algo aconteceu: "com certeza", "sem dúvida". Por exemplo, "coloquei a chave na bolsa, com certeza" ou "recebi os documentos, sim".

Sozinho, como resposta, 確かに significa "é verdade" ou "tem razão", e é muito usado na conversa para mostrar que você concorda com o que o outro disse.""",
st="""確かに + Frase (concordância)
確かに + … + けど / が + Ressalva
確かに + Verbo no passado (certeza de que aconteceu)
確かに (resposta sozinha: é verdade)

Escrita: 確かに / たしかに""",
no="""O adjetivo 確か também é usado sozinho, no começo da frase, com o sentido de "se não me engano": 確か、明日は休みだった.

Em discussões, 確かにそうですが ("de fato é assim, mas...") é uma forma educada de discordar.

Em recibos e documentos, 確かに受け取りました significa "recebido com confirmação".""",
bf="確かに",
rx="確かに|たしかに",
tk=["確かに"],
va=["確かに", "たしかに"],
E=[
("確かに、この料理はおいしい。", "たしかに、このりょうりはおいしい。", "Realmente, esta comida é gostosa."),
("確かに彼の言う通りだ。", "たしかにかれのいうとおりだ。", "De fato, é exatamente como ele diz."),
("確かに高いけど、品質はいい。", "たしかにたかいけど、ひんしつはいい。", "Realmente é caro, mas a qualidade é boa."),
("鍵は確かにかばんに入れました。", "かぎはたしかにかばんにいれました。", "Eu coloquei a chave na bolsa, com certeza."),
("「この問題、難しいね。」「確かに。」", "「このもんだい、むずかしいね。」「たしかに。」", "\"Esta questão é difícil, né?\" \"É verdade.\""),
],
R=[
("____、あなたの意見は正しい。", "De fato, a sua opinião está correta.", ["確かに", "たしかに"]),
("書類は____受け取りました。", "Recebi os documentos, com certeza.", ["確かに", "たしかに"]),
("この店は____便利だけど、少し高い。", "Esta loja é realmente prática, mas um pouco cara.", ["確かに", "たしかに"]),
("「今日は寒いね。」「____。」", "\"Hoje está frio, né?\" \"É verdade.\"", ["確かに", "たしかに"]),
("彼は昨日、____そう言いました。", "Ele disse isso ontem, com certeza.", ["確かに", "たしかに"]),
],
),
dict(
n=120,
jp="〜たて",
rd="tate",
tr="Recém- / Acabado de / Fresquinho",
ex="""たて é um sufixo que indica que algo acabou de ser feito ou de acontecer. Equivale a "recém-", "acabado de" ou "fresquinho".

Ele vem depois do verbo na forma ます sem ます. Por exemplo, 焼きたて (recém-assado), 塗りたて (pintado agora mesmo), 生まれたて (recém-nascido).

Antes de um substantivo, usa-se たての: 焼きたてのパン (pão recém-assado).

É muito usado para comida, com um tom positivo de frescor e qualidade, como pão saído do forno, arroz recém-cozido e verduras recém-colhidas. Também aparece em avisos, como 塗りたて (tinta fresca), e para pessoas que acabaram de começar algo, como um funcionário recém-formado.

たて só é usado com alguns verbos, principalmente ligados a produção, preparação e começo.""",
st="""Verbo na forma ます sem ます + たて + の + Substantivo
Verbo sem ます + たて + だ / です

Combinações comuns: 焼きたて / 炊きたて / できたて / 取れたて / 搾りたて / 生まれたて / 塗りたて / 洗いたて""",
no="""Diferente de たばかり, que pode ser usado com quase qualquer verbo, たて é limitado a algumas combinações fixas.

Em padarias e restaurantes, placas com 焼きたて e できたて atraem muitos clientes.

塗りたて, em placas, significa "cuidado, tinta fresca".""",
bf="たて",
rx="たて|立て",
tk=["たて"],
va=["たて", "たての"],
E=[
("焼きたてのパンはおいしい。", "やきたてのパンはおいしい。", "Pão recém-assado é gostoso."),
("このペンキは塗りたてなので、触らないでください。", "このペンキはぬりたてなので、さわらないでください。", "A tinta foi passada agora, então não toque, por favor."),
("彼は大学を出たての新人だ。", "かれはだいがくをでたてのしんじんだ。", "Ele é um funcionário novo, recém-formado na faculdade."),
("生まれたての赤ちゃんはとても小さい。", "うまれたてのあかちゃんはとてもちいさい。", "Um bebê recém-nascido é muito pequeno."),
("これは取れたての野菜を使った料理です。", "これはとれたてのやさいをつかったりょうりです。", "Este é um prato feito com verduras recém-colhidas."),
],
R=[
("炊き____のご飯はおいしい。", "Arroz recém-cozido é gostoso.", ["たて"]),
("洗い____のシャツはいいにおいがする。", "Camisa recém-lavada tem um cheiro bom.", ["たて"]),
("作り____の料理を食べてください。", "Coma a comida que acabou de ser feita.", ["たて"]),
("覚え____の日本語で話してみた。", "Tentei falar com o japonês que tinha acabado de aprender.", ["たて"]),
("搾り____のジュースを飲んだ。", "Tomei um suco feito na hora.", ["たて"]),
],
),
]

G = [
dict(
n=51,
jp="の",
rd="no",
tr="De / Do / Da / O de",
ex="""の é a partícula que liga dois substantivos. Ela mostra que o primeiro dá alguma informação sobre o segundo, como acontece com "de" em português.

A ordem é o contrário do português: a coisa principal vem depois de の. Assim, "o livro do Tanaka" fica Tanaka + の + livro.

Essa ligação pode indicar posse, origem, assunto, material, local e muitas outras relações. Por exemplo: o carro de alguém, um carro do Japão, um professor de inglês.

の também funciona como pronome, substituindo um substantivo que já ficou claro pelo contexto. Assim, pode significar "o de...", como "é da minha mãe", ou "o...", como em "o vermelho".""",
st="""Substantivo A + の + Substantivo B (B de A)
Substantivo + の (é de... / o de...)
Adjetivo + の (o... / a...; substitui um substantivo)
Substantivo + の + posição + に / で (em cima de, embaixo de)""",
no="""Em sequência, の pode aparecer várias vezes, como em "o livro do professor da escola". A lógica continua a mesma: cada の liga o que vem antes ao que vem depois.

Com adjetivos い, não se usa の para ligar a um substantivo: o adjetivo vem direto. Mas, quando o substantivo é omitido, entra の, como em "o vermelho".

Em níveis seguintes, の também transforma verbos em substantivos, como em "gostar de ler".""",
bf="の",
rx="の",
tk=["の"],
va=["の"],
E=[
("これは私の本です。", "これはわたしのほんです。", "Este é o meu livro."),
("日本の車はとても人気があります。", "にほんのくるまはとてもにんきがあります。", "Os carros japoneses são muito populares."),
("田中さんは英語の先生です。", "たなかさんはえいごのせんせいです。", "O Tanaka é professor de inglês."),
("このかばんは母のです。", "このかばんはははのです。", "Esta bolsa é da minha mãe."),
("すみません、赤いのをください。", "すみません、あかいのをください。", "Com licença, me dê o vermelho, por favor."),
],
R=[
("あれは田中さん____車です。", "Aquele é o carro do Tanaka.", ["の"]),
("駅で東京____地図を買いました。", "Comprei um mapa de Tóquio na estação.", ["の"]),
("「この傘は誰のですか。」「私____です。」", "\"De quem é este guarda-chuva?\" \"É meu.\"", ["の"]),
("机の上____本を取ってください。", "Pegue o livro que está em cima da mesa, por favor.", ["の"]),
("このシャツはちょっと小さいです。もっと大きい____はありますか。", "Esta camisa está um pouco pequena. Tem uma maior?", ["の"]),
],
),
dict(
n=52,
jp="〜のです",
rd="no desu",
tr="É que / Acontece que / O fato é que",
ex="""のです tem a mesma função de んです: ele explica, justifica ou pede explicação sobre uma situação. Equivale a "é que...", "acontece que...".

A diferença está no tom. んです é a forma falada e mais natural na conversa. のです é a forma completa, que soa mais formal, mais séria e mais adequada à escrita, como em textos, discursos e explicações cuidadosas.

Com のです, quem fala deixa claro que está apresentando o motivo ou o contexto de algo. Em perguntas, のですか pede uma explicação de forma educada.

Na forma simples, usa-se のだ, que é comum em textos escritos e em reflexões, como quando alguém chega a uma conclusão.""",
st="""Verbo / Adjetivo い (forma simples) + のです
Substantivo / Adjetivo な + な + のです

Pergunta: 〜のですか
Forma simples: 〜のだ
Forma falada: 〜んです / 〜んだ""",
no="""Na fala do dia a dia, usar のです o tempo todo pode soar rígido. Prefira んです em conversas comuns.

Na fala informal, a explicação também pode terminar só com の, principalmente em perguntas e respostas entre amigos.

Com substantivos e adjetivos な, não se esqueça do な antes de のです.""",
bf="のです",
rx="のです|のだ",
tk=["の", "です"],
va=["のです", "のですか", "のだ", "んです"],
E=[
("今日は体の調子が悪いのです。", "きょうはからだのちょうしがわるいのです。", "É que hoje não estou me sentindo bem."),
("どうして遅れたのですか。", "どうしておくれたのですか。", "Por que você se atrasou?"),
("実は、この店は百年前からあるのです。", "じつは、このみせはひゃくねんまえからあるのです。", "Na verdade, esta loja existe há cem anos."),
("明日は大事な試験なのです。", "あしたはだいじなしけんなのです。", "É que amanhã tenho uma prova importante."),
("私が間違っていたのだ。", "わたしがまちがっていたのだ。", "Eu é que estava errado."),
],
R=[
("「どうして休んだのですか。」「熱があった____。」", "\"Por que você faltou?\" \"É que eu estava com febre.\"", ["のです"]),
("この町は、昔は海だった____。", "Esta cidade, antigamente, era mar.", ["のです", "のだ"]),
("こんな時間に、どこへ行く____か。", "Aonde você vai a esta hora?", ["のです"]),
("彼は本当に親切な人な____。", "Ele é realmente uma pessoa gentil.", ["のです", "のだ"]),
("「なぜ日本語を勉強している____か。」「日本で働きたいからです。」", "\"Por que você está estudando japonês?\" \"Porque quero trabalhar no Japão.\"", ["のです"]),
],
),
dict(
n=53,
jp="〜のが下手",
rd="no ga heta",
tr="Ser ruim em (fazer) / Não ter jeito para",
ex="""のが下手 é usado para dizer que alguém não é bom em fazer alguma coisa. Equivale a "ser ruim em" ou "não ter jeito para".

下手 é um adjetivo な que significa "ruim em", "sem habilidade". Para falar de uma ação, e não de uma coisa, é preciso transformar o verbo em substantivo. Isso é feito com の: o verbo na forma de dicionário + の vira algo como "o ato de fazer".

Como 下手 indica a habilidade em relação a algo, a ação é marcada com が, e não com を. A pessoa que tem a dificuldade costuma vir com は.

Com substantivos, como esportes ou idiomas, não é preciso の: basta usar o substantivo + が + 下手.""",
st="""Verbo na forma de dicionário + のが + 下手 + です / だ
Substantivo + が + 下手 + です / だ
Pessoa + は + Verbo + のが下手

Negativo: のが下手じゃない
Escrita: 下手 / へた""",
no="""Falar de si mesmo com 下手 é natural e humilde. Já dizer que outra pessoa é 下手 pode soar rude, então é melhor evitar dizer isso diretamente.

Para falar de algo em que você tem dificuldade ou não gosta de fazer, 苦手 também é muito usado. 苦手 tem mais a ideia de "não me dou bem com isso".

O oposto de 下手 é 上手.""",
bf="のが下手",
rx="のが下手|のがへた",
tk=["の", "が", "下手"],
va=["のが下手", "のがへた", "のが下手です", "のが下手だ"],
E=[
("私は歌うのが下手です。", "わたしはうたうのがへたです。", "Eu sou ruim em cantar."),
("兄は料理を作るのが下手だ。", "あにはりょうりをつくるのがへただ。", "Meu irmão mais velho não tem jeito para cozinhar."),
("字を書くのが下手なので、パソコンを使います。", "じをかくのがへたなので、パソコンをつかいます。", "Como minha letra é ruim, uso o computador."),
("父は人の名前を覚えるのが下手です。", "ちちはひとのなまえをおぼえるのがへたです。", "Meu pai é ruim em lembrar o nome das pessoas."),
("私は絵を描くのが下手ですが、好きです。", "わたしはえをかくのがへたですが、すきです。", "Sou ruim em desenhar, mas gosto."),
],
R=[
("私は泳ぐ____です。", "Eu sou ruim em nadar.", ["のが下手", "のがへた"]),
("弟は朝早く起きる____。", "Meu irmão mais novo é ruim em acordar cedo.", ["のが下手です", "のがへたです", "のが下手だ", "のがへただ"]),
("私は人の前で話す____です。", "Eu sou ruim em falar na frente das pessoas.", ["のが下手", "のがへた"]),
("母は機械を使う____です。", "Minha mãe não tem jeito para usar máquinas.", ["のが下手", "のがへた"]),
("彼はダンスをする____けど、とても楽しそうです。", "Ele dança mal, mas parece se divertir muito.", ["のが下手だ", "のがへただ"]),
],
),
dict(
n=54,
jp="〜のが上手",
rd="no ga jouzu",
tr="Ser bom em (fazer) / Ter jeito para",
ex="""のが上手 é usado para dizer que alguém é bom em fazer alguma coisa. Equivale a "ser bom em" ou "ter jeito para".

上手 é um adjetivo な que significa "habilidoso". Para falar de uma ação, o verbo na forma de dicionário recebe の, que o transforma em substantivo, e depois vem が + 上手.

A ação é marcada com が, porque 上手 descreve a habilidade em relação a ela. A pessoa que tem a habilidade costuma vir com は.

Com substantivos, como esportes, idiomas e instrumentos, não é preciso の: basta usar o substantivo + が + 上手.""",
st="""Verbo na forma de dicionário + のが + 上手 + です / だ
Substantivo + が + 上手 + です / だ
Pessoa + は + Verbo + のが上手

Negativo: のが上手じゃない
Escrita: 上手 / じょうず""",
no="""Em japonês, não se costuma usar 上手 para falar das próprias habilidades, porque soa como se gabar. Para isso, usa-se 得意, que significa "ser bom em" ou "ser o meu forte".

Elogiar alguém com 上手ですね é muito comum. A resposta educada e humilde costuma ser いいえ、まだまだです.

O oposto de 上手 é 下手.""",
bf="のが上手",
rx="のが上手|のがじょうず",
tk=["の", "が", "上手"],
va=["のが上手", "のがじょうず", "のが上手です", "のが上手だ"],
E=[
("姉は歌うのが上手です。", "あねはうたうのがじょうずです。", "Minha irmã mais velha canta bem."),
("田中さんは料理を作るのが上手ですね。", "たなかさんはりょうりをつくるのがじょうずですね。", "O Tanaka cozinha bem, hein."),
("弟は絵を描くのが上手だ。", "おとうとはえをかくのがじょうずだ。", "Meu irmão mais novo desenha bem."),
("山田先生は教えるのが上手です。", "やまだせんせいはおしえるのがじょうずです。", "O professor Yamada ensina bem."),
("彼は人の話を聞くのが上手です。", "かれはひとのはなしをきくのがじょうずです。", "Ele sabe ouvir bem as pessoas."),
],
R=[
("父は車を運転する____です。", "Meu pai dirige bem.", ["のが上手", "のがじょうず"]),
("妹はピアノを弾く____。", "Minha irmã mais nova toca piano bem.", ["のが上手です", "のがじょうずです", "のが上手だ", "のがじょうずだ"]),
("田中さんは写真を撮る____ですね。", "O Tanaka tira fotos bem, hein.", ["のが上手", "のがじょうず"]),
("あの子は友達を作る____です。", "Aquela criança tem jeito para fazer amigos.", ["のが上手", "のがじょうず"]),
("母は安くていい物を見つける____です。", "Minha mãe é ótima em achar coisas boas e baratas.", ["のが上手", "のがじょうず"]),
],
),
dict(
n=55,
jp="〜のが好き",
rd="no ga suki",
tr="Gostar de (fazer)",
ex="""のが好き é usado para dizer que alguém gosta de fazer alguma coisa. Equivale a "gostar de" + ação.

好き é um adjetivo な, e não um verbo. Por isso, a coisa de que se gosta é marcada com が. Para falar de uma ação, o verbo na forma de dicionário recebe の, que o transforma em substantivo: "o ato de ler", "o ato de nadar".

A pessoa que gosta costuma vir com は. Para reforçar, usa-se 大好き, que significa "adorar".

O negativo segue a regra dos adjetivos な: のが好きじゃない ou のが好きではありません. No passado, のが好きでした ou のが好きだった.""",
st="""Verbo na forma de dicionário + のが + 好き + です / だ
Verbo na forma de dicionário + のが + 大好き + です / だ
Pessoa + は + Verbo + のが好き
Verbo + のが好きな + Substantivo

Negativo: のが好きじゃない / のが好きではありません
Passado: のが好きでした / のが好きだった""",
no="""Em frases negativas ou de contraste, é comum trocar が por は, como em のは好きじゃない, para destacar que é aquela ação específica que a pessoa não gosta.

Um erro muito comum é usar o verbo direto antes de 好き, sem の. O verbo precisa virar substantivo primeiro.

A forma こと também pode transformar verbos em substantivos, mas com 好き, o mais natural no dia a dia é の.""",
bf="のが好き",
rx="のが好き|のがすき|のが大好き|のがだいすき",
tk=["の", "が", "好き"],
va=["のが好き", "のがすき", "のが大好き", "のが好きです", "のが好きだ"],
E=[
("私は本を読むのが好きです。", "わたしはほんをよむのがすきです。", "Eu gosto de ler livros."),
("弟はゲームをするのが大好きです。", "おとうとはゲームをするのがだいすきです。", "Meu irmão mais novo adora jogar videogame."),
("週末に公園を歩くのが好きです。", "しゅうまつにこうえんをあるくのがすきです。", "Gosto de caminhar no parque no fim de semana."),
("子供のころ、絵を描くのが好きでした。", "こどものころ、えをかくのがすきでした。", "Quando eu era criança, gostava de desenhar."),
("彼女は友達と話すのが好きな人です。", "かのじょはともだちとはなすのがすきなひとです。", "Ela é uma pessoa que gosta de conversar com os amigos."),
],
R=[
("私は音楽を聞く____です。", "Eu gosto de ouvir música.", ["のが好き", "のがすき", "のが大好き", "のがだいすき"]),
("母は花を育てる____です。", "Minha mãe gosta de cultivar flores.", ["のが好き", "のがすき", "のが大好き", "のがだいすき"]),
("子供のころ、川で泳ぐ____でした。", "Quando eu era criança, gostava de nadar no rio.", ["のが好き", "のがすき", "のが大好き", "のがだいすき"]),
("犬と散歩する____ですか。", "Você gosta de passear com o cachorro?", ["のが好き", "のがすき"]),
("日本の歌を歌う____人は多いです。", "Tem muitas pessoas que gostam de cantar músicas japonesas.", ["のが好きな", "のがすきな"]),
],
),
dict(
n=56,
jp="〜の中で〜が一番",
rd="no naka de ~ ga ichiban",
tr="Entre... o mais / De todos... o mais",
ex="""Essa estrutura é usada para dizer qual elemento de um grupo é "o mais" em alguma característica. É o superlativo dentro de um grupo.

A primeira parte, の中で, apresenta o grupo de comparação: "entre as frutas", "na família", "entre os esportes". Literalmente, 中 significa "dentro", então a ideia é "dentro desse grupo".

Depois vem o elemento escolhido, marcado com が, e 一番 com o adjetivo ou com 好き / 嫌い.

Para perguntar, usa-se uma palavra interrogativa no lugar do elemento: 何 para coisas, 誰 para pessoas, どこ para lugares e いつ para tempo. A resposta repete a estrutura com o elemento escolhido.""",
st="""[Grupo] + の中で + [A] + が + 一番 + Adjetivo / 好き
[Grupo] + の中で + 何 / 誰 / どこ / いつ / どれ + が + 一番 + Adjetivo + ですか

Escrita: の中で / のなかで""",
no="""Quando o grupo é um lugar, como um país ou uma cidade, é comum usar só で, sem の中, para dizer "no Japão" ou "na turma".

Para comparar exatamente duas coisas, não se usa の中で〜一番, e sim より e ほうが.

A palavra de pergunta muda conforme o tipo de coisa no grupo. Escolher a palavra certa é um ponto que costuma cair em provas.""",
bf="の中で",
rx="の中で|のなかで",
tk=["の", "中", "で", "が", "一番"],
va=["の中で", "のなかで"],
E=[
("果物の中でいちごが一番好きです。", "くだもののなかでいちごがいちばんすきです。", "Entre as frutas, a que eu mais gosto é morango."),
("家族の中で父が一番背が高いです。", "かぞくのなかでちちがいちばんせがたかいです。", "Na minha família, o mais alto é meu pai."),
("日本の町の中でどこが一番好きですか。", "にほんのまちのなかでどこがいちばんすきですか。", "Entre as cidades do Japão, qual você mais gosta?"),
("一年の中で八月が一番暑いです。", "いちねんのなかではちがつがいちばんあついです。", "No ano, o mês mais quente é agosto."),
("クラスの中で誰が一番速く走りますか。", "クラスのなかでだれがいちばんはやくはしりますか。", "Na turma, quem corre mais rápido?"),
],
R=[
("スポーツ____サッカーが一番好きです。", "Entre os esportes, o que eu mais gosto é futebol.", ["の中で", "のなかで"]),
("季節____いつが一番好きですか。", "Entre as estações, qual você mais gosta?", ["の中で", "のなかで"]),
("この三つの____どれが一番安いですか。", "Destes três, qual é o mais barato?", ["中で", "なかで"]),
("兄弟____私が一番若いです。", "Entre os irmãos, eu sou o mais novo.", ["の中で", "のなかで"]),
("日本料理の中で何____好きですか。", "Da culinária japonesa, o que você mais gosta?", ["が一番", "がいちばん"]),
],
),
dict(
n=57,
jp="〜ので",
rd="node",
tr="Porque / Como / Por isso",
ex="""ので é usado para dar o motivo ou a causa de algo. Equivale a "porque", "como" ou "por isso", dependendo da frase.

A ordem é: primeiro o motivo, depois o resultado. ので fica no final da parte que explica o motivo.

A grande diferença entre ので e から está no tom. ので apresenta o motivo como algo objetivo, como um fato natural. Por isso, soa mais suave e educado, e é muito usado em pedidos, desculpas e explicações formais. から soa mais direto e pessoal.

Com substantivos e adjetivos な, usa-se な antes de ので, e não だ.""",
st="""Verbo / Adjetivo い (forma simples) + ので
Substantivo / Adjetivo な + な + ので

Mais formal: Verbo ます / です + ので""",
no="""Para pedir permissão ou se desculpar, ので é quase sempre a melhor escolha, porque não soa como uma justificativa forçada.

Na fala rápida, ので às vezes vira んで. É bem coloquial.

Diferente de から, ので normalmente não é usado no final da frase para responder diretamente uma pergunta com どうして. Nesses casos, からです soa mais natural.""",
bf="ので",
rx="ので",
tk=["ので"],
va=["ので", "なので"],
E=[
("雨が降っているので、タクシーで行きます。", "あめがふっているので、タクシーでいきます。", "Como está chovendo, vou de táxi."),
("頭が痛いので、今日は早く帰ります。", "あたまがいたいので、きょうははやくかえります。", "Estou com dor de cabeça, então hoje vou embora mais cedo."),
("明日は休みなので、ゆっくり寝ます。", "あしたはやすみなので、ゆっくりねます。", "Amanhã é folga, então vou dormir bastante."),
("道が混んでいたので、会議に遅れました。", "みちがこんでいたので、かいぎにおくれました。", "O trânsito estava ruim, então me atrasei para a reunião."),
("すみません、用事があるので、お先に失礼します。", "すみません、ようじがあるので、おさきにしつれいします。", "Desculpe, tenho um compromisso, então vou indo antes."),
],
R=[
("熱がある____、学校を休みます。", "Estou com febre, então vou faltar à escola.", ["ので"]),
("この本はおもしろい____、毎日読んでいます。", "Este livro é interessante, então leio todo dia.", ["ので"]),
("今日は日曜日な____、銀行は休みです。", "Hoje é domingo, então o banco está fechado.", ["ので"]),
("電車が遅れた____、遅刻しました。", "O trem atrasou, então cheguei atrasado.", ["ので"]),
("少し寒い____、窓を閉めてもいいですか。", "Está um pouco frio, então posso fechar a janela?", ["ので"]),
],
),
dict(
n=58,
jp="を",
rd="wo / o",
tr="Marca o objeto direto / Por (percurso) / De (saída)",
ex="""を é a partícula que marca o objeto direto, ou seja, aquilo que recebe a ação do verbo: o que se come, o que se lê, o que se compra.

Ela vem logo depois do objeto e antes do verbo. Como em japonês o verbo fica no final, を ajuda a mostrar claramente "o quê" está sendo feito.

を também tem um uso com verbos de movimento. Nesse caso, ela marca o espaço por onde a pessoa passa, como andar por um parque, atravessar uma rua ou virar em uma esquina.

Com verbos como 出る (sair) e 降りる (descer de um veículo), を marca o lugar de onde se sai.""",
st="""Substantivo + を + Verbo transitivo
Lugar + を + Verbo de movimento (andar / passar / atravessar / virar)
Lugar + を + 出る / 降りる (lugar de onde se sai)""",
no="""A partícula を é escrita com o caractere を, mas é pronunciada "o" na fala comum. Ela quase só aparece como partícula.

Com verbos como 好き, ほしい, わかる e できる, o objeto é marcado com が, e não com を, porque essas palavras não são verbos de ação comuns.

Na fala muito casual, を costuma ser omitida, mas na escrita e em situações educadas ela deve aparecer.""",
bf="を",
rx="を",
tk=["を"],
va=["を"],
E=[
("毎朝パンを食べます。", "まいあさパンをたべます。", "Como pão toda manhã."),
("日本語を勉強しています。", "にほんごをべんきょうしています。", "Estou estudando japonês."),
("昨日、公園を散歩しました。", "きのう、こうえんをさんぽしました。", "Ontem passeei pelo parque."),
("次の角を右に曲がってください。", "つぎのかどをみぎにまがってください。", "Vire à direita na próxima esquina, por favor."),
("毎朝八時に家を出ます。", "まいあさはちじにいえをでます。", "Saio de casa às oito toda manhã."),
],
R=[
("毎晩テレビ____見ます。", "Vejo TV toda noite.", ["を"]),
("昨日、友達に手紙____書きました。", "Ontem escrevi uma carta para um amigo.", ["を"]),
("この道____まっすぐ行ってください。", "Siga reto por esta rua, por favor.", ["を"]),
("次の駅で電車____降ります。", "Vou descer do trem na próxima estação.", ["を"]),
("子供たちが道____渡っています。", "As crianças estão atravessando a rua.", ["を"]),
],
),
dict(
n=59,
jp="〜をください",
rd="o kudasai",
tr="Me dê... / Quero... (por favor)",
ex="""をください é usado para pedir uma coisa a alguém. Equivale a "me dê..., por favor" ou "quero...".

A coisa pedida vem antes de を, e ください é a forma educada de pedir. É a forma mais simples e comum de pedir algo em lojas, restaurantes e no dia a dia.

Para dizer a quantidade, o número com contador vem depois de を e antes de ください. Assim, a ordem fica: coisa + を + quantidade + ください.

Também é possível pedir coisas abstratas, como tempo, um momento ou uma resposta.""",
st="""Substantivo + を + ください
Substantivo + を + Quantidade + ください
Substantivo A + を + Quantidade + と + Substantivo B + を + Quantidade + ください""",
no="""Na fala, é muito comum omitir を e dizer só a coisa + ください.

Em restaurantes, também se usa お願いします no lugar de ください, o que soa um pouco mais educado.

Não confunda com てください, que vem depois de um verbo e pede para alguém fazer uma ação. をください pede uma coisa.""",
bf="をください",
rx="をください|ください",
tk=["を", "ください"],
va=["をください", "ください"],
E=[
("水をください。", "みずをください。", "Me dê água, por favor."),
("このりんごを三つください。", "このりんごをみっつください。", "Me dê três destas maçãs, por favor."),
("すみません、メニューをください。", "すみません、メニューをください。", "Com licença, me traga o cardápio, por favor."),
("コーヒーを一つとケーキを二つください。", "コーヒーをひとつとケーキをふたつください。", "Um café e dois bolos, por favor."),
("少し時間をください。", "すこしじかんをください。", "Me dê um pouco de tempo, por favor."),
],
R=[
("すみません、お茶____。", "Com licença, me dê um chá, por favor.", ["をください"]),
("郵便局で切手を五枚____。", "No correio: me dê cinco selos, por favor.", ["ください"]),
("この赤いシャツ____。", "Quero esta camisa vermelha, por favor.", ["をください"]),
("もう少し考える時間____。", "Me dê um pouco mais de tempo para pensar, por favor.", ["をください"]),
("「ご注文は？」「ラーメンを一つ____。」", "\"O que vai pedir?\" \"Um ramen, por favor.\"", ["ください"]),
],
),
dict(
n=60,
jp="しかし",
rd="shikashi",
tr="Porém / Entretanto / No entanto / Mas",
ex="""しかし é uma conjunção que liga duas frases com ideias contrárias. Equivale a "porém", "entretanto" ou "no entanto".

Ela fica no começo da segunda frase, depois de um ponto final. A primeira frase apresenta uma ideia, e a segunda, iniciada por しかし, traz algo que contrasta com ela ou que vai contra o esperado.

O significado é parecido com でも, mas o tom é diferente. しかし soa formal e é típico de textos escritos, como jornais, redações, relatórios e discursos. でも é muito mais comum na conversa.

Por isso, usar しかし numa conversa casual entre amigos pode soar sério ou exagerado.""",
st="""Frase 1 (com ponto final) + しかし、 + Frase 2""",
no="""しかし combina bem com a forma simples (だ / である) em textos escritos, mas também aparece com です e ます em discursos e explicações formais.

Outras palavras de contraste com tom parecido são けれども, ところが e だが. ところが indica algo inesperado, e だが é ainda mais formal.

Em provas de leitura do JLPT, しかし costuma ser um sinal importante: a ideia principal do texto muitas vezes aparece logo depois dele.""",
bf="しかし",
rx="しかし",
tk=["しかし"],
va=["しかし"],
E=[
("この町は便利だ。しかし、家賃が高い。", "このまちはべんりだ。しかし、やちんがたかい。", "Esta cidade é prática. No entanto, o aluguel é caro."),
("彼はよく勉強した。しかし、試験に落ちた。", "かれはよくべんきょうした。しかし、しけんにおちた。", "Ele estudou bastante. Porém, foi reprovado na prova."),
("天気予報は晴れでした。しかし、午後から雨が降りました。", "てんきよほうははれでした。しかし、ごごからあめがふりました。", "A previsão era de sol. No entanto, choveu a partir da tarde."),
("日本の夏は暑いです。しかし、冬はとても寒いです。", "にほんのなつはあついです。しかし、ふゆはとてもさむいです。", "O verão no Japão é quente. Porém, o inverno é muito frio."),
("新しい薬はよく効く。しかし、少し高い。", "あたらしいくすりはよくきく。しかし、すこしたかい。", "O remédio novo funciona bem. Entretanto, é um pouco caro."),
],
R=[
("この店の料理はおいしいです。____、少し高いです。", "A comida deste restaurante é gostosa. Porém, é um pouco cara.", ["しかし"]),
("毎日練習しました。____、試合に負けました。", "Treinei todo dia. No entanto, perdi a partida.", ["しかし"]),
("この部屋は広い。____、駅から遠い。", "Este quarto é amplo. Porém, é longe da estação.", ["しかし"]),
("彼は「すぐ行く」と言った。____、まだ来ない。", "Ele disse \"já vou\". No entanto, ainda não chegou.", ["しかし"]),
("説明書を読みました。____、使い方がわかりません。", "Li o manual. Porém, não entendo como usar.", ["しかし"]),
],
),
]

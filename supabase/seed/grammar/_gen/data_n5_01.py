G = [
dict(
n=1,
jp="〜ちゃいけない・〜じゃいけない",
rd="chaikenai / jaikenai",
tr="Não pode / Não deve / É proibido",
ex="""Essa estrutura é usada para dizer que algo não é permitido. É a forma falada e mais casual de 〜てはいけない.

Na fala do dia a dia, os japoneses costumam "encurtar" ては para ちゃ. Quando a forma て do verbo termina em で (como nos verbos terminados em む, ぶ, ぬ e ぐ), では vira じゃ. Ou seja, ちゃいけない e じゃいけない têm o mesmo significado; a escolha depende só da terminação da forma て do verbo.

A ideia literal é algo como "fazer isso não está bem". Por isso ela é usada para regras, proibições, avisos e conselhos firmes, como pais falando com filhos, professores com alunos ou amigos alertando uns aos outros.

Como é uma forma contraída, ela soa informal. Em placas, documentos ou situações formais, usa-se a forma completa 〜てはいけません.""",
st="""Verbo na forma て terminada em て → troque て por ちゃ + いけない
Verbo na forma て terminada em で → troque で por じゃ + いけない

Educado: 〜ちゃいけません / 〜じゃいけません
Passado: 〜ちゃいけなかった / 〜じゃいけなかった

Forma completa equivalente: Verbo na forma て + は + いけない""",
no="""A contração segue sempre o mesmo padrão: ては vira ちゃ e では vira じゃ. Esse mesmo padrão aparece em outras expressões, como 〜ちゃだめ, que tem sentido parecido e é ainda mais coloquial.

Por ser uma forma falada, ela é rara em textos escritos formais. Em regulamentos e avisos oficiais, a forma completa é a mais comum.

Um erro comum é esquecer de olhar a forma て antes de contrair: o verbo 飲む vira 飲んで, então a forma correta é 飲んじゃいけない, e não 飲んちゃいけない.""",
bf="ちゃいけない",
rx="ちゃいけない|じゃいけない|ちゃいけません|じゃいけません|ちゃいけなかった|じゃいけなかった",
tk=["ちゃ", "じゃ", "いけない"],
va=["ちゃいけない", "じゃいけない", "ちゃいけません", "じゃいけません", "ちゃいけなかった", "じゃいけなかった"],
E=[
("ここで写真を撮っちゃいけない。", "ここでしゃしんをとっちゃいけない。", "Não pode tirar foto aqui."),
("授業中に寝ちゃいけないよ。", "じゅぎょうちゅうにねちゃいけないよ。", "Não pode dormir durante a aula, viu?"),
("このプールで泳いじゃいけません。", "このプールでおよいじゃいけません。", "Não é permitido nadar nesta piscina."),
("子供のころ、夜遅くまでテレビを見ちゃいけなかった。", "こどものころ、よるおそくまでテレビをみちゃいけなかった。", "Quando eu era criança, não podia ver TV até tarde da noite."),
("薬を飲んだあとで、お酒を飲んじゃいけないよ。", "くすりをのんだあとで、おさけをのんじゃいけないよ。", "Depois de tomar o remédio, você não pode beber álcool."),
],
R=[
("図書館で大きい声で話し____よ。", "Não pode falar alto na biblioteca, viu?", ["ちゃいけない", "ちゃいけません"]),
("廊下を走っ____。", "Não pode correr no corredor.", ["ちゃいけない", "ちゃいけません"]),
("ここにゴミを捨て____。", "Não pode jogar lixo aqui.", ["ちゃいけない", "ちゃいけません"]),
("この川で泳い____。", "Não pode nadar neste rio.", ["じゃいけない", "じゃいけません"]),
("医者に、今日はお酒を飲ん____と言われました。", "O médico me disse que hoje eu não posso beber álcool.", ["じゃいけない"]),
],
),
dict(
n=2,
jp="〜だ・〜です",
rd="da / desu",
tr="Ser / Estar / É",
ex="""だ e です funcionam como o verbo "ser" do português. Eles ligam o assunto da frase a uma informação sobre ele, como uma profissão, uma nacionalidade, um dia da semana ou uma característica.

A diferença entre os dois é o nível de formalidade. です é a forma educada, usada com desconhecidos, no trabalho e com pessoas mais velhas. だ é a forma simples, usada com amigos, família e em textos neutros, como diários.

Eles são usados depois de substantivos e de adjetivos な (sem o な). Com adjetivos い, a regra é diferente: pode-se colocar です para deixar a frase educada, mas não se usa だ, porque o adjetivo い já funciona sozinho como predicado.

Em japonês, essa estrutura também serve para "estar" quando se fala de um estado expresso por um substantivo, como estar de folga ou estar doente.""",
st="""Substantivo + だ (informal)
Substantivo + です (formal)

Adjetivo な (sem な) + だ / です

Adjetivo い + です (formal)
Adjetivo い sozinho (informal, sem だ)

Passado: だった / でした
Negativo: じゃない / ではありません""",
no="""Na fala, principalmente entre mulheres e em situações suaves, é comum omitir だ no final da frase e usar só o substantivo ou o substantivo + よ / ね. Usar だ sozinho no fim da frase pode soar um pouco direto ou firme.

です não é um verbo de verdade, por isso não muda conforme a pessoa: é igual para eu, você, ele ou nós.

Um erro muito comum é dizer おいしいだ ou 高いだ. Com adjetivos い, a forma informal é apenas o adjetivo.""",
bf="です",
rx="です|だ。|だよ|だね|だな|だと",
tk=["だ", "です"],
va=["だ", "です"],
E=[
("私は学生です。", "わたしはがくせいです。", "Eu sou estudante."),
("今日は日曜日だ。", "きょうはにちようびだ。", "Hoje é domingo."),
("この町はとても静かです。", "このまちはとてもしずかです。", "Esta cidade é muito tranquila."),
("あの人は田中さんの先生だよ。", "あのひとはたなかさんのせんせいだよ。", "Aquela pessoa é o professor do Tanaka."),
("このかばんは高いです。", "このかばんはたかいです。", "Esta bolsa é cara."),
],
R=[
("父は医者____。", "Meu pai é médico.", ["です", "だ"]),
("これは私の本____。", "Este é o meu livro.", ["です", "だ"]),
("明日は休み____よ。", "Amanhã é folga, viu?", ["だ", "です"]),
("あの公園はきれい____。", "Aquele parque é bonito.", ["です", "だ"]),
("この料理はおいしい____。", "Esta comida é gostosa.", ["です"]),
],
),
dict(
n=3,
jp="〜だけ",
rd="dake",
tr="Só / Somente / Apenas",
ex="""だけ é usado para limitar algo, mostrando que é só aquilo e nada mais. Equivale a "só", "somente" ou "apenas".

Ele vem logo depois da palavra que está sendo limitada. Pode limitar uma coisa, uma pessoa, uma quantidade, um lugar ou até uma ação.

A frase com だけ pode ser afirmativa ou negativa, e o tom costuma ser neutro: ele apenas informa o limite. Isso é diferente de しか〜ない, que também significa "só", mas exige um verbo negativo e passa a ideia de que aquilo é pouco.

Quando だけ aparece junto com partículas, ele normalmente fica antes de partículas como で, に e と, e pode substituir を e が ou ficar antes delas.""",
st="""Substantivo + だけ
Substantivo + だけ + partícula (だけで / だけに / だけと / だけが)
Quantidade + だけ
Verbo na forma de dicionário + だけ
Adjetivo い + だけ
Adjetivo な + な + だけ""",
no="""A expressão 好きなだけ significa "o quanto quiser", e 一つだけ, "só um". São usos muito frequentes no dia a dia.

だけ não carrega a ideia de "pouco demais". Se a intenção for reclamar ou destacar que algo é insuficiente, しか〜ない é mais adequado.

Em lojas, a expressão 見るだけ é a forma natural de dizer que você só está olhando.""",
bf="だけ",
rx="だけ",
tk=["だけ"],
va=["だけ"],
E=[
("水だけ飲みました。", "みずだけのみました。", "Só bebi água."),
("日曜日だけ休みです。", "にちようびだけやすみです。", "Só tenho folga aos domingos."),
("一つだけください。", "ひとつだけください。", "Me dê só um, por favor."),
("見るだけです。", "みるだけです。", "Só estou olhando."),
("日本語は少しだけわかります。", "にほんごはすこしだけわかります。", "Entendo só um pouquinho de japonês."),
],
R=[
("朝はコーヒー____飲みます。", "De manhã, só bebo café.", ["だけ"]),
("このことは私____が知っています。", "Só eu sei disso.", ["だけ"]),
("財布の中に千円____あります。", "Tenho só mil ienes na carteira.", ["だけ"]),
("見る____です。買いません。", "Só vou olhar. Não vou comprar.", ["だけ"]),
("好きな____食べてください。", "Coma o quanto quiser.", ["だけ"]),
],
),
dict(
n=4,
jp="〜だろう",
rd="darou",
tr="Provavelmente / Deve ser / Acho que / Não é?",
ex="""だろう é usado quando a pessoa fala de algo que ela acredita ser verdade, mas sem ter certeza absoluta. É uma suposição: "provavelmente", "deve ser".

Ele fica no final da frase e funciona com verbos, adjetivos e substantivos. É a versão simples e informal de でしょう. Por isso aparece muito em conversas entre amigos, em pensamentos e em textos neutros, como notícias escritas e redações.

Além da suposição, だろう também pode ser usado com entonação de pergunta para pedir confirmação, como "não é?" ou "eu não disse?". Nesse uso, quem fala espera que o outro concorde.

Na fala, esse uso de confirmação é comum principalmente entre homens. Em situações educadas, o normal é usar でしょう.""",
st="""Verbo na forma simples + だろう
Verbo na forma ない + だろう
Verbo na forma た + だろう
Adjetivo い + だろう
Adjetivo な (sem な) + だろう
Substantivo + だろう

Forma educada: でしょう
Forma reduzida na fala: だろ""",
no="""É muito comum combinar だろう com たぶん ou きっと, que reforçam o grau de certeza da suposição.

A expressão だろうと思う é uma forma natural de dar opinião com um pouco de cautela.

A forma reduzida だろ soa bem informal e, às vezes, até um pouco brusca. Evite com pessoas mais velhas ou desconhecidos.

Com substantivos e adjetivos な, não se usa だ antes de だろう: diz-se 学生だろう, nunca 学生だだろう.""",
bf="だろう",
rx="だろう|だろ",
tk=["だろう"],
va=["だろう", "だろ"],
E=[
("明日は雨が降るだろう。", "あしたはあめがふるだろう。", "Amanhã provavelmente vai chover."),
("田中さんはもう家に帰っただろう。", "たなかさんはもういえにかえっただろう。", "O Tanaka já deve ter voltado para casa."),
("この問題は難しくないだろう。", "このもんだいはむずかしくないだろう。", "Esta questão provavelmente não é difícil."),
("あの店は高いだろうと思います。", "あのみせはたかいだろうとおもいます。", "Acho que aquela loja deve ser cara."),
("ほら、言っただろう。", "ほら、いっただろう。", "Viu? Eu não te disse?"),
],
R=[
("今夜は寒くなる____。", "Hoje à noite provavelmente vai esfriar.", ["だろう"]),
("彼はたぶん来ない____。", "Ele provavelmente não vem.", ["だろう"]),
("あの人は学生____。", "Aquela pessoa deve ser estudante.", ["だろう"]),
("駅まで歩いて十分ぐらい____と思う。", "Acho que até a estação deve dar uns dez minutos a pé.", ["だろう"]),
("宿題、もう終わった____？", "Você já terminou a lição, não é?", ["だろう", "だろ"]),
],
),
dict(
n=5,
jp="で",
rd="de",
tr="Em / Com / De / Por / Por causa de",
ex="""で é uma partícula com vários usos, mas todos giram em torno de uma ideia: ela mostra o "contexto" ou o "meio" em que uma ação acontece.

Os usos mais importantes são:
• Lugar onde uma ação acontece: o lugar em que você estuda, come, trabalha.
• Meio ou ferramenta: o transporte que você usa, o objeto com que faz algo, o idioma em que fala ou escreve.
• Causa: o motivo de algo ter acontecido, como uma doença ou um acidente.
• Total ou limite: a quantidade ou o tempo que forma um conjunto, como um preço total.

Um ponto importante é a diferença entre で e に para lugares. で marca onde uma ação acontece. に marca onde algo existe ou para onde algo vai. Por isso, com verbos de existência como ある e いる, usa-se に, e não で.""",
st="""Substantivo de lugar + で + verbo de ação
Substantivo (meio, ferramenta, transporte) + で
Substantivo (idioma) + で
Substantivo (causa) + で
Quantidade / tempo + で (total ou limite)""",
no="""Para ir a pé, não se usa で: o japonês usa 歩いて.

Quando で indica causa, ele costuma aparecer com coisas que acontecem naturalmente ou fogem do controle, como doença, chuva, acidente ou terremoto.

Não confunda a partícula で com a forma て de verbos terminados em で, nem com a forma で de です, que liga frases. São elementos diferentes que apenas têm o mesmo som.""",
bf="で",
rx="で",
tk=["で"],
va=["で"],
E=[
("図書館で勉強します。", "としょかんでべんきょうします。", "Estudo na biblioteca."),
("毎日バスで学校に行きます。", "まいにちバスでがっこうにいきます。", "Vou para a escola de ônibus todo dia."),
("日本語で手紙を書きました。", "にほんごでてがみをかきました。", "Escrevi uma carta em japonês."),
("風邪で会社を休みました。", "かぜでかいしゃをやすみました。", "Faltei no trabalho por causa de um resfriado."),
("このりんごは三つで二百円です。", "このりんごはみっつでにひゃくえんです。", "Estas maçãs custam duzentos ienes as três."),
],
R=[
("箸____ご飯を食べます。", "Como arroz com hashi.", ["で"]),
("公園____サッカーをしました。", "Joguei futebol no parque.", ["で"]),
("電車____来ました。", "Vim de trem.", ["で"]),
("事故____電車が遅れました。", "O trem atrasou por causa de um acidente.", ["で"]),
("全部____千円です。", "Tudo dá mil ienes.", ["で"]),
],
),
dict(
n=6,
jp="でも",
rd="demo",
tr="Mas / Porém / Mesmo assim",
ex="""No nível N5, でも é aprendido principalmente como uma conjunção que fica no começo da frase e significa "mas" ou "porém".

Ele liga duas ideias que se contrastam. Primeiro você diz uma frase, termina com ponto, e começa a próxima com でも para mostrar que vem uma informação contrária ou inesperada.

É uma palavra muito usada na conversa e serve tanto em situações informais quanto em situações educadas. Em textos mais formais e escritos, palavras como しかし são mais comuns.

A diferença para けど é a posição: けど normalmente fica no final da primeira parte, juntando tudo em uma frase só, enquanto でも começa uma nova frase.""",
st="""Frase 1 (terminada com ponto final) + でも、 + Frase 2
でも sempre no começo da segunda frase""",
no="""でも também tem outros usos que aparecem em níveis seguintes. Depois de substantivos, ele pode significar "até mesmo" ou "ou algo assim", como em uma sugestão leve. São usos diferentes da conjunção do começo da frase.

Na conversa, でも também é usado para responder a algo que o outro disse, introduzindo uma objeção ou uma ressalva.

Começar frases com でも o tempo todo pode soar como se a pessoa estivesse sempre discordando ou dando desculpas, então vale usar com equilíbrio.""",
bf="でも",
rx="でも",
tk=["でも"],
va=["でも"],
E=[
("日本語は難しいです。でも、楽しいです。", "にほんごはむずかしいです。でも、たのしいです。", "Japonês é difícil. Mas é divertido."),
("雨が降っていました。でも、出かけました。", "あめがふっていました。でも、でかけました。", "Estava chovendo. Mas eu saí mesmo assim."),
("このレストランは安いです。でも、あまりおいしくないです。", "このレストランはやすいです。でも、あまりおいしくないです。", "Este restaurante é barato. Mas não é muito gostoso."),
("行きたいです。でも、時間がありません。", "いきたいです。でも、じかんがありません。", "Eu quero ir. Mas não tenho tempo."),
("「明日、映画を見に行かない？」「いいね。でも、何時から？」", "「あした、えいがをみにいかない？」「いいね。でも、なんじから？」", "\"Vamos ver um filme amanhã?\" \"Legal. Mas a partir de que horas?\""),
],
R=[
("肉は好きです。____、魚はあまり好きじゃありません。", "Gosto de carne. Mas não gosto muito de peixe.", ["でも"]),
("一生懸命勉強しました。____、試験は難しかったです。", "Estudei muito. Mas a prova foi difícil.", ["でも"]),
("この服はかわいいです。____、ちょっと高いです。", "Esta roupa é bonitinha. Mas é um pouco cara.", ["でも"]),
("昨日はとても疲れていました。____、パーティーに行きました。", "Ontem eu estava muito cansado. Mas fui à festa.", ["でも"]),
("「一緒に行こうよ。」「うん。____、ちょっと待って。」", "\"Vamos juntos!\" \"Tá. Mas espera um pouco.\"", ["でも"]),
],
),
dict(
n=7,
jp="〜でしょう",
rd="deshou",
tr="Provavelmente / Deve ser / Não é?",
ex="""でしょう é a forma educada de だろう. Ele mostra que a pessoa está fazendo uma suposição: acredita que algo é verdade, mas não tem certeza total.

É muito usado na previsão do tempo, em explicações e em conversas educadas. Fica no final da frase, depois de verbos, adjetivos e substantivos.

Com entonação de pergunta, でしょう também serve para pedir confirmação, algo como "não é?". Nesse caso, quem fala espera que o outro concorde.

Já でしょうか é uma forma educada e suave de fazer uma pergunta. Ela soa mais delicada do que ですか, por isso é comum ao pedir informações a desconhecidos ou atender clientes.""",
st="""Verbo na forma simples + でしょう
Verbo na forma ない + でしょう
Verbo na forma た + でしょう
Adjetivo い + でしょう
Adjetivo な (sem な) + でしょう
Substantivo + でしょう

Pergunta educada: 〜でしょうか
Confirmação: 〜でしょう？ / 〜でしょ？ (informal)""",
no="""A forma reduzida でしょ é bem comum na fala informal para pedir confirmação, com um tom de "eu não disse?" ou "né?".

Na previsão do tempo, でしょう aparece o tempo todo, porque o meteorologista fala de algo provável, mas não garantido.

Apesar de ser educado, でしょう não deve ser usado para falar das suas próprias ações ou intenções; para isso, usa-se a forma ます ou つもり.""",
bf="でしょう",
rx="でしょう|でしょ",
tk=["でしょう"],
va=["でしょう", "でしょ", "でしょうか"],
E=[
("明日は晴れるでしょう。", "あしたははれるでしょう。", "Amanhã provavelmente vai fazer sol."),
("山田さんは来ないでしょう。", "やまださんはこないでしょう。", "O Yamada provavelmente não vem."),
("この時間は、道が空いているでしょう。", "このじかんは、みちがすいているでしょう。", "Neste horário, a rua deve estar vazia."),
("すみません、駅はどこでしょうか。", "すみません、えきはどこでしょうか。", "Com licença, onde fica a estação?"),
("このケーキ、おいしいでしょう？", "このケーキ、おいしいでしょう？", "Este bolo é gostoso, não é?"),
],
R=[
("午後から雨が降る____。", "A partir da tarde provavelmente vai chover.", ["でしょう"]),
("週末は道が混む____。", "No fim de semana, as ruas provavelmente vão estar cheias.", ["でしょう"]),
("彼女はもう寝た____。", "Ela já deve ter dormido.", ["でしょう"]),
("会議は何時から____か。", "A reunião começa a que horas?", ["でしょう"]),
("ほら、この写真、きれい____？", "Olha, esta foto é bonita, não é?", ["でしょう", "でしょ"]),
],
),
dict(
n=8,
jp="どんな",
rd="donna",
tr="Que tipo de / Como / Qual",
ex="""どんな é usado para perguntar sobre o tipo, a natureza ou as características de alguma coisa. Equivale a "que tipo de" ou, dependendo da frase, a "como é".

Ele sempre vem antes de um substantivo, funcionando como um adjetivo de pergunta. Você nunca usa どんな sozinho: ele precisa estar ligado à coisa sobre a qual você quer saber mais.

A resposta normalmente descreve a coisa com adjetivos ou explicações, e não apenas escolhe uma opção. Isso é diferente de どの, que pede para escolher uma entre opções concretas, e de 何, que pergunta "o quê".

Quando aparece junto com でも, どんな ganha o sentido de "qualquer", indicando que não importa o tipo.""",
st="""どんな + Substantivo
どんな + Substantivo + ですか
どんな + Substantivo + でも (qualquer)""",
no="""どんな faz parte da família こんな, そんな, あんな e どんな, que significam "deste tipo", "desse tipo", "daquele tipo" e "que tipo".

Para perguntar como alguém está ou como foi algo, como uma viagem, os japoneses costumam usar どうですか ou どうでしたか, e não どんな.

A pergunta どんな人ですか pede uma descrição da personalidade ou das características da pessoa, não o nome dela.""",
bf="どんな",
rx="どんな",
tk=["どんな"],
va=["どんな"],
E=[
("どんな音楽が好きですか。", "どんなおんがくがすきですか。", "Que tipo de música você gosta?"),
("田中さんはどんな人ですか。", "たなかさんはどんなひとですか。", "Como é o Tanaka?"),
("昨日、どんな映画を見ましたか。", "きのう、どんなえいがをみましたか。", "Que tipo de filme você viu ontem?"),
("日本はどんな国ですか。", "にほんはどんなくにですか。", "Como é o Japão?"),
("どんな色でもいいです。", "どんないろでもいいです。", "Qualquer cor serve."),
],
R=[
("____料理が得意ですか。", "Que tipo de comida você cozinha bem?", ["どんな"]),
("新しい先生は____先生ですか。", "Como é o novo professor?", ["どんな"]),
("____本を読みたいですか。", "Que tipo de livro você quer ler?", ["どんな"]),
("北海道は____ところですか。", "Como é Hokkaido?", ["どんな"]),
("____仕事でも頑張ります。", "Vou me esforçar em qualquer trabalho.", ["どんな"]),
],
),
dict(
n=9,
jp="どうして",
rd="doushite",
tr="Por quê / Por que motivo",
ex="""どうして é usado para perguntar o motivo ou a razão de alguma coisa. Equivale a "por quê".

Ele normalmente aparece no começo da pergunta, e a frase termina com か, の ou んですか. Também pode ser usado sozinho, como resposta curta, na forma どうしてですか ou só どうして.

A resposta a uma pergunta com どうして costuma terminar com から ou ので, que explicam a causa.

Existem outras palavras com o mesmo sentido: なんで é mais informal e muito usado entre amigos, e なぜ é mais formal e comum em textos escritos. どうして fica no meio, servindo para a maioria das situações.""",
st="""どうして + frase + か / の / んですか
どうしてですか (sozinho)
どうしてか + frase (por algum motivo)

Resposta: 〜から / 〜ので""",
no="""Quando a pergunta é feita com んですか ou の, ela soa mais natural e mostra interesse real em entender a situação.

Dependendo do tom, どうして pode soar como cobrança ou reclamação, principalmente em frases negativas, como perguntar por que alguém não fez algo.

A expressão どうしてか significa "por algum motivo" ou "não sei por quê", e não é uma pergunta.""",
bf="どうして",
rx="どうして",
tk=["どうして"],
va=["どうして"],
E=[
("どうして日本語を勉強していますか。", "どうしてにほんごをべんきょうしていますか。", "Por que você está estudando japonês?"),
("どうして昨日来なかったの？", "どうしてきのうこなかったの？", "Por que você não veio ontem?"),
("「明日は行きません。」「どうしてですか。」", "「あしたはいきません。」「どうしてですか。」", "\"Amanhã não vou.\" \"Por quê?\""),
("どうしてそんなに急いでいるんですか。", "どうしてそんなにいそいでいるんですか。", "Por que você está com tanta pressa?"),
("どうしてかわからないけど、今日はとても眠い。", "どうしてかわからないけど、きょうはとてもねむい。", "Não sei por quê, mas hoje estou com muito sono."),
],
R=[
("____泣いているの？", "Por que você está chorando?", ["どうして"]),
("____遅れたんですか。", "Por que você se atrasou?", ["どうして"]),
("「パーティーに行かない。」「____？」", "\"Não vou à festa.\" \"Por quê?\"", ["どうして"]),
("____この窓は開かないんだろう。", "Por que será que esta janela não abre?", ["どうして"]),
("____かわからないけど、彼は怒っている。", "Não sei por quê, mas ele está bravo.", ["どうして"]),
],
),
dict(
n=10,
jp="どうやって",
rd="douyatte",
tr="Como / De que jeito / De que maneira",
ex="""どうやって é usado para perguntar o método ou o modo de fazer alguma coisa. Equivale a "como" ou "de que jeito".

Ele sempre se refere a uma ação, então vem antes de um verbo. A pergunta é sobre o processo: qual caminho seguir, que passos fazer, que meio usar.

Literalmente, どうやって vem de どう, que significa "como", e やって, a forma て de やる, que significa "fazer". A ideia é "fazendo de que maneira".

É diferente de どう sozinho, que pergunta a opinião ou o estado de algo, como "o que você acha?" ou "como foi?". どうやって é para "como fazer".""",
st="""どうやって + Verbo
どうやって + Verbo + か / の / んですか
どうやって + Verbo + か + frase (pergunta indireta)""",
no="""Para perguntar como chegar a algum lugar, どうやって行きますか é a forma mais natural.

Em situações educadas, também se usa どのように, que tem o mesmo sentido, mas soa mais formal.

A resposta costuma usar a forma て ou で para indicar o meio, como ir de trem ou fazer usando uma ferramenta.""",
bf="どうやって",
rx="どうやって",
tk=["どう", "やって"],
va=["どうやって"],
E=[
("駅までどうやって行きますか。", "えきまでどうやっていきますか。", "Como eu chego até a estação?"),
("この漢字はどうやって読みますか。", "このかんじはどうやってよみますか。", "Como se lê este kanji?"),
("これ、どうやって作ったの？", "これ、どうやってつくったの？", "Como você fez isso?"),
("このカメラはどうやって使うんですか。", "このカメラはどうやってつかうんですか。", "Como se usa esta câmera?"),
("どうやって日本語が上手になったか教えてください。", "どうやってにほんごがじょうずになったかおしえてください。", "Me conte como você ficou bom em japonês."),
],
R=[
("空港まで____行きますか。", "Como eu vou até o aeroporto?", ["どうやって"]),
("このゲームは____遊びますか。", "Como se joga este jogo?", ["どうやって"]),
("____この問題を解いたの？", "Como você resolveu esta questão?", ["どうやって"]),
("「すしは____食べますか。」「手で食べてもいいですよ。」", "\"Como se come sushi?\" \"Pode comer com as mãos.\"", ["どうやって"]),
("____ここに来たか覚えていません。", "Não lembro como cheguei aqui.", ["どうやって"]),
],
),
]

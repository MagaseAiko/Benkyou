G = [
dict(
n=81,
jp="〜ます・〜ません・〜ました・〜ませんでした",
rd="masu / masen / mashita / masen deshita",
tr="Faço / Não faço / Fiz / Não fiz",
ex="""Essas são as quatro formas básicas dos verbos na linguagem educada. Elas são usadas com desconhecidos, no trabalho, na escola e em qualquer situação em que se queira falar com respeito.

• ます: afirmativo, presente ou futuro ("faço", "vou fazer").
• ません: negativo, presente ou futuro ("não faço", "não vou fazer").
• ました: afirmativo no passado ("fiz").
• ませんでした: negativo no passado ("não fiz").

Em japonês, o presente e o futuro usam a mesma forma. O contexto, ou palavras como 明日 e 来週, mostra quando a ação acontece.

Para formar essas terminações, primeiro é preciso encontrar a "base ます" do verbo. Ela muda conforme o grupo do verbo: nos verbos do grupo 1, o último som muda de "u" para "i"; nos verbos do grupo 2, tira-se o る; e する e 来る são irregulares.""",
st="""Base ます + ます / ません / ました / ませんでした

Grupo 1: troque o som final "u" por "i" (書く → 書き / 飲む → 飲み / 買う → 買い)
Grupo 2: tire o る (食べる → 食べ / 見る → 見)
Irregulares: する → し / 来る → 来 (き)""",
no="""Alguns verbos terminados em る pertencem ao grupo 1, como 帰る, 入る e 走る. Por isso, a forma ます deles é 帰ります, e não 帰ます.

O passado negativo ませんでした é formado juntando ません com でした. É uma das formas mais longas dos verbos educados.

Na conversa entre amigos, usa-se a forma simples: dicionário, ない, た e なかった.""",
bf="ます",
rx="ます|ません|ました|ませんでした",
tk=["ます", "ません", "ました", "ませんでした"],
va=["ます", "ません", "ました", "ませんでした"],
E=[
("毎朝、コーヒーを飲みます。", "まいあさ、コーヒーをのみます。", "Toda manhã, tomo café."),
("私はお酒を飲みません。", "わたしはおさけをのみません。", "Eu não bebo álcool."),
("昨日、駅で友達に会いました。", "きのう、えきでともだちにあいました。", "Ontem encontrei um amigo na estação."),
("昨日は雨で、どこにも行きませんでした。", "きのうはあめで、どこにもいきませんでした。", "Ontem choveu e não fui a lugar nenhum."),
("明日、母が東京に来ます。", "あした、ははがとうきょうにきます。", "Amanhã minha mãe vem a Tóquio."),
],
R=[
("毎晩十一時に寝____。", "Toda noite, durmo às onze.", ["ます"]),
("私は肉を食べ____。", "Eu não como carne.", ["ません"]),
("先週、京都へ行き____。", "Semana passada, fui a Kyoto.", ["ました"]),
("昨日は疲れて、宿題をし____。", "Ontem estava cansado e não fiz a lição.", ["ませんでした"]),
("来週、友達がブラジルから来____。", "Semana que vem, um amigo vem do Brasil.", ["ます"]),
],
),
dict(
n=82,
jp="〜でした・〜ではありませんでした",
rd="deshita / dewa arimasen deshita",
tr="Era / Foi / Não era / Não foi",
ex="""でした e ではありませんでした são as formas do passado de です. Elas servem para dizer o que algo "era" ou "foi", e o que "não era" ou "não foi".

São usadas depois de substantivos e de adjetivos な. Por exemplo, para dizer que ontem foi domingo, que alguém era estudante ou que uma prova não foi fácil.

でした é o passado afirmativo. ではありませんでした é o passado negativo, e é formado juntando ではありません com でした. Na fala, では costuma virar じゃ, formando じゃありませんでした.

Existe ainda outra forma educada para o passado negativo: ではなかったです ou じゃなかったです. Ela é um pouco mais leve e muito usada na conversa.

Atenção: com adjetivos い, essas formas não são usadas. O passado do adjetivo い é formado pelo próprio adjetivo, com かった.""",
st="""Substantivo / Adjetivo な + でした
Substantivo / Adjetivo な + ではありませんでした
Substantivo / Adjetivo な + じゃありませんでした
Substantivo / Adjetivo な + ではなかったです / じゃなかったです

Informal: だった / じゃなかった / ではなかった""",
no="""Um erro clássico é dizer おいしいでした. Com adjetivos い, o passado correto é おいしかったです.

ではありませんでした soa mais formal e escrito. じゃなかったです é mais comum na conversa do dia a dia.

Essas formas também aparecem depois de の em explicações, como em のでした, mas esse uso é mais avançado.""",
bf="でした",
rx="でした|ではありませんでした|じゃありませんでした|ではなかった|じゃなかった",
tk=["でした", "ではありませんでした"],
va=["でした", "ではありませんでした", "じゃありませんでした", "ではなかったです", "じゃなかったです"],
E=[
("昨日は日曜日でした。", "きのうはにちようびでした。", "Ontem foi domingo."),
("子供のころ、私は静かな子でした。", "こどものころ、わたしはしずかなこでした。", "Quando criança, eu era uma criança quieta."),
("昨日の試験は簡単ではありませんでした。", "きのうのしけんはかんたんではありませんでした。", "A prova de ontem não foi fácil."),
("先週は休みじゃありませんでした。", "せんしゅうはやすみじゃありませんでした。", "Semana passada não foi folga."),
("あの店は、前は有名ではなかったです。", "あのみせは、まえはゆうめいではなかったです。", "Aquela loja, antes, não era famosa."),
],
R=[
("昨日はいい天気____。", "Ontem fez um tempo bom.", ["でした"]),
("父は昔、先生____。", "Meu pai, antigamente, era professor.", ["でした"]),
("昨日のパーティーはあまりにぎやか____。", "A festa de ontem não foi muito animada.", ["ではありませんでした", "じゃありませんでした", "ではなかったです", "じゃなかったです"]),
("子供のころ、野菜が嫌い____。", "Quando criança, eu não gostava de verdura.", ["でした"]),
("「昨日は暇でしたか。」「いいえ、暇____。」", "\"Você estava livre ontem?\" \"Não, não estava livre.\"", ["ではありませんでした", "じゃありませんでした", "ではなかったです", "じゃなかったです"]),
],
),
dict(
n=83,
jp="これ・それ・あれ・どれ",
rd="kore / sore / are / dore",
tr="Isto / Isso / Aquilo / Qual",
ex="""これ, それ, あれ e どれ são pronomes usados para apontar coisas. Eles funcionam sozinhos, no lugar de um substantivo.

A escolha depende da distância entre a coisa, quem fala e quem ouve:
• これ: algo perto de quem fala ("isto").
• それ: algo perto de quem ouve ("isso").
• あれ: algo longe dos dois ("aquilo").
• どれ: a pergunta "qual?", usada para escolher entre três ou mais coisas.

Esses pronomes recebem partículas normalmente, como は, が e を.

それ também é usado para se referir a algo que o outro acabou de dizer, e あれ, para algo que os dois conhecem e lembram.""",
st="""これ / それ / あれ + は / が / を / も
どれ + が / を / ですか

これ: perto de quem fala
それ: perto de quem ouve
あれ: longe dos dois
どれ: qual (entre três ou mais)""",
no="""Esses pronomes fazem parte do sistema こ・そ・あ・ど, que aparece em várias palavras: この / その / あの / どの, ここ / そこ / あそこ / どこ e こちら / そちら / あちら / どちら.

Para escolher entre apenas duas coisas, usa-se どちら, e não どれ.

Para pessoas, usar これ ou あれ pode soar rude. O mais educado é この人, あの人 ou, de forma respeitosa, この方 e あの方.""",
bf="これ",
rx="これ|それ|あれ|どれ",
tk=["これ", "それ", "あれ", "どれ"],
va=["これ", "それ", "あれ", "どれ"],
E=[
("これは私のかばんです。", "これはわたしのかばんです。", "Esta é a minha bolsa."),
("それは何ですか。", "それはなんですか。", "O que é isso?"),
("あれは東京タワーです。", "あれはとうきょうタワーです。", "Aquilo é a Torre de Tóquio."),
("あなたの傘はどれですか。", "あなたのかさはどれですか。", "Qual é o seu guarda-chuva?"),
("すみません、それを見せてください。", "すみません、それをみせてください。", "Com licença, me mostre isso, por favor."),
],
R=[
("あなたの手にある____は何ですか。", "O que é isso na sua mão?", ["それ"]),
("「田中さんの車は____ですか。」「あの白い車です。」", "\"Qual é o carro do Tanaka?\" \"É aquele carro branco.\"", ["どれ"]),
("私の手の中の____は日本のお金です。", "Isto aqui na minha mão é dinheiro japonês.", ["これ"]),
("遠くに見える____は富士山ですか。", "Aquilo que se vê ao longe é o Monte Fuji?", ["あれ"]),
("この中で、____が一番好きですか。", "Destes aqui, qual você mais gosta?", ["どれ"]),
],
),
dict(
n=84,
jp="ここ・そこ・あそこ・どこ",
rd="koko / soko / asoko / doko",
tr="Aqui / Aí / Lá / Onde",
ex="""ここ, そこ, あそこ e どこ são palavras para indicar lugares. Elas seguem a mesma lógica de distância de これ, それ e あれ.

• ここ: o lugar onde está quem fala ("aqui").
• そこ: o lugar perto de quem ouve ("aí").
• あそこ: um lugar longe dos dois ("lá", "ali").
• どこ: a pergunta "onde?".

Elas funcionam como substantivos e podem receber partículas como に, で, へ, を e は.

Quando quem fala e quem ouve estão no mesmo lugar, ここ indica o lugar onde os dois estão, そこ indica um lugar um pouco afastado, e あそこ indica um lugar mais distante.""",
st="""ここ / そこ / あそこ / どこ + は / が / に / で / へ / を
Substantivo + は + ここ / そこ / あそこ / どこ + です

ここ: perto de quem fala
そこ: perto de quem ouve
あそこ: longe dos dois
どこ: onde""",
no="""Em situações educadas, como em lojas e recepções, usa-se こちら, そちら, あちら e どちら no lugar de ここ, そこ, あそこ e どこ.

そこ também pode indicar um lugar que acabou de ser mencionado na conversa, mesmo que não esteja fisicamente perto do ouvinte.

Note que a forma "lá" é あそこ, e não あこ. É a única irregular do grupo.""",
bf="ここ",
rx="ここ|そこ|あそこ|どこ",
tk=["ここ", "そこ", "あそこ", "どこ"],
va=["ここ", "そこ", "あそこ", "どこ"],
E=[
("ここは私の部屋です。", "ここはわたしのへやです。", "Aqui é o meu quarto."),
("すみません、トイレはどこですか。", "すみません、トイレはどこですか。", "Com licença, onde fica o banheiro?"),
("あそこに銀行があります。", "あそこにぎんこうがあります。", "Ali tem um banco."),
("どうぞ、そこに座ってください。", "どうぞ、そこにすわってください。", "Por favor, sente-se aí."),
("「駅はどこですか。」「あそこです。」", "「えきはどこですか。」「あそこです。」", "\"Onde fica a estação?\" \"É lá.\""),
],
R=[
("すみません、出口は____ですか。", "Com licença, onde fica a saída?", ["どこ"]),
("私たちが今いる____は、昔、学校でした。", "Este lugar onde estamos agora antigamente era uma escola.", ["ここ"]),
("遠くに白い建物が見えるでしょう。____が私の会社です。", "Dá para ver um prédio branco ao longe, né? Lá é a minha empresa.", ["あそこ"]),
("「私の眼鏡、知らない？」「あなたの足の下、____にあるよ。」", "\"Você viu meus óculos?\" \"Estão aí, debaixo do seu pé.\"", ["そこ"]),
("夏休みは____へ行きたいですか。", "Aonde você quer ir nas férias de verão?", ["どこ"]),
],
),
dict(
n=85,
jp="この・その・あの・どの",
rd="kono / sono / ano / dono",
tr="Este / Esse / Aquele / Qual",
ex="""この, その, あの e どの são usados antes de um substantivo para apontar qual coisa ou pessoa está sendo mencionada. Eles nunca aparecem sozinhos: sempre precisam de um substantivo depois.

A lógica de distância é a mesma de これ, それ e あれ:
• この: perto de quem fala ("este").
• その: perto de quem ouve ("esse").
• あの: longe dos dois ("aquele").
• どの: a pergunta "qual?", para escolher entre três ou mais.

A diferença em relação a これ e それ é a função: これ substitui o substantivo, enquanto この acompanha o substantivo.

あの também é usado para lembrar algo que os dois conhecem, como uma época ou um lugar do passado.""",
st="""この / その / あの / どの + Substantivo

この: perto de quem fala
その: perto de quem ouve
あの: longe dos dois / algo que os dois conhecem
どの: qual (entre três ou mais)""",
no="""Um erro comum é usar この sozinho, sem substantivo. Quando o substantivo não aparece, o certo é usar これ.

Para escolher entre apenas duas opções, o mais natural é どちらの.

A palavra あのう, com som alongado, é uma interjeição usada para chamar a atenção ou hesitar, como "hum...". Não tem a função de あの + substantivo.""",
bf="この",
rx="この|その|あの|どの",
tk=["この", "その", "あの", "どの"],
va=["この", "その", "あの", "どの"],
E=[
("この本はおもしろいです。", "このほんはおもしろいです。", "Este livro é interessante."),
("その傘は誰のですか。", "そのかさはだれのですか。", "De quem é esse guarda-chuva?"),
("あの人は誰ですか。", "あのひとはだれですか。", "Quem é aquela pessoa?"),
("どの電車に乗りますか。", "どのでんしゃにのりますか。", "Em qual trem você vai entrar?"),
("あの時は本当に楽しかったね。", "あのときはほんとうにたのしかったね。", "Aquela época foi muito divertida, né?"),
],
R=[
("私が持っている____かばんは新しいです。", "Esta bolsa que estou segurando é nova.", ["この"]),
("あなたが持っている____ペン、ちょっと貸して。", "Me empresta essa caneta que você está segurando?", ["その"]),
("遠くに見える____山の名前を知っていますか。", "Você sabe o nome daquela montanha que se vê ao longe?", ["あの"]),
("この三つの中で、____色が好きですか。", "Destas três, de qual cor você gosta?", ["どの"]),
("子供のころ住んでいた____町に、もう一度行きたいです。", "Quero ir mais uma vez àquela cidade onde morei quando criança.", ["あの"]),
],
),
dict(
n=86,
jp="疑問詞（何・誰・いつ・いくら・いくつ）",
rd="gimonshi (nani / dare / itsu / ikura / ikutsu)",
tr="O que / Quem / Quando / Quanto custa / Quantos",
ex="""疑問詞 são as palavras interrogativas, usadas para fazer perguntas abertas. No N5, as mais importantes são:
• 何 (なに / なん): "o que".
• 誰 (だれ): "quem".
• いつ: "quando".
• いくら: "quanto custa" ou "quanto" para preços e valores.
• いくつ: "quantos" para coisas, e também "quantos anos" para idade.

Em japonês, a palavra interrogativa não precisa ir para o começo da frase. Ela fica no mesmo lugar onde estaria a resposta. Por isso, a ordem da pergunta e da resposta é igual.

何 tem duas leituras. Antes de sons como t, d e n, e antes de contadores, costuma ser lido なん. Antes de partículas como を e が, costuma ser lido なに.

Quando a palavra interrogativa é o sujeito, ela é marcada com が, e nunca com は.""",
st="""何 (なに) + を / が / に
何 (なん) + です / の / contador (何時 / 何人 / 何曜日)
誰 + が / に / と / の
いつ + Verbo / ですか
いくら + ですか
いくつ + ありますか / ですか (idade)

Formas educadas: どなた (quem) / おいくつ (idade)""",
no="""いつ normalmente não leva に, mesmo quando pergunta sobre um momento.

Para perguntar a idade de alguém de forma educada, usa-se おいくつですか. Para crianças, também é comum 何歳ですか.

Com も e o verbo negativo, as palavras interrogativas formam ideias como "nada" e "ninguém". Com か, formam "algo" e "alguém".""",
bf="何",
rx="何|誰|いつ|いくら|いくつ|なに|なん|だれ",
tk=["何", "誰", "いつ", "いくら", "いくつ"],
va=["何", "なに", "なん", "誰", "だれ", "いつ", "いくら", "いくつ", "どなた", "おいくつ"],
E=[
("これは何ですか。", "これはなんですか。", "O que é isto?"),
("あの人は誰ですか。", "あのひとはだれですか。", "Quem é aquela pessoa?"),
("誕生日はいつですか。", "たんじょうびはいつですか。", "Quando é o seu aniversário?"),
("このシャツはいくらですか。", "このシャツはいくらですか。", "Quanto custa esta camisa?"),
("箱の中にりんごはいくつありますか。", "はこのなかにりんごはいくつありますか。", "Quantas maçãs tem dentro da caixa?"),
],
R=[
("「昨日、____を食べましたか。」「カレーを食べました。」", "\"O que você comeu ontem?\" \"Comi curry.\"", ["何", "なに"]),
("「____が来ましたか。」「田中さんが来ました。」", "\"Quem veio?\" \"O Tanaka veio.\"", ["誰", "だれ"]),
("「夏休みは____からですか。」「七月二十日からです。」", "\"A partir de quando são as férias de verão?\" \"A partir de 20 de julho.\"", ["いつ"]),
("「この時計は____ですか。」「三千円です。」", "\"Quanto custa este relógio?\" \"Três mil ienes.\"", ["いくら"]),
("「弟さんは____ですか。」「十歳です。」", "\"Quantos anos tem o seu irmão mais novo?\" \"Dez anos.\"", ["いくつ", "おいくつ"]),
],
),
dict(
n=87,
jp="ない形",
rd="nai-kei",
tr="Forma negativa simples / Não (fazer)",
ex="""A forma ない é a forma negativa simples dos verbos. Ela é usada na fala informal, com amigos e família, e também serve de base para muitas outras gramáticas, como ないでください e なくてもいい.

Ela equivale a "não faço" ou "não vou fazer". Para o passado, troca-se ない por なかった ("não fiz").

A formação depende do grupo do verbo:
• Grupo 1: o último som muda de "u" para "a" e recebe ない. Verbos terminados em う viram わ, e não あ.
• Grupo 2: tira-se o る e acrescenta-se ない.
• Irregulares: する vira しない, e 来る vira 来ない (こない).

O verbo ある é especial: sua forma negativa é simplesmente ない.

Depois de formado, o verbo na forma ない se comporta como um adjetivo い: o passado é なかった, e a forma educada pode ser ないです.""",
st="""Grupo 1: troque o som final "u" por "a" + ない (書く → 書かない / 飲む → 飲まない)
Grupo 1 terminados em う: う → わ + ない (買う → 買わない)
Grupo 2: tire o る + ない (食べる → 食べない / 見る → 見ない)
Irregulares: する → しない / 来る → 来ない (こない)
Especial: ある → ない

Passado: ない → なかった""",
no="""Verbos como 帰る, 入る e 走る parecem do grupo 2, mas são do grupo 1. Por isso, a forma ない deles é 帰らない, 入らない e 走らない.

A leitura de 来ない é こない, com o som "ko", e não "ki".

Na fala muito casual de algumas regiões, ない pode virar ん, mas esse uso é dialetal ou bem informal.""",
bf="ない",
rx="ない|なかった",
tk=["ない"],
va=["ない", "なかった"],
E=[
("私はタバコを吸わない。", "わたしはタバコをすわない。", "Eu não fumo."),
("今日は学校に行かない。", "きょうはがっこうにいかない。", "Hoje não vou à escola."),
("弟は野菜を食べない。", "おとうとはやさいをたべない。", "Meu irmão mais novo não come verdura."),
("昨日は誰も来なかった。", "きのうはだれもこなかった。", "Ontem ninguém veio."),
("明日は雨だから、出かけない。", "あしたはあめだから、でかけない。", "Amanhã vai chover, então não vou sair."),
],
R=[
("私はコーヒーを飲ま____。", "Eu não bebo café.", ["ない"]),
("父は朝ご飯を食べ____。", "Meu pai não toma café da manhã.", ["ない"]),
("昨日はテレビを見____。", "Ontem não vi TV.", ["なかった"]),
("今日は疲れたから、宿題を____。", "Hoje estou cansado, então não vou fazer a lição.", ["しない"]),
("明日、田中さんは学校に____。", "Amanhã, o Tanaka não vem à escola.", ["来ない", "こない"]),
],
),
dict(
n=88,
jp="助数詞（つ・人・枚・本・個 など）",
rd="josuushi (tsu / nin / mai / hon / ko)",
tr="Contadores / Palavras para contar",
ex="""助数詞 são os contadores: palavras que vêm depois dos números para contar coisas. Em japonês, não se diz apenas "três canetas": o número precisa de um contador que combine com o tipo de objeto.

Os contadores mais importantes do N5 são:
• つ: coisas em geral, sem contador específico (de 1 a 9).
• 人: pessoas.
• 枚: coisas finas e planas, como papel, camisetas, pratos e selos.
• 本: coisas longas e finas, como canetas, garrafas, guarda-chuvas e árvores.
• 個: coisas pequenas e arredondadas, como ovos e maçãs.
• 台: máquinas e veículos.
• 匹: animais pequenos.
• 冊: livros e cadernos.

Na frase, o número com contador costuma vir depois da partícula, logo antes do verbo. Também pode vir antes do substantivo, ligado por の.

A pronúncia de alguns números muda quando se juntam ao contador, como acontece com 本, 匹 e 人.""",
st="""Número + Contador
Substantivo + が / を + Número + Contador + Verbo
Número + Contador + の + Substantivo

Perguntas: いくつ / 何人 / 何枚 / 何本 / 何個 / 何台 / 何匹 / 何冊

つ: ひとつ / ふたつ / みっつ / よっつ / いつつ / むっつ / ななつ / やっつ / ここのつ / とお
人: ひとり / ふたり / さんにん / よにん …""",
no="""Os números um e dois de pessoas são irregulares: ひとり e ふたり. A partir de três, usa-se o número + にん.

Com 本, a leitura muda: いっぽん, にほん, さんぼん, よんほん, ろっぽん. O mesmo tipo de mudança acontece com 匹: いっぴき, にひき, さんびき.

Quando não se sabe o contador certo, つ é uma opção segura para objetos, até nove.""",
bf="つ",
rx="つ|人|枚|本|個|台|匹|冊",
tk=["つ", "人", "枚", "本", "個"],
va=["つ", "人", "枚", "本", "個", "台", "匹", "冊"],
E=[
("りんごを三つ買いました。", "りんごをみっつかいました。", "Comprei três maçãs."),
("教室に学生が二十人います。", "きょうしつにがくせいがにじゅうにんいます。", "Tem vinte alunos na sala de aula."),
("切手を五枚ください。", "きってをごまいください。", "Me dê cinco selos, por favor."),
("かばんの中に鉛筆が二本あります。", "かばんのなかにえんぴつがにほんあります。", "Tem dois lápis dentro da bolsa."),
("家に犬が一匹と猫が二匹います。", "いえにいぬがいっぴきとねこがにひきいます。", "Em casa tem um cachorro e dois gatos."),
],
R=[
("私の家族は四____です。", "Minha família tem quatro pessoas.", ["人"]),
("すみません、コピーを十____お願いします。", "Com licença, dez cópias, por favor.", ["枚"]),
("ビールを二____ください。", "Me dê duas garrafas de cerveja, por favor.", ["本"]),
("スーパーで卵を三____買ってきてください。", "Compre três ovos no supermercado, por favor.", ["個", "つ"]),
("姉は車を一____持っています。", "Minha irmã mais velha tem um carro.", ["台"]),
],
),
dict(
n=89,
jp="〜が好き・〜が嫌い",
rd="ga suki / ga kirai",
tr="Gostar de / Não gostar de / Detestar",
ex="""が好き e が嫌い são usados para falar do que alguém gosta ou não gosta. Equivalem a "gostar de" e "não gostar de".

好き e 嫌い não são verbos, e sim adjetivos な. Por isso, a coisa de que se gosta é marcada com が, e não com を. A pessoa que sente o gosto costuma vir com は.

Para dar mais força, usa-se 大好き (adorar) e 大嫌い (detestar).

Para falar de ações, como gostar de ler ou de nadar, é preciso transformar o verbo em substantivo com の: のが好き.

Antes de um substantivo, eles recebem な, como em "comida favorita" ou "pessoa de quem não gosto".""",
st="""Substantivo + が + 好き / 嫌い + です / だ
Substantivo + が + 大好き / 大嫌い + です / だ
Verbo + のが + 好き / 嫌い
好きな / 嫌いな + Substantivo

Negativo: が好きじゃない / が好きではありません
Passado: が好きでした / が嫌いでした

Escrita: 好き / すき, 嫌い / きらい""",
no="""嫌い soa forte em japonês. Para dizer de forma mais suave que não gosta de algo, os japoneses preferem あまり好きじゃない.

Embora 嫌い termine em い, ele é um adjetivo な. O negativo é 嫌いじゃない, e não 嫌くない.

好き também é usado para falar de gostar de uma pessoa no sentido romântico, dependendo do contexto.""",
bf="好き",
rx="が好き|が嫌い|がすき|がきらい|が大好き|が大嫌い|がだいすき|がだいきらい",
tk=["が", "好き", "嫌い"],
va=["が好き", "が嫌い", "がすき", "がきらい", "が大好き", "が大嫌い"],
E=[
("私は猫が好きです。", "わたしはねこがすきです。", "Eu gosto de gatos."),
("弟は野菜が嫌いです。", "おとうとはやさいがきらいです。", "Meu irmão mais novo não gosta de verdura."),
("母は花が大好きです。", "はははながだいすきです。", "Minha mãe adora flores."),
("田中さんはどんな音楽が好きですか。", "たなかさんはどんなおんがくがすきですか。", "Que tipo de música o Tanaka gosta?"),
("子供のころ、牛乳が嫌いでした。", "こどものころ、ぎゅうにゅうがきらいでした。", "Quando era criança, eu não gostava de leite."),
],
R=[
("私は日本の料理____です。", "Eu gosto de comida japonesa.", ["が好き", "がすき", "が大好き", "がだいすき"]),
("兄は虫____です。", "Meu irmão mais velho detesta insetos.", ["が嫌い", "がきらい", "が大嫌い", "がだいきらい"]),
("どんなスポーツ____ですか。", "De que esporte você gosta?", ["が好き", "がすき"]),
("子供のころ、勉強____でした。", "Quando era criança, eu não gostava de estudar.", ["が嫌い", "がきらい", "が大嫌い", "がだいきらい"]),
("私はあまりお酒____じゃありません。", "Eu não gosto muito de bebida alcoólica.", ["が好き", "がすき"]),
],
),
dict(
n=90,
jp="〜ができる",
rd="ga dekiru",
tr="Saber (fazer) / Conseguir / Poder",
ex="""ができる é usado para dizer que alguém sabe fazer algo, consegue fazer algo ou que algo pode ser feito em um lugar. Equivale a "saber", "conseguir" ou "poder".

A coisa que se sabe ou se pode fazer é marcada com が, e não com を. Isso acontece porque できる indica uma capacidade ou possibilidade, e não uma ação direta.

Os usos mais comuns são:
• Habilidade: saber um idioma, um esporte, tocar um instrumento.
• Possibilidade: uma atividade que pode ser feita em um lugar.
• Surgimento: algo que foi criado, construído ou ficou pronto, como uma loja nova ou um prato que ficou pronto.

Com verbos, a estrutura é ことができる, que aparece no N4.""",
st="""Substantivo + が + できる
Lugar + で(は) + Substantivo + が + できる

Educado: ができます
Negativo: ができない / ができません
Passado: ができた / ができました
Passado negativo: ができなかった / ができませんでした""",
no="""Quando できる indica que algo surgiu ou foi construído, ele não fala de habilidade. O contexto mostra qual é o sentido.

Para dizer "pronto!" quando algo fica pronto, como comida ou um trabalho, os japoneses dizem できた.

Para falar de habilidade com mais modéstia, também se usa 少しできます.""",
bf="できる",
rx="ができる|ができます|ができない|ができなかった|ができません|ができた|ができました",
tk=["が", "できる"],
va=["ができる", "ができます", "ができない", "ができません", "ができた", "ができました"],
E=[
("私は英語ができます。", "わたしはえいごができます。", "Eu sei inglês."),
("姉はピアノができる。", "あねはピアノができる。", "Minha irmã mais velha sabe tocar piano."),
("弟はまだ料理ができません。", "おとうとはまだりょうりができません。", "Meu irmão mais novo ainda não sabe cozinhar."),
("このホテルでは、テニスができます。", "このホテルでは、テニスができます。", "Neste hotel, dá para jogar tênis."),
("駅の前に新しい店ができました。", "えきのまえにあたらしいみせができました。", "Abriu uma loja nova em frente à estação."),
],
R=[
("田中さんは中国語____。", "O Tanaka sabe chinês.", ["ができます", "ができる"]),
("私は水泳____。", "Eu não sei nadar.", ["ができません", "ができない"]),
("この公園ではバーベキュー____か。", "Dá para fazer churrasco neste parque?", ["ができます"]),
("子供のころは、スキー____。", "Quando era criança, eu não sabia esquiar.", ["ができませんでした", "ができなかった"]),
("先月、家の近くに大きいスーパー____。", "Mês passado, abriu um supermercado grande perto de casa.", ["ができました", "ができた"]),
],
),
dict(
n=91,
jp="〜から〜まで",
rd="kara ~ made",
tr="De... até... / Desde... até...",
ex="""から〜まで é usado para indicar o começo e o fim de algo, seja no espaço ou no tempo. Equivale a "de... até...".

から marca o ponto de partida, e まで marca o ponto final. Juntos, eles mostram um intervalo completo: de um lugar a outro, de um horário a outro, de um dia a outro.

É muito usado para falar de horários de funcionamento, trajetos, períodos de férias e duração de atividades.

Também pode indicar a abrangência de um grupo, com o sentido de "desde... até...", mostrando que todos dentro daquele intervalo estão incluídos.""",
st="""Lugar A + から + Lugar B + まで
Tempo A + から + Tempo B + まで
Substantivo A + から + Substantivo B + まで + です""",
no="""Também é possível usar só から ou só まで quando um dos pontos já está claro pelo contexto.

Para dizer quanto tempo leva um trajeto, a estrutura costuma terminar com かかります.

Lembre que まで indica algo contínuo até o fim. Para prazos, como "entregar até sexta", usa-se までに.""",
bf="から",
rx="から|まで",
tk=["から", "まで"],
va=["から", "まで"],
E=[
("授業は九時から三時までです。", "じゅぎょうはくじからさんじまでです。", "As aulas são das nove às três."),
("家から駅まで歩いて十分です。", "いえからえきまであるいてじっぷんです。", "De casa até a estação são dez minutos a pé."),
("月曜日から金曜日まで働きます。", "げつようびからきんようびまではたらきます。", "Trabalho de segunda a sexta."),
("東京から大阪まで新幹線で二時間半かかります。", "とうきょうからおおさかまでしんかんせんでにじかんはんかかります。", "De Tóquio até Osaka leva duas horas e meia de trem-bala."),
("夏休みは七月二十日から八月三十一日までです。", "なつやすみはしちがつはつかからはちがつさんじゅういちにちまでです。", "As férias de verão vão de 20 de julho até 31 de agosto."),
],
R=[
("銀行は九時____三時までです。", "O banco funciona das nove às três.", ["から"]),
("家から学校____自転車で行きます。", "Vou de casa até a escola de bicicleta.", ["まで"]),
("東京____京都まで、新幹線で行きました。", "Fui de Tóquio até Kyoto de trem-bala.", ["から"]),
("昼休みは十二時から一時____です。", "O intervalo de almoço é do meio-dia à uma.", ["まで"]),
("このお祭りには、子供____お年寄りまで、たくさんの人が来ます。", "Neste festival vêm muitas pessoas, das crianças aos idosos.", ["から"]),
],
),
]

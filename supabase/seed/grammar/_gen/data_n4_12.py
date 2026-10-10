G = [
dict(
n=111,
jp="〜と言われている",
rd="to iwarete iru",
tr="Diz-se que / Acredita-se que / Fala-se que",
ex="""と言われている é usado para apresentar uma opinião geral, uma crença popular ou algo que muitas pessoas dizem. Equivale a "diz-se que", "acredita-se que" ou "fala-se que".

Ele vem de 言う (dizer) na forma passiva (言われる) + ている. A ideia é "isso é dito por muitas pessoas", sem indicar quem exatamente.

É muito usado em textos informativos, notícias, explicações sobre cultura, história, saúde e costumes.

Diferente de そうだ, que repassa uma informação de uma fonte específica, と言われている fala de algo amplamente aceito ou comentado pela sociedade.""",
st="""Frase (forma simples) + と言われている
Substantivo / Adjetivo な + だ + と言われている

Educado: と言われています
Escrita: と言われている / といわれている""",
no="""Em textos acadêmicos e jornalísticos, também aparecem formas como とされている e と考えられている, com sentido parecido.

Essa estrutura deixa a informação mais objetiva e evita que quem fala pareça estar dando sua opinião pessoal.

É comum em frases sobre lendas e histórias antigas, como a origem de templos e tradições.""",
bf="と言われている",
rx="と言われてい|といわれてい",
tk=["と", "言われて", "いる"],
va=["と言われている", "と言われています", "といわれている"],
E=[
("日本人は時間に厳しいと言われている。", "にほんじんはじかんにきびしいといわれている。", "Diz-se que os japoneses são rigorosos com o horário."),
("この寺は千年前に建てられたと言われています。", "このてらはせんねんまえにたてられたといわれています。", "Diz-se que este templo foi construído há mil anos."),
("緑茶は体にいいと言われています。", "りょくちゃはからだにいいといわれています。", "Acredita-se que o chá verde faz bem para o corpo."),
("この町は日本で一番雨が多いと言われている。", "このまちはにほんでいちばんあめがおおいといわれている。", "Diz-se que esta é a cidade onde mais chove no Japão."),
("朝ご飯を食べると、頭がよく働くと言われています。", "あさごはんをたべると、あたまがよくはたらくといわれています。", "Diz-se que tomar café da manhã faz o cérebro funcionar melhor."),
],
R=[
("富士山は日本一美しい山だ____。", "Diz-se que o Monte Fuji é a montanha mais bonita do Japão.", ["と言われています", "と言われている"]),
("よく笑うことは健康にいい____。", "Diz-se que rir bastante faz bem para a saúde.", ["と言われています", "と言われている"]),
("この池には大きな魚がいる____。", "Dizem que há um peixe enorme neste lago.", ["と言われています", "と言われている"]),
("猫は人ではなく家につく____。", "Diz-se que os gatos se apegam à casa, e não às pessoas.", ["と言われています", "と言われている"]),
("一日に八時間寝るのがいい____。", "Diz-se que o ideal é dormir oito horas por dia.", ["と言われています", "と言われている"]),
],
),
dict(
n=112,
jp="〜と聞いた",
rd="to kiita",
tr="Ouvi dizer que / Fiquei sabendo que",
ex="""と聞いた é usado para dizer que você ouviu uma informação de alguém. Equivale a "ouvi dizer que" ou "fiquei sabendo que".

Ele junta a citação (と) com o verbo 聞く (ouvir) no passado. O conteúdo ouvido vem antes de と, na forma simples.

Comparado a そうだ, と聞いた deixa mais claro que quem fala ouviu aquilo pessoalmente, de alguém. Por isso, é muito comum na conversa.

A forma と聞いている (ou と聞いています) indica uma informação que a pessoa recebeu e que continua considerando válida.

Na fala casual, と聞いた costuma virar って聞いた.""",
st="""Frase (forma simples) + と聞いた / と聞きました
Substantivo / Adjetivo な + だ + と聞いた
Frase + と聞いている (informação que se tem)
Frase + と聞いて、 + Frase (ao ouvir que...)

Fala casual: って聞いた""",
no="""Para mencionar de quem você ouviu, usa-se から ou に antes: 田中さんから聞いた.

と聞いて, na forma て, liga a informação ouvida a uma reação ou ação: "ao saber que..., fiz tal coisa".

Em situações formais, também se usa 伺いました, a forma humilde de 聞いた.""",
bf="と聞いた",
rx="と聞|ときい|って聞",
tk=["と", "聞いた"],
va=["と聞いた", "と聞きました", "と聞いている", "って聞いた"],
E=[
("田中さんが入院したと聞きました。", "たなかさんがにゅういんしたとききました。", "Ouvi dizer que o Tanaka foi internado."),
("明日は雨が降ると聞いた。", "あしたはあめがふるときいた。", "Ouvi dizer que vai chover amanhã."),
("この店のケーキはおいしいと聞いて、来てみました。", "このみせのケーキはおいしいときいて、きてみました。", "Ouvi dizer que o bolo desta loja é gostoso e vim experimentar."),
("彼女は来月日本へ帰ると聞いています。", "かのじょはらいげつにほんへかえるときいています。", "Fiquei sabendo que ela volta ao Japão no mês que vem."),
("試験が延期になったって聞いたよ。", "しけんがえんきになったってきいたよ。", "Ouvi dizer que a prova foi adiada."),
],
R=[
("山田さんが来月結婚する____。", "Ouvi dizer que o Yamada vai se casar no mês que vem.", ["と聞きました", "と聞いた"]),
("あの映画はおもしろい____ので、見に行きます。", "Ouvi dizer que aquele filme é bom, então vou assistir.", ["と聞いた"]),
("部長は今日休みだ____けど、本当？", "Ouvi dizer que o gerente está de folga hoje. É verdade?", ["と聞いた", "って聞いた"]),
("この辺に新しい駅ができる____います。", "Fiquei sabendo que vão construir uma estação nova por aqui.", ["と聞いて"]),
("先生が病気だ____、心配しています。", "Soube que o professor está doente e estou preocupado.", ["と聞いて"]),
],
),
dict(
n=113,
jp="〜と思う",
rd="to omou",
tr="Achar que / Pensar que / Acreditar que",
ex="""と思う é usado para expressar opinião, suposição ou impressão. Equivale a "achar que", "pensar que" ou "acreditar que".

A opinião vem antes de と, na forma simples. Com substantivos e adjetivos な, é preciso colocar だ antes de と.

と思います é uma forma muito usada pelos japoneses para suavizar afirmações. Em vez de dizer algo de forma categórica, a pessoa apresenta como uma opinião pessoal.

Para falar da opinião de outra pessoa, usa-se と思っている, que indica uma opinião que ela tem há algum tempo.

Na fala casual, と思う pode virar って思う.""",
st="""Verbo / Adjetivo い (forma simples) + と思う
Substantivo / Adjetivo な + だ + と思う

Educado: と思います
Opinião de outra pessoa: と思っている
Fala casual: って思う""",
no="""Para dizer "acho que não", o japonês costuma negar dentro da frase: 来ないと思う ("acho que não vem"), e não 来ると思わない.

と思う é uma ótima forma de soar educado ao dar opiniões, mesmo sobre coisas que você tem bastante certeza.

Com a forma volitiva, ようと思う expressa uma intenção, como "estou pensando em fazer...".""",
bf="と思う",
rx="と思|とおも|って思",
tk=["と", "思う"],
va=["と思う", "と思います", "と思っている", "って思う"],
E=[
("明日は雨が降ると思います。", "あしたはあめがふるとおもいます。", "Acho que vai chover amanhã."),
("この本はおもしろいと思う。", "このほんはおもしろいとおもう。", "Acho este livro interessante."),
("彼は来ないと思います。", "かれはこないとおもいます。", "Acho que ele não vem."),
("日本語は難しいけど、楽しいと思っています。", "にほんごはむずかしいけど、たのしいとおもっています。", "Japonês é difícil, mas acho divertido."),
("あの人は先生だと思う。", "あのひとはせんせいだとおもう。", "Acho que aquela pessoa é professora."),
],
R=[
("この計画はいい____。", "Acho que este plano é bom.", ["と思います", "と思う"]),
("田中さんはもう帰った____。", "Acho que o Tanaka já foi embora.", ["と思います", "と思う"]),
("明日は晴れる____。", "Acho que amanhã vai fazer sol.", ["と思います", "と思う"]),
("東京は便利な町だ____。", "Acho que Tóquio é uma cidade prática.", ["と思います", "と思う"]),
("彼はたぶん来ない____。", "Acho que ele provavelmente não vem.", ["と思います", "と思う"]),
],
),
dict(
n=114,
jp="〜とか〜とか",
rd="toka ~ toka",
tr="Coisas como... e... / Tipo... e...",
ex="""とか〜とか é usado para dar exemplos, deixando claro que existem outras possibilidades. Equivale a "coisas como... e..." ou "tipo... e...".

Ele é parecido com や〜など, mas é mais casual e muito comum na conversa.

Uma diferença importante: とか pode ligar não só substantivos, mas também verbos, adjetivos e frases inteiras. Por isso, é muito usado para dar exemplos de ações, como "ler livros, ver filmes e coisas assim".

Com 言う, a estrutura とか〜とか言う serve para citar desculpas ou comentários de alguém, muitas vezes com tom de crítica ou cansaço.""",
st="""Substantivo A + とか + Substantivo B + とか
Verbo A (forma simples) + とか + Verbo B + とか + する
Frase A + とか + Frase B + とか + 言う

Também com um só exemplo: Substantivo + とか""",
no="""Na fala dos jovens, とか às vezes é usado sozinho para suavizar a frase, como "tipo...". Esse uso é bem coloquial.

Em textos formais, prefira や〜など para substantivos e たり〜たりする para ações.

O último とか pode ser omitido, principalmente na fala rápida.""",
bf="とか",
rx="とか",
tk=["とか"],
va=["とか"],
E=[
("休みの日は、映画を見るとか、本を読むとかしています。", "やすみのひは、えいがをみるとか、ほんをよむとかしています。", "Nos dias de folga, faço coisas como ver filmes e ler livros."),
("りんごとかバナナとか、果物が好きです。", "りんごとかバナナとか、くだものがすきです。", "Gosto de frutas, tipo maçã e banana."),
("日本語の勉強には、アニメとか漫画とかが役に立つ。", "にほんごのべんきょうには、アニメとかまんがとかがやくにたつ。", "Para estudar japonês, coisas como anime e mangá ajudam."),
("疲れたときは、お風呂に入るとか、早く寝るとかしたほうがいい。", "つかれたときは、おふろにはいるとか、はやくねるとかしたほうがいい。", "Quando estiver cansado, é melhor fazer coisas como tomar banho de banheira ou dormir cedo."),
("彼は忙しいとか時間がないとか言って、いつも来ない。", "かれはいそがしいとかじかんがないとかいって、いつもこない。", "Ele sempre diz coisas como estar ocupado ou sem tempo e nunca vem."),
],
R=[
("週末はテニス____サッカーとかをします。", "No fim de semana, jogo tênis, futebol e coisas assim.", ["とか"]),
("寿司____天ぷらとか、日本料理が好きです。", "Gosto de comida japonesa, tipo sushi e tempurá.", ["とか"]),
("休みの日は掃除をする____、洗濯をするとかしています。", "Nos dias de folga, faço coisas como limpar a casa e lavar roupa.", ["とか"]),
("東京とか大阪____の大きい町は人が多い。", "Cidades grandes como Tóquio e Osaka têm muita gente.", ["とか"]),
("彼女は寒い____眠いとか、文句ばかり言う。", "Ela só reclama, dizendo coisas como que está com frio ou com sono.", ["とか"]),
],
),
dict(
n=115,
jp="〜るところ",
rd="ru tokoro",
tr="Estar prestes a / Ia (fazer) agora",
ex="""Quando ところ vem depois do verbo na forma de dicionário, ele indica que a ação está prestes a acontecer. Equivale a "estou prestes a..." ou "eu ia fazer isso agora".

ところ significa "ponto" ou "momento". Com a forma de dicionário, a ideia é "estou no ponto logo antes de fazer isso".

É muito comum com palavras como 今から, これから e ちょうど, que reforçam que a ação vai começar imediatamente.

No passado, るところだった indica que algo estava prestes a acontecer naquele momento. Em alguns contextos, também significa "quase aconteceu", como algo ruim que por pouco não ocorreu.""",
st="""Verbo na forma de dicionário + ところ + です / だ
今から / これから / ちょうど + Verbo + ところです
Passado: Verbo + ところだった""",
no="""Esta é a primeira parte do trio com ところ: るところ (prestes a fazer), ているところ (fazendo agora) e たところ (acabou de fazer).

A forma ところだった também aparece com sentido de "quase", como em 遅れるところだった (quase me atrasei).

É uma resposta comum quando alguém pergunta se você já fez algo, e você está prestes a fazer.""",
bf="ところ",
rx="ところ",
tk=["る", "ところ"],
va=["ところ", "ところです", "ところだった"],
E=[
("今から出かけるところです。", "いまからでかけるところです。", "Estou prestes a sair agora."),
("今、ちょうどご飯を食べるところだ。", "いま、ちょうどごはんをたべるところだ。", "Estou justamente prestes a comer agora."),
("これから会議が始まるところです。", "これからかいぎがはじまるところです。", "A reunião está prestes a começar."),
("「もう寝た？」「今から寝るところ。」", "「もうねた？」「いまからねるところ。」", "\"Já dormiu?\" \"Estou indo dormir agora.\""),
("そのとき、電車がちょうど駅に着くところだった。", "そのとき、でんしゃがちょうどえきにつくところだった。", "Naquele momento, o trem estava prestes a chegar à estação."),
],
R=[
("今から家を出る____です。", "Estou prestes a sair de casa agora.", ["ところ"]),
("これから映画が始まる____だから、静かにして。", "O filme está prestes a começar, então fique quieto.", ["ところ"]),
("ちょうど今、あなたに電話をかける____でした。", "Eu ia te ligar justamente agora.", ["ところ"]),
("「宿題、もうした？」「今からする____。」", "\"Já fez a lição?\" \"Vou fazer agora.\"", ["ところ"]),
("今、お風呂に入る____なので、後で電話します。", "Estou prestes a entrar no banho, então ligo depois.", ["ところ"]),
],
),
dict(
n=116,
jp="〜続ける",
rd="tsuzukeru",
tr="Continuar a / Continuar fazendo / Seguir",
ex="""続ける, ligado a outro verbo, indica que uma ação continua por um tempo, sem parar. Equivale a "continuar a" ou "continuar fazendo".

A estrutura junta o verbo na forma ます sem ます com 続ける. O resultado funciona como um verbo do grupo 2 e se conjuga normalmente: 続けます, 続けた, 続けている.

É usado para ações que duram e se repetem, como falar, andar, chover, trabalhar ou estudar.

É muito comum junto com expressões de tempo, como "três horas", "o dia inteiro" ou "dez anos", destacando a duração.

Sozinho, 続ける significa "continuar algo", como continuar os estudos. Já 続く é intransitivo: "algo continua".""",
st="""Verbo na forma ます sem ます + 続ける

Educado: 続けます
Passado: 続けた / 続けました
Em andamento: 続けている

Escrita: 続ける / つづける""",
no="""Com ações de um instante, como chegar ou acordar, 続ける normalmente não é usado, porque elas não podem "durar".

Para fenômenos naturais, como a chuva, tanto 降り続ける quanto 降り続く são usados. 降り続く soa mais natural em descrições do tempo.

続ける também aparece em frases de incentivo, como "o importante é continuar".""",
bf="続ける",
rx="続け|つづけ",
tk=["続ける"],
va=["続ける", "続けます", "続けた", "続けている"],
E=[
("彼は三時間も話し続けた。", "かれはさんじかんもはなしつづけた。", "Ele continuou falando por três horas inteiras."),
("雨が一日中降り続けています。", "あめがいちにちじゅうふりつづけています。", "A chuva continua caindo o dia inteiro."),
("日本語の勉強を続けることが大切です。", "にほんごのべんきょうをつづけることがたいせつです。", "O importante é continuar estudando japonês."),
("父は十年間この会社で働き続けている。", "ちちはじゅうねんかんこのかいしゃではたらきつづけている。", "Meu pai trabalha nesta empresa há dez anos sem parar."),
("赤ちゃんが朝まで泣き続けた。", "あかちゃんがあさまでなきつづけた。", "O bebê continuou chorando até de manhã."),
],
R=[
("彼女は二時間も歩き____。", "Ela continuou andando por duas horas inteiras.", ["続けました", "続けた"]),
("子供のころから、ピアノを習い____います。", "Continuo aprendendo piano desde criança.", ["続けて"]),
("昨日の夜は、ずっと雪が降り____。", "Ontem à noite, a neve continuou caindo sem parar.", ["続けた", "続けました"]),
("毎日、日記を書き____ことは難しい。", "Continuar escrevendo um diário todo dia é difícil.", ["続ける"]),
("彼は何も言わずに、走り____。", "Ele continuou correndo sem dizer nada.", ["続けた", "続けました"]),
],
),
dict(
n=117,
jp="〜って",
rd="tte",
tr="Dizem que / Chamado / Quanto a / Que",
ex="""って é uma partícula muito comum na fala casual. Ela substitui várias formas mais longas e tem alguns usos principais.

• Citar o que alguém disse: substitui と (de と言う) e também そうだ, como em "ele disse que não vem" ou "dizem que...".
• Dar nome: substitui という, como em "uma loja chamada Sakura".
• Apresentar um tema: substitui は, com um tom de "falando de..." ou "esse tal de...", como em "japonês é difícil, né?".
• Perguntar o significado de algo: como em "o que é ramen?".

Por ser informal, って é usado com amigos, família e em conversas do dia a dia. Em situações formais, usa-se a forma completa, como と, という ou は.""",
st="""Frase + って (dizem que / disse que)
Frase + って + 言う / 聞く (citação)
Nome + って + Substantivo (chamado...)
Substantivo + って + Comentário (tema)
〜って + 何ですか (o que é...?)""",
no="""No final da frase, って sozinho já indica que a informação foi ouvida de alguém: 来ないって = "disse que não vem".

Às vezes って aparece duplicado como ってば, para insistir ou mostrar impaciência, num uso mais avançado.

Em mensagens de texto e redes sociais, って é extremamente frequente.""",
bf="って",
rx="って",
tk=["って"],
va=["って"],
E=[
("田中さん、明日来ないって。", "たなかさん、あしたこないって。", "O Tanaka disse que não vem amanhã."),
("「さくら」って店、知ってる？", "「さくら」ってみせ、しってる？", "Você conhece uma loja chamada \"Sakura\"?"),
("日本語って難しいね。", "にほんごってむずかしいね。", "Japonês é difícil, né?"),
("先生が明日テストがあるって言ってたよ。", "せんせいがあしたテストがあるっていってたよ。", "O professor disse que amanhã tem prova."),
("すみません、「ラーメン」って何ですか。", "すみません、「ラーメン」ってなんですか。", "Com licença, o que é \"ramen\"?"),
],
R=[
("彼女、来月結婚する____。", "Ela disse que vai se casar no mês que vem.", ["って"]),
("「すき焼き」____何ですか。", "O que é \"sukiyaki\"?", ["って"]),
("母が早く帰ってきなさい____言ってた。", "Minha mãe disse para eu voltar logo.", ["って"]),
("東京____人が多いですね。", "Tóquio tem muita gente, né?", ["って"]),
("「ポチ」____名前の犬を飼っています。", "Tenho um cachorro chamado \"Pochi\".", ["って"]),
],
),
dict(
n=118,
jp="受身形（〜られる）",
rd="ukemikei",
tr="Ser (feito) / Voz passiva / Sofrer (uma ação)",
ex="""A forma passiva (受身形) é usada quando o foco está em quem recebe a ação, e não em quem a faz. Equivale a "ser + particípio" do português, como "ser elogiado".

A pessoa que faz a ação é marcada com に, e quem recebe a ação é o sujeito.

O japonês tem três usos principais da passiva:
• Passiva direta: alguém recebe a ação diretamente, como "fui elogiado pelo professor".
• Passiva de incômodo (迷惑の受身): a pessoa é afetada negativamente por algo que alguém fez, como "meu irmão comeu meu bolo" (e isso me incomodou). Também funciona com verbos sem objeto, como "fui pego pela chuva".
• Passiva neutra: para fatos objetivos, quando quem fez não importa, como "este templo foi construído há oitocentos anos".

A passiva de incômodo é muito característica do japonês e expressa o sentimento de quem foi prejudicado.""",
st="""Grupo 1: último som "u" → "a" + れる (書く → 書かれる / 言う → 言われる)
Grupo 2: tire る + られる (食べる → 食べられる)
Irregulares: する → される / 来る → 来られる (こられる)

Pessoa afetada + は / が + Quem fez + に + Verbo passivo
Pessoa + は + Quem fez + に + Objeto + を + Verbo passivo (incômodo)""",
no="""A passiva dos verbos do grupo 2 tem a mesma forma da potencial (食べられる). O contexto mostra qual é o sentido.

Em notícias e textos formais, a passiva neutra é muito comum, com expressões como 〜によって作られた.

Quando a ação é positiva, como receber ajuda, os japoneses preferem てもらう à passiva.""",
bf="られる",
rx="られ|かれ|がれ|され|たれ|まれ|われ|ばれ|なれ",
tk=["られる", "れる"],
va=["られる", "れる", "られた", "れた"],
E=[
("テストでいい点を取って、先生に褒められました。", "テストでいいてんをとって、せんせいにほめられました。", "Tirei uma nota boa na prova e fui elogiado pelo professor."),
("弟にケーキを食べられた。", "おとうとにケーキをたべられた。", "Meu irmão mais novo comeu o meu bolo."),
("電車の中で足を踏まれました。", "でんしゃのなかであしをふまれました。", "Pisaram no meu pé dentro do trem."),
("雨に降られて、服が濡れてしまった。", "あめにふられて、ふくがぬれてしまった。", "Fui pego pela chuva e minhas roupas ficaram molhadas."),
("この寺は八百年前に建てられました。", "このてらははっぴゃくねんまえにたてられました。", "Este templo foi construído há oitocentos anos."),
],
R=[
("子供のころ、よく母に叱____。", "Quando criança, eu levava muita bronca da minha mãe.", ["られました", "られた"]),
("駅で知らない人に名前を呼____。", "Na estação, uma pessoa desconhecida me chamou pelo nome.", ["ばれました", "ばれた"]),
("電車の中で財布を盗____。", "Roubaram minha carteira dentro do trem.", ["まれました", "まれた"]),
("このお祭りは毎年八月に行わ____。", "Este festival é realizado todo ano em agosto.", ["れます", "れる"]),
("友達に秘密を話____て、困った。", "Meu amigo contou o meu segredo, e fiquei numa situação difícil.", ["され"]),
],
),
dict(
n=119,
jp="〜は〜が、〜は〜",
rd="wa ~ ga, ~ wa ~",
tr="A é... mas B é... / Já (contraste)",
ex="""Essa estrutura usa は duas vezes para comparar ou contrastar duas coisas. Equivale a "A é..., mas B é..." ou "quanto a A..., já B...".

Além de marcar o tema, は tem uma função importante de contraste. Quando aparece com dois elementos diferentes na mesma frase, ele destaca que um é de um jeito e o outro é de outro.

As duas partes são ligadas por が ou けど, que significam "mas".

Esse uso de は é muito comum com coisas que se gosta e não se gosta, que se sabe e não se sabe, que acontece em um momento e não em outro.

Também aparece em frases negativas, quando se quer deixar claro que a negação vale só para aquele elemento.""",
st="""A + は + …が / けど、 + B + は + …
A + は + Afirmativo + が、 + B + は + Negativo""",
no="""Muitas vezes, a segunda parte fica subentendida. Dizer apenas 肉は好きです pode sugerir que outras coisas a pessoa não gosta tanto.

Com partículas como に, で e と, o は contrastivo forma には, では e とは.

Esse uso explica por que は aparece tanto em frases negativas: ele marca o contraste com outras possibilidades.""",
bf="は",
rx="は",
tk=["は", "が"],
va=["は"],
E=[
("肉は好きですが、魚は好きではありません。", "にくはすきですが、さかなはすきではありません。", "Carne eu gosto, mas peixe não."),
("兄は背が高いが、弟は低い。", "あにはせがたかいが、おとうとはひくい。", "Meu irmão mais velho é alto, mas o mais novo é baixo."),
("平日は忙しいですが、週末は暇です。", "へいじつはいそがしいですが、しゅうまつはひまです。", "Durante a semana estou ocupado, mas no fim de semana fico livre."),
("ひらがなは読めますが、漢字はまだ読めません。", "ひらがなはよめますが、かんじはまだよめません。", "Consigo ler hiragana, mas kanji ainda não."),
("東京は人が多いけど、私の町は少ない。", "とうきょうはひとがおおいけど、わたしのまちはすくない。", "Tóquio tem muita gente, mas a minha cidade tem pouca."),
],
R=[
("夏は暑いですが、冬____寒いです。", "O verão é quente, mas o inverno é frio.", ["は"]),
("英語は話せますが、日本語____話せません。", "Falo inglês, mas japonês não.", ["は"]),
("コーヒーは飲みますが、紅茶____飲みません。", "Café eu bebo, mas chá não.", ["は"]),
("姉は料理が上手だが、私____下手だ。", "Minha irmã cozinha bem, mas eu cozinho mal.", ["は"]),
("昼____暖かいけど、夜は寒い。", "De dia está quente, mas à noite faz frio.", ["は"]),
],
),
dict(
n=120,
jp="〜やすい",
rd="yasui",
tr="Fácil de / Tende a / Propenso a",
ex="""やすい é usado para dizer que algo é fácil de fazer. Equivale a "fácil de".

Ele é formado tirando ます do verbo e acrescentando やすい. O resultado funciona como um adjetivo い e se conjuga como tal: やすくない, やすかった, やすくて.

O uso principal é falar de facilidade, como uma caneta fácil de escrever ou uma explicação fácil de entender.

Outro uso importante é indicar tendência. Com verbos que descrevem algo que acontece sem querer, como pegar resfriado, quebrar ou escorregar, やすい significa "tender a" ou "ser propenso a".

O oposto de やすい é にくい, que significa "difícil de".""",
st="""Verbo na forma ます sem ます + やすい

Negativo: やすくない
Passado: やすかった
Ligando: やすくて
Mudança: やすくなる""",
no="""Não confunda com o adjetivo 安い (barato). Os dois têm a mesma pronúncia, mas este やすい vem sempre depois de um verbo.

No sentido de tendência, やすい costuma aparecer com coisas negativas, como doenças e acidentes.

A expressão わかりやすい (fácil de entender) é um dos elogios mais comuns para explicações e professores.""",
bf="やすい",
rx="やすい|やすく|やすかった",
tk=["やすい"],
va=["やすい", "やすくない", "やすかった", "やすくて"],
E=[
("このペンは書きやすいです。", "このペンはかきやすいです。", "Esta caneta é fácil de escrever."),
("先生の説明はわかりやすい。", "せんせいのせつめいはわかりやすい。", "A explicação do professor é fácil de entender."),
("この靴は軽くて歩きやすい。", "このくつはかるくてあるきやすい。", "Estes sapatos são leves e confortáveis para andar."),
("冬は風邪をひきやすいので、気をつけてください。", "ふゆはかぜをひきやすいので、きをつけてください。", "No inverno a gente pega resfriado com facilidade, então tome cuidado."),
("この町は住みやすくて、気に入っています。", "このまちはすみやすくて、きにいっています。", "Esta cidade é boa de morar e eu gosto muito dela."),
],
R=[
("この本は字が大きくて読み____です。", "Este livro tem letras grandes e é fácil de ler.", ["やすい"]),
("このアプリは使い____。", "Este aplicativo é fácil de usar.", ["やすい", "やすいです"]),
("ガラスは割れ____から、気をつけて。", "Vidro quebra fácil, então tome cuidado.", ["やすい"]),
("このかばんは軽くて持ち____。", "Esta bolsa é leve e fácil de carregar.", ["やすい", "やすいです"]),
("雨の日は道が滑り____なります。", "Em dias de chuva, as ruas ficam escorregadias.", ["やすく"]),
],
),
]

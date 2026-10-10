G = [
dict(
n=71,
jp="〜さ",
rd="sa",
tr="Grau de / Qualidade de (substantivação)",
ex="""さ é um sufixo que transforma adjetivos em substantivos. Ele indica o grau ou a medida de uma característica. Por exemplo, 高い (alto) vira 高さ (altura), e 重い (pesado) vira 重さ (peso).

Com adjetivos い, tira-se o い e acrescenta-se さ. Com adjetivos な, basta acrescentar さ, sem な.

O substantivo formado pode ser usado como qualquer outro, com partículas como は, が, を e に.

Ele é muito usado para falar de medidas, como altura, profundidade e tamanho, e também de qualidades abstratas, como gentileza, importância e beleza.""",
st="""Adjetivo い sem い + さ (高い → 高さ / 重い → 重さ)
Adjetivo な + さ (大切 → 大切さ / 静か → 静かさ)
Exceção: いい → よさ""",
no="""Existe também o sufixo み, que forma substantivos a partir de alguns adjetivos, como 甘み e 楽しみ. A diferença é que さ indica grau ou medida, enquanto み indica a sensação ou o aspecto percebido.

さ pode ser usado com quase todos os adjetivos, enquanto み é usado com poucos.

Para perguntar uma medida, é comum usar どのくらい, como em "qual é a altura?".""",
bf="さ",
rx="さが|さは|さを|さに|さで|さの|さです",
tk=["さ"],
va=["さ"],
E=[
("富士山の高さは三千七百七十六メートルです。", "ふじさんのたかさはさんぜんななひゃくななじゅうろくメートルです。", "A altura do Monte Fuji é de três mil setecentos e setenta e seis metros."),
("この箱の重さを測ってください。", "このはこのおもさをはかってください。", "Meça o peso desta caixa, por favor."),
("彼女の優しさに感動しました。", "かのじょのやさしさにかんどうしました。", "Fiquei emocionado com a gentileza dela."),
("健康の大切さは、病気になってわかる。", "けんこうのたいせつさは、びょうきになってわかる。", "A importância da saúde a gente só entende quando fica doente."),
("この部屋の広さはどのくらいですか。", "このへやのひろさはどのくらいですか。", "Qual é o tamanho deste quarto?"),
],
R=[
("この川の深____はどのくらいですか。", "Qual é a profundidade deste rio?", ["さ"]),
("日本の夏の暑____にはもう慣れました。", "Já me acostumei com o calor do verão japonês.", ["さ"]),
("母の料理のおいし____は忘れられない。", "Não consigo esquecer o sabor da comida da minha mãe.", ["さ"]),
("失敗して、友達の大切____がわかった。", "Depois de errar, entendi a importância dos amigos.", ["さ"]),
("このかばんの大き____がちょうどいい。", "O tamanho desta bolsa é perfeito.", ["さ"]),
],
),
dict(
n=72,
jp="さっき",
rd="sakki",
tr="Há pouco / Agora há pouco / Ainda agora",
ex="""さっき significa "há pouco" ou "agora há pouco". Ele indica algo que aconteceu pouco tempo atrás, normalmente no mesmo dia, de minutos a algumas horas antes.

Ele é usado como advérbio, antes do verbo, e pode ser combinado com partículas: さっきまで (até há pouco), さっきから (desde há pouco) e さっきの (de há pouco).

さっき é informal e muito comum na conversa. Em situações formais, usa-se 先ほど, que tem o mesmo sentido.

É diferente de 今 (agora) e de この前 (outro dia): さっき fala de um passado bem recente.""",
st="""さっき + Verbo no passado
さっき + まで (até há pouco)
さっき + から (desde há pouco, até agora)
さっき + の + Substantivo (o... de há pouco)

Formal: 先ほど""",
no="""さっきから com a forma ている indica algo que começou há pouco e continua até agora, muitas vezes com um tom de impaciência.

Em e-mails de trabalho e falas com clientes, troque さっき por 先ほど.

Para algo que acabou de acontecer, segundos atrás, o japonês também usa たった今.""",
bf="さっき",
rx="さっき",
tk=["さっき"],
va=["さっき"],
E=[
("さっき田中さんから電話がありました。", "さっきたなかさんからでんわがありました。", "Há pouco, o Tanaka ligou."),
("さっき食べたばかりなのに、もうお腹がすいた。", "さっきたべたばかりなのに、もうおなかがすいた。", "Acabei de comer agora há pouco e já estou com fome."),
("さっきの話の続きを聞かせてください。", "さっきのはなしのつづきをきかせてください。", "Me conte o resto daquela história de agora há pouco."),
("彼はさっきまでここにいました。", "かれはさっきまでここにいました。", "Ele estava aqui até agora há pouco."),
("さっきから雨が降っている。", "さっきからあめがふっている。", "Está chovendo desde agora há pouco."),
],
R=[
("____言ったことは忘れてください。", "Esqueça o que eu disse há pouco.", ["さっき"]),
("____までいい天気だったのに、急に雨が降ってきた。", "Até agora há pouco o tempo estava bom, mas de repente começou a chover.", ["さっき"]),
("____の人は誰ですか。", "Quem era aquela pessoa de agora há pouco?", ["さっき"]),
("「宿題、終わった？」「うん、____終わったよ。」", "\"Terminou a lição?\" \"Sim, terminei agora há pouco.\"", ["さっき"]),
("____から同じところを歩いている気がする。", "Tenho a impressão de que estamos andando pelo mesmo lugar há um tempinho.", ["さっき"]),
],
),
dict(
n=73,
jp="〜させられる（使役受身）",
rd="saserareru (shieki ukemi)",
tr="Ser obrigado a / Ser forçado a",
ex="""させられる é a forma causativa-passiva. Ela é usada para dizer que alguém foi obrigado a fazer algo que não queria. Equivale a "ser obrigado a" ou "ser forçado a".

Ela junta duas ideias: o causativo (fazer alguém fazer algo) e o passivo (sofrer a ação de alguém). O resultado é: "alguém me fez fazer isso", com o foco em quem foi obrigado.

A pessoa que obrigou é marcada com に, e quem foi obrigado costuma ser o sujeito, muitas vezes oculto. O tom costuma ser de incômodo, reclamação ou memória desagradável.

Nos verbos do grupo 1, existe uma forma curta muito usada: troca-se せられる por される, como em 待たされる e 飲まされる. Essa forma curta não é usada com verbos terminados em す.""",
st="""Grupo 1: último som "u" → "a" + せられる / される (待つ → 待たせられる / 待たされる)
Grupo 1 terminados em す: só せられる (話す → 話させられる)
Grupo 2: tire る + させられる (食べる → 食べさせられる)
Irregulares: する → させられる / 来る → 来させられる (こさせられる)

Pessoa que obriga + に + Verbo causativo-passivo""",
no="""A forma curta される é mais comum na fala. Por exemplo, 待たされる é muito mais frequente do que 待たせられる.

Essa forma aparece muito em reclamações sobre trabalho, escola e infância.

Às vezes, させられる também expressa um sentimento provocado sem querer, como em 考えさせられる (fazer refletir), com sentido positivo.""",
bf="させられる",
rx="させられ|せられ|かされ|がされ|たされ|まされ|らされ|わされ|ばされ",
tk=["させ", "られる"],
va=["させられる", "させられた", "される", "された"],
E=[
("子供のころ、母に野菜を食べさせられました。", "こどものころ、ははにやさいをたべさせられました。", "Quando criança, minha mãe me obrigava a comer verdura."),
("駅で一時間も待たされた。", "えきでいちじかんもまたされた。", "Me fizeram esperar uma hora inteira na estação."),
("飲み会で、部長にお酒を飲まされました。", "のみかいで、ぶちょうにおさけをのまされました。", "Na confraternização, o gerente me fez beber."),
("先生にみんなの前で歌を歌わされた。", "せんせいにみんなのまえでうたをうたわされた。", "O professor me fez cantar na frente de todo mundo."),
("毎日、遅くまで残業させられている。", "まいにち、おそくまでざんぎょうさせられている。", "Todo dia sou obrigado a fazer hora extra até tarde."),
],
R=[
("子供のころ、毎日ピアノを練習さ____。", "Quando criança, eu era obrigado a praticar piano todo dia.", ["せられました", "せられた"]),
("レストランで三十分も待____。", "No restaurante, me fizeram esperar trinta minutos inteiros.", ["たされました", "たされた"]),
("先輩に重い荷物を持____。", "O veterano me fez carregar uma bagagem pesada.", ["たされました", "たされた"]),
("授業で、作文をみんなの前で読ま____。", "Na aula, me fizeram ler a redação na frente de todos.", ["されました", "された"]),
("嫌いなのに、毎朝牛乳を飲____。", "Mesmo eu não gostando, me fazem tomar leite toda manhã.", ["まされます", "まされる", "まされました", "まされた"]),
],
),
dict(
n=74,
jp="〜させる（使役）",
rd="saseru (shieki)",
tr="Fazer (alguém) fazer / Deixar (alguém) fazer",
ex="""させる é a forma causativa. Ela tem dois sentidos principais, que dependem do contexto.

O primeiro é obrigar ou mandar alguém fazer algo: "fazer alguém fazer". Por exemplo, a mãe fez o filho limpar o quarto.

O segundo é permitir que alguém faça algo: "deixar alguém fazer". Por exemplo, deixar a criança fazer o que gosta. Esse sentido fica mais claro com てあげる, てくれる ou てもらう.

Também é usado para provocar sentimentos ou reações em alguém, como fazer as pessoas rirem ou deixar a família preocupada.

A pessoa que faz a ação é marcada com に quando o verbo tem objeto (を). Com verbos sem objeto, como ir ou correr, a pessoa pode ser marcada com を.""",
st="""Grupo 1: último som "u" → "a" + せる (書く → 書かせる / 待つ → 待たせる / 言う → 言わせる)
Grupo 2: tire る + させる (食べる → 食べさせる)
Irregulares: する → させる / 来る → 来させる (こさせる)

Pessoa + に + Objeto + を + Verbo causativo
Pessoa + を + Verbo intransitivo causativo""",
no="""O causativo não costuma ser usado com superiores como "obrigar". Para pedir algo a um superior, usa-se てもらう ou ていただく.

A forma させてください, muito comum, usa o causativo para pedir permissão: "me deixe fazer".

Em níveis seguintes, aparecem formas como させてもらう e させていただく, muito usadas em linguagem formal.""",
bf="させる",
rx="させる|させ|かせ|がせ|たせ|らせ|わせ|ばせ|ませる|ませた|ませて",
tk=["させる"],
va=["させる", "させます", "させた", "させました", "させて"],
E=[
("母は弟に部屋を掃除させました。", "はははおとうとにへやをそうじさせました。", "Minha mãe fez meu irmão mais novo limpar o quarto."),
("先生は学生に作文を書かせた。", "せんせいはがくせいにさくぶんをかかせた。", "O professor fez os alunos escreverem uma redação."),
("子供には好きなことをさせてあげたい。", "こどもにはすきなことをさせてあげたい。", "Quero deixar meus filhos fazerem o que gostam."),
("彼は冗談を言って、みんなを笑わせた。", "かれはじょうだんをいって、みんなをわらわせた。", "Ele contou uma piada e fez todo mundo rir."),
("帰りが遅くなって、家族を心配させてしまった。", "かえりがおそくなって、かぞくをしんぱいさせてしまった。", "Cheguei tarde e acabei deixando minha família preocupada."),
],
R=[
("父は私に車を運転さ____くれた。", "Meu pai me deixou dirigir o carro.", ["せて"]),
("コーチは選手を毎日走ら____。", "O treinador faz os atletas correrem todos os dias.", ["せます", "せる", "せました", "せた"]),
("母は子供に野菜を食べさ____。", "A mãe fez a criança comer verdura.", ["せました", "せた"]),
("彼はいつも面白い話で私を笑わ____。", "Ele sempre me faz rir com histórias engraçadas.", ["せる", "せます"]),
("社長は新人にお茶を入れさ____。", "O presidente mandou o funcionário novo preparar o chá.", ["せた", "せました"]),
],
),
dict(
n=75,
jp="〜させてください",
rd="sasete kudasai",
tr="Deixe-me (fazer) / Permita-me",
ex="""させてください é usado para pedir permissão para fazer algo. Equivale a "deixe-me fazer" ou "permita-me".

Ele junta a forma causativa (させる, "deixar fazer") com てください (pedido). A ideia literal é "por favor, me deixe fazer isso".

É usado quando quem fala quer fazer algo e pede a autorização de outra pessoa, como descansar, ir embora mais cedo, assumir uma tarefa ou dar uma opinião.

Também é uma forma educada e humilde de se oferecer para fazer algo, mostrando vontade e respeito.

Para soar mais suave, usa-se させてもらえませんか ou させていただけませんか.""",
st="""Verbo causativo na forma て + ください

Grupo 1: 休む → 休ませてください / 帰る → 帰らせてください
Grupo 2: 考える → 考えさせてください
する → させてください

Mais suave: 〜させてもらえませんか / 〜させていただけませんか""",
no="""ちょっと考えさせてください é uma forma educada e muito comum de dizer que você precisa pensar antes de responder.

Com superiores, させていただけませんか é a forma mais adequada para pedir permissão.

A diferença para てもいいですか é o tom: させてください soa mais como um pedido firme, mostrando que você realmente quer fazer aquilo.""",
bf="させてください",
rx="せてください|せてくださいませんか|せてもらえませんか|せてもらえますか",
tk=["させて", "ください"],
va=["させてください", "させてもらえませんか", "させていただけませんか"],
E=[
("すみません、少し休ませてください。", "すみません、すこしやすませてください。", "Com licença, me deixe descansar um pouco."),
("その仕事は私にやらせてください。", "そのしごとはわたしにやらせてください。", "Deixe esse trabalho comigo, por favor."),
("ちょっと考えさせてください。", "ちょっとかんがえさせてください。", "Me deixe pensar um pouco."),
("今日は早く帰らせてもらえませんか。", "きょうははやくかえらせてもらえませんか。", "Poderia me deixar ir embora mais cedo hoje?"),
("私にも一言言わせてください。", "わたしにもひとこといわせてください。", "Me deixe dizer uma palavra também."),
],
R=[
("頭が痛いので、早退さ____。", "Estou com dor de cabeça, então me deixe sair mais cedo.", ["せてください"]),
("その荷物、私に持た____。", "Deixe-me carregar essa bagagem.", ["せてください"]),
("一度、私に説明さ____。", "Deixe-me explicar uma vez.", ["せてください"]),
("この写真、コピーさ____か。", "Você poderia me deixar copiar esta foto?", ["せてもらえません"]),
("ぜひ、私にも手伝わ____。", "Por favor, deixe-me ajudar também.", ["せてください"]),
],
),
dict(
n=76,
jp="さすが",
rd="sasuga",
tr="Como esperado / Não é à toa / Realmente",
ex="""さすが é usado para expressar admiração quando alguém ou algo corresponde exatamente à reputação ou à expectativa. Equivale a "como esperado de...", "não é à toa" ou "realmente".

Ele é muito usado para elogiar: quando um profissional faz algo muito bem, quando alguém confirma sua fama, quando um produto é tão bom quanto dizem.

Com に, na forma さすがに, o sentido muda um pouco. Ele passa a indicar "até mesmo" ou "como era de se esperar", geralmente para algo que chegou ao limite, como "até eu fiquei cansado depois de tudo isso".

Sozinho, さすが! também funciona como exclamação de elogio, parecida com "mandou bem!".""",
st="""さすが + Substantivo + だ / です (como esperado de...)
さすが + だ / です / ね (exclamação de elogio)
さすがに + Adjetivo / Verbo (até mesmo / era de se esperar)

Escrita: さすが / 流石""",
no="""Com superiores, dizer apenas さすがですね pode soar como se você estivesse avaliando a pessoa. Em situações formais, é melhor elogiar de forma mais indireta.

さすがに aparece muito com negativas ou limites, como 疲れた e 無理だ.

O kanji 流石 é pouco usado no dia a dia; o mais comum é escrever em hiragana.""",
bf="さすが",
rx="さすが|流石",
tk=["さすが"],
va=["さすが", "さすがに", "流石"],
E=[
("さすがプロですね。とても上手です。", "さすがプロですね。とてもじょうずです。", "Não é à toa que é profissional. Muito bom."),
("一回で合格するなんて、さすがだね。", "いっかいでごうかくするなんて、さすがだね。", "Passar de primeira? Mandou bem!"),
("一日中歩いて、さすがに疲れました。", "いちにちじゅうあるいて、さすがにつかれました。", "Andei o dia inteiro, e até eu fiquei cansado."),
("このお茶、さすが静岡のお茶ですね。", "このおちゃ、さすがしずおかのおちゃですね。", "Este chá é realmente digno de Shizuoka."),
("三日も寝ていないので、さすがに眠い。", "みっかもねていないので、さすがにねむい。", "Fiquei três dias sem dormir, então é claro que estou com sono."),
],
R=[
("全部正解なんて、____田中さんだね。", "Acertar tudo? Como esperado do Tanaka.", ["さすが"]),
("____先生ですね。説明がとてもわかりやすい。", "Não é à toa que é professor. A explicação é muito clara.", ["さすが"]),
("十時間も歩いたので、____に足が痛い。", "Andei dez horas inteiras, então é claro que meus pés doem.", ["さすが"]),
("一人で全部作ったの？____だね。", "Você fez tudo sozinho? Mandou bem!", ["さすが"]),
("いつも元気な彼も、今日は____に疲れているようだ。", "Até ele, que está sempre animado, parece cansado hoje.", ["さすが"]),
],
),
dict(
n=77,
jp="〜し",
rd="shi",
tr="E também / Além disso / E (motivos)",
ex="""し é usado para listar razões ou características, mostrando que há mais de uma. Equivale a "e também" ou "além disso".

Quando aparece mais de uma vez, ele enumera vários motivos ou qualidades que, juntos, levam a uma conclusão. Por exemplo, "é barato, é gostoso, então venho sempre".

Quando aparece só uma vez, ele dá uma razão e deixa subentendido que existem outras. Isso torna a frase mais suave e natural.

É comum usar も junto, reforçando a ideia de acúmulo: "não tenho dinheiro, e também não tenho tempo".

し vem depois da forma simples de verbos e adjetivos. Com substantivos e adjetivos な, coloca-se だ antes de し.""",
st="""Verbo / Adjetivo い (forma simples) + し
Substantivo / Adjetivo な + だ + し
A + し + B + し + Conclusão
Substantivo + も + … + し""",
no="""Comparado a から, し é mais suave e deixa a explicação aberta, como se houvesse outros motivos além dos citados.

No final da frase, し sozinho pode funcionar como uma justificativa informal, deixando a conclusão subentendida.

Com a forma educada (です / ます) antes de し, a frase fica um pouco mais formal, mas a forma simples é a mais comum.""",
bf="し",
rx="し、|し。|しね",
tk=["し"],
va=["し"],
E=[
("この店は安いし、おいしいし、よく来ます。", "このみせはやすいし、おいしいし、よくきます。", "Esta loja é barata, é gostosa, então venho sempre."),
("雨も降っているし、今日は家にいよう。", "あめもふっているし、きょうはいえにいよう。", "Está chovendo, entre outras coisas, então vou ficar em casa hoje."),
("彼は頭もいいし、優しいし、人気がある。", "かれはあたまもいいし、やさしいし、にんきがある。", "Ele é inteligente, gentil e por isso é popular."),
("もう遅いし、帰りましょう。", "もうおそいし、かえりましょう。", "Já está tarde, vamos embora."),
("この部屋は駅から近いし、静かだし、気に入っています。", "このへやはえきからちかいし、しずかだし、きにいっています。", "Este apartamento é perto da estação, é silencioso, e eu gosto muito dele."),
],
R=[
("お金もない____、時間もないし、旅行は無理です。", "Não tenho dinheiro, nem tempo, então viajar é impossível.", ["し"]),
("熱もある____、今日は学校を休みます。", "Estou com febre, entre outras coisas, então vou faltar à escola hoje.", ["し"]),
("彼女はきれいだ____、料理も上手だ。", "Ela é bonita e, além disso, cozinha bem.", ["し"]),
("この町は便利だ____、人も親切です。", "Esta cidade é prática, e as pessoas também são gentis.", ["し"]),
("明日は休みだ____、映画でも見に行こうか。", "Amanhã é folga, então vamos ver um filme ou algo assim?", ["し"]),
],
),
dict(
n=78,
jp="そんなに",
rd="sonna ni",
tr="Tanto / Tão / Não tão",
ex="""そんなに significa "tanto" ou "tão". Ele indica um grau ou uma quantidade relacionada ao que foi dito ou ao que se vê na situação.

Em frases afirmativas, そんなに expressa surpresa ou preocupação com algo exagerado, como "por que você está tão bravo?" ou "se comer tanto, vai passar mal".

Em frases negativas, そんなに〜ない significa "não tão..." ou "não muito". É uma forma suave de dizer que algo não é tão grande, difícil ou caro quanto se poderia imaginar.

そんなに faz parte da família こんなに, そんなに, あんなに e どんなに, que seguem a lógica de distância de こ・そ・あ・ど.""",
st="""そんなに + Adjetivo / Verbo (tão / tanto)
そんなに + Adjetivo / Verbo negativo (não tão / não muito)

Família: こんなに / そんなに / あんなに / どんなに""",
no="""そんなに〜ない é parecido com あまり〜ない, mas compara com uma expectativa: "não é tão... quanto você pensa".

こんなに é usado para algo que está perto de quem fala ("tanto assim"), e あんなに para algo distante ou lembrado ("tanto daquele jeito").

そんなに também combina com なくてもいい para tranquilizar alguém, como "não precisa se apressar tanto".""",
bf="そんなに",
rx="そんなに",
tk=["そんなに"],
va=["そんなに"],
E=[
("そんなに急がなくてもいいですよ。", "そんなにいそがなくてもいいですよ。", "Não precisa ter tanta pressa."),
("この料理はそんなに辛くない。", "このりょうりはそんなにからくない。", "Esta comida não é tão apimentada."),
("そんなに食べたら、お腹をこわすよ。", "そんなにたべたら、おなかをこわすよ。", "Se comer tanto, vai passar mal da barriga."),
("試験はそんなに難しくなかった。", "しけんはそんなにむずかしくなかった。", "A prova não foi tão difícil."),
("どうしてそんなに怒っているの？", "どうしてそんなにおこっているの？", "Por que você está tão bravo?"),
],
R=[
("____心配しないでください。", "Não se preocupe tanto.", ["そんなに"]),
("この映画は____おもしろくなかった。", "Este filme não foi tão interessante.", ["そんなに"]),
("どうして____たくさん買ったの？", "Por que você comprou tanto?", ["そんなに"]),
("駅は____遠くないですよ。", "A estação não é tão longe.", ["そんなに"]),
("毎日____働いたら、病気になりますよ。", "Se trabalhar tanto todo dia, vai ficar doente.", ["そんなに"]),
],
),
dict(
n=79,
jp="それでも",
rd="soredemo",
tr="Mesmo assim / Ainda assim / Apesar disso",
ex="""それでも é uma conjunção que significa "mesmo assim" ou "ainda assim". Ela liga duas frases quando a segunda acontece apesar da primeira.

A primeira frase apresenta uma situação que normalmente impediria algo. Depois, それでも introduz o resultado que aconteceu mesmo com essa dificuldade.

Por exemplo, "falhei várias vezes. Mesmo assim, não desisti".

Ela costuma mostrar persistência, determinação ou surpresa. É diferente de でも e しかし, que apenas introduzem um contraste. それでも destaca que algo continuou apesar do obstáculo.""",
st="""Frase 1 (com ponto final) + それでも、 + Frase 2""",
no="""それでも também é usado sozinho em conversas, como uma reação: "mesmo assim (eu quero / eu vou)".

Na escrita mais formal, expressões como にもかかわらず têm sentido parecido, mas são usadas dentro da mesma frase.

Uma frase com それでも muitas vezes transmite emoção ou força de vontade, por isso é comum em histórias e discursos motivacionais.""",
bf="それでも",
rx="それでも",
tk=["それでも"],
va=["それでも"],
E=[
("何度も失敗した。それでも、彼は諦めなかった。", "なんどもしっぱいした。それでも、かれはあきらめなかった。", "Ele falhou várias vezes. Mesmo assim, não desistiu."),
("雨が強く降っていた。それでも、試合は続いた。", "あめがつよくふっていた。それでも、しあいはつづいた。", "Chovia forte. Ainda assim, a partida continuou."),
("値段は高い。それでも、買いたい。", "ねだんはたかい。それでも、かいたい。", "O preço é alto. Mesmo assim, quero comprar."),
("医者に止められた。それでも、父はタバコをやめない。", "いしゃにとめられた。それでも、ちちはタバコをやめない。", "O médico proibiu. Mesmo assim, meu pai não para de fumar."),
("みんなに反対されました。それでも、私は留学することにしました。", "みんなにはんたいされました。それでも、わたしはりゅうがくすることにしました。", "Todos foram contra. Mesmo assim, decidi fazer intercâmbio."),
],
R=[
("彼は熱があった。____、会社に行った。", "Ele estava com febre. Mesmo assim, foi à empresa.", ["それでも"]),
("この仕事は大変だ。____、私は好きだ。", "Este trabalho é pesado. Mesmo assim, eu gosto.", ["それでも"]),
("何度も説明した。____、彼はわからなかった。", "Expliquei várias vezes. Ainda assim, ele não entendeu.", ["それでも"]),
("道はとても混んでいた。____、時間に間に合った。", "O trânsito estava muito ruim. Mesmo assim, cheguei a tempo.", ["それでも"]),
("夜遅くまで勉強しました。____、試験に落ちてしまいました。", "Estudei até tarde da noite. Mesmo assim, fui reprovado.", ["それでも"]),
],
),
dict(
n=80,
jp="〜そうだ（伝聞）",
rd="sou da (denbun)",
tr="Dizem que / Ouvi dizer que",
ex="""Nesse uso, そうだ serve para repassar uma informação que a pessoa ouviu ou leu em algum lugar. Equivale a "dizem que" ou "ouvi dizer que".

Quem fala não está dando a própria opinião: está apenas transmitindo o que outra fonte disse, como a previsão do tempo, uma notícia ou um amigo.

É comum indicar a fonte no começo da frase, com によると ("segundo...") ou の話では ("pelo que... disse").

そうだ vem depois da forma simples completa. Com substantivos e adjetivos な, é preciso colocar だ antes: 静かだそうだ, 医者だそうだ.

Não confunda com そうだ de aparência (様態), que significa "parece que vai..." e se liga de outra forma ao verbo e ao adjetivo.""",
st="""Verbo (forma simples) + そうだ / そうです
Adjetivo い + そうだ
Adjetivo な + だ + そうだ
Substantivo + だ + そうだ

Fonte: 〜によると / 〜の話では""",
no="""A diferença entre as duas そうだ está na ligação: na de hearsay, usa-se a forma completa, como 降るそうだ (dizem que vai chover); na de aparência, usa-se a base do verbo, como 降りそうだ (parece que vai chover).

そうだ de hearsay não se conjuga no passado nem no negativo: o tempo e a negação ficam na parte antes de そうだ.

らしい também repassa informação, mas acrescenta um pouco de suposição de quem fala.""",
bf="そうだ",
rx="そうだ|そうです",
tk=["そう", "だ"],
va=["そうだ", "そうです"],
E=[
("天気予報によると、明日は雨が降るそうです。", "てんきよほうによると、あしたはあめがふるそうです。", "Segundo a previsão do tempo, dizem que vai chover amanhã."),
("田中さんは来月結婚するそうだ。", "たなかさんはらいげつけっこんするそうだ。", "Ouvi dizer que o Tanaka vai se casar no mês que vem."),
("あのレストランはとてもおいしいそうです。", "あのレストランはとてもおいしいそうです。", "Dizem que aquele restaurante é muito gostoso."),
("ニュースによると、昨日大きな地震があったそうだ。", "ニュースによると、きのうおおきなじしんがあったそうだ。", "Segundo o noticiário, ontem houve um grande terremoto."),
("彼の話では、その町はとても静かだそうです。", "かれのはなしでは、そのまちはとてもしずかだそうです。", "Pelo que ele disse, essa cidade é muito tranquila."),
],
R=[
("新聞によると、来年から電車の料金が上がる____。", "Segundo o jornal, a tarifa do trem vai subir a partir do ano que vem.", ["そうです", "そうだ"]),
("友達の話では、あの映画はおもしろい____。", "Pelo que meu amigo disse, aquele filme é interessante.", ["そうです", "そうだ"]),
("先生は来週休む____。", "Dizem que o professor vai faltar semana que vem.", ["そうです", "そうだ"]),
("山田さんのお父さんは医者だ____。", "Dizem que o pai do Yamada é médico.", ["そうです", "そうだ"]),
("友達によると、昨日のテストは難しかった____です。", "Segundo meu amigo, a prova de ontem foi difícil.", ["そう"]),
],
),
]

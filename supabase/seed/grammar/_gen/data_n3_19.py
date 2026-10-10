G = [
dict(
n=181,
jp="〜ずにはいられない",
rd="zu ni wa irarenai",
tr="Não conseguir deixar de / Não resistir a / Não ter como não",
ex="""ずにはいられない é usado para dizer que a pessoa não consegue se controlar e acaba fazendo algo, por causa de um sentimento forte. Equivale a "não conseguir deixar de", "não resistir a" ou "não ter como não".

A estrutura é uma dupla negação: "não consigo ficar sem fazer". O resultado é uma ação quase involuntária, provocada por emoção, impulso ou situação.

Por exemplo, "vendo esse filme, não consegui deixar de chorar" ou "quando vejo um gato fofo, não resisto a fazer carinho".

Ela é formada com ずに (sem fazer) + はいられない (não consegue ficar). O verbo する vira せずにはいられない.

A forma ないではいられない tem o mesmo sentido e é um pouco mais falada.""",
st="""Verbo na forma ない sem ない + ずにはいられない
する → せずにはいられない
Passado: ずにはいられなかった

Variação: ないではいられない""",
no="""O sujeito costuma ser quem fala. Para outras pessoas, acrescenta-se ようだ ou らしい.

É uma forma expressiva e um pouco literária, comum em relatos de emoções fortes.

Comparado a つい〜てしまう, ずにはいられない destaca que o impulso é forte demais para resistir.""",
bf="ずにはいられない",
rx="ずにはいられない|ないではいられない|ずにはいられなかった",
tk=["ず", "には", "いられない"],
va=["ずにはいられない", "ずにはいられなかった", "ないではいられない"],
E=[
("その映画を見て、泣かずにはいられなかった。", "そのえいがをみて、なかずにはいられなかった。", "Vendo esse filme, não consegui deixar de chorar."),
("彼の話を聞くと、笑わずにはいられない。", "かれのはなしをきくと、わらわずにはいられない。", "Quando ouço as histórias dele, não tenho como não rir."),
("かわいい猫を見ると、触らずにはいられない。", "かわいいねこをみると、さわらずにはいられない。", "Quando vejo um gato fofo, não resisto a fazer carinho."),
("困っている人を見ると、助けずにはいられない。", "こまっているひとをみると、たすけずにはいられない。", "Quando vejo alguém em dificuldade, não consigo deixar de ajudar."),
("おいしそうなケーキを見て、買わずにはいられなかった。", "おいしそうなケーキをみて、かわずにはいられなかった。", "Vi um bolo com cara de delicioso e não resisti a comprar."),
],
R=[
("彼の話があまりにおかしくて、笑わ____。", "A história dele era tão engraçada que não consegui deixar de rir.", ["ずにはいられない", "ずにはいられなかった"]),
("試験の結果が気になって、先生に聞か____。", "Fico tão curioso com o resultado da prova que não resisto a perguntar ao professor.", ["ずにはいられない"]),
("悲しい話を聞いて、泣か____。", "Ouvi uma história triste e não consegui deixar de chorar.", ["ずにはいられなかった"]),
("甘い物を見ると、食べ____。", "Quando vejo doce, não resisto a comer.", ["ずにはいられない"]),
("彼の失礼な態度に、一言言わ____。", "Diante da atitude mal-educada dele, não pude deixar de dizer algo.", ["ずにはいられなかった"]),
],
),
dict(
n=182,
jp="〜ずつ",
rd="zutsu",
tr="Cada / De... em... / Aos poucos",
ex="""ずつ é usado depois de quantidades para indicar distribuição igual ou repetição em partes iguais. Equivale a "cada", "de... em..." ou "aos poucos".

Ele tem dois usos principais. O primeiro é distribuir: cada pessoa recebe ou faz a mesma quantidade. Por exemplo, "peguem dois cada um" ou "dei três doces para cada criança".

O segundo é indicar progresso gradual, em partes iguais: "leio uma página por dia" ou, com 少し, "aos poucos": "a doença está melhorando aos poucos".

ずつ vem diretamente depois de números com contador e de palavras de quantidade, como 少し e 一つ.""",
st="""Número + Contador + ずつ + Verbo (cada / de... em...)
Pessoa + Número + ずつ (cada pessoa recebe...)
少しずつ + Verbo (aos poucos)""",
no="""少しずつ é uma das expressões mais usadas e combina muito com verbos de mudança, como なる, 増える e 慣れる.

一人ずつ significa "um de cada vez" ou "cada pessoa", dependendo do contexto.

Não confunda com づつ, que é uma grafia antiga e hoje considerada incorreta.""",
bf="ずつ",
rx="ずつ",
tk=["ずつ"],
va=["ずつ"],
E=[
("毎日少しずつ日本語を勉強している。", "まいにちすこしずつにほんごをべんきょうしている。", "Estudo japonês um pouco por dia."),
("この紙は一人二枚ずつ取ってください。", "このかみはひとりにまいずつとってください。", "Peguem duas folhas cada um, por favor."),
("子供たちにお菓子を三つずつあげた。", "こどもたちにおかしをみっつずつあげた。", "Dei três doces para cada criança."),
("この本は一日に一ページずつ読んでいる。", "このほんはいちにちにいちページずつよんでいる。", "Estou lendo este livro uma página por dia."),
("父の病気は少しずつよくなっている。", "ちちのびょうきはすこしずつよくなっている。", "A doença do meu pai está melhorando aos poucos."),
],
R=[
("パンフレットは一人一つ____持っていってください。", "Leve um folheto cada um, por favor.", ["ずつ"]),
("毎日十個____漢字を覚えます。", "Decoro dez kanji por dia.", ["ずつ"]),
("春になって、雪が少し____溶けてきた。", "Com a chegada da primavera, a neve foi derretendo aos poucos.", ["ずつ"]),
("二人____グループを作ってください。", "Formem grupos de duas pessoas cada.", ["ずつ"]),
("この薬は一回二錠____飲んでください。", "Tome dois comprimidos de cada vez.", ["ずつ"]),
],
),
dict(
n=183,
jp="〜させてもらう・〜させていただく",
rd="sasete morau / sasete itadaku",
tr="Receber permissão para / Permita-me / Com sua licença vou",
ex="""させてもらう e させていただく são usados para dizer que a pessoa faz algo com a permissão de outra, de forma humilde e educada. Equivalem a "receber permissão para", "permita-me" ou "com sua licença, vou...".

Elas juntam a forma causativa (させる, "deixar fazer") com もらう / いただく (receber). A ideia literal é "recebo de você o favor de me deixar fazer".

させていただく é a forma mais humilde e muito comum em situações formais, como discursos, reuniões, atendimento ao cliente e e-mails. Por exemplo, "então, vou fazer minha apresentação".

Em perguntas, させていただけませんか é uma forma muito educada de pedir permissão: "poderia me deixar pensar um pouco?".

Na fala do dia a dia, entre colegas, させてもらう é suficiente.""",
st="""Verbo causativo na forma て + もらう / いただく
Verbo causativo て + いただけませんか (pedido educado)
Verbo causativo て + いただきます (anúncio humilde)

Exemplos: 帰る → 帰らせていただく / 考える → 考えさせていただく / 発表する → 発表させていただく""",
no="""Em japonês de negócios, させていただく às vezes é usado em excesso, mesmo quando não há permissão de ninguém envolvida. Muitos japoneses consideram esse excesso artificial.

それでは、始めさせていただきます ("então, com sua licença, vou começar") é muito comum em eventos.

Para pedidos simples, させてください também funciona, mas é menos formal.""",
bf="させていただく",
rx="させてもら|させていただ|せてもら|せていただ",
tk=["させて", "もらう", "いただく"],
va=["させてもらう", "させていただく", "させていただけませんか", "させていただきます"],
E=[
("すみません、今日は早く帰らせてもらいます。", "すみません、きょうははやくかえらせてもらいます。", "Com licença, hoje vou embora mais cedo."),
("少し考えさせていただけませんか。", "すこしかんがえさせていただけませんか。", "O senhor poderia me deixar pensar um pouco?"),
("先週、先生の研究室を見学させていただきました。", "せんしゅう、せんせいのけんきゅうしつをけんがくさせていただきました。", "Semana passada, tive a oportunidade de visitar o laboratório do professor."),
("この写真を使わせてもらってもいいですか。", "このしゃしんをつかわせてもらってもいいですか。", "Posso usar esta foto?"),
("それでは、発表させていただきます。", "それでは、はっぴょうさせていただきます。", "Então, com sua licença, vou fazer minha apresentação."),
],
R=[
("体調が悪いので、明日は休ま____いただきたいのですが。", "Não estou bem, então gostaria de faltar amanhã, se possível.", ["せて"]),
("この資料をコピーさ____いただけますか。", "Poderia me permitir copiar este documento?", ["せて"]),
("先週、工場を見学さ____。", "Semana passada, tive a oportunidade de visitar a fábrica.", ["せていただきました", "せてもらいました"]),
("それでは、一言ご挨拶さ____。", "Então, com sua licença, vou dizer algumas palavras.", ["せていただきます"]),
("旅行中、友達の家に泊まら____。", "Durante a viagem, fiquei hospedado na casa de um amigo.", ["せてもらった", "せてもらいました"]),
],
),
dict(
n=184,
jp="〜ほかない",
rd="hoka nai",
tr="Não ter outra opção a não ser / Só resta / O jeito é",
ex="""ほかない é usado para dizer que não existe outra opção: aquela é a única coisa possível de fazer. Equivale a "não há outra opção a não ser", "só resta" ou "o jeito é".

ほか significa "outro", "além disso". A ideia literal é "não há outra coisa além disso".

O sentido é praticamente o mesmo de しかない, mas ほかない soa mais formal e escrito. É comum em textos, notícias e situações sérias.

A situação costuma ser difícil, e a pessoa aceita a única saída com resignação. Por exemplo, "o trem parou, então só resta voltar a pé".

As formas ほかはない e ほかありません também são usadas.""",
st="""Verbo na forma de dicionário + ほかない
Verbo + ほかはない
Verbo + ほかありません (educado)

Escrita: ほかない / 外ない""",
no="""Na conversa do dia a dia, しかない é mais comum. ほかない aparece mais em textos formais.

Uma forma ainda mais formal é よりほかない, que aparece no N2.

Assim como しかない, ほかない também pode expressar determinação: やるほかない (o jeito é encarar).""",
bf="ほかない",
rx="ほかない|ほかありません|ほかはない|外ない",
tk=["ほか", "ない"],
va=["ほかない", "ほかはない", "ほかありません"],
E=[
("電車が止まったので、歩いて帰るほかない。", "でんしゃがとまったので、あるいてかえるほかない。", "O trem parou, então só resta voltar a pé."),
("誰も手伝ってくれないので、一人でやるほかない。", "だれもてつだってくれないので、ひとりでやるほかない。", "Ninguém vai me ajudar, então o jeito é fazer sozinho."),
("会議で決まったことなので、従うほかありません。", "かいぎできまったことなので、したがうほかありません。", "Foi decidido na reunião, então não há outra opção a não ser seguir."),
("薬が効かないなら、手術するほかない。", "くすりがきかないなら、しゅじゅつするほかない。", "Se o remédio não funcionar, não há outra opção a não ser operar."),
("ここまで来たら、やるほかはない。", "ここまできたら、やるほかはない。", "Já que chegamos até aqui, só resta fazer."),
],
R=[
("最終バスが行ってしまったので、タクシーで行く____。", "O último ônibus já foi, então só resta ir de táxi.", ["ほかない", "ほかありません"]),
("雨がやまないから、ここで待つ____。", "A chuva não para, então o jeito é esperar aqui.", ["ほかない", "ほかありません"]),
("自分が悪いのだから、謝る____。", "A culpa é minha, então só resta pedir desculpas.", ["ほかない", "ほかありません"]),
("道がわからないので、人に聞く____。", "Não sei o caminho, então o jeito é perguntar a alguém.", ["ほかない", "ほかありません"]),
("会社の決定だから、受け入れる____。", "É uma decisão da empresa, então não há outra opção a não ser aceitar.", ["ほかない", "ほかありません"]),
],
),
dict(
n=185,
jp="〜たところ（結果）",
rd="ta tokoro (kekka)",
tr="Quando (fiz)... / Ao (fazer)... descobri que",
ex="""Nesse uso, たところ indica que a pessoa fez algo e, como resultado, descobriu ou percebeu alguma coisa. Equivale a "quando fiz..." ou "ao fazer..., descobri que...".

A primeira parte é uma ação feita de propósito, geralmente uma tentativa ou verificação, como perguntar, ligar, pesquisar ou experimentar. A segunda parte mostra o resultado, muitas vezes inesperado.

Por exemplo, "quando liguei para a loja, descobri que hoje estava fechada" ou "ao consultar o professor, recebi um ótimo conselho".

A segunda parte descreve um fato que já aconteceu, e não pode ser uma vontade ou um pedido.

Esse uso é diferente da たところ do N4, que significa "acabei de fazer".""",
st="""Verbo na forma た + ところ、 + Resultado / Descoberta

Com verbos cuja forma た termina em だ: だところ""",
no="""Esse uso é parecido com たら no sentido de descoberta, mas たところ soa mais formal e é comum em relatórios e narrativas.

A primeira ação costuma ser intencional, e a segunda, uma constatação.

Para distinguir das outras たところ, observe se a segunda parte é um resultado: se for, é este uso.""",
bf="たところ",
rx="たところ|だところ",
tk=["た", "ところ"],
va=["たところ", "だところ"],
E=[
("先生に相談したところ、いいアドバイスをもらえた。", "せんせいにそうだんしたところ、いいアドバイスをもらえた。", "Quando consultei o professor, recebi um ótimo conselho."),
("店に電話したところ、今日は休みだった。", "みせにでんわしたところ、きょうはやすみだった。", "Quando liguei para a loja, descobri que hoje estava fechada."),
("調べたところ、彼の話は本当だとわかった。", "しらべたところ、かれのはなしはほんとうだとわかった。", "Ao pesquisar, descobri que a história dele era verdadeira."),
("新しい薬を飲んだところ、すぐに治った。", "あたらしいくすりをのんだところ、すぐになおった。", "Quando tomei o remédio novo, melhorei logo."),
("頼んでみたところ、快く引き受けてくれた。", "たのんでみたところ、こころよくひきうけてくれた。", "Quando pedi, ele aceitou de bom grado."),
],
R=[
("駅員に聞い____、電車は遅れているそうだ。", "Quando perguntei ao funcionário da estação, soube que o trem está atrasado.", ["たところ"]),
("病院で検査し____、問題はなかった。", "Quando fiz os exames no hospital, não havia nenhum problema.", ["たところ"]),
("ドアを開け____、誰もいなかった。", "Quando abri a porta, não havia ninguém.", ["たところ"]),
("友達に勧められた本を読ん____、とてもおもしろかった。", "Quando li o livro que meu amigo recomendou, achei muito interessante.", ["だところ"]),
("値段を聞い____、思ったより安かった。", "Quando perguntei o preço, era mais barato do que eu pensava.", ["たところ"]),
],
),
dict(
n=186,
jp="〜ないわけにはいかない",
rd="nai wake ni wa ikanai",
tr="Não ter como não / Ser obrigado a / Ter que",
ex="""ないわけにはいかない é usado para dizer que, por razões sociais, morais ou de responsabilidade, a pessoa não pode deixar de fazer algo. Equivale a "não tenho como não", "sou obrigado a" ou "tenho que".

É uma dupla negação: "não fazer não é possível". O resultado é uma obrigação, muitas vezes contra a vontade da pessoa, mas aceita por senso de dever.

Por exemplo, "eu prometi, então não tenho como não ir" ou "o professor pediu, então tenho que ajudar".

A diferença em relação a なければならない é o motivo. なければならない é uma obrigação geral. ないわけにはいかない destaca que, considerando a situação e as pessoas envolvidas, não seria aceitável deixar de fazer.""",
st="""Verbo na forma ない + わけにはいかない
Verbo na forma ない + わけにはいきません (educado)

Variação: ないわけにもいかない""",
no="""É muito comum em situações sociais, como casamentos, funerais e compromissos de trabalho.

ないわけにもいかない, com も, mostra que a pessoa está num dilema: não quer fazer, mas também não pode deixar de fazer.

Compare com わけにはいかない (sem ない), que significa "não posso fazer".""",
bf="ないわけにはいかない",
rx="ないわけにはいかない|ないわけにはいきません|ないわけにもいかない",
tk=["ない", "わけ", "には", "いかない"],
va=["ないわけにはいかない", "ないわけにはいきません", "ないわけにもいかない"],
E=[
("約束したから、行かないわけにはいかない。", "やくそくしたから、いかないわけにはいかない。", "Eu prometi, então não tenho como não ir."),
("明日は試験だから、勉強しないわけにはいかない。", "あしたはしけんだから、べんきょうしないわけにはいかない。", "Amanhã tem prova, então não tenho como não estudar."),
("先生に頼まれたので、手伝わないわけにはいかない。", "せんせいにたのまれたので、てつだわないわけにはいかない。", "O professor me pediu, então tenho que ajudar."),
("社長が出席するので、私も出ないわけにはいきません。", "しゃちょうがしゅっせきするので、わたしもでないわけにはいきません。", "O presidente vai comparecer, então eu também sou obrigado a ir."),
("親友の結婚式なので、行かないわけにはいかない。", "しんゆうのけっこんしきなので、いかないわけにはいかない。", "É o casamento do meu melhor amigo, então não tenho como não ir."),
],
R=[
("大事な会議なので、出席し____。", "É uma reunião importante, então tenho que comparecer.", ["ないわけにはいかない", "ないわけにはいきません"]),
("親が心配しているので、連絡し____。", "Meus pais estão preocupados, então não tenho como não entrar em contato.", ["ないわけにはいかない", "ないわけにはいきません"]),
("迷惑をかけたので、謝ら____。", "Causei transtorno, então sou obrigado a pedir desculpas.", ["ないわけにはいかない", "ないわけにはいきません"]),
("お世話になった人なので、お礼を言わ____。", "É uma pessoa que me ajudou muito, então tenho que agradecer.", ["ないわけにはいかない", "ないわけにはいきません"]),
("雨でも仕事なので、行か____。", "Mesmo com chuva, é trabalho, então não tenho como não ir.", ["ないわけにはいかない", "ないわけにはいきません"]),
],
),
dict(
n=187,
jp="〜のではないか・〜のではないだろうか",
rd="no de wa nai ka / no de wa nai darou ka",
tr="Será que não...? / Acho que talvez / Não seria...?",
ex="""のではないか e のではないだろうか são usados para expressar uma suposição ou uma opinião de forma cautelosa. Equivalem a "será que não...?", "acho que talvez..." ou "não seria...?".

Embora tenham forma de pergunta negativa, o sentido é afirmativo: quem fala acredita que aquilo provavelmente é verdade, mas prefere não afirmar com certeza.

Elas são muito usadas para:
• Dar opiniões suavemente, principalmente em reuniões e textos: "este plano não seria um pouco difícil?".
• Expressar preocupação: "estou preocupado se vamos nos atrasar".
• Fazer suposições: "ele já não teria ido embora?".

のではないだろうか é mais formal e comum na escrita. のではないでしょうか é a versão educada para a conversa. Na fala casual, usa-se んじゃないか.""",
st="""Verbo / Adjetivo (forma simples) + のではないか
Adjetivo な / Substantivo + な + のではないか
… + のではないだろうか (formal, escrito)
… + のではないでしょうか (educado)
… + のではないかと思う / と心配だ

Fala casual: んじゃないか / んじゃない？""",
no="""Com substantivos e adjetivos な, não se esqueça do な: 無理なのではないか.

Em redações e artigos, のではないだろうか é uma das formas mais usadas para apresentar uma ideia sem impor.

Compare com ではないか (N4), que vem diretamente depois de substantivos, sem の.""",
bf="のではないか",
rx="のではないか|のではないだろうか|のではないでしょうか|んじゃないか|んじゃないだろうか",
tk=["の", "では", "ない", "か"],
va=["のではないか", "のではないだろうか", "のではないでしょうか", "んじゃないか"],
E=[
("電気が消えている。彼はもう帰ったのではないか。", "でんきがきえている。かれはもうかえったのではないか。", "As luzes estão apagadas. Será que ele já não foi embora?"),
("この計画は少し難しいのではないでしょうか。", "このけいかくはすこしむずかしいのではないでしょうか。", "Este plano não seria um pouco difícil?"),
("この雲を見ると、明日は雨が降るのではないだろうか。", "このくもをみると、あしたはあめがふるのではないだろうか。", "Vendo essas nuvens, acho que talvez chova amanhã."),
("彼女は何か悩んでいるんじゃないか。", "かのじょはなにかなやんでいるんじゃないか。", "Será que ela não está preocupada com alguma coisa?"),
("もっといい方法があるのではないかと思う。", "もっといいほうほうがあるのではないかとおもう。", "Acho que talvez exista um jeito melhor."),
],
R=[
("道が混んでいるから、遅れる____と心配だ。", "O trânsito está ruim, então estou preocupado se vamos nos atrasar.", ["のではないか"]),
("この値段は少し高い____。", "Este preço não seria um pouco alto?", ["のではないでしょうか", "のではないだろうか"]),
("彼はいつも笑っているが、本当は寂しい____と思う。", "Ele está sempre sorrindo, mas acho que talvez, no fundo, se sinta sozinho.", ["のではないか"]),
("いろいろ試したが、この方法が一番いい____。", "Tentei várias coisas, mas não seria este método o melhor?", ["のではないでしょうか", "のではないだろうか"]),
("電気がついているから、まだ誰かいる____。", "A luz está acesa, então será que ainda não tem alguém?", ["のではないか", "のではないだろうか"]),
],
),
dict(
n=188,
jp="〜とのことだ",
rd="to no koto da",
tr="Dizem que / Mandou dizer que / Segundo o recado",
ex="""とのことだ é usado para repassar uma informação ou um recado que se recebeu de outra pessoa, de forma formal e objetiva. Equivale a "dizem que", "mandou dizer que" ou "segundo o recado".

Ele é muito comum no trabalho, para transmitir mensagens: "o Tanaka ligou e disse que vai se atrasar um pouco" ou "o gerente mandou avisar que vai faltar hoje".

Também aparece com によると, para indicar a fonte da informação, como uma previsão do tempo ou um comunicado.

とのことだ é mais formal que そうだ e que ということだ. Por isso, é muito usado em e-mails, recados e relatos profissionais.

A forma とのことでした, no passado, é comum ao repassar um recado já recebido.""",
st="""Frase (forma simples) + とのことだ / とのことです
Pessoa + から、 + Frase + とのことでした (recado recebido)
Fonte + によると、 + Frase + とのことです""",
no="""Em recados por telefone no trabalho, とのことです é uma das formas mais naturais de transmitir a mensagem.

〜からよろしくとのことでした ("fulano mandou lembranças") é uma frase muito comum.

Na conversa casual, os japoneses preferem そうだ ou って.""",
bf="とのことだ",
rx="とのことだ|とのことです|とのこと",
tk=["との", "こと", "だ"],
va=["とのことだ", "とのことです", "とのことでした"],
E=[
("田中さんから電話があって、少し遅れるとのことです。", "たなかさんからでんわがあって、すこしおくれるとのことです。", "O Tanaka ligou e disse que vai se atrasar um pouco."),
("部長は今日、休むとのことだ。", "ぶちょうはきょう、やすむとのことだ。", "O gerente mandou avisar que vai faltar hoje."),
("天気予報によると、明日は晴れるとのことです。", "てんきよほうによると、あしたははれるとのことです。", "Segundo a previsão do tempo, amanhã vai fazer sol."),
("先生によると、試験は来週行われるとのことです。", "せんせいによると、しけんはらいしゅうおこなわれるとのことです。", "Segundo o professor, a prova será na semana que vem."),
("社長から、皆さんによろしくとのことでした。", "しゃちょうから、みなさんによろしくとのことでした。", "O presidente mandou lembranças a todos."),
],
R=[
("山田さんから連絡があり、会議に出られない____。", "O Yamada entrou em contato e disse que não poderá participar da reunião.", ["とのことです", "とのことだ"]),
("受付から、お客様は三時にいらっしゃる____。", "Segundo a recepção, o cliente virá às três.", ["とのことです", "とのことだ"]),
("母から、今日は早く帰ってきなさい____。", "Minha mãe mandou dizer para eu voltar cedo hoje.", ["とのことです", "とのことだ", "とのことでした"]),
("医者によると、一週間で治る____。", "Segundo o médico, vai sarar em uma semana.", ["とのことです", "とのことだ"]),
("課長から、明日は休みにする____。", "O chefe de seção mandou avisar que amanhã será folga.", ["とのことです", "とのことだ", "とのことでした"]),
],
),
dict(
n=189,
jp="〜ないうちに",
rd="nai uchi ni",
tr="Antes que / Enquanto ainda não",
ex="""ないうちに é usado para dizer que é bom fazer algo antes que uma situação mude, geralmente para pior. Equivale a "antes que" ou "enquanto ainda não...".

Ele junta a forma ない do verbo com うちに (enquanto). A ideia literal é "enquanto ainda não aconteceu". Por exemplo, "vamos voltar antes que escureça" ou "coma antes que esfrie".

A segunda parte costuma ser uma ação recomendada, um pedido ou uma intenção, para aproveitar o momento antes da mudança.

Outro uso importante é com verbos de percepção, como 知らない e 気がつかない, que significam "sem perceber": "quando vi, já tinha anoitecido sem eu perceber".""",
st="""Verbo na forma ない + うちに + Ação (antes que...)
知らない / 気がつかない + うちに + Mudança (sem perceber)""",
no="""Em comparação com 前に, ないうちに destaca mais a urgência e a ideia de aproveitar o momento.

冷めないうちに ("antes que esfrie") é uma frase muito comum ao servir comida.

知らないうちに é usado para mudanças que acontecem sem que a pessoa perceba, como o tempo passar.""",
bf="ないうちに",
rx="ないうちに",
tk=["ない", "うち", "に"],
va=["ないうちに"],
E=[
("暗くならないうちに、帰りましょう。", "くらくならないうちに、かえりましょう。", "Vamos voltar antes que escureça."),
("雨が降らないうちに、買い物に行こう。", "あめがふらないうちに、かいものにいこう。", "Vamos fazer compras antes que chova."),
("忘れないうちに、メモしておきます。", "わすれないうちに、メモしておきます。", "Vou anotar antes que eu esqueça."),
("冷めないうちに、どうぞ召し上がってください。", "さめないうちに、どうぞめしあがってください。", "Por favor, coma antes que esfrie."),
("知らないうちに、寝てしまっていた。", "しらないうちに、ねてしまっていた。", "Sem perceber, acabei pegando no sono."),
],
R=[
("料理が冷め____、食べてください。", "Coma antes que a comida esfrie, por favor.", ["ないうちに"]),
("先生に言われたことを忘れ____、宿題をしよう。", "Vou fazer a lição antes de esquecer o que o professor disse.", ["ないうちに"]),
("子供が起き____、掃除を終わらせたい。", "Quero terminar a limpeza antes que as crianças acordem.", ["ないうちに"]),
("本を読んでいたら、気がつか____、夜になっていた。", "Estava lendo e, sem perceber, já tinha anoitecido.", ["ないうちに"]),
("雨が降ら____、洗濯物を取り込んで。", "Recolha a roupa antes que chova.", ["ないうちに"]),
],
),
]

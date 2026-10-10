G = [
dict(
n=131,
jp="〜づらい",
rd="zurai",
tr="Difícil de / Desconfortável de / Custoso de",
ex="""づらい é usado para dizer que algo é difícil ou desconfortável de fazer. Equivale a "difícil de" ou "custoso de".

Ele é formado tirando ます do verbo e acrescentando づらい, que vem do adjetivo 辛い (penoso). O resultado funciona como um adjetivo い.

A diferença em relação a にくい é sutil. にくい indica uma dificuldade mais objetiva, ligada à característica da coisa. づらい destaca o desconforto ou o sofrimento de quem faz, físico ou emocional.

Por isso, づらい é muito usado em situações emocionais, como ser difícil recusar um pedido, ser difícil dizer a verdade ou pedir algo a alguém.""",
st="""Verbo na forma ます sem ます + づらい

Negativo: づらくない
Passado: づらかった
Ligando: づらくて
Mudança: づらくなる""",
no="""Para situações físicas, como ler letras pequenas, づらい e にくい muitas vezes podem ser trocados.

Para situações emocionais, como 言いづらい e 断りづらい, づらい soa mais natural.

づらい geralmente não é usado para coisas que acontecem sozinhas, como algo que "não quebra fácil". Nesse caso, usa-se にくい.""",
bf="づらい",
rx="づらい|づらく|づらかった",
tk=["づらい"],
va=["づらい", "づらくない", "づらかった", "づらくて"],
E=[
("この靴はきつくて歩きづらい。", "このくつはきつくてあるきづらい。", "Estes sapatos são apertados e desconfortáveis para andar."),
("先輩のお願いは、断りづらいです。", "せんぱいのおねがいは、ことわりづらいです。", "É difícil recusar um pedido do veterano."),
("字が小さくて読みづらい。", "じがちいさくてよみづらい。", "As letras são pequenas e difíceis de ler."),
("本当のことは言いづらかった。", "ほんとうのことはいいづらかった。", "Foi difícil dizer a verdade."),
("骨が多くて、この魚は食べづらい。", "ほねがおおくて、このさかなはたべづらい。", "Este peixe tem muita espinha e é difícil de comer."),
],
R=[
("彼女の前では、そのことは話し____。", "Na frente dela, é difícil falar sobre isso.", ["づらい", "づらいです"]),
("部長には相談し____です。", "É difícil pedir conselho ao gerente.", ["づらい"]),
("この部屋は暗くて、本が読み____。", "Este quarto é escuro, e é difícil ler.", ["づらい", "づらいです"]),
("喉が痛くて、薬が飲み込み____。", "Estou com dor de garganta e é difícil engolir o remédio.", ["づらい", "づらいです"]),
("一度断ると、もう一度頼み____なる。", "Depois de recusar uma vez, fica difícil pedir de novo.", ["づらく"]),
],
),
dict(
n=132,
jp="あげる・くれる・もらう",
rd="ageru / kureru / morau",
tr="Dar / Dar (para mim) / Receber",
ex="""あげる, くれる e もらう são os verbos de dar e receber. A escolha depende da direção da coisa e de quem está envolvido.

• あげる: dar algo para outra pessoa. A coisa sai de quem fala (ou do seu grupo) e vai para alguém de fora, ou vai de uma terceira pessoa para outra.
• くれる: dar algo para quem fala ou para alguém do seu grupo, como a família. A coisa vem de fora em direção a "mim".
• もらう: receber algo de alguém. O sujeito é quem recebe, e quem deu é marcado com に ou から.

O ponto mais importante é que, quando alguém dá algo para você, não se usa あげる: usa-se くれる. Isso mostra o ponto de vista de quem fala.

Esses mesmos verbos aparecem com a forma て (てあげる, てくれる, てもらう) para falar de favores.""",
st="""Quem dá + は / が + Quem recebe + に + Coisa + を + あげる
Quem dá + が + (私に) + Coisa + を + くれる
Quem recebe + は / が + Quem dá + に / から + Coisa + を + もらう

Formas respeitosas e humildes:
あげる → さしあげる (para superiores)
くれる → くださる (de superiores)
もらう → いただく (de superiores)""",
no="""Com pessoas da sua família, くれる também é usado quando alguém dá algo para um familiar seu, porque a família é vista como parte do seu grupo.

Para dar algo a animais e plantas, usa-se やる, que é mais informal.

Quando o presente vem de uma instituição, como uma empresa ou escola, もらう costuma usar から, e não に.""",
bf="あげる",
rx="あげ|くれ|もら",
tk=["あげる", "くれる", "もらう"],
va=["あげる", "くれる", "もらう", "さしあげる", "くださる", "いただく"],
E=[
("私は友達に誕生日プレゼントをあげました。", "わたしはともだちにたんじょうびプレゼントをあげました。", "Dei um presente de aniversário para meu amigo."),
("母が私に時計をくれました。", "ははがわたしにとけいをくれました。", "Minha mãe me deu um relógio."),
("私は先生から本をもらいました。", "わたしはせんせいからほんをもらいました。", "Ganhei um livro do professor."),
("弟は田中さんにお菓子をもらった。", "おとうとはたなかさんにおかしをもらった。", "Meu irmão mais novo ganhou doces do Tanaka."),
("友達が妹に花をくれた。", "ともだちがいもうとにはなをくれた。", "Meu amigo deu flores para a minha irmã mais nova."),
],
R=[
("私は妹にケーキを____。", "Dei um bolo para a minha irmã mais nova.", ["あげました", "あげた"]),
("誕生日に父が私にかばんを____。", "No meu aniversário, meu pai me deu uma bolsa.", ["くれました", "くれた"]),
("私は友達から手紙を____。", "Recebi uma carta de um amigo.", ["もらいました", "もらった"]),
("隣の人が私の家族に野菜を____。", "O vizinho deu verduras para a minha família.", ["くれました", "くれた"]),
("田中さんは山田さんに本を____。", "O Tanaka deu um livro para o Yamada.", ["あげました", "あげた"]),
],
),
dict(
n=133,
jp="〜てもらえませんか・〜てくれませんか",
rd="te moraemasen ka / te kuremasen ka",
tr="Poderia (fazer) para mim? / Você poderia...?",
ex="""てもらえませんか e てくれませんか são formas educadas de pedir que alguém faça algo para você. Equivalem a "poderia...?" ou "você poderia...?".

As duas usam a forma negativa com pergunta, o que deixa o pedido suave, porque dá ao outro a liberdade de recusar.

A diferença está no ponto de vista. てくれませんか foca em quem vai fazer o favor: "você não faria isso por mim?". てもらえませんか usa a forma potencial de もらう e foca em quem recebe: "eu não poderia receber de você esse favor?". Por isso, てもらえませんか costuma soar um pouco mais educado.

As versões ますか (てくれますか, てもらえますか) também são educadas, mas um pouco mais diretas.

Para superiores e situações muito formais, usa-se ていただけませんか.""",
st="""Verbo na forma て + くれませんか / くれますか
Verbo na forma て + もらえませんか / もらえますか

Do mais casual ao mais formal:
てくれる？ → てくれない？ → てくれませんか → てもらえませんか → ていただけませんか""",
no="""Entre amigos, a forma casual てくれない？ é muito comum e soa natural.

Com superiores, てくれませんか pode soar um pouco direto. Prefira ていただけませんか.

Para recusar um pedido assim, os japoneses costumam dizer すみません、ちょっと… e explicar o motivo.""",
bf="てもらえませんか",
rx="てもらえませんか|でもらえませんか|てくれませんか|でくれませんか|てもらえますか|てくれますか|でもらえますか|でくれますか",
tk=["て", "もらえません", "くれません", "か"],
va=["てもらえませんか", "てくれませんか", "てもらえますか", "てくれますか"],
E=[
("すみません、ちょっと手伝ってもらえませんか。", "すみません、ちょっとてつだってもらえませんか。", "Com licença, você poderia me ajudar um pouco?"),
("暑いので、窓を開けてくれませんか。", "あついので、まどをあけてくれませんか。", "Está quente, você poderia abrir a janela?"),
("この荷物を少し預かってもらえませんか。", "このにもつをすこしあずかってもらえませんか。", "Você poderia guardar esta bagagem um pouco para mim?"),
("もう少し静かにしてくれませんか。", "もうすこししずかにしてくれませんか。", "Você poderia fazer um pouco menos de barulho?"),
("駅まで車で送ってもらえますか。", "えきまでくるまでおくってもらえますか。", "Você poderia me levar de carro até a estação?"),
],
R=[
("すみません、ペンを貸し____。", "Com licença, você poderia me emprestar uma caneta?", ["てもらえませんか", "てくれませんか", "てもらえますか", "てくれますか"]),
("この字の読み方を教え____。", "Você poderia me ensinar como se lê esta letra?", ["てもらえませんか", "てくれませんか", "てもらえますか", "てくれますか"]),
("トイレに行くので、ちょっとここで待っ____。", "Vou ao banheiro, você poderia me esperar aqui um pouco?", ["てもらえませんか", "てくれませんか", "てもらえますか", "てくれますか"]),
("この手紙を読ん____。", "Você poderia ler esta carta para mim?", ["でもらえませんか", "でくれませんか", "でもらえますか", "でくれますか"]),
("明日、少し早く来____。", "Você poderia vir um pouco mais cedo amanhã?", ["てもらえませんか", "てくれませんか", "てもらえますか", "てくれますか"]),
],
),
dict(
n=134,
jp="お〜する・お〜いたす",
rd="o ~ suru / o ~ itasu",
tr="Fazer (humilde) / Permita-me (fazer)",
ex="""お〜する e お〜いたす são formas humildes (謙譲語) usadas para falar das próprias ações quando elas afetam ou beneficiam uma pessoa que merece respeito, como um cliente ou um superior.

No 謙譲語, quem fala se coloca em posição modesta, rebaixando a própria ação para mostrar respeito ao outro.

A estrutura coloca お antes do verbo na forma ます sem ます, e する ou いたす depois. Com verbos de origem chinesa do tipo "substantivo + する", usa-se ご: ご案内する, ご説明する.

いたす é mais humilde que する. Por isso, お〜いたします é a forma mais formal, muito usada no atendimento ao cliente e em e-mails de trabalho.

Essas formas só são usadas para ações de quem fala ou do seu grupo, e que envolvem a outra pessoa.""",
st="""お + Verbo na forma ます sem ます + する / します
お + Verbo na forma ます sem ます + いたす / いたします (mais humilde)
ご + Substantivo de ação + する / いたす

Exemplos: 持つ → お持ちします / 送る → お送りします / 案内する → ご案内します""",
no="""A frase お待ちしております ("estamos esperando pelo senhor") é muito comum em convites e lojas.

Essas formas não são usadas para ações que não envolvem a outra pessoa. Por exemplo, para "eu vou dormir", não faz sentido usar お寝します.

Alguns verbos têm formas humildes especiais, como 行く → 参る / 伺う e 言う → 申す.""",
bf="お〜する",
rx="お持ちし|お持ちいた|お送りし|お送りいた|お待ちし|お待ちいた|お知らせし|お知らせいた|お手伝いし|お手伝いいた|ご案内し|ご案内いた|ご説明し|ご説明いた|ご連絡し|ご連絡いた|お届けし|お届けいた|お手伝い",
tk=["お", "する", "いたす"],
va=["お〜する", "お〜します", "お〜いたします", "ご〜します"],
E=[
("重いでしょう。お荷物をお持ちします。", "おもいでしょう。おにもつをおもちします。", "Deve estar pesado. Eu carrego sua bagagem."),
("駅までお送りしましょうか。", "えきまでおおくりしましょうか。", "Quer que eu o leve até a estação?"),
("結果は後ほどお知らせいたします。", "けっかはのちほどおしらせいたします。", "Informaremos o resultado mais tarde."),
("会場までご案内します。", "かいじょうまでごあんないします。", "Vou guiá-lo até o local."),
("皆様のお越しをお待ちしております。", "みなさまのおこしをおまちしております。", "Aguardamos a visita de todos."),
],
R=[
("重そうですね。私が____。（持つ）", "Parece pesado. Eu carrego. (carregar)", ["お持ちします", "お持ちいたします"]),
("詳しいことは私から____。（説明する）", "Eu explico os detalhes. (explicar)", ["ご説明します", "ご説明いたします"]),
("後でこちらから____。（連絡する）", "Mais tarde, entraremos em contato. (contatar)", ["ご連絡します", "ご連絡いたします"]),
("明日、資料を____。（届ける）", "Amanhã, entregaremos os documentos. (entregar)", ["お届けします", "お届けいたします"]),
("何か____ことはありますか。（手伝う）", "Há algo em que eu possa ajudar? (ajudar)", ["お手伝いする", "お手伝いできる"]),
],
),
dict(
n=135,
jp="〜ていただく",
rd="te itadaku",
tr="Receber (o favor de) (humilde) / Ter a honra de",
ex="""ていただく é a forma humilde de てもらう. Ela é usada quando quem fala recebe uma ação de alguém que merece respeito, como um professor, um superior ou um cliente.

いただく é a forma humilde de もらう (receber). Assim, ていただく significa "recebi de alguém respeitado o favor de...".

A pessoa que fez a ação é marcada com に. Quem fala é quem recebe, e geralmente não aparece na frase.

É muito usada para agradecer e para relatar favores recebidos em situações formais, como no trabalho e na escola.

Na forma ていただいて、ありがとうございます, ela expressa um agradecimento muito educado.""",
st="""Pessoa respeitada + に + Verbo na forma て + いただく

Passado: ていただいた / ていただきました
Agradecimento: 〜ていただいて、ありがとうございます
Pedido: ていただけませんか""",
no="""Para traduzir, muitas vezes é mais natural inverter a frase: 先生に直していただいた vira "o professor corrigiu para mim".

Em textos de negócios, a forma させていただく (fazer com a permissão de alguém) aparece muito, às vezes até em excesso.

Com pessoas próximas, a forma comum てもらう é suficiente.""",
bf="ていただく",
rx="ていただ|でいただ",
tk=["て", "いただく"],
va=["ていただく", "ていただいた", "ていただきました", "ていただいて"],
E=[
("先生に作文を直していただきました。", "せんせいにさくぶんをなおしていただきました。", "O professor corrigiu minha redação."),
("部長に駅まで送っていただいた。", "ぶちょうにえきまでおくっていただいた。", "O gerente me levou até a estação."),
("田中先生に日本語を教えていただいています。", "たなかせんせいににほんごをおしえていただいています。", "O professor Tanaka está me ensinando japonês."),
("お客様に、アンケートに答えていただきました。", "おきゃくさまに、アンケートにこたえていただきました。", "Os clientes responderam ao questionário."),
("社長に褒めていただいて、うれしかったです。", "しゃちょうにほめていただいて、うれしかったです。", "Fiquei feliz por ter sido elogiado pelo presidente."),
],
R=[
("先生に推薦状を書い____。", "O professor escreveu uma carta de recomendação para mim.", ["ていただきました"]),
("課長に仕事を手伝っ____。", "O chefe de seção me ajudou no trabalho.", ["ていただきました"]),
("お忙しいところ、来____、ありがとうございます。", "Obrigado por ter vindo, mesmo estando tão ocupado.", ["ていただいて"]),
("先輩にいいレストランを教え____。", "O veterano me indicou um bom restaurante.", ["ていただきました"]),
("先生に私の作文を読ん____。", "O professor leu a minha redação.", ["でいただきました"]),
],
),
dict(
n=136,
jp="〜てくださる",
rd="te kudasaru",
tr="Fazer (algo) por mim (respeitoso)",
ex="""てくださる é a forma respeitosa de てくれる. Ela é usada quando alguém que merece respeito, como um professor ou um superior, faz algo em benefício de quem fala.

くださる é a forma respeitosa de くれる (dar para mim). Assim, てくださる significa "alguém respeitado fez o favor de... por mim".

Quem faz a ação é o sujeito, marcado com が. Quem fala é o beneficiário.

Na forma ます, ela é irregular: em vez de くださります, diz-se くださいます. No passado, くださいました.

A forma てくださって、ありがとうございます é uma maneira muito educada de agradecer.""",
st="""Pessoa respeitada + が + Verbo na forma て + くださる

Educado: てくださいます (forma irregular)
Passado: てくださった / てくださいました
Agradecimento: 〜てくださって、ありがとうございます""",
no="""A forma てください, usada para pedidos, vem justamente de くださる no imperativo.

Comparando: 先生が教えてくださった (foco em quem fez) e 先生に教えていただいた (foco em quem recebeu) têm praticamente o mesmo sentido.

Com colegas e amigos, a forma comum てくれる é suficiente.""",
bf="てくださる",
rx="てくださる|てくださった|てくださいました|てくださって|でくださる|でくださった|でくださいました|でくださって",
tk=["て", "くださる"],
va=["てくださる", "てくださいました", "てくださった", "てくださって"],
E=[
("雨の日に、先生が駅まで送ってくださいました。", "あめのひに、せんせいがえきまでおくってくださいました。", "Num dia de chuva, o professor me levou até a estação."),
("社長がお土産を買ってくださった。", "しゃちょうがおみやげをかってくださった。", "O presidente comprou uma lembrancinha para nós."),
("知らない方が道を教えてくださいました。", "しらないかたがみちをおしえてくださいました。", "Uma pessoa desconhecida me ensinou o caminho."),
("いつも親切にしてくださって、ありがとうございます。", "いつもしんせつにしてくださって、ありがとうございます。", "Obrigado por ser sempre tão gentil comigo."),
("部長が私の意見を聞いてくださった。", "ぶちょうがわたしのいけんをきいてくださった。", "O gerente ouviu a minha opinião."),
],
R=[
("先生が私の作文を直し____。", "O professor corrigiu a minha redação.", ["てくださいました", "てくださった"]),
("先輩が昼ご飯をごちそうし____。", "O veterano me pagou o almoço.", ["てくださいました", "てくださった"]),
("お忙しいのに、手伝っ____ありがとうございます。", "Obrigado por me ajudar, mesmo estando ocupado.", ["てくださって"]),
("部長が新しい仕事を任せ____。", "O gerente me confiou um novo trabalho.", ["てくださいました", "てくださった"]),
("社長が私の話を最後まで聞い____。", "O presidente ouviu o que eu tinha a dizer até o fim.", ["てくださいました", "てくださった"]),
],
),
dict(
n=137,
jp="おっしゃる・申す",
rd="ossharu / mousu",
tr="Dizer (respeitoso) / Dizer (humilde) / Chamar-se",
ex="""おっしゃる e 申す são formas especiais do verbo 言う (dizer).

おっしゃる é a forma respeitosa (尊敬語). Ela é usada quando alguém que merece respeito diz algo, como um professor, um cliente ou um superior. Também aparece na pergunta educada sobre o nome de alguém: お名前は何とおっしゃいますか.

申す é a forma humilde (謙譲語). Ela é usada para as próprias palavras, ou de alguém do seu grupo, ao falar com uma pessoa respeitada. O uso mais comum é na apresentação: 〜と申します (meu nome é...).

Na forma ます, おっしゃる é irregular: diz-se おっしゃいます, e não おっしゃります.""",
st="""Pessoa respeitada + が + おっしゃる (respeitoso)
お名前は何とおっしゃいますか (pergunta educada)
Eu / Meu grupo + が + 申す (humilde)
〜と申します (apresentação)

Formas: おっしゃいます / おっしゃった; 申します / 申しました / 申しております""",
no="""申し上げる é uma forma ainda mais humilde, usada para falar diretamente com alguém muito importante, como em お礼を申し上げます.

Na apresentação em situações formais, como entrevistas de emprego, 〜と申します é a forma padrão.

Também se usa 申す em expressões fixas, como 申し訳ありません.""",
bf="おっしゃる",
rx="おっしゃ|申し|申す",
tk=["おっしゃる", "申す"],
va=["おっしゃる", "おっしゃいます", "おっしゃった", "申す", "申します"],
E=[
("先生がそうおっしゃいました。", "せんせいがそうおっしゃいました。", "O professor disse isso."),
("失礼ですが、お名前は何とおっしゃいますか。", "しつれいですが、おなまえはなんとおっしゃいますか。", "Com licença, qual é o seu nome?"),
("はじめまして。私は田中と申します。", "はじめまして。わたしはたなかともうします。", "Muito prazer. Meu nome é Tanaka."),
("部長がおっしゃったとおりにします。", "ぶちょうがおっしゃったとおりにします。", "Vou fazer do jeito que o gerente disse."),
("父が先生によろしくと申しておりました。", "ちちがせんせいによろしくともうしておりました。", "Meu pai mandou lembranças ao professor."),
],
R=[
("はじめまして。ブラジルから来たマリアと____。", "Muito prazer. Meu nome é Maria e vim do Brasil.", ["申します"]),
("社長が明日休むと____。", "O presidente disse que vai faltar amanhã.", ["おっしゃいました", "おっしゃった"]),
("失礼ですが、お名前は何と____か。", "Com licença, qual é o seu nome?", ["おっしゃいます"]),
("先生が____ことを、よく覚えています。", "Lembro bem do que o professor disse.", ["おっしゃった"]),
("母がよろしくと____おりました。", "Minha mãe mandou lembranças.", ["申して"]),
],
),
dict(
n=138,
jp="伺う・参る",
rd="ukagau / mairu",
tr="Visitar / Perguntar / Ir / Vir (humilde)",
ex="""伺う e 参る são formas humildes (謙譲語) usadas para as próprias ações, quando se fala com alguém que merece respeito.

伺う tem dois sentidos principais. O primeiro é "visitar" ou "ir" à casa ou ao local de alguém respeitado. O segundo é "perguntar" ou "ouvir", como em "queria perguntar uma coisa" ou "ouvi a palestra do professor".

参る é a forma humilde de 行く (ir) e 来る (vir). Ela é muito usada no trabalho e em anúncios, como avisos em estações de trem. Também aparece na apresentação: 〜から参りました ("vim de...").

A diferença é que 伺う tem uma pessoa respeitada como destino ou fonte, enquanto 参る é mais geral e soa formal e educado.""",
st="""Lugar de alguém respeitado + に + 伺う (visitar)
Pessoa respeitada + に + 伺う (perguntar / ouvir)
Lugar + に / へ + 参る (ir / vir, humilde)

Formas: 伺います / 伺いました; 参ります / 参りました

Escrita: 伺う / うかがう, 参る / まいる""",
no="""Nas estações, o aviso 電車がまいります ("o trem está chegando") usa 参る de forma polida, mesmo sem uma pessoa humilde envolvida.

A expressão お話を伺う significa "ouvir o que alguém tem a dizer" de forma respeitosa.

Para o "ir / vir" de outras pessoas respeitadas, usa-se いらっしゃる, e nunca 参る.""",
bf="伺う",
rx="伺|うかが|参り|参る|まいり|まいる",
tk=["伺う", "参る"],
va=["伺う", "伺います", "参る", "参ります", "参りました"],
E=[
("明日、先生のお宅に伺います。", "あした、せんせいのおたくにうかがいます。", "Amanhã, vou visitar a casa do professor."),
("ちょっと伺いたいことがあるのですが。", "ちょっとうかがいたいことがあるのですが。", "Eu gostaria de perguntar uma coisa."),
("来週、御社に参ります。", "らいしゅう、おんしゃにまいります。", "Semana que vem, irei à sua empresa."),
("まもなく電車がまいります。ご注意ください。", "まもなくでんしゃがまいります。ごちゅういください。", "O trem está chegando. Tenham cuidado."),
("先生のお話を伺って、勉強になりました。", "せんせいのおはなしをうかがって、べんきょうになりました。", "Ouvir o que o professor disse foi muito instrutivo."),
],
R=[
("明日の午後、事務所に____。", "Amanhã à tarde, irei ao escritório.", ["伺います", "参ります"]),
("すみません、ちょっと____たいことがあります。", "Com licença, gostaria de perguntar uma coisa.", ["伺い"]),
("部長、すぐ____。", "Gerente, já estou indo.", ["参ります", "伺います"]),
("先生のお話を____、とても感動しました。", "Fiquei muito emocionado ao ouvir o que o professor disse.", ["伺って"]),
("はじめまして。ブラジルから____ました。", "Muito prazer. Vim do Brasil.", ["参り"]),
],
),
dict(
n=139,
jp="召し上がる",
rd="meshiagaru",
tr="Comer / Beber (respeitoso)",
ex="""召し上がる é a forma respeitosa (尊敬語) de 食べる (comer) e 飲む (beber). Ela é usada quando alguém que merece respeito come ou bebe, como um cliente, um professor ou um superior.

É muito comum em restaurantes, lojas e ao oferecer comida para alguém. A frase どうぞ召し上がってください significa "por favor, sirva-se".

Existe também a forma お召し上がりください, que é ainda mais polida e aparece muito em embalagens de alimentos e restaurantes.

Como é respeitosa, nunca é usada para falar de si mesmo. Para a própria ação de comer de forma humilde, usa-se いただく.""",
st="""Pessoa respeitada + が / は + Comida + を + 召し上がる

Educado: 召し上がります
Passado: 召し上がった / 召し上がりました
Convite: 召し上がってください / お召し上がりください

Escrita: 召し上がる / めしあがる""",
no="""O par respeitoso e humilde é: 召し上がる (o outro come) e いただく (eu como).

いただきます, dito antes das refeições, vem justamente da forma humilde de "receber" e "comer".

Na pergunta 何を召し上がりますか, um atendente pergunta educadamente o que o cliente vai comer ou beber.""",
bf="召し上がる",
rx="召し上が|めしあが",
tk=["召し上がる"],
va=["召し上がる", "召し上がります", "召し上がった", "召し上がってください"],
E=[
("先生は何を召し上がりますか。", "せんせいはなにをめしあがりますか。", "O que o professor vai comer?"),
("どうぞ、召し上がってください。", "どうぞ、めしあがってください。", "Por favor, sirva-se."),
("社長はもう昼ご飯を召し上がりました。", "しゃちょうはもうひるごはんをめしあがりました。", "O presidente já almoçou."),
("冷めないうちに、お召し上がりください。", "さめないうちに、おめしあがりください。", "Por favor, coma antes que esfrie."),
("お客様はコーヒーを召し上がりますか。", "おきゃくさまはコーヒーをめしあがりますか。", "O senhor vai querer café?"),
],
R=[
("温かいうちに、どうぞ____ください。", "Por favor, sirva-se enquanto está quente.", ["召し上がって"]),
("先生、お茶を____か。", "Professor, aceita um chá?", ["召し上がります"]),
("社長はケーキを二つも____。", "O presidente comeu dois pedaços inteiros de bolo.", ["召し上がりました"]),
("お客様、お飲み物は何を____か。", "Senhor, o que vai querer beber?", ["召し上がります"]),
("部長は昨日、お寿司を____そうです。", "Dizem que o gerente comeu sushi ontem.", ["召し上がった"]),
],
),
dict(
n=140,
jp="〜ことにしている",
rd="koto ni shite iru",
tr="Ter como regra / Ter o hábito de (por decisão)",
ex="""ことにしている é usado para falar de um hábito ou de uma regra pessoal que a própria pessoa decidiu seguir. Equivale a "tenho como regra" ou "tenho o costume de".

Ele vem de ことにする (decidir), na forma ている. A ideia é que a pessoa tomou uma decisão no passado e continua seguindo essa decisão até hoje.

Por exemplo, decidir acordar às seis todos os dias, não comer doces à noite ou passar os fins de semana com a família.

Com a forma ない, indica uma regra de não fazer algo: ないことにしている.

A diferença em relação a ようにしている é que ことにしている soa mais firme, como uma regra fixa. ようにしている indica um esforço para manter um hábito, mesmo que nem sempre dê certo.""",
st="""Verbo na forma de dicionário + ことにしている
Verbo na forma ない + ことにしている

Educado: ことにしています""",
no="""Compare: ことにする (decisão no momento), ことにしている (regra pessoal contínua) e ことになっている (regra externa, que aparece no N3).

É muito usado ao explicar rotinas e princípios pessoais em entrevistas ou conversas.

Para hábitos que não foram decididos conscientemente, basta usar ている ou いつも.""",
bf="ことにしている",
rx="ことにしている|ことにしています",
tk=["こと", "に", "している"],
va=["ことにしている", "ことにしています"],
E=[
("毎朝、六時に起きることにしています。", "まいあさ、ろくじにおきることにしています。", "Tenho como regra acordar às seis toda manhã."),
("夜は甘い物を食べないことにしている。", "よるはあまいものをたべないことにしている。", "Tenho como regra não comer doces à noite."),
("週末は家族と過ごすことにしています。", "しゅうまつはかぞくとすごすことにしています。", "Tenho o costume de passar os fins de semana com a família."),
("寝る前に日記を書くことにしている。", "ねるまえににっきをかくことにしている。", "Tenho o hábito de escrever um diário antes de dormir."),
("健康のために、エレベーターを使わないことにしています。", "けんこうのために、エレベーターをつかわないことにしています。", "Pela saúde, tenho como regra não usar o elevador."),
],
R=[
("毎日、日本語のニュースを聞く____。", "Tenho como regra ouvir notícias em japonês todos os dias.", ["ことにしています", "ことにしている"]),
("お酒は週末だけ飲む____。", "Tenho como regra beber só nos fins de semana.", ["ことにしています", "ことにしている"]),
("仕事のメールは夜は見ない____。", "Tenho como regra não olhar e-mails de trabalho à noite.", ["ことにしています", "ことにしている"]),
("月に一度、両親に電話する____。", "Tenho o costume de ligar para os meus pais uma vez por mês.", ["ことにしています", "ことにしている"]),
("一か月に一冊、本を読む____。", "Tenho como regra ler um livro por mês.", ["ことにしています", "ことにしている"]),
],
),
dict(
n=141,
jp="〜ようにしている",
rd="you ni shite iru",
tr="Procurar sempre / Esforçar-se para (manter um hábito)",
ex="""ようにしている é usado para falar de um hábito que a pessoa se esforça para manter. Equivale a "procuro sempre..." ou "me esforço para...".

Ele vem de ようにする (esforçar-se para que algo aconteça), na forma ている. A ideia é um esforço contínuo, que faz parte da rotina, mas que nem sempre é perfeito.

Por exemplo, procurar beber bastante água, procurar dormir cedo ou procurar não comer doces demais.

Comparado a ことにしている, ようにしている soa mais flexível. ことにしている é uma regra fixa; ようにしている é um esforço, uma tentativa constante.

É muito usado ao falar de saúde, estudos e boas práticas do dia a dia.""",
st="""Verbo na forma de dicionário + ようにしている
Verbo na forma ない + ようにしている

Educado: ようにしています""",
no="""Expressões como できるだけ e なるべく ("sempre que possível") combinam muito bem com ようにしている.

Para conselhos a outras pessoas, a forma ようにしてください é a mais natural.

ようにしている descreve o seu esforço; ようになった descreve uma mudança que já aconteceu.""",
bf="ようにしている",
rx="ようにしている|ようにしています",
tk=["よう", "に", "している"],
va=["ようにしている", "ようにしています"],
E=[
("毎日水をたくさん飲むようにしています。", "まいにちみずをたくさんのむようにしています。", "Procuro beber bastante água todos os dias."),
("できるだけ早く寝るようにしている。", "できるだけはやくねるようにしている。", "Procuro dormir o mais cedo possível."),
("甘い物を食べすぎないようにしています。", "あまいものをたべすぎないようにしています。", "Procuro não comer doces demais."),
("毎日少しでも日本語を話すようにしている。", "まいにちすこしでもにほんごをはなすようにしている。", "Procuro falar pelo menos um pouco de japonês todo dia."),
("人の話を最後まで聞くようにしています。", "ひとのはなしをさいごまできくようにしています。", "Procuro sempre ouvir as pessoas até o fim."),
],
R=[
("毎朝、野菜ジュースを飲む____。", "Procuro tomar suco de verduras toda manhã.", ["ようにしています", "ようにしている"]),
("駅まではなるべく歩く____。", "Procuro ir a pé até a estação sempre que possível.", ["ようにしています", "ようにしている"]),
("夜遅く食べない____。", "Procuro não comer tarde da noite.", ["ようにしています", "ようにしている"]),
("授業の前に予習する____。", "Procuro estudar a matéria antes da aula.", ["ようにしています", "ようにしている"]),
("会議では、必ず意見を言う____。", "Nas reuniões, faço questão de sempre dar minha opinião.", ["ようにしています", "ようにしている"]),
],
),
dict(
n=142,
jp="〜ように言う・〜ように頼む",
rd="you ni iu / you ni tanomu",
tr="Dizer para (fazer) / Pedir para (fazer)",
ex="""ように言う e ように頼む são usados para relatar ordens, conselhos ou pedidos feitos a alguém de forma indireta. Equivalem a "dizer para fazer" e "pedir para fazer".

O conteúdo do pedido vem antes de ように, com o verbo na forma de dicionário ou na forma ない. A pessoa que recebe o pedido é marcada com に.

Além de 言う e 頼む, a mesma estrutura funciona com verbos como 注意する (avisar, chamar a atenção), 伝える (transmitir) e お願いする (pedir educadamente).

Na forma passiva, ように言われる significa "me disseram para..." e é muito usada para contar o que alguém pediu ou mandou você fazer.

Essa estrutura é uma forma de citação indireta: ela transmite o sentido do pedido, sem repetir as palavras exatas.""",
st="""Pessoa + に + Verbo (dicionário / ない) + ように + 言う / 頼む / 注意する / 伝える
Pessoa + に + Verbo + ように + 言われる (passiva: me disseram para...)""",
no="""Para citar as palavras exatas, usa-se 「〜てください」と言う. Com ように, a citação fica indireta e mais natural na narração.

Com ない, a estrutura indica um aviso ou proibição: 遅れないように言われた (me disseram para não me atrasar).

伝えてください é muito útil para deixar recados, como pedir que avisem alguém.""",
bf="ように言う",
rx="ように言|ようにいい|ようにいう|ように頼|ようにたの|ように注意|ように伝え",
tk=["ように", "言う", "頼む"],
va=["ように言う", "ように頼む", "ように言われる", "ように注意する", "ように伝える"],
E=[
("先生は学生に静かにするように言いました。", "せんせいはがくせいにしずかにするようにいいました。", "O professor disse aos alunos para ficarem em silêncio."),
("母に早く寝るように言われた。", "ははにはやくねるようにいわれた。", "Minha mãe me disse para dormir cedo."),
("友達に引っ越しを手伝ってくれるように頼みました。", "ともだちにひっこしをてつだってくれるようにたのみました。", "Pedi a um amigo para me ajudar na mudança."),
("医者にお酒を飲まないように注意されました。", "いしゃにおさけをのまないようにちゅういされました。", "O médico me avisou para não beber álcool."),
("田中さんに後で電話するように伝えてください。", "たなかさんにあとででんわするようにつたえてください。", "Diga ao Tanaka para me ligar mais tarde, por favor."),
],
R=[
("部長は私に資料を準備する____。", "O gerente me disse para preparar os documentos.", ["ように言いました", "ように言った"]),
("母に部屋を片付ける____。", "Minha mãe me disse para arrumar o quarto.", ["ように言われました", "ように言われた"]),
("隣の人に音楽を小さくする____。", "Pedi ao vizinho para abaixar a música.", ["ように頼みました", "ように頼んだ"]),
("先生に遅刻しない____。", "O professor me avisou para não chegar atrasado.", ["ように注意されました", "ように注意された", "ように言われました", "ように言われた"]),
("山田さんに明日来る____ください。", "Diga ao Yamada para vir amanhã, por favor.", ["ように伝えて", "ように言って"]),
],
),
dict(
n=143,
jp="命令形",
rd="meireikei",
tr="Imperativo / Faça! (ordem direta)",
ex="""命令形 é a forma imperativa dos verbos. Ela expressa uma ordem direta e forte, como "faça!", "vá!", "pare!".

Por ser muito direta, essa forma soa rude em conversas comuns. Ela aparece em situações específicas: emergências, esportes e torcidas, ordens de superiores para subordinados em contextos rígidos, placas de trânsito, falas masculinas muito informais, citações e personagens de mangá e anime.

Um uso positivo e comum é na torcida, como 頑張れ! ("vamos lá!", "força!").

A formação depende do grupo do verbo. No grupo 1, o último som muda de "u" para "e". No grupo 2, troca-se る por ろ. Os irregulares ficam しろ (de する) e 来い (こい, de 来る).""",
st="""Grupo 1: último som "u" → "e" (行く → 行け / 待つ → 待て / 頑張る → 頑張れ)
Grupo 2: troque る por ろ (食べる → 食べろ / 起きる → 起きろ)
Irregulares: する → しろ (escrito: せよ) / 来る → 来い (こい)""",
no="""Para ordens mais suaves, usa-se なさい (pais e professores) ou てください (educado).

Em placas de trânsito, 止まれ ("pare") é um exemplo famoso de imperativo.

Mulheres e pessoas em situações educadas raramente usam o imperativo na fala do dia a dia, exceto em citações ou torcidas.""",
bf="命令形",
rx="ろ！|ろ。|け！|け。|れ！|れ。|め！|め。|げ！|げ。|せ！|せ。|べ！|べ。|て！|て。|い！|い。",
tk=["え", "ろ"],
va=["け", "れ", "め", "ろ", "しろ", "来い"],
E=[
("もう八時だぞ。早く起きろ！", "もうはちじだぞ。はやくおきろ！", "Já são oito horas! Levanta logo!"),
("あと少しだ。頑張れ！", "あとすこしだ。がんばれ！", "Falta pouco. Força!"),
("交差点の前に、止まれ。", "こうさてんのまえに、とまれ。", "Pare antes do cruzamento."),
("危ないから、ここへ来い！", "あぶないから、ここへこい！", "É perigoso, venha para cá!"),
("「火事だ！逃げろ！」と彼は叫んだ。", "「かじだ！にげろ！」とかれはさけんだ。", "\"É fogo! Corram!\", ele gritou."),
],
R=[
("遅れるぞ。もっと速く走____！", "Vamos nos atrasar! Corra mais rápido!", ["れ"]),
("うるさい。静かにし____！", "Que barulho! Fique quieto!", ["ろ"]),
("危ない！逃げ____！", "Perigo! Fuja!", ["ろ"]),
("時間がない。早く来____！", "Não temos tempo. Venha logo!", ["い"]),
("最後まで頑張____！", "Força até o fim!", ["れ"]),
],
),
dict(
n=144,
jp="疑問詞＋か",
rd="gimonshi + ka",
tr="Algo / Alguém / Algum lugar / Algum dia",
ex="""Quando uma palavra interrogativa recebe か, ela deixa de ser uma pergunta e passa a indicar algo indefinido. Equivale a "algo", "alguém", "algum lugar", "algum dia".

• 何か: alguma coisa, algo.
• 誰か: alguém.
• どこか: algum lugar.
• いつか: algum dia, alguma hora.
• どれか: algum (entre várias opções).

Essas formas aparecem em frases afirmativas, perguntas e convites. Por exemplo, "quer beber alguma coisa?" ou "algum dia quero morar no Japão".

As partículas が e を costumam ser omitidas depois dessas palavras. Outras partículas, como へ, に e で, ficam depois de か: どこかへ, 誰かに.""",
st="""何か / 誰か / どこか / いつか / どれか + Verbo
どこか + へ / に / で + Verbo
誰か + に / と + Verbo""",
no="""Compare: 何か (algo) e 何も〜ない (nada). Com か, a ideia é indefinida; com も e negativo, é negação total.

Em perguntas, 何か食べましたか significa "você comeu alguma coisa?", e a resposta pode ser はい ou いいえ, diferente de 何を食べましたか, que pede o que foi comido.

いつか costuma expressar um desejo ou plano vago para o futuro.""",
bf="何か",
rx="何か|誰か|どこか|いつか|どれか|なにか|だれか",
tk=["何", "か"],
va=["何か", "誰か", "どこか", "いつか", "どれか"],
E=[
("のどが渇きましたね。何か飲みませんか。", "のどがかわきましたね。なにかのみませんか。", "Que sede, né? Quer beber alguma coisa?"),
("私がいない間に、誰か来ましたか。", "わたしがいないあいだに、だれかきましたか。", "Veio alguém enquanto eu não estava?"),
("週末、どこかへ行きたいです。", "しゅうまつ、どこかへいきたいです。", "No fim de semana, quero ir a algum lugar."),
("いつか日本に住みたい。", "いつかにほんにすみたい。", "Algum dia, quero morar no Japão."),
("この中からどれか一つ選んでください。", "このなかからどれかひとつえらんでください。", "Escolha uma destas opções, por favor."),
],
R=[
("お腹がすいた。____食べたい。", "Estou com fome. Quero comer alguma coisa.", ["何か", "なにか"]),
("暑いですね。____窓を開けてくれませんか。", "Está quente, né? Alguém poderia abrir a janela?", ["誰か", "だれか"]),
("夏休みは____へ旅行に行きますか。", "Nas férias de verão, você vai viajar para algum lugar?", ["どこか"]),
("____また会いましょう。", "Vamos nos ver de novo algum dia.", ["いつか"]),
("赤と青と白の中から、____を選んでください。", "Escolha uma entre a vermelha, a azul e a branca.", ["どれか"]),
],
),
dict(
n=145,
jp="疑問詞＋も〜ない",
rd="gimonshi + mo ~ nai",
tr="Nada / Ninguém / Nenhum lugar / Nenhum",
ex="""Quando uma palavra interrogativa recebe も e o verbo fica na forma negativa, a frase expressa uma negação total. Equivale a "nada", "ninguém", "nenhum lugar" ou "nenhum".

• 何も〜ない: nada.
• 誰も〜ない: ninguém.
• どこにも / どこへも〜ない: nenhum lugar.
• どれも〜ない: nenhum (entre várias opções).

O verbo precisa estar sempre na forma negativa. Por exemplo, "não comi nada", "não tem ninguém", "não fui a lugar nenhum".

Com partículas como に, へ e と, elas ficam entre a palavra interrogativa e も: 誰にも, どこにも, 誰とも.

Isso é diferente de 疑問詞+か, que indica algo indefinido em frases afirmativas ("algo", "alguém").""",
st="""何も + Verbo negativo (nada)
誰も + Verbo negativo (ninguém)
どこにも / どこへも + Verbo negativo (nenhum lugar)
どれも + Adjetivo / Verbo negativo (nenhum)
誰にも / 誰とも + Verbo negativo""",
no="""いつも não segue esse padrão: いつも significa "sempre", e não "nunca". Para "nunca", usa-se 一度も〜ない ou 決して〜ない.

Em frases afirmativas, どれも e 誰も também podem significar "todos", como em どれもおいしい (todos são gostosos).

A resposta curta 何も significa "nada", e é muito comum em conversas.""",
bf="何も",
rx="何も|誰も|どこにも|どこへも|どこも|どれも|なにも|だれも|一度も|誰にも|誰とも|だれにも",
tk=["何", "も", "ない"],
va=["何も", "誰も", "どこにも", "どこへも", "どれも"],
E=[
("今日は忙しくて、何も食べていません。", "きょうはいそがしくて、なにもたべていません。", "Hoje estive ocupado e não comi nada."),
("教室には誰もいない。", "きょうしつにはだれもいない。", "Não tem ninguém na sala de aula."),
("週末はどこにも行きませんでした。", "しゅうまつはどこにもいきませんでした。", "No fim de semana, não fui a lugar nenhum."),
("この中のどれも好きじゃない。", "このなかのどれもすきじゃない。", "Não gosto de nenhum destes."),
("彼のことは誰にも言わないで。", "かれのことはだれにもいわないで。", "Não conte para ninguém sobre ele."),
],
R=[
("冷蔵庫に____ありません。", "Não tem nada na geladeira.", ["何も", "なにも"]),
("この部屋には____いません。", "Não tem ninguém neste quarto.", ["誰も", "だれも"]),
("昨日は____行かないで、家にいました。", "Ontem não fui a lugar nenhum e fiquei em casa.", ["どこにも", "どこへも"]),
("彼は____言わないで帰った。", "Ele foi embora sem dizer nada.", ["何も", "なにも"]),
("この店の料理は、____おいしくない。", "Nenhum prato deste restaurante é gostoso.", ["どれも"]),
],
),
]

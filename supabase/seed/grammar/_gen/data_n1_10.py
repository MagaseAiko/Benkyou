G = [
dict(
n=91,
jp="〜ないものか / 〜ないものだろうか",
rd="nai mono ka / nai mono darou ka",
tr="Será que não há como / Será que não dá para / Quem dera",
ex="""ないものか e ないものだろうか expressam um desejo forte de que algo aconteça, mesmo sendo difícil. Equivalem a "será que não há como...?" ou "quem dera...".

A pessoa procura uma forma de realizar algo que parece complicado. Por exemplo, "será que não há como resolver este problema?".

Costumam vir com a forma potencial do verbo, como できないものか ou 行けないものか.""",
st="""Verbo (forma potencial, forma ない) + ものか
Verbo (forma potencial, forma ない) + ものだろうか
Verbo (forma ない) + ものか""",
no="""É parecido com ないかなあ, mas ないものか é mais formal e expressa um desejo mais forte.

A forma ないものでしょうか é usada para fazer pedidos educados.""",
bf="ないものか",
rx="ないものか|ないものだろうか|ないものでしょうか|ないもんか",
tk=["ない", "もの", "か"],
va=["ないものか", "ないものだろうか", "ないものでしょうか"],
E=[
("この問題を何とか解決できないものか。", "このもんだいをなんとかかいけつできないものか。", "Será que não há como resolver este problema de algum jeito?"),
("もっと安く旅行できないものだろうか。", "もっとやすくりょこうできないものだろうか。", "Será que não dá para viajar mais barato?"),
("彼の病気が早く治らないものか。", "かれのびょうきがはやくなおらないものか。", "Quem dera a doença dele sarasse logo."),
("締め切りを少し延ばしていただけないものでしょうか。", "しめきりをすこしのばしていただけないものでしょうか。", "Será que não seria possível estender um pouco o prazo?"),
("毎日の通勤時間をもっと短くできないものか。", "まいにちのつうきんじかんをもっとみじかくできないものか。", "Será que não há como encurtar o tempo de deslocamento diário?"),
],
R=[
("何とかして彼女に会え____。", "Será que não há como eu encontrá-la de algum jeito?", ["ないものか", "ないものだろうか"]),
("この渋滞は何とかなら____。", "Será que este congestionamento não tem solução?", ["ないものか", "ないものだろうか"]),
("もう少し値段を下げられ____。", "Será que não dá para baixar um pouco o preço?", ["ないものか", "ないものだろうか", "ないものでしょうか"]),
("戦争のない世界は作れ____。", "Será que não é possível criar um mundo sem guerras?", ["ないものか", "ないものだろうか"]),
("早く春が来____。", "Quem dera a primavera chegasse logo.", ["ないものか", "ないものだろうか"]),
],
),
dict(
n=92,
jp="〜ないとも限らない",
rd="nai tomo kagiranai",
tr="Pode ser que / Não é impossível que / Nunca se sabe se",
ex="""ないとも限らない indica que existe uma pequena possibilidade de algo acontecer, geralmente algo ruim. Equivale a "pode ser que" ou "nunca se sabe se".

A pessoa usa essa expressão para justificar um cuidado ou uma precaução. Por exemplo, "pode ser que chova, então leve o guarda-chuva".

Muitas vezes a segunda parte é um conselho ou uma ação de prevenção.""",
st="""Verbo (forma ない) + とも限らない
Adjetivo い (forma くない) + とも限らない""",
no="""É parecido com かもしれない, mas ないとも限らない destaca uma possibilidade pequena e ruim.

A forma ないとは限らない tem um sentido parecido.""",
bf="ないとも限らない",
rx="ないとも限らない|ないともかぎらない|ないとも限りません",
tk=["ない", "とも", "限らない"],
va=["ないとも限らない", "ないともかぎらない", "ないとも限りません"],
E=[
("雨が降らないとも限らないから、傘を持っていこう。", "あめがふらないともかぎらないから、かさをもっていこう。", "Pode ser que chova, então vamos levar guarda-chuva."),
("事故が起きないとも限らないので、保険に入っておこう。", "じこがおきないともかぎらないので、ほけんにはいっておこう。", "Nunca se sabe se vai acontecer um acidente, então vamos fazer seguro."),
("誰かに聞かれないとも限らないから、小さい声で話して。", "だれかにきかれないともかぎらないから、ちいさいこえではなして。", "Pode ser que alguém ouça, então fale baixo."),
("彼が気を変えないとも限らない。", "かれがきをかえないともかぎらない。", "Não é impossível que ele mude de ideia."),
("地震が来ないとも限りませんから、準備しておきましょう。", "じしんがこないともかぎりませんから、じゅんびしておきましょう。", "Pode ser que venha um terremoto, então vamos nos preparar."),
],
R=[
("道が混ま____から、早めに出よう。", "Pode ser que a estrada esteja cheia, então vamos sair mais cedo.", ["ないとも限らない", "ないともかぎらない"]),
("パソコンが壊れ____ので、データを保存しておく。", "Nunca se sabe se o computador vai quebrar, então salvo os dados.", ["ないとも限らない", "ないともかぎらない"]),
("忘れ____から、メモしておこう。", "Pode ser que eu esqueça, então vou anotar.", ["ないとも限らない", "ないともかぎらない"]),
("泥棒が入ら____ので、鍵をかけてください。", "Pode ser que entre um ladrão, então tranque a porta.", ["ないとも限らない", "ないともかぎらない", "ないとも限りません"]),
("病気にかから____から、健康診断を受けよう。", "Nunca se sabe se vamos adoecer, então vamos fazer exames.", ["ないとも限らない", "ないともかぎらない"]),
],
),
dict(
n=93,
jp="〜なくしては",
rd="naku shite wa",
tr="Sem / Se não fosse / Na ausência de",
ex="""なくしては indica que, sem algo, uma coisa não seria possível. Equivale a "sem" ou "se não fosse".

A segunda parte é sempre negativa ou indica impossibilidade. Por exemplo, "sem o apoio de vocês, este sucesso não teria acontecido".

É uma expressão formal, muito usada em discursos e agradecimentos.""",
st="""Substantivo + なくしては + Frase negativa
Substantivo + なくして(は) + Verbo (forma potencial negativa)""",
no="""É parecido com なしには e がなければ.

A forma なくして sem は também aparece, como em 努力なくして成功なし.""",
bf="なくしては",
rx="なくしては|なくして",
tk=["なく", "して", "は"],
va=["なくしては", "なくして"],
E=[
("皆さんの協力なくしては、この計画は成功しなかった。", "みなさんのきょうりょくなくしては、このけいかくはせいこうしなかった。", "Sem a cooperação de todos, este plano não teria dado certo."),
("努力なくしては、夢は実現できない。", "どりょくなくしては、ゆめはじつげんできない。", "Sem esforço, não dá para realizar sonhos."),
("愛なくしては、人は生きられない。", "あいなくしては、ひとはいきられない。", "Sem amor, as pessoas não conseguem viver."),
("家族の支えなくしては、ここまで来られなかった。", "かぞくのささえなくしては、ここまでこられなかった。", "Se não fosse o apoio da família, eu não teria chegado até aqui."),
("信頼なくして、いい関係は作れない。", "しんらいなくして、いいかんけいはつくれない。", "Sem confiança, não dá para construir uma boa relação."),
],
R=[
("先生の指導____、合格はできなかった。", "Sem a orientação do professor, eu não teria passado.", ["なくしては", "なくして"]),
("健康____、仕事は続けられない。", "Sem saúde, não dá para continuar trabalhando.", ["なくしては", "なくして"]),
("ファンの応援____、優勝はありえなかった。", "Sem o apoio dos fãs, a vitória teria sido impossível.", ["なくしては", "なくして"]),
("この技術____、今の生活は考えられない。", "Sem esta tecnologia, é impossível imaginar a vida atual.", ["なくしては", "なくして"]),
("苦労____、本当の喜びは得られない。", "Sem dificuldades, não se alcança a verdadeira alegria.", ["なくしては", "なくして"]),
],
),
dict(
n=94,
jp="〜並み",
rd="nami",
tr="Ao nível de / Igual a / Comparável a",
ex="""並み indica que algo está no mesmo nível ou grau de outra coisa. Equivale a "ao nível de" ou "comparável a".

Por exemplo, "um calor de verão" ou "uma habilidade de profissional".

Também aparece com palavras de tempo, como 例年並み, que significa "igual aos anos anteriores".""",
st="""Substantivo + 並み
Substantivo + 並みの + Substantivo
Substantivo + 並みに + Verbo / Adjetivo""",
no="""Expressões comuns são プロ並み, 例年並み, 人並み, 世間並み e 平年並み.

A palavra 人並み significa "como a maioria das pessoas" ou "normal".""",
bf="並み",
rx="並み|なみ",
tk=["並み"],
va=["並み", "並みの", "並みに"],
E=[
("彼の料理の腕はプロ並みだ。", "かれのりょうりのうではプロなみだ。", "A habilidade dele na cozinha é de nível profissional."),
("今日は真夏並みの暑さだ。", "きょうはまなつなみのあつさだ。", "Hoje está um calor de pleno verão."),
("今年の桜は例年並みに咲いた。", "ことしのさくらはれいねんなみにさいた。", "As cerejeiras deste ano floresceram como nos anos anteriores."),
("人並みの生活ができれば十分だ。", "ひとなみのせいかつができればじゅうぶんだ。", "Basta poder levar uma vida normal como a de todos."),
("この子は大人並みに漢字が読める。", "このこはおとななみにかんじがよめる。", "Esta criança lê kanji como um adulto."),
],
R=[
("彼女の英語はネイティブ____だ。", "O inglês dela é de nível nativo.", ["並み"]),
("今年の冬は平年____の寒さだそうだ。", "Dizem que o frio deste inverno será igual ao de anos normais.", ["並み"]),
("彼はプロ____の技術を持っている。", "Ele tem uma técnica de nível profissional.", ["並み"]),
("人____に結婚して、子供がほしい。", "Quero me casar e ter filhos, como a maioria das pessoas.", ["並み"]),
("このホテルは一流ホテル____のサービスだ。", "Este hotel tem um atendimento comparável ao de hotéis de primeira linha.", ["並み"]),
],
),
dict(
n=95,
jp="なんという / なんと / なんて",
rd="nanto iu / nanto / nante",
tr="Que / Como / Mas que",
ex="""なんという, なんと e なんて são usadas para expressar emoção forte, como surpresa, admiração ou indignação. Equivalem a "que...!" ou "como...!".

なんという vem antes de substantivos, como "que dia lindo!". なんと vem antes de adjetivos ou frases, como "como é bonito!". なんて é a forma mais coloquial.

Muitas vezes a frase termina com だろう ou のだろう.""",
st="""なんという + Substantivo + だろう
なんと + Adjetivo + Substantivo + だろう
なんて + Adjetivo + んだろう""",
no="""なんと também pode ser usada para mostrar surpresa com um número ou fato, como "nada menos que...".

なんて no fim de uma expressão tem outro uso, de desprezo ou surpresa, como 勉強なんて.""",
bf="なんという",
rx="なんという|なんと|なんて|何という|何と",
tk=["なん", "という"],
va=["なんという", "なんと", "なんて"],
E=[
("なんという美しい景色だろう。", "なんといううつくしいけしきだろう。", "Que paisagem linda!"),
("なんとかわいい子供だろう。", "なんとかわいいこどもだろう。", "Que criança fofa!"),
("なんて素敵なプレゼントなんだろう。", "なんてすてきなプレゼントなんだろう。", "Que presente maravilhoso!"),
("なんということをしてくれたんだ。", "なんということをしてくれたんだ。", "Mas que coisa você fez!"),
("彼はなんと百歳まで生きた。", "かれはなんとひゃくさいまでいきた。", "Ele viveu até nada menos que cem anos."),
],
R=[
("____ひどい話だろう。", "Que história horrível!", ["なんという", "なんと", "なんて"]),
("____きれいな花なんだろう。", "Que flor bonita!", ["なんと", "なんて"]),
("____ことだ、財布をなくした。", "Mas que coisa, perdi a carteira.", ["なんという"]),
("彼女は____十か国語も話せる。", "Ela fala nada menos que dez línguas.", ["なんと"]),
("____優しい人なんだろう。", "Que pessoa gentil!", ["なんと", "なんて"]),
],
),
dict(
n=96,
jp="何しろ",
rd="nanishiro",
tr="Afinal / De qualquer forma / O fato é que",
ex="""何しろ serve para destacar o motivo principal de algo, de forma enfática. Equivale a "afinal" ou "o fato é que".

A pessoa explica uma situação apresentando o fator mais importante. Por exemplo, "estou exausto, afinal trabalhei doze horas".

Também pode significar "de qualquer forma", como em "de qualquer forma, vamos tentar".""",
st="""何しろ + Frase (motivo principal)
何しろ + Frase + から / ので""",
no="""É parecido com なにせ e とにかく.

Muitas vezes vem junto com から ou ので no fim da frase.""",
bf="何しろ",
rx="何しろ|なにしろ",
tk=["何", "しろ"],
va=["何しろ", "なにしろ"],
E=[
("疲れた。何しろ十二時間も働いたからね。", "つかれた。なにしろじゅうにじかんもはたらいたからね。", "Estou cansado. Afinal, trabalhei doze horas."),
("何しろ急いでいたので、財布を忘れてしまった。", "なにしろいそいでいたので、さいふをわすれてしまった。", "O fato é que eu estava com pressa, então esqueci a carteira."),
("何しろやってみよう。", "なにしろやってみよう。", "De qualquer forma, vamos tentar."),
("あの店はいつも混んでいる。何しろ安くておいしいから。", "あのみせはいつもこんでいる。なにしろやすくておいしいから。", "Aquela loja vive cheia. Afinal, é barata e gostosa."),
("何しろ初めてのことなので、わからないことばかりだ。", "なにしろはじめてのことなので、わからないことばかりだ。", "O fato é que é a primeira vez, então não entendo quase nada."),
],
R=[
("____暑くて、何もする気にならない。", "O fato é que está tão quente que não tenho vontade de fazer nada.", ["何しろ", "なにしろ"]),
("彼は人気者だ。____話が面白いからね。", "Ele é popular. Afinal, conversa de um jeito divertido.", ["何しろ", "なにしろ"]),
("____時間がないので、急いでください。", "O fato é que não há tempo, então se apresse.", ["何しろ", "なにしろ"]),
("____一度会ってみてください。", "De qualquer forma, encontre-o uma vez.", ["何しろ", "なにしろ"]),
("この仕事は大変だ。____一人でやらなければならない。", "Este trabalho é pesado. Afinal, tenho que fazer sozinho.", ["何しろ", "なにしろ"]),
],
),
dict(
n=97,
jp="〜ならでは",
rd="nara dewa",
tr="Típico de / Só mesmo / Exclusivo de",
ex="""ならでは indica que algo só é possível ou só existe por causa de uma pessoa, lugar ou situação específica. Equivale a "típico de" ou "só mesmo".

É usado para elogiar algo único e especial. Por exemplo, "um sabor que só mesmo esta loja tem" ou "uma experiência típica do Japão".

A forma mais comum é ならではの, antes de substantivos.""",
st="""Substantivo + ならではの + Substantivo
Substantivo + ならでは + だ""",
no="""É usado principalmente com elogios.

Também aparece como ならではの味, ならではの経験 e ならではの魅力.""",
bf="ならでは",
rx="ならでは",
tk=["なら", "では"],
va=["ならでは", "ならではの"],
E=[
("これは京都ならではの景色だ。", "これはきょうとならではのけしきだ。", "Esta é uma paisagem típica de Kyoto."),
("この店ならではの味を楽しんでください。", "このみせならではのあじをたのしんでください。", "Aproveite o sabor que só mesmo esta loja tem."),
("子供ならではの自由な発想だ。", "こどもならではのじゆうなはっそうだ。", "É uma imaginação livre típica de criança."),
("手作りならではの温かさがある。", "てづくりならではのあたたかさがある。", "Tem o calor que só o feito à mão tem."),
("これは日本ならではの文化だ。", "これはにほんならではのぶんかだ。", "Esta é uma cultura exclusiva do Japão."),
],
R=[
("地元の人____の情報を教えてもらった。", "Recebi informações que só mesmo os moradores conhecem.", ["ならでは"]),
("この料理は、プロ____の技術が光る。", "Este prato mostra uma técnica que só mesmo um profissional tem.", ["ならでは"]),
("北海道____の新鮮な海の幸を味わった。", "Provei frutos do mar frescos típicos de Hokkaido.", ["ならでは"]),
("旅行____の楽しみがある。", "Há prazeres que só as viagens trazem.", ["ならでは"]),
("あの先生____の分かりやすい説明だった。", "Foi uma explicação clara que só mesmo aquele professor sabe dar.", ["ならでは"]),
],
),
dict(
n=98,
jp="〜ならいざしらず / 〜はいざしらず",
rd="nara iza shirazu / wa iza shirazu",
tr="Se fosse... até entenderia / Não sei quanto a / Seria outra história se",
ex="""ならいざしらず indica que um caso seria compreensível, mas o caso atual não é. Equivale a "se fosse..., até entenderia, mas" ou "seria outra história se...".

A primeira parte mostra uma situação em que algo seria aceitável, e a segunda mostra que, na realidade, aquilo não é aceitável. Por exemplo, "se fosse uma criança, até entenderia, mas um adulto fazer isso...".

É uma expressão formal, com tom de crítica.""",
st="""Substantivo + ならいざしらず
Substantivo + はいざしらず
Verbo (forma simples) + なら + いざしらず""",
no="""É parecido com ならともかく e ならまだしも.

いざしらず significa literalmente "não sei", por isso o sentido é "não sei quanto a isso, mas...".""",
bf="ならいざしらず",
rx="ならいざしらず|はいざしらず|ならいざ知らず|はいざ知らず",
tk=["なら", "いざ", "しらず"],
va=["ならいざしらず", "はいざしらず", "ならいざ知らず"],
E=[
("子供ならいざしらず、大人がそんなことをするなんて。", "こどもならいざしらず、おとながそんなことをするなんて。", "Se fosse uma criança, até entenderia, mas um adulto fazer uma coisa dessas..."),
("昔はいざしらず、今は誰でも海外旅行ができる。", "むかしはいざしらず、いまはだれでもかいがいりょこうができる。", "Não sei quanto a antigamente, mas hoje qualquer um pode viajar para o exterior."),
("初心者ならいざしらず、プロがこんなミスをするとは。", "しょしんしゃならいざしらず、プロがこんなミスをするとは。", "Se fosse um iniciante, até entenderia, mas um profissional cometer um erro desses..."),
("一回ならいざしらず、何度も同じ失敗をするのは問題だ。", "いっかいならいざしらず、なんどもおなじしっぱいをするのはもんだいだ。", "Uma vez ainda passava, mas repetir o mesmo erro várias vezes é um problema."),
("他の人はいざしらず、私は反対だ。", "ほかのひとはいざしらず、わたしははんたいだ。", "Não sei quanto aos outros, mas eu sou contra."),
],
R=[
("知らなかった____、知っていて黙っていたのは許せない。", "Se não soubesse, até entenderia, mas saber e ficar calado é imperdoável.", ["ならいざしらず", "ならいざ知らず"]),
("学生____、社会人なら時間を守るべきだ。", "Se fosse estudante, até entenderia, mas um profissional deve ser pontual.", ["ならいざしらず", "ならいざ知らず"]),
("平日____、日曜日に会社に行くなんて。", "Se fosse dia útil, tudo bem, mas ir à empresa num domingo...", ["ならいざしらず", "ならいざ知らず"]),
("他の国____、日本では考えられないことだ。", "Não sei quanto a outros países, mas no Japão isso é impensável.", ["はいざしらず", "はいざ知らず"]),
("簡単な問題____、こんな難しい問題は解けない。", "Se fosse um problema fácil, seria outra história, mas um problema tão difícil não dá para resolver.", ["ならいざしらず", "ならいざ知らず"]),
],
),
dict(
n=99,
jp="〜なり",
rd="nari",
tr="Mal / Assim que / Logo que",
ex="""なり indica que, assim que uma ação aconteceu, outra ação veio logo em seguida, muitas vezes de forma inesperada. Equivale a "mal..." ou "assim que...".

O sujeito das duas ações costuma ser o mesmo, e não é a própria pessoa que fala. Por exemplo, "mal chegou em casa, ele foi para o quarto".

É uma expressão um pouco literária.""",
st="""Verbo (forma dicionário) + なり + Ação seguinte (passado)""",
no="""É parecido com や否や e とたんに.

Não se usa com a primeira pessoa nem com pedidos ou intenções.

Não se confunde com なり de opções, como 〜なり〜なり.""",
bf="なり",
rx="なり",
tk=["なり"],
va=["なり"],
E=[
("彼は家に帰るなり、自分の部屋に閉じこもった。", "かれはいえにかえるなり、じぶんのへやにとじこもった。", "Mal chegou em casa, ele se trancou no quarto."),
("彼女は私の顔を見るなり、泣き出した。", "かのじょはわたしのかおをみるなり、なきだした。", "Assim que viu meu rosto, ela começou a chorar."),
("子供はベッドに入るなり、眠ってしまった。", "こどもはベッドにはいるなり、ねむってしまった。", "Mal se deitou, a criança adormeceu."),
("父は新聞を読むなり、怒り出した。", "ちちはしんぶんをよむなり、おこりだした。", "Assim que leu o jornal, meu pai ficou bravo."),
("彼は電話を切るなり、部屋を飛び出した。", "かれはでんわをきるなり、へやをとびだした。", "Mal desligou o telefone, ele saiu correndo do quarto."),
],
R=[
("彼女は手紙を読む____、顔色を変えた。", "Assim que leu a carta, ela mudou de expressão.", ["なり"]),
("彼は席に着く____、お酒を注文した。", "Mal se sentou, ele pediu uma bebida.", ["なり"]),
("犬は主人の姿を見る____、走ってきた。", "Assim que viu o dono, o cachorro veio correndo.", ["なり"]),
("兄は会社から帰る____、ソファーで寝てしまった。", "Mal voltou do trabalho, meu irmão dormiu no sofá.", ["なり"]),
("彼女は部屋に入る____、窓を開けた。", "Assim que entrou no quarto, ela abriu a janela.", ["なり"]),
],
),
dict(
n=100,
jp="〜なりに / 〜なりの",
rd="nari ni / nari no",
tr="Do seu jeito / À sua maneira / Dentro das suas possibilidades",
ex="""なりに e なりの indicam que algo é feito de acordo com as próprias capacidades ou condições, mesmo que sejam limitadas. Equivalem a "do seu jeito" ou "à sua maneira".

A pessoa reconhece que há limites, mas valoriza o esforço feito dentro deles. Por exemplo, "as crianças pensam do jeito delas" ou "fiz o melhor que pude, à minha maneira".

なりの vem antes de substantivos, e なりに funciona como advérbio.""",
st="""Substantivo + なりに + Verbo
Substantivo + なりの + Substantivo
Verbo / Adjetivo (forma simples) + なりに""",
no="""Expressões comuns são 自分なりに, 子供なりに, 私なりの考え e それなりに.

それなりに significa "de certa forma" ou "razoavelmente".""",
bf="なりに",
rx="なりに|なりの",
tk=["なり", "に"],
va=["なりに", "なりの", "それなりに"],
E=[
("子供は子供なりに、いろいろ考えている。", "こどもはこどもなりに、いろいろかんがえている。", "As crianças pensam em muitas coisas, do jeito delas."),
("自分なりに一生懸命頑張った。", "じぶんなりにいっしょうけんめいがんばった。", "Me esforcei ao máximo, à minha maneira."),
("これは私なりの考えです。", "これはわたしなりのかんがえです。", "Esta é a minha opinião, do meu jeito."),
("お金がないなりに、楽しく暮らしている。", "おかねがないなりに、たのしくくらしている。", "Mesmo sem dinheiro, vivo feliz dentro das minhas possibilidades."),
("この店はそれなりにおいしい。", "このみせはそれなりにおいしい。", "Esta loja é razoavelmente gostosa."),
],
R=[
("彼は彼____努力している。", "Ele se esforça à maneira dele.", ["なりに"]),
("初心者には初心者____楽しみ方がある。", "Os iniciantes têm o seu próprio jeito de se divertir.", ["なりの"]),
("自分____調べてみたが、よくわからなかった。", "Pesquisei do meu jeito, mas não entendi bem.", ["なりに"]),
("狭い部屋だが、それ____快適だ。", "É um quarto pequeno, mas razoavelmente confortável.", ["なりに"]),
("彼女には彼女____理由があるのだろう。", "Ela deve ter os seus próprios motivos.", ["なりの"]),
],
),
]

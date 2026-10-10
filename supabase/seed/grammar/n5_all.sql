-- n5-grammar-01 — 〜ちゃいけない・〜じゃいけない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-01',
    'grammar',
    'N5',
    $$〜ちゃいけない・〜じゃいけない$$,
    $$chaikenai / jaikenai$$,
    $$Não pode / Não deve / É proibido$$,
    $$Essa estrutura é usada para dizer que algo não é permitido. É a forma falada e mais casual de 〜てはいけない.

Na fala do dia a dia, os japoneses costumam "encurtar" ては para ちゃ. Quando a forma て do verbo termina em で (como nos verbos terminados em む, ぶ, ぬ e ぐ), では vira じゃ. Ou seja, ちゃいけない e じゃいけない têm o mesmo significado; a escolha depende só da terminação da forma て do verbo.

A ideia literal é algo como "fazer isso não está bem". Por isso ela é usada para regras, proibições, avisos e conselhos firmes, como pais falando com filhos, professores com alunos ou amigos alertando uns aos outros.

Como é uma forma contraída, ela soa informal. Em placas, documentos ou situações formais, usa-se a forma completa 〜てはいけません.$$,
    $$A contração segue sempre o mesmo padrão: ては vira ちゃ e では vira じゃ. Esse mesmo padrão aparece em outras expressões, como 〜ちゃだめ, que tem sentido parecido e é ainda mais coloquial.

Por ser uma forma falada, ela é rara em textos escritos formais. Em regulamentos e avisos oficiais, a forma completa é a mais comum.

Um erro comum é esquecer de olhar a forma て antes de contrair: o verbo 飲む vira 飲んで, então a forma correta é 飲んじゃいけない, e não 飲んちゃいけない.$$,
    $$Verbo na forma て terminada em て → troque て por ちゃ + いけない
Verbo na forma て terminada em で → troque で por じゃ + いけない

Educado: 〜ちゃいけません / 〜じゃいけません
Passado: 〜ちゃいけなかった / 〜じゃいけなかった

Forma completa equivalente: Verbo na forma て + は + いけない$$,
    $$ちゃいけない$$,
    $$ちゃいけない|じゃいけない|ちゃいけません|じゃいけません|ちゃいけなかった|じゃいけなかった$$,
    ARRAY['ちゃ', 'じゃ', 'いけない']::text[],
    ARRAY['ちゃいけない', 'じゃいけない', 'ちゃいけません', 'じゃいけません', 'ちゃいけなかった', 'じゃいけなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-01', $$ここで写真を撮っちゃいけない。$$, $$ここでしゃしんをとっちゃいけない。$$, $$Não pode tirar foto aqui.$$),
    ('n5-grammar-01', $$授業中に寝ちゃいけないよ。$$, $$じゅぎょうちゅうにねちゃいけないよ。$$, $$Não pode dormir durante a aula, viu?$$),
    ('n5-grammar-01', $$このプールで泳いじゃいけません。$$, $$このプールでおよいじゃいけません。$$, $$Não é permitido nadar nesta piscina.$$),
    ('n5-grammar-01', $$子供のころ、夜遅くまでテレビを見ちゃいけなかった。$$, $$こどものころ、よるおそくまでテレビをみちゃいけなかった。$$, $$Quando eu era criança, não podia ver TV até tarde da noite.$$),
    ('n5-grammar-01', $$薬を飲んだあとで、お酒を飲んじゃいけないよ。$$, $$くすりをのんだあとで、おさけをのんじゃいけないよ。$$, $$Depois de tomar o remédio, você não pode beber álcool.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$図書館で大きい声で話し____よ。$$, $$Não pode falar alto na biblioteca, viu?$$),
        (2, $$廊下を走っ____。$$, $$Não pode correr no corredor.$$),
        (3, $$ここにゴミを捨て____。$$, $$Não pode jogar lixo aqui.$$),
        (4, $$この川で泳い____。$$, $$Não pode nadar neste rio.$$),
        (5, $$医者に、今日はお酒を飲ん____と言われました。$$, $$O médico me disse que hoje eu não posso beber álcool.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-01', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ちゃいけない$$),
        (1, $$ちゃいけません$$),
        (2, $$ちゃいけない$$),
        (2, $$ちゃいけません$$),
        (3, $$ちゃいけない$$),
        (3, $$ちゃいけません$$),
        (4, $$じゃいけない$$),
        (4, $$じゃいけません$$),
        (5, $$じゃいけない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-02 — 〜だ・〜です
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-02',
    'grammar',
    'N5',
    $$〜だ・〜です$$,
    $$da / desu$$,
    $$Ser / Estar / É$$,
    $$だ e です funcionam como o verbo "ser" do português. Eles ligam o assunto da frase a uma informação sobre ele, como uma profissão, uma nacionalidade, um dia da semana ou uma característica.

A diferença entre os dois é o nível de formalidade. です é a forma educada, usada com desconhecidos, no trabalho e com pessoas mais velhas. だ é a forma simples, usada com amigos, família e em textos neutros, como diários.

Eles são usados depois de substantivos e de adjetivos な (sem o な). Com adjetivos い, a regra é diferente: pode-se colocar です para deixar a frase educada, mas não se usa だ, porque o adjetivo い já funciona sozinho como predicado.

Em japonês, essa estrutura também serve para "estar" quando se fala de um estado expresso por um substantivo, como estar de folga ou estar doente.$$,
    $$Na fala, principalmente entre mulheres e em situações suaves, é comum omitir だ no final da frase e usar só o substantivo ou o substantivo + よ / ね. Usar だ sozinho no fim da frase pode soar um pouco direto ou firme.

です não é um verbo de verdade, por isso não muda conforme a pessoa: é igual para eu, você, ele ou nós.

Um erro muito comum é dizer おいしいだ ou 高いだ. Com adjetivos い, a forma informal é apenas o adjetivo.$$,
    $$Substantivo + だ (informal)
Substantivo + です (formal)

Adjetivo な (sem な) + だ / です

Adjetivo い + です (formal)
Adjetivo い sozinho (informal, sem だ)

Passado: だった / でした
Negativo: じゃない / ではありません$$,
    $$です$$,
    $$です|だ。|だよ|だね|だな|だと$$,
    ARRAY['だ', 'です']::text[],
    ARRAY['だ', 'です']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-02', $$私は学生です。$$, $$わたしはがくせいです。$$, $$Eu sou estudante.$$),
    ('n5-grammar-02', $$今日は日曜日だ。$$, $$きょうはにちようびだ。$$, $$Hoje é domingo.$$),
    ('n5-grammar-02', $$この町はとても静かです。$$, $$このまちはとてもしずかです。$$, $$Esta cidade é muito tranquila.$$),
    ('n5-grammar-02', $$あの人は田中さんの先生だよ。$$, $$あのひとはたなかさんのせんせいだよ。$$, $$Aquela pessoa é o professor do Tanaka.$$),
    ('n5-grammar-02', $$このかばんは高いです。$$, $$このかばんはたかいです。$$, $$Esta bolsa é cara.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父は医者____。$$, $$Meu pai é médico.$$),
        (2, $$これは私の本____。$$, $$Este é o meu livro.$$),
        (3, $$明日は休み____よ。$$, $$Amanhã é folga, viu?$$),
        (4, $$あの公園はきれい____。$$, $$Aquele parque é bonito.$$),
        (5, $$この料理はおいしい____。$$, $$Esta comida é gostosa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-02', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$です$$),
        (1, $$だ$$),
        (2, $$です$$),
        (2, $$だ$$),
        (3, $$だ$$),
        (3, $$です$$),
        (4, $$です$$),
        (4, $$だ$$),
        (5, $$です$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-03 — 〜だけ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-03',
    'grammar',
    'N5',
    $$〜だけ$$,
    $$dake$$,
    $$Só / Somente / Apenas$$,
    $$だけ é usado para limitar algo, mostrando que é só aquilo e nada mais. Equivale a "só", "somente" ou "apenas".

Ele vem logo depois da palavra que está sendo limitada. Pode limitar uma coisa, uma pessoa, uma quantidade, um lugar ou até uma ação.

A frase com だけ pode ser afirmativa ou negativa, e o tom costuma ser neutro: ele apenas informa o limite. Isso é diferente de しか〜ない, que também significa "só", mas exige um verbo negativo e passa a ideia de que aquilo é pouco.

Quando だけ aparece junto com partículas, ele normalmente fica antes de partículas como で, に e と, e pode substituir を e が ou ficar antes delas.$$,
    $$A expressão 好きなだけ significa "o quanto quiser", e 一つだけ, "só um". São usos muito frequentes no dia a dia.

だけ não carrega a ideia de "pouco demais". Se a intenção for reclamar ou destacar que algo é insuficiente, しか〜ない é mais adequado.

Em lojas, a expressão 見るだけ é a forma natural de dizer que você só está olhando.$$,
    $$Substantivo + だけ
Substantivo + だけ + partícula (だけで / だけに / だけと / だけが)
Quantidade + だけ
Verbo na forma de dicionário + だけ
Adjetivo い + だけ
Adjetivo な + な + だけ$$,
    $$だけ$$,
    $$だけ$$,
    ARRAY['だけ']::text[],
    ARRAY['だけ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-03', $$水だけ飲みました。$$, $$みずだけのみました。$$, $$Só bebi água.$$),
    ('n5-grammar-03', $$日曜日だけ休みです。$$, $$にちようびだけやすみです。$$, $$Só tenho folga aos domingos.$$),
    ('n5-grammar-03', $$一つだけください。$$, $$ひとつだけください。$$, $$Me dê só um, por favor.$$),
    ('n5-grammar-03', $$見るだけです。$$, $$みるだけです。$$, $$Só estou olhando.$$),
    ('n5-grammar-03', $$日本語は少しだけわかります。$$, $$にほんごはすこしだけわかります。$$, $$Entendo só um pouquinho de japonês.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$朝はコーヒー____飲みます。$$, $$De manhã, só bebo café.$$),
        (2, $$このことは私____が知っています。$$, $$Só eu sei disso.$$),
        (3, $$財布の中に千円____あります。$$, $$Tenho só mil ienes na carteira.$$),
        (4, $$見る____です。買いません。$$, $$Só vou olhar. Não vou comprar.$$),
        (5, $$好きな____食べてください。$$, $$Coma o quanto quiser.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-03', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけ$$),
        (2, $$だけ$$),
        (3, $$だけ$$),
        (4, $$だけ$$),
        (5, $$だけ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-04 — 〜だろう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-04',
    'grammar',
    'N5',
    $$〜だろう$$,
    $$darou$$,
    $$Provavelmente / Deve ser / Acho que / Não é?$$,
    $$だろう é usado quando a pessoa fala de algo que ela acredita ser verdade, mas sem ter certeza absoluta. É uma suposição: "provavelmente", "deve ser".

Ele fica no final da frase e funciona com verbos, adjetivos e substantivos. É a versão simples e informal de でしょう. Por isso aparece muito em conversas entre amigos, em pensamentos e em textos neutros, como notícias escritas e redações.

Além da suposição, だろう também pode ser usado com entonação de pergunta para pedir confirmação, como "não é?" ou "eu não disse?". Nesse uso, quem fala espera que o outro concorde.

Na fala, esse uso de confirmação é comum principalmente entre homens. Em situações educadas, o normal é usar でしょう.$$,
    $$É muito comum combinar だろう com たぶん ou きっと, que reforçam o grau de certeza da suposição.

A expressão だろうと思う é uma forma natural de dar opinião com um pouco de cautela.

A forma reduzida だろ soa bem informal e, às vezes, até um pouco brusca. Evite com pessoas mais velhas ou desconhecidos.

Com substantivos e adjetivos な, não se usa だ antes de だろう: diz-se 学生だろう, nunca 学生だだろう.$$,
    $$Verbo na forma simples + だろう
Verbo na forma ない + だろう
Verbo na forma た + だろう
Adjetivo い + だろう
Adjetivo な (sem な) + だろう
Substantivo + だろう

Forma educada: でしょう
Forma reduzida na fala: だろ$$,
    $$だろう$$,
    $$だろう|だろ$$,
    ARRAY['だろう']::text[],
    ARRAY['だろう', 'だろ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-04', $$明日は雨が降るだろう。$$, $$あしたはあめがふるだろう。$$, $$Amanhã provavelmente vai chover.$$),
    ('n5-grammar-04', $$田中さんはもう家に帰っただろう。$$, $$たなかさんはもういえにかえっただろう。$$, $$O Tanaka já deve ter voltado para casa.$$),
    ('n5-grammar-04', $$この問題は難しくないだろう。$$, $$このもんだいはむずかしくないだろう。$$, $$Esta questão provavelmente não é difícil.$$),
    ('n5-grammar-04', $$あの店は高いだろうと思います。$$, $$あのみせはたかいだろうとおもいます。$$, $$Acho que aquela loja deve ser cara.$$),
    ('n5-grammar-04', $$ほら、言っただろう。$$, $$ほら、いっただろう。$$, $$Viu? Eu não te disse?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今夜は寒くなる____。$$, $$Hoje à noite provavelmente vai esfriar.$$),
        (2, $$彼はたぶん来ない____。$$, $$Ele provavelmente não vem.$$),
        (3, $$あの人は学生____。$$, $$Aquela pessoa deve ser estudante.$$),
        (4, $$駅まで歩いて十分ぐらい____と思う。$$, $$Acho que até a estação deve dar uns dez minutos a pé.$$),
        (5, $$宿題、もう終わった____？$$, $$Você já terminou a lição, não é?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-04', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だろう$$),
        (2, $$だろう$$),
        (3, $$だろう$$),
        (4, $$だろう$$),
        (5, $$だろう$$),
        (5, $$だろ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-05 — で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-05',
    'grammar',
    'N5',
    $$で$$,
    $$de$$,
    $$Em / Com / De / Por / Por causa de$$,
    $$で é uma partícula com vários usos, mas todos giram em torno de uma ideia: ela mostra o "contexto" ou o "meio" em que uma ação acontece.

Os usos mais importantes são:
• Lugar onde uma ação acontece: o lugar em que você estuda, come, trabalha.
• Meio ou ferramenta: o transporte que você usa, o objeto com que faz algo, o idioma em que fala ou escreve.
• Causa: o motivo de algo ter acontecido, como uma doença ou um acidente.
• Total ou limite: a quantidade ou o tempo que forma um conjunto, como um preço total.

Um ponto importante é a diferença entre で e に para lugares. で marca onde uma ação acontece. に marca onde algo existe ou para onde algo vai. Por isso, com verbos de existência como ある e いる, usa-se に, e não で.$$,
    $$Para ir a pé, não se usa で: o japonês usa 歩いて.

Quando で indica causa, ele costuma aparecer com coisas que acontecem naturalmente ou fogem do controle, como doença, chuva, acidente ou terremoto.

Não confunda a partícula で com a forma て de verbos terminados em で, nem com a forma で de です, que liga frases. São elementos diferentes que apenas têm o mesmo som.$$,
    $$Substantivo de lugar + で + verbo de ação
Substantivo (meio, ferramenta, transporte) + で
Substantivo (idioma) + で
Substantivo (causa) + で
Quantidade / tempo + で (total ou limite)$$,
    $$で$$,
    $$で$$,
    ARRAY['で']::text[],
    ARRAY['で']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-05', $$図書館で勉強します。$$, $$としょかんでべんきょうします。$$, $$Estudo na biblioteca.$$),
    ('n5-grammar-05', $$毎日バスで学校に行きます。$$, $$まいにちバスでがっこうにいきます。$$, $$Vou para a escola de ônibus todo dia.$$),
    ('n5-grammar-05', $$日本語で手紙を書きました。$$, $$にほんごでてがみをかきました。$$, $$Escrevi uma carta em japonês.$$),
    ('n5-grammar-05', $$風邪で会社を休みました。$$, $$かぜでかいしゃをやすみました。$$, $$Faltei no trabalho por causa de um resfriado.$$),
    ('n5-grammar-05', $$このりんごは三つで二百円です。$$, $$このりんごはみっつでにひゃくえんです。$$, $$Estas maçãs custam duzentos ienes as três.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$箸____ご飯を食べます。$$, $$Como arroz com hashi.$$),
        (2, $$公園____サッカーをしました。$$, $$Joguei futebol no parque.$$),
        (3, $$電車____来ました。$$, $$Vim de trem.$$),
        (4, $$事故____電車が遅れました。$$, $$O trem atrasou por causa de um acidente.$$),
        (5, $$全部____千円です。$$, $$Tudo dá mil ienes.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-05', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$で$$),
        (2, $$で$$),
        (3, $$で$$),
        (4, $$で$$),
        (5, $$で$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-06 — でも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-06',
    'grammar',
    'N5',
    $$でも$$,
    $$demo$$,
    $$Mas / Porém / Mesmo assim$$,
    $$No nível N5, でも é aprendido principalmente como uma conjunção que fica no começo da frase e significa "mas" ou "porém".

Ele liga duas ideias que se contrastam. Primeiro você diz uma frase, termina com ponto, e começa a próxima com でも para mostrar que vem uma informação contrária ou inesperada.

É uma palavra muito usada na conversa e serve tanto em situações informais quanto em situações educadas. Em textos mais formais e escritos, palavras como しかし são mais comuns.

A diferença para けど é a posição: けど normalmente fica no final da primeira parte, juntando tudo em uma frase só, enquanto でも começa uma nova frase.$$,
    $$でも também tem outros usos que aparecem em níveis seguintes. Depois de substantivos, ele pode significar "até mesmo" ou "ou algo assim", como em uma sugestão leve. São usos diferentes da conjunção do começo da frase.

Na conversa, でも também é usado para responder a algo que o outro disse, introduzindo uma objeção ou uma ressalva.

Começar frases com でも o tempo todo pode soar como se a pessoa estivesse sempre discordando ou dando desculpas, então vale usar com equilíbrio.$$,
    $$Frase 1 (terminada com ponto final) + でも、 + Frase 2
でも sempre no começo da segunda frase$$,
    $$でも$$,
    $$でも$$,
    ARRAY['でも']::text[],
    ARRAY['でも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-06', $$日本語は難しいです。でも、楽しいです。$$, $$にほんごはむずかしいです。でも、たのしいです。$$, $$Japonês é difícil. Mas é divertido.$$),
    ('n5-grammar-06', $$雨が降っていました。でも、出かけました。$$, $$あめがふっていました。でも、でかけました。$$, $$Estava chovendo. Mas eu saí mesmo assim.$$),
    ('n5-grammar-06', $$このレストランは安いです。でも、あまりおいしくないです。$$, $$このレストランはやすいです。でも、あまりおいしくないです。$$, $$Este restaurante é barato. Mas não é muito gostoso.$$),
    ('n5-grammar-06', $$行きたいです。でも、時間がありません。$$, $$いきたいです。でも、じかんがありません。$$, $$Eu quero ir. Mas não tenho tempo.$$),
    ('n5-grammar-06', $$「明日、映画を見に行かない？」「いいね。でも、何時から？」$$, $$「あした、えいがをみにいかない？」「いいね。でも、なんじから？」$$, $$"Vamos ver um filme amanhã?" "Legal. Mas a partir de que horas?"$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$肉は好きです。____、魚はあまり好きじゃありません。$$, $$Gosto de carne. Mas não gosto muito de peixe.$$),
        (2, $$一生懸命勉強しました。____、試験は難しかったです。$$, $$Estudei muito. Mas a prova foi difícil.$$),
        (3, $$この服はかわいいです。____、ちょっと高いです。$$, $$Esta roupa é bonitinha. Mas é um pouco cara.$$),
        (4, $$昨日はとても疲れていました。____、パーティーに行きました。$$, $$Ontem eu estava muito cansado. Mas fui à festa.$$),
        (5, $$「一緒に行こうよ。」「うん。____、ちょっと待って。」$$, $$"Vamos juntos!" "Tá. Mas espera um pouco."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-06', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でも$$),
        (2, $$でも$$),
        (3, $$でも$$),
        (4, $$でも$$),
        (5, $$でも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-07 — 〜でしょう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-07',
    'grammar',
    'N5',
    $$〜でしょう$$,
    $$deshou$$,
    $$Provavelmente / Deve ser / Não é?$$,
    $$でしょう é a forma educada de だろう. Ele mostra que a pessoa está fazendo uma suposição: acredita que algo é verdade, mas não tem certeza total.

É muito usado na previsão do tempo, em explicações e em conversas educadas. Fica no final da frase, depois de verbos, adjetivos e substantivos.

Com entonação de pergunta, でしょう também serve para pedir confirmação, algo como "não é?". Nesse caso, quem fala espera que o outro concorde.

Já でしょうか é uma forma educada e suave de fazer uma pergunta. Ela soa mais delicada do que ですか, por isso é comum ao pedir informações a desconhecidos ou atender clientes.$$,
    $$A forma reduzida でしょ é bem comum na fala informal para pedir confirmação, com um tom de "eu não disse?" ou "né?".

Na previsão do tempo, でしょう aparece o tempo todo, porque o meteorologista fala de algo provável, mas não garantido.

Apesar de ser educado, でしょう não deve ser usado para falar das suas próprias ações ou intenções; para isso, usa-se a forma ます ou つもり.$$,
    $$Verbo na forma simples + でしょう
Verbo na forma ない + でしょう
Verbo na forma た + でしょう
Adjetivo い + でしょう
Adjetivo な (sem な) + でしょう
Substantivo + でしょう

Pergunta educada: 〜でしょうか
Confirmação: 〜でしょう？ / 〜でしょ？ (informal)$$,
    $$でしょう$$,
    $$でしょう|でしょ$$,
    ARRAY['でしょう']::text[],
    ARRAY['でしょう', 'でしょ', 'でしょうか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-07', $$明日は晴れるでしょう。$$, $$あしたははれるでしょう。$$, $$Amanhã provavelmente vai fazer sol.$$),
    ('n5-grammar-07', $$山田さんは来ないでしょう。$$, $$やまださんはこないでしょう。$$, $$O Yamada provavelmente não vem.$$),
    ('n5-grammar-07', $$この時間は、道が空いているでしょう。$$, $$このじかんは、みちがすいているでしょう。$$, $$Neste horário, a rua deve estar vazia.$$),
    ('n5-grammar-07', $$すみません、駅はどこでしょうか。$$, $$すみません、えきはどこでしょうか。$$, $$Com licença, onde fica a estação?$$),
    ('n5-grammar-07', $$このケーキ、おいしいでしょう？$$, $$このケーキ、おいしいでしょう？$$, $$Este bolo é gostoso, não é?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$午後から雨が降る____。$$, $$A partir da tarde provavelmente vai chover.$$),
        (2, $$週末は道が混む____。$$, $$No fim de semana, as ruas provavelmente vão estar cheias.$$),
        (3, $$彼女はもう寝た____。$$, $$Ela já deve ter dormido.$$),
        (4, $$会議は何時から____か。$$, $$A reunião começa a que horas?$$),
        (5, $$ほら、この写真、きれい____？$$, $$Olha, esta foto é bonita, não é?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-07', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でしょう$$),
        (2, $$でしょう$$),
        (3, $$でしょう$$),
        (4, $$でしょう$$),
        (5, $$でしょう$$),
        (5, $$でしょ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-08 — どんな
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-08',
    'grammar',
    'N5',
    $$どんな$$,
    $$donna$$,
    $$Que tipo de / Como / Qual$$,
    $$どんな é usado para perguntar sobre o tipo, a natureza ou as características de alguma coisa. Equivale a "que tipo de" ou, dependendo da frase, a "como é".

Ele sempre vem antes de um substantivo, funcionando como um adjetivo de pergunta. Você nunca usa どんな sozinho: ele precisa estar ligado à coisa sobre a qual você quer saber mais.

A resposta normalmente descreve a coisa com adjetivos ou explicações, e não apenas escolhe uma opção. Isso é diferente de どの, que pede para escolher uma entre opções concretas, e de 何, que pergunta "o quê".

Quando aparece junto com でも, どんな ganha o sentido de "qualquer", indicando que não importa o tipo.$$,
    $$どんな faz parte da família こんな, そんな, あんな e どんな, que significam "deste tipo", "desse tipo", "daquele tipo" e "que tipo".

Para perguntar como alguém está ou como foi algo, como uma viagem, os japoneses costumam usar どうですか ou どうでしたか, e não どんな.

A pergunta どんな人ですか pede uma descrição da personalidade ou das características da pessoa, não o nome dela.$$,
    $$どんな + Substantivo
どんな + Substantivo + ですか
どんな + Substantivo + でも (qualquer)$$,
    $$どんな$$,
    $$どんな$$,
    ARRAY['どんな']::text[],
    ARRAY['どんな']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-08', $$どんな音楽が好きですか。$$, $$どんなおんがくがすきですか。$$, $$Que tipo de música você gosta?$$),
    ('n5-grammar-08', $$田中さんはどんな人ですか。$$, $$たなかさんはどんなひとですか。$$, $$Como é o Tanaka?$$),
    ('n5-grammar-08', $$昨日、どんな映画を見ましたか。$$, $$きのう、どんなえいがをみましたか。$$, $$Que tipo de filme você viu ontem?$$),
    ('n5-grammar-08', $$日本はどんな国ですか。$$, $$にほんはどんなくにですか。$$, $$Como é o Japão?$$),
    ('n5-grammar-08', $$どんな色でもいいです。$$, $$どんないろでもいいです。$$, $$Qualquer cor serve.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____料理が得意ですか。$$, $$Que tipo de comida você cozinha bem?$$),
        (2, $$新しい先生は____先生ですか。$$, $$Como é o novo professor?$$),
        (3, $$____本を読みたいですか。$$, $$Que tipo de livro você quer ler?$$),
        (4, $$北海道は____ところですか。$$, $$Como é Hokkaido?$$),
        (5, $$____仕事でも頑張ります。$$, $$Vou me esforçar em qualquer trabalho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-08', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どんな$$),
        (2, $$どんな$$),
        (3, $$どんな$$),
        (4, $$どんな$$),
        (5, $$どんな$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-09 — どうして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-09',
    'grammar',
    'N5',
    $$どうして$$,
    $$doushite$$,
    $$Por quê / Por que motivo$$,
    $$どうして é usado para perguntar o motivo ou a razão de alguma coisa. Equivale a "por quê".

Ele normalmente aparece no começo da pergunta, e a frase termina com か, の ou んですか. Também pode ser usado sozinho, como resposta curta, na forma どうしてですか ou só どうして.

A resposta a uma pergunta com どうして costuma terminar com から ou ので, que explicam a causa.

Existem outras palavras com o mesmo sentido: なんで é mais informal e muito usado entre amigos, e なぜ é mais formal e comum em textos escritos. どうして fica no meio, servindo para a maioria das situações.$$,
    $$Quando a pergunta é feita com んですか ou の, ela soa mais natural e mostra interesse real em entender a situação.

Dependendo do tom, どうして pode soar como cobrança ou reclamação, principalmente em frases negativas, como perguntar por que alguém não fez algo.

A expressão どうしてか significa "por algum motivo" ou "não sei por quê", e não é uma pergunta.$$,
    $$どうして + frase + か / の / んですか
どうしてですか (sozinho)
どうしてか + frase (por algum motivo)

Resposta: 〜から / 〜ので$$,
    $$どうして$$,
    $$どうして$$,
    ARRAY['どうして']::text[],
    ARRAY['どうして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-09', $$どうして日本語を勉強していますか。$$, $$どうしてにほんごをべんきょうしていますか。$$, $$Por que você está estudando japonês?$$),
    ('n5-grammar-09', $$どうして昨日来なかったの？$$, $$どうしてきのうこなかったの？$$, $$Por que você não veio ontem?$$),
    ('n5-grammar-09', $$「明日は行きません。」「どうしてですか。」$$, $$「あしたはいきません。」「どうしてですか。」$$, $$"Amanhã não vou." "Por quê?"$$),
    ('n5-grammar-09', $$どうしてそんなに急いでいるんですか。$$, $$どうしてそんなにいそいでいるんですか。$$, $$Por que você está com tanta pressa?$$),
    ('n5-grammar-09', $$どうしてかわからないけど、今日はとても眠い。$$, $$どうしてかわからないけど、きょうはとてもねむい。$$, $$Não sei por quê, mas hoje estou com muito sono.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____泣いているの？$$, $$Por que você está chorando?$$),
        (2, $$____遅れたんですか。$$, $$Por que você se atrasou?$$),
        (3, $$「パーティーに行かない。」「____？」$$, $$"Não vou à festa." "Por quê?"$$),
        (4, $$____この窓は開かないんだろう。$$, $$Por que será que esta janela não abre?$$),
        (5, $$____かわからないけど、彼は怒っている。$$, $$Não sei por quê, mas ele está bravo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-09', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どうして$$),
        (2, $$どうして$$),
        (3, $$どうして$$),
        (4, $$どうして$$),
        (5, $$どうして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-10 — どうやって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-10',
    'grammar',
    'N5',
    $$どうやって$$,
    $$douyatte$$,
    $$Como / De que jeito / De que maneira$$,
    $$どうやって é usado para perguntar o método ou o modo de fazer alguma coisa. Equivale a "como" ou "de que jeito".

Ele sempre se refere a uma ação, então vem antes de um verbo. A pergunta é sobre o processo: qual caminho seguir, que passos fazer, que meio usar.

Literalmente, どうやって vem de どう, que significa "como", e やって, a forma て de やる, que significa "fazer". A ideia é "fazendo de que maneira".

É diferente de どう sozinho, que pergunta a opinião ou o estado de algo, como "o que você acha?" ou "como foi?". どうやって é para "como fazer".$$,
    $$Para perguntar como chegar a algum lugar, どうやって行きますか é a forma mais natural.

Em situações educadas, também se usa どのように, que tem o mesmo sentido, mas soa mais formal.

A resposta costuma usar a forma て ou で para indicar o meio, como ir de trem ou fazer usando uma ferramenta.$$,
    $$どうやって + Verbo
どうやって + Verbo + か / の / んですか
どうやって + Verbo + か + frase (pergunta indireta)$$,
    $$どうやって$$,
    $$どうやって$$,
    ARRAY['どう', 'やって']::text[],
    ARRAY['どうやって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-10', $$駅までどうやって行きますか。$$, $$えきまでどうやっていきますか。$$, $$Como eu chego até a estação?$$),
    ('n5-grammar-10', $$この漢字はどうやって読みますか。$$, $$このかんじはどうやってよみますか。$$, $$Como se lê este kanji?$$),
    ('n5-grammar-10', $$これ、どうやって作ったの？$$, $$これ、どうやってつくったの？$$, $$Como você fez isso?$$),
    ('n5-grammar-10', $$このカメラはどうやって使うんですか。$$, $$このカメラはどうやってつかうんですか。$$, $$Como se usa esta câmera?$$),
    ('n5-grammar-10', $$どうやって日本語が上手になったか教えてください。$$, $$どうやってにほんごがじょうずになったかおしえてください。$$, $$Me conte como você ficou bom em japonês.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$空港まで____行きますか。$$, $$Como eu vou até o aeroporto?$$),
        (2, $$このゲームは____遊びますか。$$, $$Como se joga este jogo?$$),
        (3, $$____この問題を解いたの？$$, $$Como você resolveu esta questão?$$),
        (4, $$「すしは____食べますか。」「手で食べてもいいですよ。」$$, $$"Como se come sushi?" "Pode comer com as mãos."$$),
        (5, $$____ここに来たか覚えていません。$$, $$Não lembro como cheguei aqui.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-10', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どうやって$$),
        (2, $$どうやって$$),
        (3, $$どうやって$$),
        (4, $$どうやって$$),
        (5, $$どうやって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-11 — が
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-11',
    'grammar',
    'N5',
    $$が$$,
    $$ga$$,
    $$Marca o sujeito / Quem / O que$$,
    $$が é a partícula que marca o sujeito da frase, ou seja, quem faz a ação ou aquilo que está sendo descrito.

Ela é usada principalmente quando a informação é nova ou quando queremos destacar exatamente quem ou o que. Por isso, palavras de pergunta como 誰 e 何 vêm sempre com が quando são o sujeito, e a resposta também usa が.

Também usamos が para descrever o que acontece ou o que vemos, como fenômenos da natureza e cenas que acabamos de notar.

Alguns verbos e adjetivos pedem が para indicar o "objeto" do sentimento ou da capacidade, como gostar, querer, entender e saber fazer algo. Nesses casos, a coisa de que se gosta ou que se entende é marcada com が, e não com を.

A diferença entre が e は é um dos pontos mais importantes do japonês: は apresenta o tema da conversa ("falando de..."), enquanto が aponta o sujeito específico, muitas vezes com destaque.$$,
    $$Na estrutura de dois sujeitos, は indica o tema geral e が indica uma parte ou característica dele. É assim que o japonês expressa ideias como "o elefante tem a tromba comprida".

が também pode ser usado como conjunção no meio da frase, com sentido de "mas". Esse uso é mais educado que けど e aparece bastante em frases formais.

Quando se responde a uma pergunta que usou が, a resposta deve usar が também. Trocar por は soa estranho nesse contexto.$$,
    $$Substantivo + が + Verbo
Substantivo + が + Adjetivo
Palavra interrogativa (誰 / 何 / どれ) + が
Lugar + に + Substantivo + が + ある / いる
Substantivo + が + 好き / 嫌い / 上手 / 下手 / わかる / ほしい
Tema + は + Parte + が + Adjetivo$$,
    $$が$$,
    $$が$$,
    ARRAY['が']::text[],
    ARRAY['が']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-11', $$猫がいます。$$, $$ねこがいます。$$, $$Tem um gato.$$),
    ('n5-grammar-11', $$誰が来ましたか。$$, $$だれがきましたか。$$, $$Quem veio?$$),
    ('n5-grammar-11', $$雨が降っています。$$, $$あめがふっています。$$, $$Está chovendo.$$),
    ('n5-grammar-11', $$このケーキは私が作りました。$$, $$このケーキはわたしがつくりました。$$, $$Fui eu que fiz este bolo.$$),
    ('n5-grammar-11', $$象は鼻が長い。$$, $$ぞうははながながい。$$, $$O elefante tem a tromba comprida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$空____青いです。$$, $$O céu está azul.$$),
        (2, $$誰____窓を開けましたか。$$, $$Quem abriu a janela?$$),
        (3, $$机の上に本____あります。$$, $$Tem um livro em cima da mesa.$$),
        (4, $$「誰が掃除しましたか。」「私____しました。」$$, $$"Quem fez a limpeza?" "Fui eu."$$),
        (5, $$妹は目____大きいです。$$, $$Minha irmã mais nova tem olhos grandes.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-11', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$が$$),
        (2, $$が$$),
        (3, $$が$$),
        (4, $$が$$),
        (5, $$が$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-12 — 〜があります
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-12',
    'grammar',
    'N5',
    $$〜があります$$,
    $$ga arimasu$$,
    $$Ter / Haver / Existir$$,
    $$があります é usado para dizer que alguma coisa existe ou está em algum lugar. Equivale a "tem", "há" ou "existe".

O verbo ある é usado para coisas que não se movem sozinhas: objetos, plantas, prédios e lugares. Para pessoas e animais, usa-se いる.

ある também serve para dizer que você tem ou não tem algo, como tempo, dinheiro ou uma ideia, e para falar de eventos que vão acontecer ou aconteceram, como provas, reuniões e festas.

Quando ある indica a localização de um objeto, o lugar é marcado com に. Mas quando ある indica um evento, o lugar onde ele acontece é marcado com で, porque um evento é algo que "acontece" em um lugar.$$,
    $$A forma negativa informal de ある é ない, e não あらない. É um dos poucos verbos com negativo irregular.

Quando a frase pergunta "onde está" algo já conhecido, a ordem muda: a coisa vem com は e o lugar com に, como em uma resposta sobre a localização de um objeto específico.

Na pergunta, 何かありますか significa "tem alguma coisa?", e a resposta negativa natural é 何もありません.$$,
    $$Lugar + に + Coisa + があります
Substantivo + があります (possuir algo / ter um evento)
Lugar + で + Evento + があります

Negativo: がありません
Passado: がありました
Passado negativo: がありませんでした

Informal: がある / がない / があった / がなかった$$,
    $$ある$$,
    $$があります|がありません|がありました|がありませんでした|がある|があった|がない|がなかった$$,
    ARRAY['が', 'ある']::text[],
    ARRAY['があります', 'がありません', 'がありました', 'がありませんでした', 'がある', 'がない', 'があった', 'がなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-12', $$机の上に本があります。$$, $$つくえのうえにほんがあります。$$, $$Tem um livro em cima da mesa.$$),
    ('n5-grammar-12', $$駅の近くに大きいスーパーがあります。$$, $$えきのちかくにおおきいスーパーがあります。$$, $$Perto da estação tem um supermercado grande.$$),
    ('n5-grammar-12', $$明日、テストがあります。$$, $$あした、テストがあります。$$, $$Amanhã tem prova.$$),
    ('n5-grammar-12', $$今日は時間がありません。$$, $$きょうはじかんがありません。$$, $$Hoje não tenho tempo.$$),
    ('n5-grammar-12', $$昨日、家の近くで火事がありました。$$, $$きのう、いえのちかくでかじがありました。$$, $$Ontem houve um incêndio perto de casa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$部屋にテレビ____。$$, $$Tem uma TV no quarto.$$),
        (2, $$この町には病院____。$$, $$Nesta cidade não tem hospital.$$),
        (3, $$来週、大事な会議____。$$, $$Semana que vem tem uma reunião importante.$$),
        (4, $$財布にお金____。$$, $$Não tem dinheiro na carteira.$$),
        (5, $$先週、学校でお祭り____。$$, $$Semana passada teve um festival na escola.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-12', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$があります$$),
        (1, $$がある$$),
        (2, $$がありません$$),
        (2, $$がない$$),
        (3, $$があります$$),
        (3, $$がある$$),
        (4, $$がありません$$),
        (4, $$がない$$),
        (5, $$がありました$$),
        (5, $$があった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-13 — 〜がほしい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-13',
    'grammar',
    'N5',
    $$〜がほしい$$,
    $$ga hoshii$$,
    $$Querer (algo) / Desejar$$,
    $$がほしい é usado para dizer que você quer alguma coisa, como um objeto, um animal, tempo ou uma pessoa na sua vida.

O ponto principal é que ほしい é um adjetivo い, e não um verbo. Por isso, a coisa desejada é marcada com が, e a conjugação segue as regras dos adjetivos い: ほしくない para o negativo e ほしかった para o passado.

ほしい serve para coisas (substantivos). Para dizer que você quer fazer uma ação, a gramática é outra: a forma たい do verbo.

ほしい expressa um desejo interno de quem fala. Por isso, em afirmações, ele é usado normalmente para "eu quero" e, em perguntas, para "você quer?". Para falar do desejo de outra pessoa, o japonês prefere outras formas, como citar o que ela disse ou usar ほしがっている.$$,
    $$Na frase negativa, é comum trocar が por は, porque は dá um tom de contraste: "isso, eu não quero".

Perguntar diretamente a um superior se ele quer algo com ほしいですか pode soar invasivo. Em situações educadas, prefere-se oferecer, com expressões como いかがですか.

Hoje em dia, ほしい é escrito mais em hiragana, mas o kanji 欲しい também é muito usado.

Para falar do desejo de outra pessoa, usa-se 欲しがっている, e nesse caso o objeto passa a ser marcado com を.$$,
    $$Substantivo + が + ほしい
Substantivo + が + ほしいです (educado)

Negativo: ほしくない / ほしくないです / ほしくありません
Passado: ほしかった / ほしかったです

Escrita: ほしい / 欲しい$$,
    $$ほしい$$,
    $$がほしい|が欲しい|がほしく|が欲しく|がほしかった|が欲しかった$$,
    ARRAY['が', 'ほしい']::text[],
    ARRAY['がほしい', 'が欲しい', 'がほしいです', 'が欲しいです', 'がほしくない', 'が欲しくない', 'がほしかった', 'が欲しかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-13', $$新しい車がほしいです。$$, $$あたらしいくるまがほしいです。$$, $$Quero um carro novo.$$),
    ('n5-grammar-13', $$誕生日に何が欲しい？$$, $$たんじょうびになにがほしい？$$, $$O que você quer de aniversário?$$),
    ('n5-grammar-13', $$今は少し時間がほしいです。$$, $$いまはすこしじかんがほしいです。$$, $$Agora eu queria um pouco de tempo.$$),
    ('n5-grammar-13', $$子供のころ、犬がほしかったです。$$, $$こどものころ、いぬがほしかったです。$$, $$Quando era criança, eu queria um cachorro.$$),
    ('n5-grammar-13', $$もっと友達がほしいなあ。$$, $$もっとともだちがほしいなあ。$$, $$Queria ter mais amigos...$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$冷たい水が____。$$, $$Quero água gelada.$$),
        (2, $$私は新しいくつ____です。$$, $$Eu quero sapatos novos.$$),
        (3, $$誕生日に何____ですか。$$, $$O que você quer de aniversário?$$),
        (4, $$子供のころ、自転車が____。$$, $$Quando era criança, eu queria uma bicicleta.$$),
        (5, $$弟は新しいゲームが____と言っています。$$, $$Meu irmão mais novo diz que quer um jogo novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-13', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほしい$$),
        (1, $$欲しい$$),
        (1, $$ほしいです$$),
        (1, $$欲しいです$$),
        (2, $$がほしい$$),
        (2, $$が欲しい$$),
        (3, $$がほしい$$),
        (3, $$が欲しい$$),
        (4, $$ほしかった$$),
        (4, $$欲しかった$$),
        (4, $$ほしかったです$$),
        (4, $$欲しかったです$$),
        (5, $$ほしい$$),
        (5, $$欲しい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-14 — 〜がいます
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-14',
    'grammar',
    'N5',
    $$〜がいます$$,
    $$ga imasu$$,
    $$Ter / Haver / Estar (seres vivos)$$,
    $$がいます é usado para dizer que um ser vivo existe ou está em algum lugar. Equivale a "tem", "há" ou "está".

O verbo いる é usado para pessoas e animais, ou seja, seres que se movem por conta própria. Para objetos e plantas, usa-se ある.

Além de indicar onde alguém está, いる também serve para dizer que você tem alguém na sua vida, como irmãos, filhos, amigos, namorado ou um animal de estimação.

O lugar onde o ser vivo está é marcado com に. A pessoa ou o animal é marcado com が quando a informação é nova.$$,
    $$Às vezes a escolha entre いる e ある depende de como a coisa é vista. Um táxi ou ônibus parado com motorista, esperando passageiros, costuma ser tratado com いる, porque a ideia é de alguém ali.

Robôs e personagens também podem ser tratados com いる quando são vistos como "seres".

Quando se diz quantas pessoas há, o número costuma vir entre が e います, com contadores como 人.$$,
    $$Lugar + に + Ser vivo + がいます
Pessoa + (に) は + Ser vivo + がいます (ter família, amigos, animais)

Negativo: がいません
Passado: がいました
Passado negativo: がいませんでした

Informal: がいる / がいない / がいた / がいなかった$$,
    $$いる$$,
    $$がいます|がいません|がいました|がいませんでした|がいる|がいた|がいない|がいなかった$$,
    ARRAY['が', 'いる']::text[],
    ARRAY['がいます', 'がいません', 'がいました', 'がいませんでした', 'がいる', 'がいない', 'がいた', 'がいなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-14', $$公園に子供がいます。$$, $$こうえんにこどもがいます。$$, $$Tem crianças no parque.$$),
    ('n5-grammar-14', $$私には姉がいます。$$, $$わたしにはあねがいます。$$, $$Eu tenho uma irmã mais velha.$$),
    ('n5-grammar-14', $$木の上に鳥がいます。$$, $$きのうえにとりがいます。$$, $$Tem um pássaro em cima da árvore.$$),
    ('n5-grammar-14', $$教室に先生がいません。$$, $$きょうしつにせんせいがいません。$$, $$O professor não está na sala de aula.$$),
    ('n5-grammar-14', $$昔、この家には猫がいました。$$, $$むかし、このいえにはねこがいました。$$, $$Antigamente, havia um gato nesta casa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$池に魚____。$$, $$Tem peixes no lago.$$),
        (2, $$私は兄弟____。$$, $$Eu não tenho irmãos.$$),
        (3, $$部屋に誰____か。$$, $$Tem alguém no quarto?$$),
        (4, $$昨日、庭に大きい犬____。$$, $$Ontem havia um cachorro grande no quintal.$$),
        (5, $$駅の前にタクシー____。$$, $$Tem táxis em frente à estação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-14', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がいます$$),
        (1, $$がいる$$),
        (2, $$がいません$$),
        (2, $$がいない$$),
        (3, $$がいます$$),
        (4, $$がいました$$),
        (4, $$がいた$$),
        (5, $$がいます$$),
        (5, $$がいる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-15 — 〜ほうがいい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-15',
    'grammar',
    'N5',
    $$〜ほうがいい$$,
    $$hou ga ii$$,
    $$É melhor / Deveria / Seria bom$$,
    $$ほうがいい é usado para dar conselhos e recomendações. Equivale a "é melhor..." ou "você deveria...".

A palavra ほう significa "lado" ou "opção". A ideia é comparar: entre fazer e não fazer, "o lado de fazer é melhor". Por isso, o conselho soa bem claro e direto.

Para aconselhar a fazer algo, o mais comum é usar o verbo no passado (forma た), mesmo que a ação seja no futuro. Para aconselhar a não fazer algo, usa-se a forma ない.

Como o conselho é direto, ele pode soar forte quando dito a um superior. Para suavizar, os japoneses costumam acrescentar と思います ou よ no final.$$,
    $$Usar a forma de dicionário em vez da forma た também é possível, mas a forma た soa mais natural e é a mais usada quando se dá um conselho direto a alguém.

Com a forma ない, nunca se usa o passado: o correto é ないほうがいい, e não なかったほうがいい.

A palavra ほう aqui é a mesma de より〜ほうが, usada para comparações. Lembrar dessa ligação ajuda a entender por que o conselho tem um tom de escolha entre duas opções.$$,
    $$Verbo na forma た + ほうがいい
Verbo na forma ない + ほうがいい

Educado: ほうがいいです
Mais suave: ほうがいいと思います

Escrita: ほうがいい / 方がいい
Forma escrita mais formal: ほうがよい$$,
    $$ほうがいい$$,
    $$ほうがいい|方がいい|ほうがよい|方がよい$$,
    ARRAY['ほう', 'が', 'いい']::text[],
    ARRAY['ほうがいい', '方がいい', 'ほうがいいです', '方がいいです', 'ほうがよい', '方がよい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-15', $$早く寝たほうがいいですよ。$$, $$はやくねたほうがいいですよ。$$, $$É melhor você dormir cedo.$$),
    ('n5-grammar-15', $$傘を持っていったほうがいい。$$, $$かさをもっていったほうがいい。$$, $$É melhor levar guarda-chuva.$$),
    ('n5-grammar-15', $$あまりお酒を飲まないほうがいいです。$$, $$あまりおさけをのまないほうがいいです。$$, $$É melhor não beber muito.$$),
    ('n5-grammar-15', $$熱があるなら、病院に行った方がいいよ。$$, $$ねつがあるなら、びょういんにいったほうがいいよ。$$, $$Se você está com febre, é melhor ir ao hospital.$$),
    ('n5-grammar-15', $$この道は夜は危ないから、通らないほうがいいと思います。$$, $$このみちはよるはあぶないから、とおらないほうがいいとおもいます。$$, $$Esta rua é perigosa à noite, então acho melhor não passar por ela.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$疲れているなら、休んだ____よ。$$, $$Se você está cansado, é melhor descansar.$$),
        (2, $$冬の北海道は寒いから、コートを着た____です。$$, $$Hokkaido no inverno é frio, então é melhor usar casaco.$$),
        (3, $$夜遅くに一人で歩かない____。$$, $$É melhor não andar sozinho tarde da noite.$$),
        (4, $$風邪なら、薬を飲んだ____ですよ。$$, $$Se for resfriado, é melhor você tomar o remédio.$$),
        (5, $$先生に聞いた____と思います。$$, $$Acho que é melhor perguntar ao professor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-15', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほうがいい$$),
        (1, $$方がいい$$),
        (1, $$ほうがいいです$$),
        (1, $$方がいいです$$),
        (2, $$ほうがいい$$),
        (2, $$方がいい$$),
        (3, $$ほうがいい$$),
        (3, $$方がいい$$),
        (3, $$ほうがいいです$$),
        (3, $$方がいいです$$),
        (4, $$ほうがいい$$),
        (4, $$方がいい$$),
        (5, $$ほうがいい$$),
        (5, $$方がいい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-16 — い形容詞
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-16',
    'grammar',
    'N5',
    $$い形容詞$$,
    $$i-keiyoushi$$,
    $$Adjetivo い / Adjetivo terminado em い$$,
    $$Os adjetivos い são adjetivos que terminam em い na forma básica e que se conjugam sozinhos, quase como verbos. Eles mostram qualidades, sensações e estados, como grande, frio, gostoso e divertido.

Diferente do português, em japonês o próprio adjetivo muda para indicar negativo e passado. Para isso, tira-se o い final e acrescenta-se uma terminação: くない para o negativo, かった para o passado e くなかった para o passado negativo.

Para deixar a frase educada, basta colocar です depois da forma conjugada. Não se usa だ com adjetivos い.

Antes de um substantivo, o adjetivo い fica na forma básica, sem mudança nenhuma. Para ligar dois adjetivos, troca-se o い por くて.

O adjetivo いい, que significa "bom", é irregular: nas conjugações ele vira よ, formando よくない, よかった e よくなかった.$$,
    $$Algumas palavras terminam em い, mas não são adjetivos い. As mais famosas são きれい e 嫌い, que são adjetivos な. Elas formam o negativo com じゃない, e não com くない.

Um erro comum de iniciantes é usar でした com adjetivos い, como おいしいでした. O passado educado correto é おいしかったです: o passado fica no adjetivo, e です só deixa a frase educada.

A forma くありません soa um pouco mais formal que くないです, mas as duas são corretas e muito usadas.$$,
    $$Afirmativo: Adjetivo い
Negativo: Adjetivo sem い + くない
Passado: Adjetivo sem い + かった
Passado negativo: Adjetivo sem い + くなかった

Educado: forma conjugada + です
Negativo educado alternativo: sem い + くありません / くありませんでした

Antes de substantivo: Adjetivo い + Substantivo
Ligando adjetivos: sem い + くて

Irregular: いい → よくない / よかった / よくなかった$$,
    $$い$$,
    $$いです|くない|かった|くなかった|くありません$$,
    ARRAY['い', 'くない', 'かった', 'くなかった']::text[],
    ARRAY['い', 'くない', 'かった', 'くなかった', 'くありません', 'くありませんでした', 'くて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-16', $$この本はおもしろいです。$$, $$このほんはおもしろいです。$$, $$Este livro é interessante.$$),
    ('n5-grammar-16', $$今日はあまり寒くない。$$, $$きょうはあまりさむくない。$$, $$Hoje não está muito frio.$$),
    ('n5-grammar-16', $$昨日の映画は楽しかったです。$$, $$きのうのえいがはたのしかったです。$$, $$O filme de ontem foi divertido.$$),
    ('n5-grammar-16', $$旅行はあまりよくなかった。$$, $$りょこうはあまりよくなかった。$$, $$A viagem não foi muito boa.$$),
    ('n5-grammar-16', $$このラーメンは安くて、おいしいです。$$, $$このラーメンはやすくて、おいしいです。$$, $$Este ramen é barato e gostoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このかばんはあまり高____。$$, $$Esta bolsa não é muito cara.$$),
        (2, $$昨日はとても寒____。$$, $$Ontem estava muito frio.$$),
        (3, $$先週のテストは難し____。$$, $$A prova da semana passada não foi difícil.$$),
        (4, $$この部屋は広____です。$$, $$Este quarto é amplo.$$),
        (5, $$昨日のパーティーはとても____です。$$, $$A festa de ontem foi muito boa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-16', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くない$$),
        (1, $$くないです$$),
        (1, $$くありません$$),
        (2, $$かった$$),
        (2, $$かったです$$),
        (3, $$くなかった$$),
        (3, $$くなかったです$$),
        (3, $$くありませんでした$$),
        (4, $$い$$),
        (5, $$よかった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-17 — 一番
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-17',
    'grammar',
    'N5',
    $$一番$$,
    $$ichiban$$,
    $$O mais / Número um / Primeiro lugar$$,
    $$一番 é usado para formar o superlativo, ou seja, para dizer que algo é "o mais" de um grupo. Literalmente, significa "número um".

Ele vem antes de um adjetivo, de um advérbio ou de expressões como 好き, mostrando que aquilo está no grau máximo: o mais alto, o mais barato, o que eu mais gosto.

Muitas vezes, o grupo de comparação é indicado antes, com expressões como の中で ("entre") ou com um lugar seguido de で, como "no Japão" ou "na turma".

一番 também pode ser usado como substantivo, com o sentido de "primeiro lugar".$$,
    $$Para perguntar "qual é o mais...", usa-se uma palavra interrogativa com が, como 何が, 誰が, どこが ou いつが, seguida de 一番.

Quando a comparação é entre exatamente duas coisas, o japonês não usa 一番, e sim a estrutura com より e ほうが.

Na escrita do dia a dia, いちばん em hiragana é muito comum, principalmente quando funciona como advérbio.$$,
    $$一番 + Adjetivo
一番 + Advérbio / 好き / 嫌い
[Grupo] + の中で + [A] + が + 一番 + Adjetivo
[Lugar] + で + 一番 + Adjetivo + Substantivo
一番 + Substantivo (primeiro lugar)

Escrita: 一番 / いちばん$$,
    $$一番$$,
    $$一番|いちばん$$,
    ARRAY['一番']::text[],
    ARRAY['一番', 'いちばん']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-17', $$富士山は日本で一番高い山です。$$, $$ふじさんはにほんでいちばんたかいやまです。$$, $$O Monte Fuji é a montanha mais alta do Japão.$$),
    ('n5-grammar-17', $$果物の中でりんごが一番好きです。$$, $$くだもののなかでりんごがいちばんすきです。$$, $$De todas as frutas, a que eu mais gosto é maçã.$$),
    ('n5-grammar-17', $$一番近い駅はどこですか。$$, $$いちばんちかいえきはどこですか。$$, $$Qual é a estação mais próxima?$$),
    ('n5-grammar-17', $$クラスで誰が一番背が高いですか。$$, $$クラスでだれがいちばんせがたかいですか。$$, $$Quem é o mais alto da turma?$$),
    ('n5-grammar-17', $$朝、学校に一番早く来たのは田中さんでした。$$, $$あさ、がっこうにいちばんはやくきたのはたなかさんでした。$$, $$Quem chegou mais cedo à escola de manhã foi o Tanaka.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家族の中で父が____背が高いです。$$, $$Na minha família, quem é mais alto é meu pai.$$),
        (2, $$一年で____寒い月は何月ですか。$$, $$Qual é o mês mais frio do ano?$$),
        (3, $$スポーツの中で何が____好きですか。$$, $$De todos os esportes, qual você mais gosta?$$),
        (4, $$この店で____人気があるのはこのケーキです。$$, $$O mais popular desta loja é este bolo.$$),
        (5, $$マラソン大会で____になりました。$$, $$Fiquei em primeiro lugar na maratona.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-17', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一番$$),
        (1, $$いちばん$$),
        (2, $$一番$$),
        (2, $$いちばん$$),
        (3, $$一番$$),
        (3, $$いちばん$$),
        (4, $$一番$$),
        (4, $$いちばん$$),
        (5, $$一番$$),
        (5, $$いちばん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-18 — 一緒に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-18',
    'grammar',
    'N5',
    $$一緒に$$,
    $$issho ni$$,
    $$Juntos / Junto com$$,
    $$一緒に significa "juntos". Ele mostra que duas ou mais pessoas fazem a mesma ação ao mesmo tempo, ou no mesmo lugar.

Ele funciona como um advérbio, então vem antes do verbo. Para dizer com quem a ação é feita, usa-se a pessoa seguida da partícula と antes de 一緒に.

É muito comum em convites. Junto com ませんか ou ましょう, ele forma convites naturais para fazer algo com alguém.

Quando o "com quem" já está claro pela conversa, a pessoa pode ser omitida, e 一緒に sozinho já entende-se como "comigo" ou "com a gente".$$,
    $$A palavra 一緒 sozinha significa "juntos" ou "o mesmo". Por isso, a expressão 一緒です pode significar "é igual" ou "estamos juntos", dependendo do contexto.

Dizer só と, sem 一緒に, também é possível, mas 一緒に reforça a ideia de que a ação foi compartilhada.

Em grupos, o japonês costuma usar みんなで antes de 一緒に para dizer "todos juntos".$$,
    $$一緒に + Verbo
Pessoa + と + 一緒に + Verbo
一緒に + Verbo ませんか (convite)
一緒に + Verbo ましょう (proposta)

Escrita: 一緒に / いっしょに$$,
    $$一緒に$$,
    $$一緒に|いっしょに$$,
    ARRAY['一緒', 'に']::text[],
    ARRAY['一緒に', 'いっしょに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-18', $$一緒に帰りましょう。$$, $$いっしょにかえりましょう。$$, $$Vamos voltar juntos.$$),
    ('n5-grammar-18', $$友達と一緒に映画を見ました。$$, $$ともだちといっしょにえいがをみました。$$, $$Vi um filme junto com um amigo.$$),
    ('n5-grammar-18', $$週末、一緒に買い物に行きませんか。$$, $$しゅうまつ、いっしょにかいものにいきませんか。$$, $$Quer ir fazer compras comigo no fim de semana?$$),
    ('n5-grammar-18', $$毎朝、犬と一緒に公園を散歩します。$$, $$まいあさ、いぬといっしょにこうえんをさんぽします。$$, $$Toda manhã, passeio no parque junto com o cachorro.$$),
    ('n5-grammar-18', $$今は家族と一緒に住んでいます。$$, $$いまはかぞくといっしょにすんでいます。$$, $$Agora moro junto com a minha família.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日、____勉強しませんか。$$, $$Amanhã, quer estudar junto comigo?$$),
        (2, $$母と____料理を作りました。$$, $$Fiz comida junto com a minha mãe.$$),
        (3, $$みんなで____歌いましょう。$$, $$Vamos todos cantar juntos.$$),
        (4, $$いつか彼女と____旅行に行きたいです。$$, $$Algum dia quero viajar junto com a minha namorada.$$),
        (5, $$子供のころ、よく祖父と____釣りに行きました。$$, $$Quando era criança, eu ia muito pescar junto com meu avô.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-18', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一緒に$$),
        (1, $$いっしょに$$),
        (2, $$一緒に$$),
        (2, $$いっしょに$$),
        (3, $$一緒に$$),
        (3, $$いっしょに$$),
        (4, $$一緒に$$),
        (4, $$いっしょに$$),
        (5, $$一緒に$$),
        (5, $$いっしょに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-19 — いつも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-19',
    'grammar',
    'N5',
    $$いつも$$,
    $$itsumo$$,
    $$Sempre / Normalmente / De costume$$,
    $$いつも significa "sempre". Ele mostra que algo acontece toda vez, de forma constante ou como hábito.

Como é um advérbio, ele normalmente aparece antes do verbo ou do adjetivo, e pode ficar no começo da frase ou logo depois do tema.

Com verbos no presente, いつも expressa hábitos e rotinas. Com adjetivos ou descrições, mostra uma característica que aparece o tempo todo.

Quando vem antes de の e de um substantivo, いつもの quer dizer "o de sempre", "o de costume". E, em comparações com より, いつも funciona como "o normal", o padrão do dia a dia.$$,
    $$A expressão いつもありがとうございます é um agradecimento muito comum, usado para agradecer por tudo o que a pessoa faz normalmente, e não por algo específico.

いつも indica uma frequência quase total. Para frequências menores, o japonês usa palavras como よく (com frequência), 時々 (às vezes) e あまり〜ない (não muito).

いつも é diferente de ずっと: いつも fala de algo que se repete, enquanto ずっと fala de algo contínuo, sem interrupção.$$,
    $$いつも + Verbo (hábito)
いつも + Adjetivo / Substantivo + です
いつもの + Substantivo (o de sempre)
いつも + より (comparado com o normal)$$,
    $$いつも$$,
    $$いつも$$,
    ARRAY['いつも']::text[],
    ARRAY['いつも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-19', $$私はいつも七時に起きます。$$, $$わたしはいつもしちじにおきます。$$, $$Eu sempre acordo às sete.$$),
    ('n5-grammar-19', $$田中さんはいつも元気ですね。$$, $$たなかさんはいつもげんきですね。$$, $$O Tanaka está sempre animado, né?$$),
    ('n5-grammar-19', $$いつもの店で会いましょう。$$, $$いつものみせであいましょう。$$, $$Vamos nos encontrar no lugar de sempre.$$),
    ('n5-grammar-19', $$朝はいつもコーヒーを飲みます。$$, $$あさはいつもコーヒーをのみます。$$, $$De manhã, sempre tomo café.$$),
    ('n5-grammar-19', $$いつもありがとうございます。$$, $$いつもありがとうございます。$$, $$Obrigado por sempre me ajudar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父は____新聞を読んでいます。$$, $$Meu pai está sempre lendo jornal.$$),
        (2, $$姉は____忙しいです。$$, $$Minha irmã mais velha está sempre ocupada.$$),
        (3, $$昼ご飯は____会社の食堂で食べます。$$, $$Sempre almoço no refeitório da empresa.$$),
        (4, $$今日は____より早く起きました。$$, $$Hoje acordei mais cedo do que de costume.$$),
        (5, $$すみません、____のコーヒーをください。$$, $$Com licença, me dê o café de sempre.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-19', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いつも$$),
        (2, $$いつも$$),
        (3, $$いつも$$),
        (4, $$いつも$$),
        (5, $$いつも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-20 — 〜じゃない・〜ではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-20',
    'grammar',
    'N5',
    $$〜じゃない・〜ではない$$,
    $$ja nai / dewa nai$$,
    $$Não é / Não está / Não ser$$,
    $$じゃない e ではない são a forma negativa de だ e です. Eles servem para dizer que algo "não é" alguma coisa.

São usados depois de substantivos e de adjetivos な (sem o な). Com adjetivos い, o negativo é diferente: usa-se くない.

A diferença entre as duas formas é o tom. ではない é a forma completa e soa mais formal e mais adequada à escrita. じゃない é a contração falada de では e é a mais comum nas conversas.

Para deixar educado, existem duas opções: じゃありません / ではありません, que são mais formais, e じゃないです / ではないです, que são educadas mas um pouco mais leves.

Com entonação de pergunta, じゃない também pode ser usado para confirmar algo que a pessoa acha que é verdade, como "não é o Tanaka?".$$,
    $$Na escrita formal, como relatórios e textos acadêmicos, prefere-se ではない. Na fala cotidiana, じゃない aparece muito mais.

O uso de じゃない como confirmação depende da entonação: subindo no final, a frase vira uma pergunta do tipo "não é?". Esse uso também aparece com verbos e adjetivos, como em "não é bom?".

Um erro comum é usar じゃない com adjetivos い, como dizer 高いじゃない querendo dizer "não é caro". O correto é 高くない.$$,
    $$Substantivo + じゃない / ではない
Adjetivo な (sem な) + じゃない / ではない

Educado: じゃありません / ではありません / じゃないです / ではないです
Passado: じゃなかった / ではなかった
Passado educado: じゃありませんでした / ではありませんでした / じゃなかったです / ではなかったです$$,
    $$ではない$$,
    $$じゃない|ではない|じゃありません|ではありません|じゃなかった|ではなかった$$,
    ARRAY['じゃ', 'では', 'ない']::text[],
    ARRAY['じゃない', 'ではない', 'じゃありません', 'ではありません', 'じゃないです', 'ではないです', 'じゃなかった', 'ではなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-20', $$私は医者じゃない。$$, $$わたしはいしゃじゃない。$$, $$Eu não sou médico.$$),
    ('n5-grammar-20', $$これは私の傘ではありません。$$, $$これはわたしのかさではありません。$$, $$Este não é o meu guarda-chuva.$$),
    ('n5-grammar-20', $$この町はあまり静かじゃないです。$$, $$このまちはあまりしずかじゃないです。$$, $$Esta cidade não é muito tranquila.$$),
    ('n5-grammar-20', $$昨日は休みじゃなかった。$$, $$きのうはやすみじゃなかった。$$, $$Ontem não foi folga.$$),
    ('n5-grammar-20', $$野菜はあまり好きではありません。$$, $$やさいはあまりすきではありません。$$, $$Não gosto muito de verdura.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は学生____。$$, $$Ele não é estudante.$$),
        (2, $$この部屋はあまりきれい____。$$, $$Este quarto não está muito limpo.$$),
        (3, $$今日は月曜日____。火曜日です。$$, $$Hoje não é segunda-feira. É terça.$$),
        (4, $$昨日のテストは簡単____。$$, $$A prova de ontem não foi fácil.$$),
        (5, $$「あれ、田中さん____？」「うん、そうだよ。」$$, $$"Ei, aquele não é o Tanaka?" "É, sim."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-20', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$じゃない$$),
        (1, $$ではない$$),
        (1, $$じゃありません$$),
        (1, $$ではありません$$),
        (1, $$じゃないです$$),
        (1, $$ではないです$$),
        (2, $$じゃない$$),
        (2, $$ではない$$),
        (2, $$じゃありません$$),
        (2, $$ではありません$$),
        (2, $$じゃないです$$),
        (2, $$ではないです$$),
        (3, $$じゃありません$$),
        (3, $$ではありません$$),
        (3, $$じゃないです$$),
        (3, $$ではないです$$),
        (4, $$じゃなかった$$),
        (4, $$ではなかった$$),
        (4, $$じゃありませんでした$$),
        (4, $$ではありませんでした$$),
        (4, $$じゃなかったです$$),
        (4, $$ではなかったです$$),
        (5, $$じゃない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-21 — か
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-21',
    'grammar',
    'N5',
    $$か$$,
    $$ka$$,
    $$Partícula de pergunta / Será que$$,
    $$か é a partícula que transforma uma frase em pergunta. Ela fica no final da frase e funciona como o ponto de interrogação falado do japonês.

Com a forma educada (です e ます), basta colocar か no final para fazer uma pergunta. Por isso, na escrita japonesa tradicional, muitas vezes nem se usa o símbolo de interrogação: o か já mostra que é uma pergunta.

か também aparece no meio da frase para formar perguntas indiretas, como "sei onde...", "não sei a que horas...". Nesse caso, a pergunta fica dentro de uma frase maior.

Com ませんか, か forma convites educados. E na resposta そうですか, ele não é exatamente uma pergunta, mas mostra que você recebeu e entendeu a informação, como "ah, é?" ou "entendi".$$,
    $$Na fala informal, か no final costuma ser substituído por entonação subindo ou pela partícula の. Usar か sozinho com a forma simples pode soar brusco, principalmente na fala masculina.

Com substantivos e adjetivos な na forma simples, o だ desaparece antes de か na pergunta indireta.

A entonação de そうですか muda o sentido: descendo, mostra que você entendeu; subindo, mostra surpresa ou dúvida.$$,
    $$Frase educada (です / ます) + か
Palavra interrogativa + … + か
Frase na forma simples + か + 知っています / わかりません (pergunta indireta)
Verbo ません + か (convite)
そうですか (reação a uma informação)$$,
    $$か$$,
    $$か$$,
    ARRAY['か']::text[],
    ARRAY['か']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-21', $$これは何ですか。$$, $$これはなんですか。$$, $$O que é isto?$$),
    ('n5-grammar-21', $$明日、学校に行きますか。$$, $$あした、がっこうにいきますか。$$, $$Você vai à escola amanhã?$$),
    ('n5-grammar-21', $$田中さんがどこにいるか知っていますか。$$, $$たなかさんがどこにいるかしっていますか。$$, $$Você sabe onde o Tanaka está?$$),
    ('n5-grammar-21', $$一緒に行きませんか。$$, $$いっしょにいきませんか。$$, $$Quer ir junto?$$),
    ('n5-grammar-21', $$「明日は休みです。」「そうですか。」$$, $$「あしたはやすみです。」「そうですか。」$$, $$"Amanhã é folga." "Ah, é?"$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あなたは学生です____。$$, $$Você é estudante?$$),
        (2, $$すみません、トイレはどこです____。$$, $$Com licença, onde fica o banheiro?$$),
        (3, $$昨日、何を食べました____。$$, $$O que você comeu ontem?$$),
        (4, $$会議が何時に始まる____わかりません。$$, $$Não sei a que horas a reunião começa.$$),
        (5, $$「来週、テストがあります。」「そうです____。」$$, $$"Semana que vem tem prova." "Ah, é?"$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-21', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$か$$),
        (2, $$か$$),
        (3, $$か$$),
        (4, $$か$$),
        (5, $$か$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-22 — 〜か〜か
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-22',
    'grammar',
    'N5',
    $$〜か〜か$$,
    $$ka ~ ka$$,
    $$Ou / Se... ou...$$,
    $$か também é usado para apresentar opções, com o sentido de "ou". Quando você coloca か entre duas coisas, mostra que é uma ou outra.

Com substantivos, a forma mais simples é A か B. O segundo か, depois de B, é opcional nesse caso e aparece mais quando se quer deixar bem claro que são alternativas.

Com verbos, a estrutura com dois か é muito comum para expressar dúvida entre duas possibilidades, como "se vai ou não vai". Nesse caso, junta-se o verbo afirmativo e o negativo, cada um seguido de か.

Essa construção aparece muito com verbos como decidir, saber, escolher e perguntar.$$,
    $$A construção com か é diferente de や e と. と junta todas as coisas ("A e B"), や dá exemplos ("A, B e outras coisas"), e か mostra que é uma das opções.

Na pergunta indireta com duas opções, o tom é de dúvida. Por isso, ela aparece com frequência ao falar de decisões que ainda não foram tomadas.

Com substantivos, também é muito comum a forma どちらか, que significa "um dos dois".$$,
    $$Substantivo A + か + Substantivo B
Substantivo A + か + Substantivo B + か
Verbo A + か + Verbo B + か
Verbo (forma simples) + か + Verbo (forma ない) + か (se... ou não)$$,
    $$か$$,
    $$か$$,
    ARRAY['か']::text[],
    ARRAY['か']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-22', $$月曜日か火曜日に来てください。$$, $$げつようびかかようびにきてください。$$, $$Venha na segunda ou na terça, por favor.$$),
    ('n5-grammar-22', $$コーヒーか紅茶、どちらがいいですか。$$, $$コーヒーかこうちゃ、どちらがいいですか。$$, $$Café ou chá, qual você prefere?$$),
    ('n5-grammar-22', $$いつも電車かバスで学校に行きます。$$, $$いつもでんしゃかバスでがっこうにいきます。$$, $$Sempre vou para a escola de trem ou de ônibus.$$),
    ('n5-grammar-22', $$パーティーに行くか行かないか、まだ決めていません。$$, $$パーティーにいくかいかないか、まだきめていません。$$, $$Ainda não decidi se vou à festa ou não.$$),
    ('n5-grammar-22', $$肉か魚か選んでください。$$, $$にくかさかなかえらんでください。$$, $$Escolha carne ou peixe, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$赤____青のペンを貸してください。$$, $$Me empresta uma caneta vermelha ou azul, por favor.$$),
        (2, $$夏休みは海____山に行きたいです。$$, $$Nas férias de verão, quero ir para a praia ou para a montanha.$$),
        (3, $$晩ご飯はラーメン____カレーにしましょう。$$, $$Vamos jantar ramen ou curry.$$),
        (4, $$その話が本当____うそか、わかりません。$$, $$Não sei se essa história é verdade ou mentira.$$),
        (5, $$彼が来る____来ないか、誰も知りません。$$, $$Ninguém sabe se ele vem ou não.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-22', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$か$$),
        (2, $$か$$),
        (3, $$か$$),
        (4, $$か$$),
        (5, $$か$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-23 — から
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-23',
    'grammar',
    'N5',
    $$から$$,
    $$kara$$,
    $$Porque / Por isso / De / Desde / A partir de$$,
    $$から tem dois usos principais no N5, e os dois partem da mesma ideia de "origem".

O primeiro é indicar o motivo. Quando から vem depois de uma frase, ele mostra que aquilo é a causa do que vem depois. A ordem é a contrária do português: primeiro o motivo, depois o resultado. Você pode traduzir como "porque", "como" ou "então", conforme a frase.

O segundo é indicar o ponto de partida, seja de lugar ou de tempo. Depois de um substantivo, から significa "de", "desde" ou "a partir de".

No uso de motivo, から pode vir depois da forma simples ou da forma educada. Com substantivos e adjetivos な, é preciso colocar だ ou です antes de から.

A resposta a uma pergunta com どうして costuma terminar com から, como uma explicação curta.$$,
    $$から para motivo soa mais subjetivo e direto que ので. Por isso, ele é ótimo para conversas do dia a dia, mas pode soar um pouco forte em pedidos formais ou desculpas.

Não confunda から sozinho com てから, que significa "depois de fazer" e é outra gramática.

Para receber algo de alguém, os verbos もらう e 借りる podem usar から ou に para marcar a pessoa.$$,
    $$Motivo:
Verbo / Adjetivo い (forma simples ou educada) + から
Substantivo / Adjetivo な + だ / です + から
… + からです (resposta com o motivo)

Ponto de partida:
Substantivo (lugar) + から
Substantivo (tempo) + から$$,
    $$から$$,
    $$から$$,
    ARRAY['から']::text[],
    ARRAY['から', 'だから', 'ですから']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-23', $$雨が降っているから、家にいます。$$, $$あめがふっているから、いえにいます。$$, $$Como está chovendo, vou ficar em casa.$$),
    ('n5-grammar-23', $$今日は日曜日だから、学校は休みです。$$, $$きょうはにちようびだから、がっこうはやすみです。$$, $$Hoje é domingo, então não tem aula.$$),
    ('n5-grammar-23', $$授業は九時から始まります。$$, $$じゅぎょうはくじからはじまります。$$, $$A aula começa às nove.$$),
    ('n5-grammar-23', $$ブラジルから来ました。$$, $$ブラジルからきました。$$, $$Vim do Brasil.$$),
    ('n5-grammar-23', $$「どうして食べないの？」「お腹がいっぱいだから。」$$, $$「どうしてたべないの？」「おなかがいっぱいだから。」$$, $$"Por que você não come?" "Porque estou cheio."$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$寒い____、窓を閉めてください。$$, $$Está frio, então feche a janela, por favor.$$),
        (2, $$この銀行は九時____です。$$, $$Este banco abre a partir das nove.$$),
        (3, $$駅____家まで歩きました。$$, $$Andei da estação até a casa.$$),
        (4, $$明日はテストだ____、今日は勉強します。$$, $$Amanhã tem prova, então hoje vou estudar.$$),
        (5, $$「どうして遅れたんですか。」「電車が遅れた____です。」$$, $$"Por que você se atrasou?" "Porque o trem atrasou."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-23', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$から$$),
        (2, $$から$$),
        (3, $$から$$),
        (4, $$から$$),
        (5, $$から$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-24 — 〜方
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-24',
    'grammar',
    'N5',
    $$〜方$$,
    $$kata$$,
    $$Jeito de / Modo de / Maneira de$$,
    $$方 (lido かた) é usado depois de um verbo para formar a ideia de "jeito de fazer", "modo de fazer" ou "como fazer".

Para isso, tira-se ます da forma educada do verbo e coloca-se 方. O resultado é um substantivo, então ele pode ser usado com partículas como を, が e は.

Como a nova palavra é um substantivo, o objeto do verbo original não usa mais を: ele passa a usar の. Assim, "o jeito de ler o kanji" fica com の entre o kanji e o verbo.

Com verbos com する, como 勉強する, a forma fica 勉強の仕方, usando し方 (às vezes escrito 仕方).$$,
    $$方 também tem outros sentidos. Lido かた, ele é uma forma educada de dizer "pessoa", como em あの方. Lido ほう, ele aparece em comparações e em ほうがいい.

A expressão 仕方がない significa "não tem jeito" e vem justamente da ideia de "não existe um modo de fazer".

Algumas formas são tão comuns que viraram vocabulário próprio, como 読み方 (leitura), 使い方 (modo de usar) e 行き方 (como chegar).$$,
    $$Verbo na forma ます sem ます + 方
Substantivo + の + Verbo sem ます + 方
Substantivo + の + し方 / 仕方 (verbos com する)

Escrita: 方 / かた$$,
    $$方$$,
    $$方|かた$$,
    ARRAY['方']::text[],
    ARRAY['方', 'かた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-24', $$この漢字の読み方を教えてください。$$, $$このかんじのよみかたをおしえてください。$$, $$Me ensine a leitura deste kanji, por favor.$$),
    ('n5-grammar-24', $$駅までの行き方がわかりません。$$, $$えきまでのいきかたがわかりません。$$, $$Não sei como chegar até a estação.$$),
    ('n5-grammar-24', $$このアプリの使い方は簡単です。$$, $$このアプリのつかいかたはかんたんです。$$, $$O jeito de usar este aplicativo é fácil.$$),
    ('n5-grammar-24', $$母にカレーの作り方を習いました。$$, $$ははにカレーのつくりかたをならいました。$$, $$Aprendi com minha mãe a fazer curry.$$),
    ('n5-grammar-24', $$先生は話し方がとても優しいです。$$, $$せんせいははなしかたがとてもやさしいです。$$, $$O professor tem um jeito de falar muito gentil.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お箸の持ち____を教えてください。$$, $$Me ensine a segurar os hashis, por favor.$$),
        (2, $$このパソコンの使い____がわかりません。$$, $$Não sei usar este computador.$$),
        (3, $$日本語の手紙の書き____を勉強しています。$$, $$Estou estudando como escrever cartas em japonês.$$),
        (4, $$切符の買い____を駅員さんに聞きました。$$, $$Perguntei ao funcionário da estação como comprar a passagem.$$),
        (5, $$彼は歩き____がお父さんに似ています。$$, $$O jeito de andar dele parece com o do pai.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-24', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$方$$),
        (1, $$かた$$),
        (2, $$方$$),
        (2, $$かた$$),
        (3, $$方$$),
        (3, $$かた$$),
        (4, $$方$$),
        (4, $$かた$$),
        (5, $$方$$),
        (5, $$かた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-25 — 〜けど
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-25',
    'grammar',
    'N5',
    $$〜けど$$,
    $$kedo$$,
    $$Mas / Porém / Embora$$,
    $$けど é usado para ligar duas ideias que se contrastam, com o sentido de "mas" ou "embora". Ele fica no final da primeira parte da frase, juntando tudo em uma frase só.

É muito usado na conversa informal. Pode vir depois da forma simples ou da forma educada. Com substantivos e adjetivos な, coloca-se だ antes de けど na forma simples.

Além do contraste, けど também tem uma função muito japonesa: suavizar. Quando uma frase termina com けど e o resto fica "no ar", a pessoa está introduzindo um assunto, fazendo um pedido indireto ou evitando soar direta demais.

Por exemplo, ao pedir ajuda ou fazer uma pergunta, terminar com けど deixa espaço para o outro responder, sem pressão.$$,
    $$けど é a forma mais curta e casual da família けれども, けれど e けど. Em situações formais e na escrita, けれども ou が são mais adequados.

O uso de けど no final da frase para suavizar é muito comum ao falar com atendentes, professores ou desconhecidos, e não soa mal-educado.

Às vezes けど não indica contraste forte, mas apenas apresenta um contexto antes da informação principal.$$,
    $$Verbo / Adjetivo い (forma simples ou educada) + けど + Frase
Substantivo / Adjetivo な + だ + けど + Frase
Substantivo / Adjetivo な + です + けど + Frase
Frase + けど (final suavizado, sem completar)$$,
    $$けど$$,
    $$けど$$,
    ARRAY['けど']::text[],
    ARRAY['けど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-25', $$この店は高いけど、おいしいです。$$, $$このみせはたかいけど、おいしいです。$$, $$Este restaurante é caro, mas é gostoso.$$),
    ('n5-grammar-25', $$行きたいけど、時間がない。$$, $$いきたいけど、じかんがない。$$, $$Quero ir, mas não tenho tempo.$$),
    ('n5-grammar-25', $$日本語は難しいけど、おもしろい。$$, $$にほんごはむずかしいけど、おもしろい。$$, $$Japonês é difícil, mas é interessante.$$),
    ('n5-grammar-25', $$雨だけど、出かけます。$$, $$あめだけど、でかけます。$$, $$Está chovendo, mas vou sair.$$),
    ('n5-grammar-25', $$すみません、ちょっと聞きたいことがあるんですけど…。$$, $$すみません、ちょっとききたいことがあるんですけど…。$$, $$Com licença, eu queria perguntar uma coisa...$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$薬を飲んだ____、まだ頭が痛いです。$$, $$Tomei remédio, mas ainda estou com dor de cabeça.$$),
        (2, $$兄は背が高い____、私は低いです。$$, $$Meu irmão mais velho é alto, mas eu sou baixo.$$),
        (3, $$今日は休みだ____、仕事に行きます。$$, $$Hoje é folga, mas vou trabalhar.$$),
        (4, $$このアパートは安い____、駅から遠いです。$$, $$Este apartamento é barato, mas é longe da estação.$$),
        (5, $$あのう、駅に行きたいんです____…。$$, $$Hum, eu queria ir à estação...$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-25', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$けど$$),
        (2, $$けど$$),
        (3, $$けど$$),
        (4, $$けど$$),
        (5, $$けど$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-26 — 〜けれども
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-26',
    'grammar',
    'N5',
    $$〜けれども$$,
    $$keredomo$$,
    $$Mas / Porém / Embora / No entanto$$,
    $$けれども tem o mesmo significado de けど: liga duas ideias que se contrastam, como "mas" ou "embora". A diferença está no tom.

けれども é a forma completa e soa mais educada e cuidadosa. Por isso, combina bem com a forma です e ます, com situações de trabalho, conversas com pessoas mais velhas e textos escritos.

Ele pode ficar no final da primeira parte da frase, ligando as duas ideias, ou no começo de uma nova frase, com o sentido de "no entanto".

Assim como けど, けれども também pode suavizar pedidos e perguntas, deixando a frase mais delicada.$$,
    $$As três formas, けれども, けれど e けど, são a mesma palavra em níveis diferentes de formalidade. Conhecer as três ajuda a reconhecer o tom de quem fala.

Na escrita muito formal, como relatórios e jornais, é comum usar が ou しかし no lugar de けれども.

Começar a frase com けれども soa um pouco mais formal e literário do que começar com でも.$$,
    $$Frase (forma educada ou simples) + けれども + Frase
Substantivo / Adjetivo な + です / だ + けれども + Frase
Frase 1 (com ponto final) + けれども、 + Frase 2

Do mais formal ao mais informal: けれども → けれど → けど$$,
    $$けれども$$,
    $$けれども|けれど$$,
    ARRAY['けれども']::text[],
    ARRAY['けれども', 'けれど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-26', $$一生懸命練習したけれども、試合に負けました。$$, $$いっしょうけんめいれんしゅうしたけれども、しあいにまけました。$$, $$Treinei muito, mas perdi a partida.$$),
    ('n5-grammar-26', $$この服はきれいですけれども、少し高いです。$$, $$このふくはきれいですけれども、すこしたかいです。$$, $$Esta roupa é bonita, mas é um pouco cara.$$),
    ('n5-grammar-26', $$雪が降っていますけれども、学校は休みになりません。$$, $$ゆきがふっていますけれども、がっこうはやすみになりません。$$, $$Está nevando, mas as aulas não vão ser canceladas.$$),
    ('n5-grammar-26', $$説明を聞いた。けれども、よくわからなかった。$$, $$せつめいをきいた。けれども、よくわからなかった。$$, $$Ouvi a explicação. No entanto, não entendi bem.$$),
    ('n5-grammar-26', $$すみませんけれども、もう少しゆっくり話してください。$$, $$すみませんけれども、もうすこしゆっくりはなしてください。$$, $$Desculpe, mas fale um pouco mais devagar, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$何度も電話しました____、彼は出ませんでした。$$, $$Liguei várias vezes, mas ele não atendeu.$$),
        (2, $$この料理は見た目は普通です____、とてもおいしいです。$$, $$Esta comida tem aparência comum, mas é muito gostosa.$$),
        (3, $$部屋は狭いです____、明るくて気持ちがいいです。$$, $$O quarto é pequeno, mas é claro e agradável.$$),
        (4, $$頑張りました。____、合格できませんでした。$$, $$Me esforcei. No entanto, não consegui passar.$$),
        (5, $$失礼です____、どちら様ですか。$$, $$Desculpe, mas quem é o senhor?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-26', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$けれども$$),
        (1, $$けれど$$),
        (2, $$けれども$$),
        (2, $$けれど$$),
        (3, $$けれども$$),
        (3, $$けれど$$),
        (4, $$けれども$$),
        (4, $$けれど$$),
        (5, $$けれども$$),
        (5, $$けれど$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-27 — まだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-27',
    'grammar',
    'N5',
    $$まだ$$,
    $$mada$$,
    $$Ainda / Ainda não$$,
    $$まだ significa "ainda". Ele mostra que uma situação continua igual e ainda não mudou.

Com frases afirmativas, まだ indica que algo continua acontecendo ou continua sendo verdade, como ainda estar dormindo, ainda ter tempo ou ainda ser estudante.

Com frases negativas, まだ significa "ainda não", ou seja, algo que se espera que aconteça, mas que não aconteceu até agora.

Sozinho, na resposta まだです ou só まだ, ele significa "ainda não". É a resposta natural quando alguém pergunta se você já fez alguma coisa.

O oposto de まだ é もう, que significa "já".$$,
    $$Na resposta まだです, não é preciso repetir o verbo; o contexto já deixa claro do que se trata.

まだ pode indicar que ainda falta pouco ou que ainda há margem, como em ainda ter tempo, ainda dar para ir.

Muitas vezes まだ tem um tom de "ainda não, mas vai acontecer". Por isso, ele combina com coisas que se espera fazer no futuro.$$,
    $$まだ + Verbo na forma ている (ainda está fazendo)
まだ + Adjetivo / Substantivo + です
まだ + Verbo na forma ていない / ていません (ainda não fez)
まだです / まだ (resposta: ainda não)$$,
    $$まだ$$,
    $$まだ$$,
    ARRAY['まだ']::text[],
    ARRAY['まだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-27', $$弟はまだ寝ています。$$, $$おとうとはまだねています。$$, $$Meu irmão mais novo ainda está dormindo.$$),
    ('n5-grammar-27', $$まだ時間がありますよ。$$, $$まだじかんがありますよ。$$, $$Ainda temos tempo.$$),
    ('n5-grammar-27', $$外はまだ明るいです。$$, $$そとはまだあかるいです。$$, $$Lá fora ainda está claro.$$),
    ('n5-grammar-27', $$「宿題は終わった？」「ううん、まだ。」$$, $$「しゅくだいはおわった？」「ううん、まだ。」$$, $$"Terminou a lição?" "Não, ainda não."$$),
    ('n5-grammar-27', $$日本語はまだ下手ですが、毎日勉強しています。$$, $$にほんごはまだへたですが、まいにちべんきょうしています。$$, $$Meu japonês ainda é fraco, mas estudo todo dia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨が____降っています。$$, $$Ainda está chovendo.$$),
        (2, $$「もう昼ご飯を食べましたか。」「いいえ、____です。」$$, $$"Você já almoçou?" "Não, ainda não."$$),
        (3, $$父は____会社にいます。$$, $$Meu pai ainda está na empresa.$$),
        (4, $$私は____学生です。$$, $$Eu ainda sou estudante.$$),
        (5, $$____五時なのに、外はもう暗い。$$, $$Ainda são cinco horas, mas lá fora já está escuro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-27', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まだ$$),
        (2, $$まだ$$),
        (3, $$まだ$$),
        (4, $$まだ$$),
        (5, $$まだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-28 — まだ〜ていません
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-28',
    'grammar',
    'N5',
    $$まだ〜ていません$$,
    $$mada ~ te imasen$$,
    $$Ainda não (fiz) / Ainda não aconteceu$$,
    $$まだ〜ていません é usado para dizer que algo ainda não foi feito ou ainda não aconteceu até agora, mas que pode ou deve acontecer depois.

A estrutura junta まだ (ainda) com o verbo na forma て seguido de いません. A forma ている aqui não indica uma ação em andamento, e sim um estado: "estar sem ter feito". A ideia é que a situação "não feito" continua até o momento atual.

Um ponto muito importante: em japonês, para dizer "ainda não fiz", não se usa o passado negativo ませんでした. O passado negativo indica que algo não aconteceu em um momento terminado do passado, enquanto まだ〜ていません fala do estado atual.

Na forma informal, usa-se ていない, e na fala casual é comum reduzir para てない.$$,
    $$Responder "ainda não" a uma pergunta com もう〜ましたか pode ser feito de duas formas: com a frase completa usando ていません, ou de forma curta com まだです.

Usar ませんでした no lugar de ていません é um erro muito comum de estudantes. Com ませんでした, a frase passa a ideia de que a oportunidade já acabou.

Na fala rápida, a forma ていない vira てない, e でいない vira でない.$$,
    $$まだ + Verbo na forma て + いません (educado)
まだ + Verbo na forma て + いない (informal)
まだ + Verbo na forma て + ない (informal falado)$$,
    $$ていません$$,
    $$ていません|でいません|ていない|でいない$$,
    ARRAY['まだ', 'て', 'いません']::text[],
    ARRAY['ていません', 'でいません', 'ていない', 'でいない', 'てない', 'でない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-28', $$まだ昼ご飯を食べていません。$$, $$まだひるごはんをたべていません。$$, $$Ainda não almocei.$$),
    ('n5-grammar-28', $$その映画はまだ見ていません。$$, $$そのえいがはまだみていません。$$, $$Ainda não vi esse filme.$$),
    ('n5-grammar-28', $$宿題がまだ終わっていない。$$, $$しゅくだいがまだおわっていない。$$, $$A lição ainda não terminou.$$),
    ('n5-grammar-28', $$田中さんはまだ来ていませんね。$$, $$たなかさんはまだきていませんね。$$, $$O Tanaka ainda não chegou, né?$$),
    ('n5-grammar-28', $$その本は買ったけど、まだ読んでいません。$$, $$そのほんはかったけど、まだよんでいません。$$, $$Comprei esse livro, mas ainda não li.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$まだ部屋を掃除し____。$$, $$Ainda não limpei o quarto.$$),
        (2, $$「レポートはもう出しましたか。」「いいえ、まだ出し____。」$$, $$"Você já entregou o relatório?" "Não, ainda não entreguei."$$),
        (3, $$バスはまだ来____。$$, $$O ônibus ainda não veio.$$),
        (4, $$新しい漢字をまだ覚え____。$$, $$Ainda não decorei os kanji novos.$$),
        (5, $$薬はもらったけど、まだ飲ん____。$$, $$Peguei o remédio, mas ainda não tomei.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-28', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ていません$$),
        (1, $$ていない$$),
        (2, $$ていません$$),
        (3, $$ていません$$),
        (3, $$ていない$$),
        (4, $$ていません$$),
        (4, $$ていない$$),
        (5, $$でいません$$),
        (5, $$でいない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-29 — まで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-29',
    'grammar',
    'N5',
    $$まで$$,
    $$made$$,
    $$Até / Até que$$,
    $$まで indica o limite final de algo, seja de lugar, de tempo ou de ação. Equivale a "até".

Depois de um lugar, mostra até onde se vai. Depois de um horário ou data, mostra até quando algo continua.

Depois de um verbo na forma de dicionário, まで significa "até que": a primeira ação continua acontecendo até o momento em que a segunda acontece.

É muito comum usar まで junto com から, formando a ideia de "de... até...", tanto para lugares quanto para horários.

Um ponto importante: まで indica que a ação continua o tempo todo até aquele limite. Para dizer "até tal hora" no sentido de prazo, ou seja, fazer algo antes daquele momento, usa-se までに, que é outra gramática.$$,
    $$A diferença entre まで e までに é um erro clássico. まで fala de algo contínuo até o limite; までに fala de um prazo final.

まで também pode significar "até mesmo" depois de substantivos, mostrando que algo vai além do esperado. Esse uso aparece mais em níveis seguintes.

Em horários de funcionamento, a forma 〜までです é uma maneira natural de dizer até quando algo fica aberto ou acontece.$$,
    $$Substantivo (lugar) + まで
Substantivo (tempo) + まで
Verbo na forma de dicionário + まで (até que)
Substantivo + から + Substantivo + まで$$,
    $$まで$$,
    $$まで$$,
    ARRAY['まで']::text[],
    ARRAY['まで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-29', $$駅まで歩きます。$$, $$えきまであるきます。$$, $$Vou a pé até a estação.$$),
    ('n5-grammar-29', $$この店は夜十時までです。$$, $$このみせはよるじゅうじまでです。$$, $$Esta loja funciona até as dez da noite.$$),
    ('n5-grammar-29', $$昨日は夜遅くまで勉強しました。$$, $$きのうはよるおそくまでべんきょうしました。$$, $$Ontem estudei até tarde da noite.$$),
    ('n5-grammar-29', $$東京から大阪まで新幹線で行きました。$$, $$とうきょうからおおさかまでしんかんせんでいきました。$$, $$Fui de Tóquio até Osaka de trem-bala.$$),
    ('n5-grammar-29', $$バスが来るまで、ここで待ちましょう。$$, $$バスがくるまで、ここでまちましょう。$$, $$Vamos esperar aqui até o ônibus chegar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日、五時____働きます。$$, $$Todo dia, trabalho até as cinco.$$),
        (2, $$空港____タクシーで行きました。$$, $$Fui de táxi até o aeroporto.$$),
        (3, $$夏休みは八月三十一日____です。$$, $$As férias de verão vão até 31 de agosto.$$),
        (4, $$雨がやむ____、ここにいましょう。$$, $$Vamos ficar aqui até a chuva parar.$$),
        (5, $$この本を最後____読んでください。$$, $$Leia este livro até o final, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-29', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まで$$),
        (2, $$まで$$),
        (3, $$まで$$),
        (4, $$まで$$),
        (5, $$まで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-30 — 〜前に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-30',
    'grammar',
    'N5',
    $$〜前に$$,
    $$mae ni$$,
    $$Antes de / Há (tempo atrás)$$,
    $$前に é usado para dizer que uma ação acontece antes de outra. Equivale a "antes de".

Ele pode vir depois de um verbo ou de um substantivo. Com verbo, usa-se sempre a forma de dicionário, mesmo que a frase inteira esteja no passado. Isso acontece porque, no momento da primeira ação, a segunda ainda não tinha acontecido.

Com substantivo, coloca-se の entre o substantivo e 前に, como "antes da aula" ou "antes da refeição".

Depois de uma quantidade de tempo, sem の, 前に significa "atrás" ou "há", como "há três anos".$$,
    $$Usar o verbo no passado antes de 前に é um erro comum. Mesmo falando do passado, o verbo continua na forma de dicionário.

A palavra 前 também significa "frente". Quando se fala de um lugar, como a frente da estação, の前に indica posição, e não tempo. O contexto mostra qual sentido é usado.

O oposto de 前に é 後で (depois de), que usa o verbo na forma た.$$,
    $$Verbo na forma de dicionário + 前に
Substantivo + の + 前に
Período de tempo + 前に (há... / ... atrás)

Escrita: 前に / まえに$$,
    $$前に$$,
    $$前に|まえに$$,
    ARRAY['前', 'に']::text[],
    ARRAY['前に', 'まえに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-30', $$寝る前に歯を磨きます。$$, $$ねるまえにはをみがきます。$$, $$Escovo os dentes antes de dormir.$$),
    ('n5-grammar-30', $$食事の前に手を洗いましょう。$$, $$しょくじのまえにてをあらいましょう。$$, $$Vamos lavar as mãos antes da refeição.$$),
    ('n5-grammar-30', $$日本に来る前に、少し日本語を勉強しました。$$, $$にほんにくるまえに、すこしにほんごをべんきょうしました。$$, $$Antes de vir para o Japão, estudei um pouco de japonês.$$),
    ('n5-grammar-30', $$三年前に結婚しました。$$, $$さんねんまえにけっこんしました。$$, $$Casei há três anos.$$),
    ('n5-grammar-30', $$出かける前に、天気予報を見たほうがいいですよ。$$, $$でかけるまえに、てんきよほうをみたほうがいいですよ。$$, $$Antes de sair, é melhor ver a previsão do tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ご飯を食べる____、手を洗います。$$, $$Lavo as mãos antes de comer.$$),
        (2, $$授業の____宿題を出してください。$$, $$Entregue a lição antes da aula, por favor.$$),
        (3, $$二年____日本に来ました。$$, $$Vim para o Japão há dois anos.$$),
        (4, $$電車に乗る____、切符を買います。$$, $$Compro a passagem antes de pegar o trem.$$),
        (5, $$試験の____、もう一度復習しました。$$, $$Antes da prova, revisei mais uma vez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-30', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$前に$$),
        (1, $$まえに$$),
        (2, $$前に$$),
        (2, $$まえに$$),
        (3, $$前に$$),
        (3, $$まえに$$),
        (4, $$前に$$),
        (4, $$まえに$$),
        (5, $$前に$$),
        (5, $$まえに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-31 — 〜ませんか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-31',
    'grammar',
    'N5',
    $$〜ませんか$$,
    $$masen ka$$,
    $$Que tal...? / Você não quer...? / Vamos...?$$,
    $$ませんか é usado para fazer convites de forma educada. Equivale a "você não quer...?" ou "que tal...?".

A forma é negativa (ません) com か de pergunta, mas o sentido não é negativo. Perguntar "você não vai...?" deixa a outra pessoa livre para recusar, e por isso soa gentil e respeitoso.

Esse é o jeito mais educado e comum de convidar alguém no nível N5. Ele combina muito com 一緒に, quando você quer fazer algo junto com a pessoa.

Na fala informal, entre amigos, o mesmo convite é feito com a forma ない e entonação de pergunta, como "não quer ir?".$$,
    $$A diferença entre ませんか e ましょう está na pressão: ませんか pergunta a vontade do outro, enquanto ましょう já propõe a ação como se estivesse decidido. Por isso, ませんか é mais adequado para convidar alguém pela primeira vez.

Para recusar um convite de forma educada, os japoneses raramente dizem "não" diretamente. É comum usar ちょっと… e deixar a frase incompleta.

Quando alguém aceita um convite feito com ませんか, a resposta natural é いいですね ou ええ、〜ましょう.$$,
    $$Verbo na forma ます sem ます + ませんか
一緒に + Verbo ませんか

Informal: Verbo na forma ない + ？ (com entonação de pergunta)$$,
    $$ませんか$$,
    $$ませんか$$,
    ARRAY['ません', 'か']::text[],
    ARRAY['ませんか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-31', $$一緒に昼ご飯を食べませんか。$$, $$いっしょにひるごはんをたべませんか。$$, $$Quer almoçar comigo?$$),
    ('n5-grammar-31', $$週末、映画を見に行きませんか。$$, $$しゅうまつ、えいがをみにいきませんか。$$, $$Que tal irmos ver um filme no fim de semana?$$),
    ('n5-grammar-31', $$ちょっと休みませんか。$$, $$ちょっとやすみませんか。$$, $$Que tal descansarmos um pouco?$$),
    ('n5-grammar-31', $$今度、うちに遊びに来ませんか。$$, $$こんど、うちにあそびにきませんか。$$, $$Da próxima vez, não quer vir aqui em casa?$$),
    ('n5-grammar-31', $$「お茶でも飲みませんか。」「いいですね。」$$, $$「おちゃでものみませんか。」「いいですね。」$$, $$"Que tal tomarmos um chá?" "Boa ideia."$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日、一緒にテニスをし____。$$, $$Amanhã, quer jogar tênis comigo?$$),
        (2, $$日曜日、公園に行き____。$$, $$Que tal irmos ao parque no domingo?$$),
        (3, $$駅の前のカフェでコーヒーを飲み____。$$, $$Que tal tomarmos um café na cafeteria em frente à estação?$$),
        (4, $$「今晩、一緒にご飯を食べ____。」「すみません、今晩はちょっと…。」$$, $$"Quer jantar comigo hoje?" "Desculpe, hoje não dá..."$$),
        (5, $$夏休みに、一緒に沖縄へ行き____。$$, $$Nas férias de verão, não quer ir a Okinawa comigo?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-31', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ませんか$$),
        (2, $$ませんか$$),
        (3, $$ませんか$$),
        (4, $$ませんか$$),
        (5, $$ませんか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-32 — 〜ましょう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-32',
    'grammar',
    'N5',
    $$〜ましょう$$,
    $$mashou$$,
    $$Vamos... / Façamos...$$,
    $$ましょう é usado para propor ou combinar uma ação que será feita junto com outras pessoas. Equivale a "vamos...".

Ele tem um tom mais decidido que ませんか: em vez de perguntar se o outro quer, ele já sugere que todos façam a ação. Por isso, é muito usado quando a ideia já foi aceita, ou quando a pessoa está organizando um grupo.

Também é a resposta natural para aceitar um convite. Se alguém pergunta "vamos?" com ませんか, responder com ましょう significa "sim, vamos".

Em avisos, regras e instruções educadas, ましょう também aparece com o sentido de "vamos fazer assim", indicando um comportamento esperado de todos.$$,
    $$Para convidar alguém pela primeira vez, ませんか costuma soar mais gentil. ましょう funciona melhor quando o grupo já está de acordo ou quando quem fala está liderando.

Em escolas e lugares públicos, avisos com ましょう são muito comuns, como lembretes de boas maneiras.

A forma informal de ましょう é a forma volitiva, que aparece no N4. Entre amigos, ela é muito mais comum do que ましょう.$$,
    $$Verbo na forma ます sem ます + ましょう
一緒に + Verbo ましょう

Informal: forma volitiva do verbo (う / よう)$$,
    $$ましょう$$,
    $$ましょう$$,
    ARRAY['ましょう']::text[],
    ARRAY['ましょう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-32', $$さあ、始めましょう。$$, $$さあ、はじめましょう。$$, $$Bom, vamos começar.$$),
    ('n5-grammar-32', $$駅の前で会いましょう。$$, $$えきのまえであいましょう。$$, $$Vamos nos encontrar em frente à estação.$$),
    ('n5-grammar-32', $$疲れましたね。少し休みましょう。$$, $$つかれましたね。すこしやすみましょう。$$, $$Cansamos, né. Vamos descansar um pouco.$$),
    ('n5-grammar-32', $$「何か食べに行きませんか。」「ええ、行きましょう。」$$, $$「なにかたべにいきませんか。」「ええ、いきましょう。」$$, $$"Quer ir comer alguma coisa?" "Sim, vamos."$$),
    ('n5-grammar-32', $$図書館の中では静かにしましょう。$$, $$としょかんのなかではしずかにしましょう。$$, $$Dentro da biblioteca, vamos fazer silêncio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$もう時間ですね。じゃ、帰り____。$$, $$Já está na hora, né. Então, vamos voltar.$$),
        (2, $$「一緒に写真を撮りませんか。」「ええ、撮り____。」$$, $$"Quer tirar uma foto juntos?" "Sim, vamos tirar."$$),
        (3, $$明日は七時に駅で会い____。$$, $$Amanhã, vamos nos encontrar na estação às sete.$$),
        (4, $$みんなで一緒に歌を歌い____。$$, $$Vamos todos cantar uma música juntos.$$),
        (5, $$ゴミは決められた日に出し____。$$, $$Vamos colocar o lixo para fora nos dias determinados.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-32', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ましょう$$),
        (2, $$ましょう$$),
        (3, $$ましょう$$),
        (4, $$ましょう$$),
        (5, $$ましょう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-33 — 〜ましょうか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-33',
    'grammar',
    'N5',
    $$〜ましょうか$$,
    $$mashou ka$$,
    $$Vamos...? / Quer que eu...? / Devo...?$$,
    $$ましょうか é ましょう com か de pergunta. Ele tem dois usos principais.

O primeiro é oferecer ajuda. Quando a ação é feita por quem fala, a frase significa "quer que eu faça isso?". É um jeito educado de se oferecer para carregar algo, abrir uma janela, chamar um táxi.

O segundo é sugerir algo ao grupo de forma mais suave que ましょう. A pessoa propõe e, ao mesmo tempo, pergunta a opinião dos outros: "vamos...?".

Com palavras interrogativas, como 何, いつ e どこ, ましょうか serve para combinar detalhes junto com o outro, como "o que vamos comer?" ou "onde nos encontramos?".$$,
    $$Quando alguém se oferece com ましょうか, as respostas mais comuns são お願いします para aceitar e 大丈夫です ou いいえ、けっこうです para recusar com educação.

Para oferecer ajuda a um superior, ましょうか é natural e respeitoso. Em níveis mais altos, existem formas ainda mais formais, como お〜しましょうか.

O contexto mostra se a ação é de quem fala ou do grupo: se só quem fala vai agir, é uma oferta; se todos vão agir, é uma sugestão.$$,
    $$Verbo na forma ます sem ます + ましょうか
Palavra interrogativa + … + Verbo ましょうか

Informal: forma volitiva do verbo + か$$,
    $$ましょうか$$,
    $$ましょうか$$,
    ARRAY['ましょう', 'か']::text[],
    ARRAY['ましょうか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-33', $$荷物を持ちましょうか。$$, $$にもつをもちましょうか。$$, $$Quer que eu carregue a bagagem?$$),
    ('n5-grammar-33', $$窓を開けましょうか。$$, $$まどをあけましょうか。$$, $$Quer que eu abra a janela?$$),
    ('n5-grammar-33', $$そろそろ帰りましょうか。$$, $$そろそろかえりましょうか。$$, $$Vamos indo?$$),
    ('n5-grammar-33', $$明日は何時に会いましょうか。$$, $$あしたはなんじにあいましょうか。$$, $$Amanhã, que horas a gente se encontra?$$),
    ('n5-grammar-33', $$「タクシーを呼びましょうか。」「ええ、お願いします。」$$, $$「タクシーをよびましょうか。」「ええ、おねがいします。」$$, $$"Quer que eu chame um táxi?" "Sim, por favor."$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$暑いですね。エアコンをつけ____。$$, $$Está quente, né. Quer que eu ligue o ar-condicionado?$$),
        (2, $$その箱、重いでしょう。手伝い____。$$, $$Essa caixa deve estar pesada. Quer que eu ajude?$$),
        (3, $$次はどこへ行き____。$$, $$Aonde vamos agora?$$),
        (4, $$疲れましたね。ちょっと休み____。$$, $$Cansamos, né. Vamos descansar um pouco?$$),
        (5, $$「駅まで送り____。」「ありがとうございます。助かります。」$$, $$"Quer que eu te leve até a estação?" "Obrigado. Ajuda muito."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-33', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ましょうか$$),
        (2, $$ましょうか$$),
        (3, $$ましょうか$$),
        (4, $$ましょうか$$),
        (5, $$ましょうか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-34 — も
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-34',
    'grammar',
    'N5',
    $$も$$,
    $$mo$$,
    $$Também / Nem / Tanto... quanto...$$,
    $$も é uma partícula que significa "também". Ela mostra que a mesma coisa vale para mais de um elemento.

も ocupa o lugar de は, が e を: em vez de usar essas partículas, você coloca も. Já com outras partículas, como に, で e と, も fica depois delas, formando にも, でも e とも.

Quando aparece duas vezes, na forma A も B も, significa "tanto A quanto B" em frases afirmativas, e "nem A nem B" em frases negativas.

Depois de palavras interrogativas, como 何, 誰 e どこ, e com o verbo no negativo, も forma ideias como "nada", "ninguém" e "nenhum lugar".

Depois de uma quantidade, も dá ênfase, mostrando que o número é maior do que o esperado.$$,
    $$Dizer 何もありません é a forma natural de "não tem nada". Com 何 e も, o verbo precisa estar no negativo.

Um erro comum é juntar も com は, が ou を, como dizer 私はも. O correto é só 私も.

Na resposta curta, 私も sozinho significa "eu também", e é muito usado em conversas.$$,
    $$Substantivo + も (no lugar de は / が / を)
Substantivo + partícula + も (にも / でも / とも / へも)
A + も + B + も + afirmativo (tanto A quanto B)
A + も + B + も + negativo (nem A nem B)
Palavra interrogativa + も + negativo (nada / ninguém / nenhum lugar)
Quantidade + も (ênfase: "todo esse tanto")$$,
    $$も$$,
    $$も$$,
    ARRAY['も']::text[],
    ARRAY['も']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-34', $$私も学生です。$$, $$わたしもがくせいです。$$, $$Eu também sou estudante.$$),
    ('n5-grammar-34', $$兄も姉も東京に住んでいます。$$, $$あにもあねもとうきょうにすんでいます。$$, $$Tanto meu irmão quanto minha irmã moram em Tóquio.$$),
    ('n5-grammar-34', $$今日は何も食べていません。$$, $$きょうはなにもたべていません。$$, $$Hoje não comi nada.$$),
    ('n5-grammar-34', $$旅行で京都にも行きました。$$, $$りょこうできょうとにもいきました。$$, $$Na viagem, também fui a Kyoto.$$),
    ('n5-grammar-34', $$昨日は十時間も寝ました。$$, $$きのうはじゅうじかんもねました。$$, $$Ontem dormi dez horas inteiras.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$田中さんは医者です。山田さん____医者です。$$, $$O Tanaka é médico. O Yamada também é médico.$$),
        (2, $$教室には誰____いません。$$, $$Não tem ninguém na sala de aula.$$),
        (3, $$肉____魚も好きです。$$, $$Gosto tanto de carne quanto de peixe.$$),
        (4, $$「私はコーヒーが好きです。」「私____。」$$, $$"Eu gosto de café." "Eu também."$$),
        (5, $$駅まで一時間____かかりました。$$, $$Levou uma hora inteira até a estação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-34', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$も$$),
        (2, $$も$$),
        (3, $$も$$),
        (4, $$も$$),
        (5, $$も$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-35 — もう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-35',
    'grammar',
    'N5',
    $$もう$$,
    $$mou$$,
    $$Já / Mais / Não mais$$,
    $$もう é um advérbio com sentidos que dependem da frase, mas que giram em torno da ideia de "mudança de situação".

Com o verbo no passado, もう significa "já": a ação aconteceu e a situação mudou. Em perguntas, もう〜ましたか pergunta se algo já foi feito.

Antes de números e quantidades, もう significa "mais", como em mais um, mais uma vez, mais um pouco.

Com o verbo no negativo, もう significa "não mais": algo que acontecia antes deixou de acontecer.

O oposto de もう (já) é まだ (ainda). Por isso, para responder "ainda não" a uma pergunta com もう, usa-se まだ.$$,
    $$Na resposta afirmativa, é comum repetir もう: はい、もう〜ました.

A expressão もう一度 significa "mais uma vez" e é muito usada para pedir que alguém repita algo.

Dito sozinho e com certo tom, もう também expressa irritação, algo como "ah, poxa!". Esse uso é bem coloquial.$$,
    $$もう + Verbo na forma ました / た (já fez)
もう + Verbo ましたか (pergunta: já fez?)
もう + Quantidade (mais um / mais uma vez)
もう + Verbo negativo (não mais)
もう + Horário / Situação + です (já é...)$$,
    $$もう$$,
    $$もう$$,
    ARRAY['もう']::text[],
    ARRAY['もう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-35', $$もう宿題をしました。$$, $$もうしゅくだいをしました。$$, $$Já fiz a lição.$$),
    ('n5-grammar-35', $$「もう昼ご飯を食べましたか。」「はい、もう食べました。」$$, $$「もうひるごはんをたべましたか。」「はい、もうたべました。」$$, $$"Você já almoçou?" "Sim, já almocei."$$),
    ('n5-grammar-35', $$もう一度言ってください。$$, $$もういちどいってください。$$, $$Diga mais uma vez, por favor.$$),
    ('n5-grammar-35', $$もう十時ですよ。早く寝ましょう。$$, $$もうじゅうじですよ。はやくねましょう。$$, $$Já são dez horas. Vamos dormir cedo.$$),
    ('n5-grammar-35', $$もうタバコは吸いません。$$, $$もうタバコはすいません。$$, $$Não fumo mais.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父は____会社に行きました。$$, $$Meu pai já foi para a empresa.$$),
        (2, $$すみません、____一つください。$$, $$Com licença, me dê mais um, por favor.$$),
        (3, $$「映画は始まりましたか。」「はい、____始まりましたよ。」$$, $$"O filme já começou?" "Sim, já começou."$$),
        (4, $$____遅いから、帰りましょう。$$, $$Já está tarde, vamos voltar.$$),
        (5, $$あの店には____行きたくないです。$$, $$Não quero mais ir àquela loja.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-35', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もう$$),
        (2, $$もう$$),
        (3, $$もう$$),
        (4, $$もう$$),
        (5, $$もう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-36 — な形容詞
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-36',
    'grammar',
    'N5',
    $$な形容詞$$,
    $$na-keiyoushi$$,
    $$Adjetivo な / Adjetivo com な$$,
    $$Os adjetivos な são adjetivos que recebem な quando vêm antes de um substantivo. Eles descrevem qualidades e estados, como tranquilo, famoso, bonito e prático.

Diferente dos adjetivos い, os adjetivos な não se conjugam sozinhos. Eles funcionam de um jeito parecido com os substantivos: quem muda é o que vem depois. Para o presente usa-se だ ou です, para o negativo じゃない ou ではありません, e para o passado だった ou でした.

O な só aparece quando o adjetivo está diretamente antes de um substantivo. No final da frase, o な desaparece e entra だ ou です.

Para ligar um adjetivo な a outra qualidade, usa-se で. E para transformá-lo em advérbio, usa-se に, como "fazer algo de forma tranquila".$$,
    $$Alguns adjetivos な terminam em い e confundem estudantes, como きれい, 嫌い e 有名. Eles nunca usam くない ou かった: o negativo de きれい é きれいじゃない.

Muitos adjetivos な vêm do chinês e são escritos com dois kanji, como 有名, 便利 e 親切.

O adjetivo 同じ é especial: antes de substantivo, ele não recebe な.$$,
    $$Antes de substantivo: Adjetivo + な + Substantivo
Afirmativo: Adjetivo + だ / です
Negativo: Adjetivo + じゃない / ではない / じゃありません / ではありません
Passado: Adjetivo + だった / でした
Passado negativo: Adjetivo + じゃなかった / ではなかった / じゃありませんでした / ではありませんでした
Ligando qualidades: Adjetivo + で
Advérbio: Adjetivo + に$$,
    $$な$$,
    $$な|です|でした|だった|じゃない|ではない|じゃなかった|ではなかった|じゃありません|ではありません$$,
    ARRAY['な', 'だ', 'です']::text[],
    ARRAY['な', 'だ', 'です', 'じゃない', 'ではない', 'だった', 'でした', 'じゃなかった', 'ではなかった', 'で', 'に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-36', $$ここは静かな町です。$$, $$ここはしずかなまちです。$$, $$Aqui é uma cidade tranquila.$$),
    ('n5-grammar-36', $$田中さんはとても親切です。$$, $$たなかさんはとてもしんせつです。$$, $$O Tanaka é muito gentil.$$),
    ('n5-grammar-36', $$この公園はあまりきれいじゃないです。$$, $$このこうえんはあまりきれいじゃないです。$$, $$Este parque não é muito limpo.$$),
    ('n5-grammar-36', $$昨日のテストは簡単でした。$$, $$きのうのテストはかんたんでした。$$, $$A prova de ontem foi fácil.$$),
    ('n5-grammar-36', $$この町はにぎやかで、楽しいです。$$, $$このまちはにぎやかで、たのしいです。$$, $$Esta cidade é animada e divertida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ここは有名____レストランです。$$, $$Aqui é um restaurante famoso.$$),
        (2, $$昨日の仕事はあまり大変____。$$, $$O trabalho de ontem não foi muito puxado.$$),
        (3, $$子供のころ、野菜が嫌い____。$$, $$Quando eu era criança, não gostava de verdura.$$),
        (4, $$彼女はきれい____、優しい人です。$$, $$Ela é bonita e é uma pessoa gentil.$$),
        (5, $$この部屋はあまりきれい____。$$, $$Este quarto não está muito limpo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-36', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$な$$),
        (2, $$じゃなかった$$),
        (2, $$ではなかった$$),
        (2, $$じゃありませんでした$$),
        (2, $$ではありませんでした$$),
        (2, $$じゃなかったです$$),
        (2, $$ではなかったです$$),
        (3, $$でした$$),
        (3, $$だった$$),
        (4, $$で$$),
        (5, $$じゃない$$),
        (5, $$ではない$$),
        (5, $$じゃありません$$),
        (5, $$ではありません$$),
        (5, $$じゃないです$$),
        (5, $$ではないです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-37 — 〜なあ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-37',
    'grammar',
    'N5',
    $$〜なあ$$,
    $$naa$$,
    $$Que... / Nossa / Como... (exclamação)$$,
    $$なあ é uma partícula de final de frase que expressa um sentimento forte, como admiração, surpresa, desejo ou desabafo. É como dizer "que...!", "nossa, como...!" ou um suspiro em voz alta.

Normalmente é usada quando a pessoa fala consigo mesma ou comenta algo em voz alta, sem esperar resposta. Por isso, ela soa espontânea e emotiva.

Ela vem depois da forma simples da frase. Com substantivos e adjetivos な, coloca-se だ antes de なあ.

Junto com たい, なあ expressa um desejo, quase como um sonho: "como eu queria...".$$,
    $$なあ é diferente de ね: ね busca a concordância do outro, enquanto なあ é mais um sentimento expresso para si mesmo.

A forma curta な também é usada, principalmente na fala masculina e casual. Não confunda com a proibição な (como em "não faça"), que vem depois do verbo na forma de dicionário e tem tom de ordem.

Por ser informal e emotiva, なあ não é usada em situações formais.$$,
    $$Verbo / Adjetivo い (forma simples) + なあ
Substantivo / Adjetivo な + だ + なあ
Verbo na forma たい + なあ (desejo)

Variações: な / なー$$,
    $$なあ$$,
    $$なあ|なー$$,
    ARRAY['なあ']::text[],
    ARRAY['なあ', 'なー', 'な']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-37', $$きれいだなあ。$$, $$きれいだなあ。$$, $$Que lindo!$$),
    ('n5-grammar-37', $$今日は暑いなあ。$$, $$きょうはあついなあ。$$, $$Que calor hoje!$$),
    ('n5-grammar-37', $$日本に行きたいなあ。$$, $$にほんにいきたいなあ。$$, $$Como eu queria ir ao Japão...$$),
    ('n5-grammar-37', $$この料理、おいしいなあ。$$, $$このりょうり、おいしいなあ。$$, $$Nossa, esta comida é gostosa!$$),
    ('n5-grammar-37', $$田中さん、遅いなあ。$$, $$たなかさん、おそいなあ。$$, $$O Tanaka está demorando, hein...$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この景色、すごい____。$$, $$Nossa, esta paisagem é incrível!$$),
        (2, $$もう少し寝たい____。$$, $$Queria dormir mais um pouco...$$),
        (3, $$今日はいい天気だ____。$$, $$Que dia bonito hoje!$$),
        (4, $$あーあ、お腹がすいた____。$$, $$Ai, que fome...$$),
        (5, $$彼は本当に日本語が上手だ____。$$, $$Ele fala japonês muito bem, hein.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-37', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なあ$$),
        (1, $$なー$$),
        (2, $$なあ$$),
        (2, $$なー$$),
        (3, $$なあ$$),
        (3, $$なー$$),
        (4, $$なあ$$),
        (4, $$なー$$),
        (5, $$なあ$$),
        (5, $$なー$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-38 — 〜ないで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-38',
    'grammar',
    'N5',
    $$〜ないで$$,
    $$naide$$,
    $$Sem / Sem fazer / Em vez de$$,
    $$ないで é usado para dizer que uma ação é feita sem fazer outra. Equivale a "sem" ou "sem fazer".

A estrutura liga dois verbos: o primeiro, na forma ない + で, mostra o que não foi feito; o segundo mostra o que foi feito, nessas condições.

Também pode indicar uma escolha, com o sentido de "em vez de": em vez de fazer A, a pessoa fez B.

O tempo da frase, presente ou passado, fica no último verbo. O verbo com ないで não muda.$$,
    $$ないで é diferente de なくて, que também liga frases, mas indica causa, como "por não ter feito, aconteceu algo". ないで indica o modo ou a escolha.

No final da frase, ないで sozinho vira um pedido informal, como "não faça isso". Esse uso é a forma curta de ないでください.

Na fala, a forma ずに tem o mesmo sentido de ないで, mas é mais formal e aparece em níveis seguintes.$$,
    $$Verbo na forma ない + で + Verbo
Verbo na forma ない + で、 + Verbo (em vez de)$$,
    $$ないで$$,
    $$ないで$$,
    ARRAY['ない', 'で']::text[],
    ARRAY['ないで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-38', $$朝ご飯を食べないで学校に行きました。$$, $$あさごはんをたべないでがっこうにいきました。$$, $$Fui para a escola sem tomar café da manhã.$$),
    ('n5-grammar-38', $$傘を持たないで出かけました。$$, $$かさをもたないででかけました。$$, $$Saí sem levar guarda-chuva.$$),
    ('n5-grammar-38', $$辞書を使わないで新聞を読みます。$$, $$じしょをつかわないでしんぶんをよみます。$$, $$Leio o jornal sem usar dicionário.$$),
    ('n5-grammar-38', $$昨日は寝ないで勉強しました。$$, $$きのうはねないでべんきょうしました。$$, $$Ontem estudei sem dormir.$$),
    ('n5-grammar-38', $$電車に乗らないで、歩いて帰りました。$$, $$でんしゃにのらないで、あるいてかえりました。$$, $$Em vez de pegar o trem, voltei a pé.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$砂糖を入れ____コーヒーを飲みます。$$, $$Tomo café sem colocar açúcar.$$),
        (2, $$昨日は宿題をし____寝ました。$$, $$Ontem dormi sem fazer a lição.$$),
        (3, $$手を洗わ____ご飯を食べてはいけません。$$, $$Não pode comer sem lavar as mãos.$$),
        (4, $$誰にも言わ____家を出ました。$$, $$Saí de casa sem dizer nada a ninguém.$$),
        (5, $$バスに乗ら____、自転車で行きました。$$, $$Em vez de pegar o ônibus, fui de bicicleta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-38', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないで$$),
        (2, $$ないで$$),
        (3, $$ないで$$),
        (4, $$ないで$$),
        (5, $$ないで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-39 — 〜ないでください
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-39',
    'grammar',
    'N5',
    $$〜ないでください$$,
    $$naide kudasai$$,
    $$Não faça... / Por favor não... / Evite...$$,
    $$ないでください é usado para pedir educadamente que alguém não faça alguma coisa. Equivale a "por favor, não...".

Ele é formado pela forma ない do verbo, seguida de でください. É o oposto de てください, que pede para fazer algo.

É muito usado em avisos, regras, instruções e pedidos do dia a dia. Também aparece em frases de cuidado e gentileza, como "não se preocupe" e "não se esqueça".

Na fala informal, entre amigos e família, ください costuma ser omitido, e a frase termina só com ないで, muitas vezes com ね ou よ para suavizar.$$,
    $$Mesmo sendo educado, ないでください é um pedido direto. Com superiores, os japoneses costumam suavizar com explicações antes, como dizer o motivo com から.

A expressão 心配しないでください é uma das mais comuns e serve para tranquilizar alguém.

Em placas e avisos escritos, também é comum ver formas mais curtas e firmes, mas na conversa ないでください é a forma padrão.$$,
    $$Verbo na forma ない + でください (educado)
Verbo na forma ない + で (informal)
Verbo na forma ない + でね / でよ (informal, mais suave)$$,
    $$ないでください$$,
    $$ないでください|ないで。|ないでね|ないでよ$$,
    ARRAY['ない', 'で', 'ください']::text[],
    ARRAY['ないでください', 'ないで', 'ないでね', 'ないでよ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-39', $$ここで写真を撮らないでください。$$, $$ここでしゃしんをとらないでください。$$, $$Por favor, não tire fotos aqui.$$),
    ('n5-grammar-39', $$心配しないでください。$$, $$しんぱいしないでください。$$, $$Não se preocupe.$$),
    ('n5-grammar-39', $$授業中に話さないでください。$$, $$じゅぎょうちゅうにはなさないでください。$$, $$Por favor, não converse durante a aula.$$),
    ('n5-grammar-39', $$このことは誰にも言わないでね。$$, $$このことはだれにもいわないでね。$$, $$Não conte isso para ninguém, tá?$$),
    ('n5-grammar-39', $$明日の約束を忘れないでください。$$, $$あしたのやくそくをわすれないでください。$$, $$Não se esqueça do compromisso de amanhã, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ここに車を止め____。$$, $$Por favor, não estacione aqui.$$),
        (2, $$危ないですから、押さ____。$$, $$É perigoso, então não empurre, por favor.$$),
        (3, $$図書館で食べ物を食べ____。$$, $$Por favor, não coma na biblioteca.$$),
        (4, $$まだ帰ら____。$$, $$Não vá embora ainda, por favor.$$),
        (5, $$泣か____よ。$$, $$Não chore.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-39', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないでください$$),
        (2, $$ないでください$$),
        (3, $$ないでください$$),
        (4, $$ないでください$$),
        (4, $$ないで$$),
        (5, $$ないで$$),
        (5, $$ないでください$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-40 — 〜なくてもいい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-40',
    'grammar',
    'N5',
    $$〜なくてもいい$$,
    $$nakute mo ii$$,
    $$Não precisa / Não é necessário$$,
    $$なくてもいい é usado para dizer que algo não é necessário. Equivale a "não precisa" ou "não é preciso".

Literalmente, a estrutura quer dizer "mesmo não fazendo, está tudo bem". Ou seja, a pessoa tem liberdade para não fazer aquilo.

Ela é formada pela forma ない do verbo, trocando o い final por くても, e depois いい. Em perguntas, なくてもいいですか serve para pedir permissão para não fazer algo.

Com adjetivos い, usa-se くなくてもいい ("não precisa ser..."). Com substantivos e adjetivos な, usa-se じゃなくてもいい.

É o oposto de なければならない e なくてはいけない, que indicam obrigação.$$,
    $$Na conversa, なくても大丈夫 é tão comum quanto なくてもいい e soa um pouco mais leve e simpático.

なくてもかまわない tem o mesmo sentido, mas soa mais formal.

Quando alguém pergunta なければなりませんか ("tenho que...?"), a resposta negativa natural é いいえ、〜なくてもいいです.$$,
    $$Verbo na forma ない sem い + くてもいい
Adjetivo い sem い + くなくてもいい
Substantivo / Adjetivo な + じゃなくてもいい

Educado: なくてもいいです
Pergunta: なくてもいいですか
Variações: なくても大丈夫 / なくてもかまわない$$,
    $$なくてもいい$$,
    $$なくてもいい|なくても大丈夫|なくてもかまわない$$,
    ARRAY['なくて', 'も', 'いい']::text[],
    ARRAY['なくてもいい', 'なくてもいいです', 'なくても大丈夫', 'なくてもかまわない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-40', $$明日は来なくてもいいです。$$, $$あしたはこなくてもいいです。$$, $$Amanhã você não precisa vir.$$),
    ('n5-grammar-40', $$全部食べなくてもいいよ。$$, $$ぜんぶたべなくてもいいよ。$$, $$Não precisa comer tudo.$$),
    ('n5-grammar-40', $$ここでは靴を脱がなくてもいいですか。$$, $$ここではくつをぬがなくてもいいですか。$$, $$Aqui eu não preciso tirar os sapatos?$$),
    ('n5-grammar-40', $$急がなくても大丈夫ですよ。$$, $$いそがなくてもだいじょうぶですよ。$$, $$Não precisa ter pressa.$$),
    ('n5-grammar-40', $$高くなくてもいいから、丈夫なかばんがほしいです。$$, $$たかくなくてもいいから、じょうぶなかばんがほしいです。$$, $$Não precisa ser cara, só quero uma bolsa resistente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日は宿題をし____です。$$, $$Hoje não precisa fazer a lição.$$),
        (2, $$ここに名前は書か____ですよ。$$, $$Aqui não precisa escrever o nome.$$),
        (3, $$「お金を払わなくてもいいですか。」「はい、払わ____。」$$, $$"Não preciso pagar?" "Isso, não precisa pagar."$$),
        (4, $$明日は休みだから、早く起き____。$$, $$Amanhã é folga, então não precisa acordar cedo.$$),
        (5, $$この仕事は日本語が上手____いいです。$$, $$Para este trabalho, não precisa ser bom em japonês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-40', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なくてもいい$$),
        (2, $$なくてもいい$$),
        (3, $$なくてもいいです$$),
        (3, $$なくてもいい$$),
        (3, $$なくても大丈夫です$$),
        (3, $$なくても大丈夫$$),
        (4, $$なくてもいい$$),
        (4, $$なくてもいいです$$),
        (4, $$なくても大丈夫$$),
        (4, $$なくても大丈夫です$$),
        (5, $$じゃなくても$$),
        (5, $$でなくても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-41 — 〜なくちゃ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-41',
    'grammar',
    'N5',
    $$〜なくちゃ$$,
    $$nakucha$$,
    $$Tenho que / Preciso / Devo$$,
    $$なくちゃ é uma forma falada e casual de dizer que algo precisa ser feito. Equivale a "tenho que" ou "preciso".

Ela vem da forma completa なくては, que na fala rápida vira なくちゃ. A frase completa seria なくてはいけない ou なくてはならない, mas, na conversa, o final いけない é muitas vezes omitido, porque o sentido de obrigação já fica claro.

Por ser bem informal, なくちゃ é usada com amigos, família ou quando a pessoa fala consigo mesma, lembrando de algo que precisa fazer.

Existe ainda outra forma curta muito comum, なきゃ, que vem de なければ e tem exatamente o mesmo sentido.$$,
    $$なくちゃ e なきゃ são extremamente comuns na fala do dia a dia, principalmente entre jovens.

Por serem contrações, não são adequadas para situações formais, como falar com um chefe ou escrever um e-mail de trabalho. Nesses casos, usa-se なければなりません ou なくてはいけません.

O mesmo tipo de contração aparece em ちゃいけない, onde ては vira ちゃ.$$,
    $$Verbo na forma ない sem い + くちゃ
Verbo na forma ない sem い + くちゃ + いけない / ならない

Forma completa: なくては + いけない / ならない
Variação: Verbo na forma ない sem い + きゃ (なきゃ)$$,
    $$なくちゃ$$,
    $$なくちゃ|なきゃ$$,
    ARRAY['なくちゃ']::text[],
    ARRAY['なくちゃ', 'なきゃ', 'なくちゃいけない', 'なくちゃならない', 'なきゃいけない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-41', $$あ、もう行かなくちゃ。$$, $$あ、もういかなくちゃ。$$, $$Ah, já tenho que ir.$$),
    ('n5-grammar-41', $$明日は早く起きなくちゃ。$$, $$あしたははやくおきなくちゃ。$$, $$Amanhã tenho que acordar cedo.$$),
    ('n5-grammar-41', $$今日は宿題をしなくちゃいけない。$$, $$きょうはしゅくだいをしなくちゃいけない。$$, $$Hoje tenho que fazer a lição.$$),
    ('n5-grammar-41', $$寝る前に薬を飲まなくちゃ。$$, $$ねるまえにくすりをのまなくちゃ。$$, $$Preciso tomar o remédio antes de dormir.$$),
    ('n5-grammar-41', $$牛乳がない。買いに行かなきゃ。$$, $$ぎゅうにゅうがない。かいにいかなきゃ。$$, $$Acabou o leite. Tenho que ir comprar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あ、もう八時だ。急が____。$$, $$Ah, já são oito horas. Tenho que me apressar.$$),
        (2, $$来週テストだから、勉強し____。$$, $$Semana que vem tem prova, então tenho que estudar.$$),
        (3, $$部屋が汚いから、掃除し____。$$, $$O quarto está sujo, então preciso limpar.$$),
        (4, $$今晩、母に電話し____いけない。$$, $$Hoje à noite tenho que ligar para minha mãe.$$),
        (5, $$明日は大事な会議だから、早く寝____。$$, $$Amanhã tem uma reunião importante, então tenho que dormir cedo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-41', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なくちゃ$$),
        (1, $$なきゃ$$),
        (2, $$なくちゃ$$),
        (2, $$なきゃ$$),
        (3, $$なくちゃ$$),
        (3, $$なきゃ$$),
        (4, $$なくちゃ$$),
        (4, $$なきゃ$$),
        (5, $$なくちゃ$$),
        (5, $$なきゃ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-42 — 〜なくてはいけない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-42',
    'grammar',
    'N5',
    $$〜なくてはいけない$$,
    $$nakute wa ikenai$$,
    $$Ter que / Precisar / Dever$$,
    $$なくてはいけない é usado para dizer que algo é obrigatório ou necessário. Equivale a "ter que" ou "precisar".

A lógica da estrutura é uma dupla negação: "se não fizer, não está bem". Ou seja, não fazer é proibido, então é preciso fazer.

Ela é formada pela forma ない do verbo, trocando o い final por くては, seguida de いけない. Na forma educada, fica なくてはいけません.

なくてはいけない costuma expressar uma obrigação ligada à situação ou ao senso pessoal de dever, como regras do dia a dia, compromissos e coisas que a pessoa sente que precisa fazer. É mais comum na conversa que なくてはならない, que soa mais formal.$$,
    $$Na fala, なくては costuma virar なくちゃ, formando なくちゃいけない. Essa é a versão casual da mesma ideia.

As formas なければいけない e なければならない também expressam obrigação e são muito comuns. Elas aparecem no N4.

Para dizer que algo não é necessário, o oposto é なくてもいい.$$,
    $$Verbo na forma ない sem い + くてはいけない
Adjetivo い sem い + くなくてはいけない
Substantivo / Adjetivo な + でなくてはいけない

Educado: なくてはいけません
Passado: なくてはいけなかった / なくてはいけませんでした$$,
    $$なくてはいけない$$,
    $$なくてはいけない|なくてはいけません|なくてはいけなかった$$,
    ARRAY['なくて', 'は', 'いけない']::text[],
    ARRAY['なくてはいけない', 'なくてはいけません', 'なくてはいけなかった', 'なくてはいけませんでした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-42', $$毎日薬を飲まなくてはいけません。$$, $$まいにちくすりをのまなくてはいけません。$$, $$Tenho que tomar remédio todo dia.$$),
    ('n5-grammar-42', $$明日までにレポートを出さなくてはいけない。$$, $$あしたまでにレポートをださなくてはいけない。$$, $$Tenho que entregar o relatório até amanhã.$$),
    ('n5-grammar-42', $$この学校では制服を着なくてはいけません。$$, $$このがっこうではせいふくをきなくてはいけません。$$, $$Nesta escola, é preciso usar uniforme.$$),
    ('n5-grammar-42', $$昨日は遅くまで働かなくてはいけなかった。$$, $$きのうはおそくまではたらかなくてはいけなかった。$$, $$Ontem tive que trabalhar até tarde.$$),
    ('n5-grammar-42', $$日本では車は左側を走らなくてはいけません。$$, $$にほんではくるまはひだりがわをはしらなくてはいけません。$$, $$No Japão, os carros precisam andar pela esquerda.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎朝六時に起き____。$$, $$Tenho que acordar às seis toda manhã.$$),
        (2, $$今日中に宿題をし____。$$, $$Tenho que fazer a lição ainda hoje.$$),
        (3, $$図書館の本は今週返さ____。$$, $$Tenho que devolver os livros da biblioteca esta semana.$$),
        (4, $$昨日は病院に行か____。$$, $$Ontem tive que ir ao hospital.$$),
        (5, $$車を運転するときは、免許を持ってい____。$$, $$Quando dirige, você precisa estar com a carteira de motorista.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-42', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なくてはいけません$$),
        (1, $$なくてはいけない$$),
        (2, $$なくてはいけません$$),
        (2, $$なくてはいけない$$),
        (3, $$なくてはいけません$$),
        (3, $$なくてはいけない$$),
        (4, $$なくてはいけなかった$$),
        (4, $$なくてはいけませんでした$$),
        (5, $$なくてはいけません$$),
        (5, $$なくてはいけない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-43 — 〜なくてはならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-43',
    'grammar',
    'N5',
    $$〜なくてはならない$$,
    $$nakute wa naranai$$,
    $$Ter que / Ser obrigatório / Precisar$$,
    $$なくてはならない também significa "ter que" e expressa obrigação ou necessidade, assim como なくてはいけない.

A lógica é a mesma dupla negação: "se não fizer, não dá certo". Por isso, o resultado é uma obrigação.

A diferença está no tom. なくてはならない soa mais formal e objetivo. Ele é muito usado para obrigações gerais, regras sociais, leis e necessidades que não dependem da opinião de quem fala. Também aparece mais na escrita e em discursos.

Já なくてはいけない é mais comum na conversa e costuma refletir uma obrigação sentida pela própria pessoa. Na prática, as duas formas muitas vezes podem ser trocadas.$$,
    $$Na fala casual, なくてはならない pode virar なくちゃならない, mas essa forma é menos comum do que なくちゃいけない.

なくてはならない também pode ser usado como adjetivo antes de um substantivo, com o sentido de "indispensável", como algo sem o qual não se vive.

As formas なければならない e なければなりません têm o mesmo sentido e são muito usadas em textos formais.$$,
    $$Verbo na forma ない sem い + くてはならない
Adjetivo い sem い + くなくてはならない
Substantivo / Adjetivo な + でなくてはならない

Educado: なくてはなりません
Passado: なくてはならなかった / なくてはなりませんでした$$,
    $$なくてはならない$$,
    $$なくてはならない|なくてはなりません|なくてはならなかった$$,
    ARRAY['なくて', 'は', 'ならない']::text[],
    ARRAY['なくてはならない', 'なくてはなりません', 'なくてはならなかった', 'なくてはなりませんでした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-43', $$社員は毎朝九時までに会社に来なくてはなりません。$$, $$しゃいんはまいあさくじまでにかいしゃにこなくてはなりません。$$, $$Os funcionários precisam chegar à empresa até as nove toda manhã.$$),
    ('n5-grammar-43', $$外国に行くとき、パスポートを持っていなくてはならない。$$, $$がいこくにいくとき、パスポートをもっていなくてはならない。$$, $$Quando se vai ao exterior, é preciso ter passaporte.$$),
    ('n5-grammar-43', $$来月、引っ越さなくてはならない。$$, $$らいげつ、ひっこさなくてはならない。$$, $$Mês que vem, vou ter que me mudar.$$),
    ('n5-grammar-43', $$試験では、黒いペンを使わなくてはなりません。$$, $$しけんでは、くろいペンをつかわなくてはなりません。$$, $$Na prova, é obrigatório usar caneta preta.$$),
    ('n5-grammar-43', $$父が病気で、仕事を休まなくてはならなかった。$$, $$ちちがびょうきで、しごとをやすまなくてはならなかった。$$, $$Meu pai ficou doente, e eu tive que faltar ao trabalho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$国民は税金を払わ____。$$, $$Os cidadãos têm que pagar impostos.$$),
        (2, $$会議の前に資料を読ま____。$$, $$É preciso ler os documentos antes da reunião.$$),
        (3, $$留学生はビザを持ってい____。$$, $$Os estudantes estrangeiros precisam ter visto.$$),
        (4, $$先週は毎日残業し____。$$, $$Semana passada, tive que fazer hora extra todo dia.$$),
        (5, $$約束は守ら____。$$, $$Promessas devem ser cumpridas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-43', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なくてはなりません$$),
        (1, $$なくてはならない$$),
        (2, $$なくてはなりません$$),
        (2, $$なくてはならない$$),
        (3, $$なくてはなりません$$),
        (3, $$なくてはならない$$),
        (4, $$なくてはならなかった$$),
        (4, $$なくてはなりませんでした$$),
        (5, $$なくてはならない$$),
        (5, $$なくてはなりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-44 — 〜なる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-44',
    'grammar',
    'N5',
    $$〜なる$$,
    $$naru$$,
    $$Tornar-se / Ficar / Virar$$,
    $$なる significa "tornar-se", "ficar" ou "virar". Ele mostra uma mudança: algo passa de um estado para outro.

A forma de ligar なる depende da palavra que vem antes. Com substantivos e adjetivos な, usa-se に antes de なる. Com adjetivos い, troca-se o い final por く.

なる é usado para mudanças de profissão, idade, estação do ano, clima, sentimentos e habilidades, entre muitas outras coisas.

Um ponto importante é que なる indica uma mudança que acontece naturalmente ou como resultado de algo. Quando alguém provoca a mudança de propósito, o japonês usa する no lugar de なる.$$,
    $$A diferença entre なる e する é importante: きれいになる é "ficar limpo", enquanto きれいにする é "deixar limpo", ou seja, alguém limpou.

Para idade, usa-se なる para dizer quantos anos alguém vai fazer ou fez.

Em lojas e restaurantes, frases com になります aparecem muito como uma forma educada de apresentar algo, como o valor da conta. É um uso típico do atendimento ao cliente.$$,
    $$Substantivo + に + なる
Adjetivo な (sem な) + に + なる
Adjetivo い sem い + く + なる

Educado: なります
Passado: なった / なりました
Desejo: になりたい / くなりたい$$,
    $$なる$$,
    $$になる|になります|になりました|になった|になって|になりたい|くなる|くなります|くなりました|くなった|くなって$$,
    ARRAY['に', 'く', 'なる']::text[],
    ARRAY['になる', 'になります', 'になった', 'になりました', 'くなる', 'くなります', 'くなった', 'くなりました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-44', $$弟は医者になりました。$$, $$おとうとはいしゃになりました。$$, $$Meu irmão mais novo virou médico.$$),
    ('n5-grammar-44', $$掃除して、部屋がきれいになった。$$, $$そうじして、へやがきれいになった。$$, $$Limpei, e o quarto ficou limpo.$$),
    ('n5-grammar-44', $$十一月になって、寒くなりました。$$, $$じゅういちがつになって、さむくなりました。$$, $$Chegou novembro e esfriou.$$),
    ('n5-grammar-44', $$将来、先生になりたいです。$$, $$しょうらい、せんせいになりたいです。$$, $$No futuro, quero ser professor.$$),
    ('n5-grammar-44', $$日本語が上手になりましたね。$$, $$にほんごがじょうずになりましたね。$$, $$Seu japonês melhorou bastante, hein.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$姉は来年二十歳に____。$$, $$Minha irmã mais velha vai fazer vinte anos no ano que vem.$$),
        (2, $$薬を飲んで、元気に____。$$, $$Tomei o remédio e fiquei bem.$$),
        (3, $$急に空が暗く____。$$, $$De repente, o céu ficou escuro.$$),
        (4, $$大人になったら、何に____たいですか。$$, $$Quando crescer, o que você quer ser?$$),
        (5, $$毎日練習して、ピアノが上手に____。$$, $$Pratiquei todo dia e fiquei bom no piano.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-44', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なります$$),
        (1, $$なる$$),
        (2, $$なりました$$),
        (2, $$なった$$),
        (3, $$なりました$$),
        (3, $$なった$$),
        (4, $$なり$$),
        (5, $$なりました$$),
        (5, $$なった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-45 — 〜んです
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-45',
    'grammar',
    'N5',
    $$〜んです$$,
    $$n desu$$,
    $$É que / Acontece que / Sabe$$,
    $$んです é usado para explicar uma situação, dar um motivo ou pedir uma explicação. Ele dá à frase o sentido de "é que...", "acontece que...".

A diferença entre uma frase normal e uma frase com んです é o foco. Uma frase normal só informa um fato. Com んです, a pessoa está ligando aquele fato ao contexto: explicando por que algo aconteceu, justificando algo ou mostrando interesse em entender a situação.

Em perguntas, んですか mostra que quem pergunta percebeu algo e quer uma explicação, como "o que aconteceu?" ao ver alguém triste.

Também é muito usado antes de um pedido ou pergunta, apresentando a situação primeiro: "é que eu queria ir à estação...".

んです é a forma falada de のです. Na fala informal, usa-se んだ ou の.$$,
    $$Usar んです demais pode soar insistente, porque toda frase vira uma explicação. Ele deve aparecer quando existe um contexto a ser explicado.

Em perguntas, んですか pode soar como cobrança se o tom for forte, principalmente em perguntas negativas.

Com substantivos e adjetivos な, não se esqueça do な: 休みなんです, e não 休みんです.$$,
    $$Verbo / Adjetivo い (forma simples) + んです
Substantivo / Adjetivo な + な + んです

Pergunta: 〜んですか
Antes de pedido: 〜んですが / 〜んですけど

Informal: 〜んだ / 〜の
Forma escrita: 〜のです$$,
    $$んです$$,
    $$んです|んだ$$,
    ARRAY['ん', 'です']::text[],
    ARRAY['んです', 'んですか', 'んだ', 'のです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-45', $$すみません、頭が痛いんです。$$, $$すみません、あたまがいたいんです。$$, $$Desculpe, é que estou com dor de cabeça.$$),
    ('n5-grammar-45', $$どうしたんですか。$$, $$どうしたんですか。$$, $$O que aconteceu?$$),
    ('n5-grammar-45', $$明日は休みなんです。$$, $$あしたはやすみなんです。$$, $$É que amanhã é folga.$$),
    ('n5-grammar-45', $$実は、来月結婚するんです。$$, $$じつは、らいげつけっこんするんです。$$, $$Na verdade, vou me casar no mês que vem.$$),
    ('n5-grammar-45', $$駅に行きたいんですが、どう行けばいいですか。$$, $$えきにいきたいんですが、どういけばいいですか。$$, $$Eu queria ir à estação. Como faço para chegar?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「どうして食べないんですか。」「お腹が痛い____。」$$, $$"Por que você não está comendo?" "É que estou com dor de barriga."$$),
        (2, $$元気がないですね。どうした____。$$, $$Você está desanimado, hein. O que houve?$$),
        (3, $$「昨日、休みましたね。」「ええ、熱があった____。」$$, $$"Você faltou ontem, né?" "Sim, é que eu estava com febre."$$),
        (4, $$このかばん、すごく高かった____よ。$$, $$Esta bolsa foi muito cara, sabia?$$),
        (5, $$「すみません、遅れて。」「いいえ、私も今来た____。」$$, $$"Desculpe o atraso." "Não tem problema, eu também acabei de chegar."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-45', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$んです$$),
        (2, $$んですか$$),
        (3, $$んです$$),
        (4, $$んです$$),
        (4, $$んだ$$),
        (5, $$んです$$),
        (5, $$んだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-46 — ね
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-46',
    'grammar',
    'N5',
    $$ね$$,
    $$ne$$,
    $$Né / Não é? / Hein / Certo?$$,
    $$ね é uma partícula de final de frase usada para buscar a concordância ou a confirmação de quem está ouvindo. Equivale ao nosso "né?", "não é?" ou "certo?".

Ela é usada quando quem fala acredita que o ouvinte também sabe ou sente o mesmo. Por isso, aparece muito em comentários sobre o tempo, sobre comida e sobre coisas que as duas pessoas estão vendo juntas.

ね também serve para confirmar uma informação, como um horário ou um combinado, e para deixar a frase mais suave e simpática.

Ela funciona depois de frases formais e informais. Com substantivos e adjetivos な, na forma simples, usa-se だね.$$,
    $$ね é diferente de よ: ね busca concordância sobre algo compartilhado, enquanto よ passa uma informação nova que o outro talvez não saiba.

A combinação よね mistura as duas ideias: quem fala tem quase certeza, mas quer confirmar.

Usar ね com frequência deixa a conversa mais calorosa. Uma frase sem ね pode soar mais seca em certas situações.

Prolongar para ねえ pode expressar emoção ou chamar a atenção de alguém.$$,
    $$Frase (forma educada) + ね
Frase (forma simples) + ね
Substantivo / Adjetivo な + ですね / だね$$,
    $$ね$$,
    $$ね$$,
    ARRAY['ね']::text[],
    ARRAY['ね', 'ねえ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-46', $$今日は暑いですね。$$, $$きょうはあついですね。$$, $$Hoje está quente, né?$$),
    ('n5-grammar-46', $$このケーキ、おいしいね。$$, $$このケーキ、おいしいね。$$, $$Este bolo é gostoso, né?$$),
    ('n5-grammar-46', $$明日の会議は十時からですね。$$, $$あしたのかいぎはじゅうじからですね。$$, $$A reunião de amanhã é a partir das dez, certo?$$),
    ('n5-grammar-46', $$じゃ、また明日ね。$$, $$じゃ、またあしたね。$$, $$Então, até amanhã, tá?$$),
    ('n5-grammar-46', $$日本語が上手ですね。$$, $$にほんごがじょうずですね。$$, $$Você fala bem japonês, hein.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「いい天気ですね。」「そうです____。」$$, $$"Que dia bonito, né?" "É mesmo."$$),
        (2, $$会議は三時からです____。$$, $$A reunião é a partir das três, certo?$$),
        (3, $$この花、きれいだ____。$$, $$Esta flor é bonita, né?$$),
        (4, $$じゃ、駅の前で待ってる____。$$, $$Então vou te esperar em frente à estação, tá?$$),
        (5, $$田中さんはまだ来ていません____。$$, $$O Tanaka ainda não chegou, né?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-46', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ね$$),
        (2, $$ね$$),
        (3, $$ね$$),
        (4, $$ね$$),
        (5, $$ね$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-47 — に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-47',
    'grammar',
    'N5',
    $$に$$,
    $$ni$$,
    $$Em / Para / A / Às$$,
    $$に é uma das partículas mais versáteis do japonês. A ideia central é marcar um "ponto": um ponto no tempo, um ponto no espaço ou o ponto de chegada de uma ação.

Os principais usos são:
• Tempo específico: horários, dias e datas em que algo acontece.
• Lugar de existência: onde algo ou alguém está, com ある e いる.
• Destino: para onde se vai, se vem ou se volta.
• Pessoa que recebe a ação: a quem se dá algo, com quem se encontra, para quem se telefona.
• Ponto de chegada: onde se entra, onde se senta, em que veículo se sobe.
• Frequência: quantas vezes algo acontece em um período.

Para tempos relativos, como hoje, amanhã e toda semana, normalmente não se usa に. Ele é usado com tempos "marcados", como horas, datas e dias da semana.$$,
    $$A diferença entre に e で para lugares é um ponto clássico: に marca onde algo está ou para onde vai, e で marca onde uma ação acontece.

Com destinos, に e へ podem ser trocados na maioria dos casos. に destaca o ponto de chegada, e へ destaca a direção.

Palavras como 今日, 明日, 毎日 e 来週 normalmente não levam に.$$,
    $$Tempo específico + に
Lugar + に + ある / いる
Destino + に + 行く / 来る / 帰る
Pessoa + に + あげる / 会う / 電話する / 聞く
Lugar / Veículo + に + 入る / 乗る / 座る
Período + に + Número de vezes$$,
    $$に$$,
    $$に$$,
    ARRAY['に']::text[],
    ARRAY['に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-47', $$毎朝七時に起きます。$$, $$まいあさしちじにおきます。$$, $$Acordo às sete toda manhã.$$),
    ('n5-grammar-47', $$猫は机の下にいます。$$, $$ねこはつくえのしたにいます。$$, $$O gato está embaixo da mesa.$$),
    ('n5-grammar-47', $$来年、日本に行きます。$$, $$らいねん、にほんにいきます。$$, $$Ano que vem, vou para o Japão.$$),
    ('n5-grammar-47', $$友達に手紙を書きました。$$, $$ともだちにてがみをかきました。$$, $$Escrevi uma carta para um amigo.$$),
    ('n5-grammar-47', $$一週間に三回、ジムに行きます。$$, $$いっしゅうかんにさんかい、ジムにいきます。$$, $$Vou à academia três vezes por semana.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$授業は九時____始まります。$$, $$A aula começa às nove.$$),
        (2, $$銀行は駅の前____あります。$$, $$O banco fica em frente à estação.$$),
        (3, $$駅で電車____乗ります。$$, $$Pego o trem na estação.$$),
        (4, $$昨日、町で先生____会いました。$$, $$Ontem encontrei o professor na cidade.$$),
        (5, $$一日____二回、薬を飲みます。$$, $$Tomo o remédio duas vezes por dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-47', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に$$),
        (2, $$に$$),
        (3, $$に$$),
        (4, $$に$$),
        (5, $$に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-48 — 〜に行く
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-48',
    'grammar',
    'N5',
    $$〜に行く$$,
    $$ni iku$$,
    $$Ir (fazer algo) / Ir para$$,
    $$に行く é usado para dizer que alguém vai a algum lugar com um objetivo. Equivale a "ir fazer algo" ou "ir para fazer algo".

A estrutura junta o verbo da ação que a pessoa vai fazer, na forma ます sem ます, com に e o verbo de movimento. Assim, o に aqui marca a finalidade do deslocamento.

Além de 行く, a mesma estrutura funciona com 来る (vir) e 帰る (voltar), sempre com a ideia de "ir, vir ou voltar para fazer algo".

Com verbos do tipo "substantivo + する", como 買い物する ou 散歩する, é comum usar só o substantivo antes de に, como 買い物に行く.

O lugar para onde se vai pode aparecer antes, marcado com へ ou に.$$,
    $$Quando o lugar e a finalidade aparecem juntos, é comum usar へ para o lugar, evitando repetir に duas vezes seguidas.

Essa construção funciona só com verbos de movimento. Para outras finalidades, usa-se ために, que aparece em níveis seguintes.

Em convites, ela combina muito bem com ませんか, como ao chamar alguém para ir comer ou ver algo.$$,
    $$Verbo na forma ます sem ます + に + 行く / 来る / 帰る
Substantivo de ação + に + 行く / 来る / 帰る
Lugar + へ / に + Verbo sem ます + に + 行く$$,
    $$に行く$$,
    $$に行|にいく|にいき|にいっ|に来|にきます|にきました|にきた|に帰$$,
    ARRAY['に', '行く']::text[],
    ARRAY['に行く', 'に行きます', 'に行った', 'に行きました', 'に来る', 'に来ます', 'に帰る', 'に帰ります']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-48', $$友達と映画を見に行きました。$$, $$ともだちとえいがをみにいきました。$$, $$Fui ver um filme com um amigo.$$),
    ('n5-grammar-48', $$昼ご飯を食べに行きませんか。$$, $$ひるごはんをたべにいきませんか。$$, $$Quer ir almoçar?$$),
    ('n5-grammar-48', $$週末、デパートへ買い物に行きます。$$, $$しゅうまつ、デパートへかいものにいきます。$$, $$No fim de semana, vou fazer compras na loja de departamentos.$$),
    ('n5-grammar-48', $$日本へ日本語を勉強しに来ました。$$, $$にほんへにほんごをべんきょうしにきました。$$, $$Vim ao Japão para estudar japonês.$$),
    ('n5-grammar-48', $$忘れ物を取りに家に帰りました。$$, $$わすれものをとりにいえにかえりました。$$, $$Voltei para casa para pegar uma coisa que esqueci.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$図書館へ本を借り____。$$, $$Vou à biblioteca pegar um livro emprestado.$$),
        (2, $$週末、海へ泳ぎ____。$$, $$No fim de semana, fui nadar na praia.$$),
        (3, $$駅まで友達を迎え____。$$, $$Vou buscar meu amigo na estação.$$),
        (4, $$夕方、公園へ散歩____。$$, $$No fim da tarde, vou passear no parque.$$),
        (5, $$母が東京へ私に会い____。$$, $$Minha mãe veio a Tóquio para me ver.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-48', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に行きます$$),
        (1, $$にいきます$$),
        (1, $$に行く$$),
        (1, $$にいく$$),
        (2, $$に行きました$$),
        (2, $$にいきました$$),
        (2, $$に行った$$),
        (2, $$にいった$$),
        (3, $$に行きます$$),
        (3, $$にいきます$$),
        (3, $$に行く$$),
        (3, $$にいく$$),
        (4, $$に行きます$$),
        (4, $$にいきます$$),
        (4, $$に行く$$),
        (4, $$にいく$$),
        (5, $$に来ました$$),
        (5, $$にきました$$),
        (5, $$に来た$$),
        (5, $$にきた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-49 — 〜にする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-49',
    'grammar',
    'N5',
    $$〜にする$$,
    $$ni suru$$,
    $$Escolher / Decidir por / Ficar com$$,
    $$にする é usado para dizer que você escolheu ou decidiu algo entre várias opções. Equivale a "escolher", "decidir por" ou "ficar com".

É muito usado em restaurantes, lojas e na hora de combinar planos. Por exemplo, ao pedir uma bebida, dizer "vou ficar com café".

A coisa escolhida vem antes de に, e する indica a decisão. Na forma educada, usa-se にします para a escolha no momento e にしました para uma decisão já tomada.

Em perguntas, 何にしますか é a forma natural de perguntar "o que você vai querer?" ou "o que você escolhe?".

Com ましょう e よう, a estrutura vira uma proposta de escolha para o grupo.$$,
    $$Não confunda essa にする com a にする que indica transformação, como deixar algo limpo ou silencioso. A diferença é que aqui a palavra antes de に é uma opção escolhida.

Em lanchonetes e restaurantes, にします é uma forma mais delicada de pedir do que ください, porque soa como uma escolha pessoal.

Para decisões sobre ações, o japonês usa ことにする, que aparece no N4.$$,
    $$Substantivo + に + する
Substantivo + に + します / しました
何 / どれ / いつ + に + しますか
Substantivo + に + しましょう / しよう$$,
    $$にする$$,
    $$にする|にします|にしました|にした|にしよう|にしましょう$$,
    ARRAY['に', 'する']::text[],
    ARRAY['にする', 'にします', 'にしました', 'にした', 'にしよう', 'にしましょう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-49', $$私はコーヒーにします。$$, $$わたしはコーヒーにします。$$, $$Vou querer café.$$),
    ('n5-grammar-49', $$飲み物は何にしますか。$$, $$のみものはなににしますか。$$, $$O que você vai querer de bebida?$$),
    ('n5-grammar-49', $$旅行は来週にしました。$$, $$りょこうはらいしゅうにしました。$$, $$Decidi fazer a viagem na semana que vem.$$),
    ('n5-grammar-49', $$プレゼントはこのかばんにしよう。$$, $$プレゼントはこのかばんにしよう。$$, $$Vou escolher esta bolsa como presente.$$),
    ('n5-grammar-49', $$会議は三時からにしましょう。$$, $$かいぎはさんじからにしましょう。$$, $$Vamos marcar a reunião a partir das três.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「飲み物は何にしますか。」「紅茶____。」$$, $$"O que vai querer de bebida?" "Vou querer chá."$$),
        (2, $$今日の晩ご飯はカレー____。$$, $$Vamos de curry no jantar de hoje.$$),
        (3, $$迷ったけど、色は赤____。$$, $$Fiquei em dúvida, mas escolhi a cor vermelha.$$),
        (4, $$待ち合わせは駅の前____か。$$, $$Que tal nos encontrarmos em frente à estação?$$),
        (5, $$「どれにしますか。」「じゃ、これ____。」$$, $$"Qual você vai querer?" "Então, vou ficar com este."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-49', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にします$$),
        (2, $$にしましょう$$),
        (2, $$にしよう$$),
        (3, $$にしました$$),
        (3, $$にした$$),
        (4, $$にしましょう$$),
        (4, $$にします$$),
        (5, $$にします$$),
        (5, $$にする$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-50 — に・へ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-50',
    'grammar',
    'N5',
    $$に・へ$$,
    $$ni / e$$,
    $$Para / A / Em direção a$$,
    $$に e へ são usadas para indicar o destino de um movimento, com verbos como ir, vir, voltar e virar. As duas podem ser traduzidas como "para" ou "a".

Na maioria das frases com verbos de movimento, as duas funcionam e o sentido é praticamente o mesmo. A diferença é de foco: に destaca o ponto de chegada, o lugar exato aonde se chega; へ destaca a direção, o caminho em direção a algum lugar.

Por causa dessa ideia de direção, へ combina bem com cartas, mensagens e palavras de direção, como "à direita" ou "para cá".

Uma diferença prática importante: só へ pode ser seguida por の para formar um modificador, como "uma carta para minha mãe". Com に, isso não é possível.$$,
    $$A partícula へ é escrita com o caractere へ, mas é pronunciada "e". É a mesma situação de は, que é lida "wa" quando é partícula.

Em frases educadas de recepção, como こちらへどうぞ, へ é a escolha natural.

Para usos que não são de movimento, como horário, existência e pessoa que recebe algo, só に funciona.$$,
    $$Lugar + に + Verbo de movimento
Lugar + へ + Verbo de movimento
Substantivo + への + Substantivo (só へ)$$,
    $$に$$,
    $$に|へ$$,
    ARRAY['に', 'へ']::text[],
    ARRAY['に', 'へ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-50', $$明日、東京へ行きます。$$, $$あした、とうきょうへいきます。$$, $$Amanhã vou para Tóquio.$$),
    ('n5-grammar-50', $$毎日八時に会社に行きます。$$, $$まいにちはちじにかいしゃにいきます。$$, $$Todo dia vou para a empresa às oito.$$),
    ('n5-grammar-50', $$夏休みに国へ帰りました。$$, $$なつやすみにくにへかえりました。$$, $$Nas férias de verão, voltei para o meu país.$$),
    ('n5-grammar-50', $$こちらへどうぞ。$$, $$こちらへどうぞ。$$, $$Por aqui, por favor.$$),
    ('n5-grammar-50', $$これは母への手紙です。$$, $$これはははへのてがみです。$$, $$Esta é uma carta para minha mãe.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$来週、大阪____行きます。$$, $$Semana que vem, vou para Osaka.$$),
        (2, $$何時に家____帰りますか。$$, $$A que horas você volta para casa?$$),
        (3, $$昨日、友達が私の家____来ました。$$, $$Ontem, um amigo veio à minha casa.$$),
        (4, $$これは先生____のプレゼントです。$$, $$Este é um presente para o professor.$$),
        (5, $$次の角を右____曲がってください。$$, $$Vire à direita na próxima esquina, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-50', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に$$),
        (1, $$へ$$),
        (2, $$に$$),
        (2, $$へ$$),
        (3, $$に$$),
        (3, $$へ$$),
        (4, $$へ$$),
        (5, $$に$$),
        (5, $$へ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-51 — の
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-51',
    'grammar',
    'N5',
    $$の$$,
    $$no$$,
    $$De / Do / Da / O de$$,
    $$の é a partícula que liga dois substantivos. Ela mostra que o primeiro dá alguma informação sobre o segundo, como acontece com "de" em português.

A ordem é o contrário do português: a coisa principal vem depois de の. Assim, "o livro do Tanaka" fica Tanaka + の + livro.

Essa ligação pode indicar posse, origem, assunto, material, local e muitas outras relações. Por exemplo: o carro de alguém, um carro do Japão, um professor de inglês.

の também funciona como pronome, substituindo um substantivo que já ficou claro pelo contexto. Assim, pode significar "o de...", como "é da minha mãe", ou "o...", como em "o vermelho".$$,
    $$Em sequência, の pode aparecer várias vezes, como em "o livro do professor da escola". A lógica continua a mesma: cada の liga o que vem antes ao que vem depois.

Com adjetivos い, não se usa の para ligar a um substantivo: o adjetivo vem direto. Mas, quando o substantivo é omitido, entra の, como em "o vermelho".

Em níveis seguintes, の também transforma verbos em substantivos, como em "gostar de ler".$$,
    $$Substantivo A + の + Substantivo B (B de A)
Substantivo + の (é de... / o de...)
Adjetivo + の (o... / a...; substitui um substantivo)
Substantivo + の + posição + に / で (em cima de, embaixo de)$$,
    $$の$$,
    $$の$$,
    ARRAY['の']::text[],
    ARRAY['の']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-51', $$これは私の本です。$$, $$これはわたしのほんです。$$, $$Este é o meu livro.$$),
    ('n5-grammar-51', $$日本の車はとても人気があります。$$, $$にほんのくるまはとてもにんきがあります。$$, $$Os carros japoneses são muito populares.$$),
    ('n5-grammar-51', $$田中さんは英語の先生です。$$, $$たなかさんはえいごのせんせいです。$$, $$O Tanaka é professor de inglês.$$),
    ('n5-grammar-51', $$このかばんは母のです。$$, $$このかばんはははのです。$$, $$Esta bolsa é da minha mãe.$$),
    ('n5-grammar-51', $$すみません、赤いのをください。$$, $$すみません、あかいのをください。$$, $$Com licença, me dê o vermelho, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あれは田中さん____車です。$$, $$Aquele é o carro do Tanaka.$$),
        (2, $$駅で東京____地図を買いました。$$, $$Comprei um mapa de Tóquio na estação.$$),
        (3, $$「この傘は誰のですか。」「私____です。」$$, $$"De quem é este guarda-chuva?" "É meu."$$),
        (4, $$机の上____本を取ってください。$$, $$Pegue o livro que está em cima da mesa, por favor.$$),
        (5, $$このシャツはちょっと小さいです。もっと大きい____はありますか。$$, $$Esta camisa está um pouco pequena. Tem uma maior?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-51', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$の$$),
        (2, $$の$$),
        (3, $$の$$),
        (4, $$の$$),
        (5, $$の$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-52 — 〜のです
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-52',
    'grammar',
    'N5',
    $$〜のです$$,
    $$no desu$$,
    $$É que / Acontece que / O fato é que$$,
    $$のです tem a mesma função de んです: ele explica, justifica ou pede explicação sobre uma situação. Equivale a "é que...", "acontece que...".

A diferença está no tom. んです é a forma falada e mais natural na conversa. のです é a forma completa, que soa mais formal, mais séria e mais adequada à escrita, como em textos, discursos e explicações cuidadosas.

Com のです, quem fala deixa claro que está apresentando o motivo ou o contexto de algo. Em perguntas, のですか pede uma explicação de forma educada.

Na forma simples, usa-se のだ, que é comum em textos escritos e em reflexões, como quando alguém chega a uma conclusão.$$,
    $$Na fala do dia a dia, usar のです o tempo todo pode soar rígido. Prefira んです em conversas comuns.

Na fala informal, a explicação também pode terminar só com の, principalmente em perguntas e respostas entre amigos.

Com substantivos e adjetivos な, não se esqueça do な antes de のです.$$,
    $$Verbo / Adjetivo い (forma simples) + のです
Substantivo / Adjetivo な + な + のです

Pergunta: 〜のですか
Forma simples: 〜のだ
Forma falada: 〜んです / 〜んだ$$,
    $$のです$$,
    $$のです|のだ$$,
    ARRAY['の', 'です']::text[],
    ARRAY['のです', 'のですか', 'のだ', 'んです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-52', $$今日は体の調子が悪いのです。$$, $$きょうはからだのちょうしがわるいのです。$$, $$É que hoje não estou me sentindo bem.$$),
    ('n5-grammar-52', $$どうして遅れたのですか。$$, $$どうしておくれたのですか。$$, $$Por que você se atrasou?$$),
    ('n5-grammar-52', $$実は、この店は百年前からあるのです。$$, $$じつは、このみせはひゃくねんまえからあるのです。$$, $$Na verdade, esta loja existe há cem anos.$$),
    ('n5-grammar-52', $$明日は大事な試験なのです。$$, $$あしたはだいじなしけんなのです。$$, $$É que amanhã tenho uma prova importante.$$),
    ('n5-grammar-52', $$私が間違っていたのだ。$$, $$わたしがまちがっていたのだ。$$, $$Eu é que estava errado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「どうして休んだのですか。」「熱があった____。」$$, $$"Por que você faltou?" "É que eu estava com febre."$$),
        (2, $$この町は、昔は海だった____。$$, $$Esta cidade, antigamente, era mar.$$),
        (3, $$こんな時間に、どこへ行く____か。$$, $$Aonde você vai a esta hora?$$),
        (4, $$彼は本当に親切な人な____。$$, $$Ele é realmente uma pessoa gentil.$$),
        (5, $$「なぜ日本語を勉強している____か。」「日本で働きたいからです。」$$, $$"Por que você está estudando japonês?" "Porque quero trabalhar no Japão."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-52', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のです$$),
        (2, $$のです$$),
        (2, $$のだ$$),
        (3, $$のです$$),
        (4, $$のです$$),
        (4, $$のだ$$),
        (5, $$のです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-53 — 〜のが下手
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-53',
    'grammar',
    'N5',
    $$〜のが下手$$,
    $$no ga heta$$,
    $$Ser ruim em (fazer) / Não ter jeito para$$,
    $$のが下手 é usado para dizer que alguém não é bom em fazer alguma coisa. Equivale a "ser ruim em" ou "não ter jeito para".

下手 é um adjetivo な que significa "ruim em", "sem habilidade". Para falar de uma ação, e não de uma coisa, é preciso transformar o verbo em substantivo. Isso é feito com の: o verbo na forma de dicionário + の vira algo como "o ato de fazer".

Como 下手 indica a habilidade em relação a algo, a ação é marcada com が, e não com を. A pessoa que tem a dificuldade costuma vir com は.

Com substantivos, como esportes ou idiomas, não é preciso の: basta usar o substantivo + が + 下手.$$,
    $$Falar de si mesmo com 下手 é natural e humilde. Já dizer que outra pessoa é 下手 pode soar rude, então é melhor evitar dizer isso diretamente.

Para falar de algo em que você tem dificuldade ou não gosta de fazer, 苦手 também é muito usado. 苦手 tem mais a ideia de "não me dou bem com isso".

O oposto de 下手 é 上手.$$,
    $$Verbo na forma de dicionário + のが + 下手 + です / だ
Substantivo + が + 下手 + です / だ
Pessoa + は + Verbo + のが下手

Negativo: のが下手じゃない
Escrita: 下手 / へた$$,
    $$のが下手$$,
    $$のが下手|のがへた$$,
    ARRAY['の', 'が', '下手']::text[],
    ARRAY['のが下手', 'のがへた', 'のが下手です', 'のが下手だ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-53', $$私は歌うのが下手です。$$, $$わたしはうたうのがへたです。$$, $$Eu sou ruim em cantar.$$),
    ('n5-grammar-53', $$兄は料理を作るのが下手だ。$$, $$あにはりょうりをつくるのがへただ。$$, $$Meu irmão mais velho não tem jeito para cozinhar.$$),
    ('n5-grammar-53', $$字を書くのが下手なので、パソコンを使います。$$, $$じをかくのがへたなので、パソコンをつかいます。$$, $$Como minha letra é ruim, uso o computador.$$),
    ('n5-grammar-53', $$父は人の名前を覚えるのが下手です。$$, $$ちちはひとのなまえをおぼえるのがへたです。$$, $$Meu pai é ruim em lembrar o nome das pessoas.$$),
    ('n5-grammar-53', $$私は絵を描くのが下手ですが、好きです。$$, $$わたしはえをかくのがへたですが、すきです。$$, $$Sou ruim em desenhar, mas gosto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私は泳ぐ____です。$$, $$Eu sou ruim em nadar.$$),
        (2, $$弟は朝早く起きる____。$$, $$Meu irmão mais novo é ruim em acordar cedo.$$),
        (3, $$私は人の前で話す____です。$$, $$Eu sou ruim em falar na frente das pessoas.$$),
        (4, $$母は機械を使う____です。$$, $$Minha mãe não tem jeito para usar máquinas.$$),
        (5, $$彼はダンスをする____けど、とても楽しそうです。$$, $$Ele dança mal, mas parece se divertir muito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-53', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のが下手$$),
        (1, $$のがへた$$),
        (2, $$のが下手です$$),
        (2, $$のがへたです$$),
        (2, $$のが下手だ$$),
        (2, $$のがへただ$$),
        (3, $$のが下手$$),
        (3, $$のがへた$$),
        (4, $$のが下手$$),
        (4, $$のがへた$$),
        (5, $$のが下手だ$$),
        (5, $$のがへただ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-54 — 〜のが上手
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-54',
    'grammar',
    'N5',
    $$〜のが上手$$,
    $$no ga jouzu$$,
    $$Ser bom em (fazer) / Ter jeito para$$,
    $$のが上手 é usado para dizer que alguém é bom em fazer alguma coisa. Equivale a "ser bom em" ou "ter jeito para".

上手 é um adjetivo な que significa "habilidoso". Para falar de uma ação, o verbo na forma de dicionário recebe の, que o transforma em substantivo, e depois vem が + 上手.

A ação é marcada com が, porque 上手 descreve a habilidade em relação a ela. A pessoa que tem a habilidade costuma vir com は.

Com substantivos, como esportes, idiomas e instrumentos, não é preciso の: basta usar o substantivo + が + 上手.$$,
    $$Em japonês, não se costuma usar 上手 para falar das próprias habilidades, porque soa como se gabar. Para isso, usa-se 得意, que significa "ser bom em" ou "ser o meu forte".

Elogiar alguém com 上手ですね é muito comum. A resposta educada e humilde costuma ser いいえ、まだまだです.

O oposto de 上手 é 下手.$$,
    $$Verbo na forma de dicionário + のが + 上手 + です / だ
Substantivo + が + 上手 + です / だ
Pessoa + は + Verbo + のが上手

Negativo: のが上手じゃない
Escrita: 上手 / じょうず$$,
    $$のが上手$$,
    $$のが上手|のがじょうず$$,
    ARRAY['の', 'が', '上手']::text[],
    ARRAY['のが上手', 'のがじょうず', 'のが上手です', 'のが上手だ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-54', $$姉は歌うのが上手です。$$, $$あねはうたうのがじょうずです。$$, $$Minha irmã mais velha canta bem.$$),
    ('n5-grammar-54', $$田中さんは料理を作るのが上手ですね。$$, $$たなかさんはりょうりをつくるのがじょうずですね。$$, $$O Tanaka cozinha bem, hein.$$),
    ('n5-grammar-54', $$弟は絵を描くのが上手だ。$$, $$おとうとはえをかくのがじょうずだ。$$, $$Meu irmão mais novo desenha bem.$$),
    ('n5-grammar-54', $$山田先生は教えるのが上手です。$$, $$やまだせんせいはおしえるのがじょうずです。$$, $$O professor Yamada ensina bem.$$),
    ('n5-grammar-54', $$彼は人の話を聞くのが上手です。$$, $$かれはひとのはなしをきくのがじょうずです。$$, $$Ele sabe ouvir bem as pessoas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父は車を運転する____です。$$, $$Meu pai dirige bem.$$),
        (2, $$妹はピアノを弾く____。$$, $$Minha irmã mais nova toca piano bem.$$),
        (3, $$田中さんは写真を撮る____ですね。$$, $$O Tanaka tira fotos bem, hein.$$),
        (4, $$あの子は友達を作る____です。$$, $$Aquela criança tem jeito para fazer amigos.$$),
        (5, $$母は安くていい物を見つける____です。$$, $$Minha mãe é ótima em achar coisas boas e baratas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-54', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のが上手$$),
        (1, $$のがじょうず$$),
        (2, $$のが上手です$$),
        (2, $$のがじょうずです$$),
        (2, $$のが上手だ$$),
        (2, $$のがじょうずだ$$),
        (3, $$のが上手$$),
        (3, $$のがじょうず$$),
        (4, $$のが上手$$),
        (4, $$のがじょうず$$),
        (5, $$のが上手$$),
        (5, $$のがじょうず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-55 — 〜のが好き
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-55',
    'grammar',
    'N5',
    $$〜のが好き$$,
    $$no ga suki$$,
    $$Gostar de (fazer)$$,
    $$のが好き é usado para dizer que alguém gosta de fazer alguma coisa. Equivale a "gostar de" + ação.

好き é um adjetivo な, e não um verbo. Por isso, a coisa de que se gosta é marcada com が. Para falar de uma ação, o verbo na forma de dicionário recebe の, que o transforma em substantivo: "o ato de ler", "o ato de nadar".

A pessoa que gosta costuma vir com は. Para reforçar, usa-se 大好き, que significa "adorar".

O negativo segue a regra dos adjetivos な: のが好きじゃない ou のが好きではありません. No passado, のが好きでした ou のが好きだった.$$,
    $$Em frases negativas ou de contraste, é comum trocar が por は, como em のは好きじゃない, para destacar que é aquela ação específica que a pessoa não gosta.

Um erro muito comum é usar o verbo direto antes de 好き, sem の. O verbo precisa virar substantivo primeiro.

A forma こと também pode transformar verbos em substantivos, mas com 好き, o mais natural no dia a dia é の.$$,
    $$Verbo na forma de dicionário + のが + 好き + です / だ
Verbo na forma de dicionário + のが + 大好き + です / だ
Pessoa + は + Verbo + のが好き
Verbo + のが好きな + Substantivo

Negativo: のが好きじゃない / のが好きではありません
Passado: のが好きでした / のが好きだった$$,
    $$のが好き$$,
    $$のが好き|のがすき|のが大好き|のがだいすき$$,
    ARRAY['の', 'が', '好き']::text[],
    ARRAY['のが好き', 'のがすき', 'のが大好き', 'のが好きです', 'のが好きだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-55', $$私は本を読むのが好きです。$$, $$わたしはほんをよむのがすきです。$$, $$Eu gosto de ler livros.$$),
    ('n5-grammar-55', $$弟はゲームをするのが大好きです。$$, $$おとうとはゲームをするのがだいすきです。$$, $$Meu irmão mais novo adora jogar videogame.$$),
    ('n5-grammar-55', $$週末に公園を歩くのが好きです。$$, $$しゅうまつにこうえんをあるくのがすきです。$$, $$Gosto de caminhar no parque no fim de semana.$$),
    ('n5-grammar-55', $$子供のころ、絵を描くのが好きでした。$$, $$こどものころ、えをかくのがすきでした。$$, $$Quando eu era criança, gostava de desenhar.$$),
    ('n5-grammar-55', $$彼女は友達と話すのが好きな人です。$$, $$かのじょはともだちとはなすのがすきなひとです。$$, $$Ela é uma pessoa que gosta de conversar com os amigos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私は音楽を聞く____です。$$, $$Eu gosto de ouvir música.$$),
        (2, $$母は花を育てる____です。$$, $$Minha mãe gosta de cultivar flores.$$),
        (3, $$子供のころ、川で泳ぐ____でした。$$, $$Quando eu era criança, gostava de nadar no rio.$$),
        (4, $$犬と散歩する____ですか。$$, $$Você gosta de passear com o cachorro?$$),
        (5, $$日本の歌を歌う____人は多いです。$$, $$Tem muitas pessoas que gostam de cantar músicas japonesas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-55', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のが好き$$),
        (1, $$のがすき$$),
        (1, $$のが大好き$$),
        (1, $$のがだいすき$$),
        (2, $$のが好き$$),
        (2, $$のがすき$$),
        (2, $$のが大好き$$),
        (2, $$のがだいすき$$),
        (3, $$のが好き$$),
        (3, $$のがすき$$),
        (3, $$のが大好き$$),
        (3, $$のがだいすき$$),
        (4, $$のが好き$$),
        (4, $$のがすき$$),
        (5, $$のが好きな$$),
        (5, $$のがすきな$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-56 — 〜の中で〜が一番
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-56',
    'grammar',
    'N5',
    $$〜の中で〜が一番$$,
    $$no naka de ~ ga ichiban$$,
    $$Entre... o mais / De todos... o mais$$,
    $$Essa estrutura é usada para dizer qual elemento de um grupo é "o mais" em alguma característica. É o superlativo dentro de um grupo.

A primeira parte, の中で, apresenta o grupo de comparação: "entre as frutas", "na família", "entre os esportes". Literalmente, 中 significa "dentro", então a ideia é "dentro desse grupo".

Depois vem o elemento escolhido, marcado com が, e 一番 com o adjetivo ou com 好き / 嫌い.

Para perguntar, usa-se uma palavra interrogativa no lugar do elemento: 何 para coisas, 誰 para pessoas, どこ para lugares e いつ para tempo. A resposta repete a estrutura com o elemento escolhido.$$,
    $$Quando o grupo é um lugar, como um país ou uma cidade, é comum usar só で, sem の中, para dizer "no Japão" ou "na turma".

Para comparar exatamente duas coisas, não se usa の中で〜一番, e sim より e ほうが.

A palavra de pergunta muda conforme o tipo de coisa no grupo. Escolher a palavra certa é um ponto que costuma cair em provas.$$,
    $$[Grupo] + の中で + [A] + が + 一番 + Adjetivo / 好き
[Grupo] + の中で + 何 / 誰 / どこ / いつ / どれ + が + 一番 + Adjetivo + ですか

Escrita: の中で / のなかで$$,
    $$の中で$$,
    $$の中で|のなかで$$,
    ARRAY['の', '中', 'で', 'が', '一番']::text[],
    ARRAY['の中で', 'のなかで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-56', $$果物の中でいちごが一番好きです。$$, $$くだもののなかでいちごがいちばんすきです。$$, $$Entre as frutas, a que eu mais gosto é morango.$$),
    ('n5-grammar-56', $$家族の中で父が一番背が高いです。$$, $$かぞくのなかでちちがいちばんせがたかいです。$$, $$Na minha família, o mais alto é meu pai.$$),
    ('n5-grammar-56', $$日本の町の中でどこが一番好きですか。$$, $$にほんのまちのなかでどこがいちばんすきですか。$$, $$Entre as cidades do Japão, qual você mais gosta?$$),
    ('n5-grammar-56', $$一年の中で八月が一番暑いです。$$, $$いちねんのなかではちがつがいちばんあついです。$$, $$No ano, o mês mais quente é agosto.$$),
    ('n5-grammar-56', $$クラスの中で誰が一番速く走りますか。$$, $$クラスのなかでだれがいちばんはやくはしりますか。$$, $$Na turma, quem corre mais rápido?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$スポーツ____サッカーが一番好きです。$$, $$Entre os esportes, o que eu mais gosto é futebol.$$),
        (2, $$季節____いつが一番好きですか。$$, $$Entre as estações, qual você mais gosta?$$),
        (3, $$この三つの____どれが一番安いですか。$$, $$Destes três, qual é o mais barato?$$),
        (4, $$兄弟____私が一番若いです。$$, $$Entre os irmãos, eu sou o mais novo.$$),
        (5, $$日本料理の中で何____好きですか。$$, $$Da culinária japonesa, o que você mais gosta?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-56', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$の中で$$),
        (1, $$のなかで$$),
        (2, $$の中で$$),
        (2, $$のなかで$$),
        (3, $$中で$$),
        (3, $$なかで$$),
        (4, $$の中で$$),
        (4, $$のなかで$$),
        (5, $$が一番$$),
        (5, $$がいちばん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-57 — 〜ので
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-57',
    'grammar',
    'N5',
    $$〜ので$$,
    $$node$$,
    $$Porque / Como / Por isso$$,
    $$ので é usado para dar o motivo ou a causa de algo. Equivale a "porque", "como" ou "por isso", dependendo da frase.

A ordem é: primeiro o motivo, depois o resultado. ので fica no final da parte que explica o motivo.

A grande diferença entre ので e から está no tom. ので apresenta o motivo como algo objetivo, como um fato natural. Por isso, soa mais suave e educado, e é muito usado em pedidos, desculpas e explicações formais. から soa mais direto e pessoal.

Com substantivos e adjetivos な, usa-se な antes de ので, e não だ.$$,
    $$Para pedir permissão ou se desculpar, ので é quase sempre a melhor escolha, porque não soa como uma justificativa forçada.

Na fala rápida, ので às vezes vira んで. É bem coloquial.

Diferente de から, ので normalmente não é usado no final da frase para responder diretamente uma pergunta com どうして. Nesses casos, からです soa mais natural.$$,
    $$Verbo / Adjetivo い (forma simples) + ので
Substantivo / Adjetivo な + な + ので

Mais formal: Verbo ます / です + ので$$,
    $$ので$$,
    $$ので$$,
    ARRAY['ので']::text[],
    ARRAY['ので', 'なので']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-57', $$雨が降っているので、タクシーで行きます。$$, $$あめがふっているので、タクシーでいきます。$$, $$Como está chovendo, vou de táxi.$$),
    ('n5-grammar-57', $$頭が痛いので、今日は早く帰ります。$$, $$あたまがいたいので、きょうははやくかえります。$$, $$Estou com dor de cabeça, então hoje vou embora mais cedo.$$),
    ('n5-grammar-57', $$明日は休みなので、ゆっくり寝ます。$$, $$あしたはやすみなので、ゆっくりねます。$$, $$Amanhã é folga, então vou dormir bastante.$$),
    ('n5-grammar-57', $$道が混んでいたので、会議に遅れました。$$, $$みちがこんでいたので、かいぎにおくれました。$$, $$O trânsito estava ruim, então me atrasei para a reunião.$$),
    ('n5-grammar-57', $$すみません、用事があるので、お先に失礼します。$$, $$すみません、ようじがあるので、おさきにしつれいします。$$, $$Desculpe, tenho um compromisso, então vou indo antes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$熱がある____、学校を休みます。$$, $$Estou com febre, então vou faltar à escola.$$),
        (2, $$この本はおもしろい____、毎日読んでいます。$$, $$Este livro é interessante, então leio todo dia.$$),
        (3, $$今日は日曜日な____、銀行は休みです。$$, $$Hoje é domingo, então o banco está fechado.$$),
        (4, $$電車が遅れた____、遅刻しました。$$, $$O trem atrasou, então cheguei atrasado.$$),
        (5, $$少し寒い____、窓を閉めてもいいですか。$$, $$Está um pouco frio, então posso fechar a janela?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-57', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ので$$),
        (2, $$ので$$),
        (3, $$ので$$),
        (4, $$ので$$),
        (5, $$ので$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-58 — を
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-58',
    'grammar',
    'N5',
    $$を$$,
    $$wo / o$$,
    $$Marca o objeto direto / Por (percurso) / De (saída)$$,
    $$を é a partícula que marca o objeto direto, ou seja, aquilo que recebe a ação do verbo: o que se come, o que se lê, o que se compra.

Ela vem logo depois do objeto e antes do verbo. Como em japonês o verbo fica no final, を ajuda a mostrar claramente "o quê" está sendo feito.

を também tem um uso com verbos de movimento. Nesse caso, ela marca o espaço por onde a pessoa passa, como andar por um parque, atravessar uma rua ou virar em uma esquina.

Com verbos como 出る (sair) e 降りる (descer de um veículo), を marca o lugar de onde se sai.$$,
    $$A partícula を é escrita com o caractere を, mas é pronunciada "o" na fala comum. Ela quase só aparece como partícula.

Com verbos como 好き, ほしい, わかる e できる, o objeto é marcado com が, e não com を, porque essas palavras não são verbos de ação comuns.

Na fala muito casual, を costuma ser omitida, mas na escrita e em situações educadas ela deve aparecer.$$,
    $$Substantivo + を + Verbo transitivo
Lugar + を + Verbo de movimento (andar / passar / atravessar / virar)
Lugar + を + 出る / 降りる (lugar de onde se sai)$$,
    $$を$$,
    $$を$$,
    ARRAY['を']::text[],
    ARRAY['を']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-58', $$毎朝パンを食べます。$$, $$まいあさパンをたべます。$$, $$Como pão toda manhã.$$),
    ('n5-grammar-58', $$日本語を勉強しています。$$, $$にほんごをべんきょうしています。$$, $$Estou estudando japonês.$$),
    ('n5-grammar-58', $$昨日、公園を散歩しました。$$, $$きのう、こうえんをさんぽしました。$$, $$Ontem passeei pelo parque.$$),
    ('n5-grammar-58', $$次の角を右に曲がってください。$$, $$つぎのかどをみぎにまがってください。$$, $$Vire à direita na próxima esquina, por favor.$$),
    ('n5-grammar-58', $$毎朝八時に家を出ます。$$, $$まいあさはちじにいえをでます。$$, $$Saio de casa às oito toda manhã.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎晩テレビ____見ます。$$, $$Vejo TV toda noite.$$),
        (2, $$昨日、友達に手紙____書きました。$$, $$Ontem escrevi uma carta para um amigo.$$),
        (3, $$この道____まっすぐ行ってください。$$, $$Siga reto por esta rua, por favor.$$),
        (4, $$次の駅で電車____降ります。$$, $$Vou descer do trem na próxima estação.$$),
        (5, $$子供たちが道____渡っています。$$, $$As crianças estão atravessando a rua.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-58', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を$$),
        (2, $$を$$),
        (3, $$を$$),
        (4, $$を$$),
        (5, $$を$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-59 — 〜をください
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-59',
    'grammar',
    'N5',
    $$〜をください$$,
    $$o kudasai$$,
    $$Me dê... / Quero... (por favor)$$,
    $$をください é usado para pedir uma coisa a alguém. Equivale a "me dê..., por favor" ou "quero...".

A coisa pedida vem antes de を, e ください é a forma educada de pedir. É a forma mais simples e comum de pedir algo em lojas, restaurantes e no dia a dia.

Para dizer a quantidade, o número com contador vem depois de を e antes de ください. Assim, a ordem fica: coisa + を + quantidade + ください.

Também é possível pedir coisas abstratas, como tempo, um momento ou uma resposta.$$,
    $$Na fala, é muito comum omitir を e dizer só a coisa + ください.

Em restaurantes, também se usa お願いします no lugar de ください, o que soa um pouco mais educado.

Não confunda com てください, que vem depois de um verbo e pede para alguém fazer uma ação. をください pede uma coisa.$$,
    $$Substantivo + を + ください
Substantivo + を + Quantidade + ください
Substantivo A + を + Quantidade + と + Substantivo B + を + Quantidade + ください$$,
    $$をください$$,
    $$をください|ください$$,
    ARRAY['を', 'ください']::text[],
    ARRAY['をください', 'ください']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-59', $$水をください。$$, $$みずをください。$$, $$Me dê água, por favor.$$),
    ('n5-grammar-59', $$このりんごを三つください。$$, $$このりんごをみっつください。$$, $$Me dê três destas maçãs, por favor.$$),
    ('n5-grammar-59', $$すみません、メニューをください。$$, $$すみません、メニューをください。$$, $$Com licença, me traga o cardápio, por favor.$$),
    ('n5-grammar-59', $$コーヒーを一つとケーキを二つください。$$, $$コーヒーをひとつとケーキをふたつください。$$, $$Um café e dois bolos, por favor.$$),
    ('n5-grammar-59', $$少し時間をください。$$, $$すこしじかんをください。$$, $$Me dê um pouco de tempo, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$すみません、お茶____。$$, $$Com licença, me dê um chá, por favor.$$),
        (2, $$郵便局で切手を五枚____。$$, $$No correio: me dê cinco selos, por favor.$$),
        (3, $$この赤いシャツ____。$$, $$Quero esta camisa vermelha, por favor.$$),
        (4, $$もう少し考える時間____。$$, $$Me dê um pouco mais de tempo para pensar, por favor.$$),
        (5, $$「ご注文は？」「ラーメンを一つ____。」$$, $$"O que vai pedir?" "Um ramen, por favor."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-59', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をください$$),
        (2, $$ください$$),
        (3, $$をください$$),
        (4, $$をください$$),
        (5, $$ください$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-60 — しかし
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-60',
    'grammar',
    'N5',
    $$しかし$$,
    $$shikashi$$,
    $$Porém / Entretanto / No entanto / Mas$$,
    $$しかし é uma conjunção que liga duas frases com ideias contrárias. Equivale a "porém", "entretanto" ou "no entanto".

Ela fica no começo da segunda frase, depois de um ponto final. A primeira frase apresenta uma ideia, e a segunda, iniciada por しかし, traz algo que contrasta com ela ou que vai contra o esperado.

O significado é parecido com でも, mas o tom é diferente. しかし soa formal e é típico de textos escritos, como jornais, redações, relatórios e discursos. でも é muito mais comum na conversa.

Por isso, usar しかし numa conversa casual entre amigos pode soar sério ou exagerado.$$,
    $$しかし combina bem com a forma simples (だ / である) em textos escritos, mas também aparece com です e ます em discursos e explicações formais.

Outras palavras de contraste com tom parecido são けれども, ところが e だが. ところが indica algo inesperado, e だが é ainda mais formal.

Em provas de leitura do JLPT, しかし costuma ser um sinal importante: a ideia principal do texto muitas vezes aparece logo depois dele.$$,
    $$Frase 1 (com ponto final) + しかし、 + Frase 2$$,
    $$しかし$$,
    $$しかし$$,
    ARRAY['しかし']::text[],
    ARRAY['しかし']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-60', $$この町は便利だ。しかし、家賃が高い。$$, $$このまちはべんりだ。しかし、やちんがたかい。$$, $$Esta cidade é prática. No entanto, o aluguel é caro.$$),
    ('n5-grammar-60', $$彼はよく勉強した。しかし、試験に落ちた。$$, $$かれはよくべんきょうした。しかし、しけんにおちた。$$, $$Ele estudou bastante. Porém, foi reprovado na prova.$$),
    ('n5-grammar-60', $$天気予報は晴れでした。しかし、午後から雨が降りました。$$, $$てんきよほうははれでした。しかし、ごごからあめがふりました。$$, $$A previsão era de sol. No entanto, choveu a partir da tarde.$$),
    ('n5-grammar-60', $$日本の夏は暑いです。しかし、冬はとても寒いです。$$, $$にほんのなつはあついです。しかし、ふゆはとてもさむいです。$$, $$O verão no Japão é quente. Porém, o inverno é muito frio.$$),
    ('n5-grammar-60', $$新しい薬はよく効く。しかし、少し高い。$$, $$あたらしいくすりはよくきく。しかし、すこしたかい。$$, $$O remédio novo funciona bem. Entretanto, é um pouco caro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この店の料理はおいしいです。____、少し高いです。$$, $$A comida deste restaurante é gostosa. Porém, é um pouco cara.$$),
        (2, $$毎日練習しました。____、試合に負けました。$$, $$Treinei todo dia. No entanto, perdi a partida.$$),
        (3, $$この部屋は広い。____、駅から遠い。$$, $$Este quarto é amplo. Porém, é longe da estação.$$),
        (4, $$彼は「すぐ行く」と言った。____、まだ来ない。$$, $$Ele disse "já vou". No entanto, ainda não chegou.$$),
        (5, $$説明書を読みました。____、使い方がわかりません。$$, $$Li o manual. Porém, não entendo como usar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-60', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$しかし$$),
        (2, $$しかし$$),
        (3, $$しかし$$),
        (4, $$しかし$$),
        (5, $$しかし$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-61 — 〜すぎる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-61',
    'grammar',
    'N5',
    $$〜すぎる$$,
    $$sugiru$$,
    $$Demais / Excessivamente$$,
    $$すぎる é usado para dizer que algo passou do limite, ou seja, é "demais". Equivale a "demais" ou "excessivamente".

O verbo すぎる sozinho significa "passar", "ultrapassar". Quando é ligado a outra palavra, ele mostra que aquela ação ou característica foi além do normal ou do adequado.

Com verbos, tira-se ます e acrescenta-se すぎる, como em "comer demais". Com adjetivos い, tira-se o い. Com adjetivos な, basta tirar o な.

Na maioria das vezes, すぎる tem um tom negativo: indica que o excesso causou algum problema. Por isso, é comum aparecer na forma すぎて, ligando o excesso ao resultado.

Depois de ligado, すぎる se conjuga como um verbo comum: すぎます, すぎた, すぎて.$$,
    $$Na fala jovem, すぎる às vezes é usado de forma positiva, como em elogios exagerados. Mesmo assim, o sentido básico é "passou do ponto".

O substantivo すぎ também existe, como em 食べすぎ e 飲みすぎ, que significam "o excesso de comer" e "o excesso de beber".

Com adjetivos い terminados em ない, como 少ない, a forma é 少なすぎる, sem さ. O さ aparece apenas com ない sozinho e com adjetivos formados com ない.$$,
    $$Verbo na forma ます sem ます + すぎる
Adjetivo い sem い + すぎる
Adjetivo な (sem な) + すぎる

Exceções: いい → よすぎる / ない → なさすぎる

Educado: すぎます
Passado: すぎた / すぎました
Ligando: すぎて

Escrita: すぎる / 過ぎる$$,
    $$すぎる$$,
    $$すぎる|すぎます|すぎました|すぎた|すぎて|過ぎる|過ぎます|過ぎた|過ぎて$$,
    ARRAY['すぎる']::text[],
    ARRAY['すぎる', 'すぎます', 'すぎた', 'すぎました', 'すぎて', '過ぎる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-61', $$昨日は食べすぎました。$$, $$きのうはたべすぎました。$$, $$Ontem comi demais.$$),
    ('n5-grammar-61', $$このかばんは高すぎます。$$, $$このかばんはたかすぎます。$$, $$Esta bolsa é cara demais.$$),
    ('n5-grammar-61', $$この部屋は静かすぎて、ちょっと怖い。$$, $$このへやはしずかすぎて、ちょっとこわい。$$, $$Este quarto é silencioso demais, dá um pouco de medo.$$),
    ('n5-grammar-61', $$お酒を飲みすぎて、頭が痛いです。$$, $$おさけをのみすぎて、あたまがいたいです。$$, $$Bebi demais e estou com dor de cabeça.$$),
    ('n5-grammar-61', $$この問題は難しすぎて、全然わからない。$$, $$このもんだいはむずかしすぎて、ぜんぜんわからない。$$, $$Esta questão é difícil demais, não entendo nada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このカレーは辛____。$$, $$Este curry é apimentado demais.$$),
        (2, $$昨日はテレビを見____、目が痛いです。$$, $$Ontem vi TV demais e estou com os olhos doendo.$$),
        (3, $$この靴は私には大き____。$$, $$Estes sapatos são grandes demais para mim.$$),
        (4, $$昨日の夜、ゲームをし____。$$, $$Ontem à noite, joguei videogame demais.$$),
        (5, $$彼の説明は簡単____、よくわかりませんでした。$$, $$A explicação dele foi simples demais, e eu não entendi direito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-61', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$すぎます$$),
        (1, $$すぎる$$),
        (2, $$すぎて$$),
        (3, $$すぎます$$),
        (3, $$すぎる$$),
        (4, $$すぎました$$),
        (4, $$すぎた$$),
        (5, $$すぎて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-62 — 〜たことがある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-62',
    'grammar',
    'N5',
    $$〜たことがある$$,
    $$ta koto ga aru$$,
    $$Já ter feito / Ter a experiência de$$,
    $$たことがある é usado para falar de experiências de vida: coisas que a pessoa já fez pelo menos uma vez. Equivale a "já ter feito".

A estrutura junta o verbo no passado (forma た) com こと, que transforma a ação em "a experiência de ter feito", e がある, que indica que essa experiência existe.

Na forma negativa, たことがない significa "nunca ter feito". Em perguntas, たことがありますか pergunta se a pessoa já teve aquela experiência.

Um ponto importante: essa estrutura fala de experiências em geral, sem um momento específico. Por isso, não costuma ser usada com coisas muito recentes ou do dia a dia, como "já comi hoje". Nesses casos, usa-se apenas o passado.$$,
    $$Para reforçar "nunca", é comum usar 一度も com a forma negativa.

Para dizer quantas vezes você já fez algo, coloca-se o número de vezes antes de ある, como 二回ある.

Não confunda com a forma de dicionário + ことがある, que aparece no N4 e significa "às vezes acontece de...".$$,
    $$Verbo na forma た + ことがある
Verbo na forma た + ことがあります (educado)

Negativo: たことがない / たことがありません
Pergunta: たことがありますか

Com verbos cuja forma た termina em だ: だことがある$$,
    $$たことがある$$,
    $$たことがある|たことがあります|たことがない|たことがありません|だことがある|だことがあります|だことがない|だことがありません$$,
    ARRAY['た', 'こと', 'が', 'ある']::text[],
    ARRAY['たことがある', 'たことがあります', 'たことがない', 'たことがありません', 'だことがある', 'だことがない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-62', $$富士山に登ったことがあります。$$, $$ふじさんにのぼったことがあります。$$, $$Já subi o Monte Fuji.$$),
    ('n5-grammar-62', $$日本の映画を見たことがありますか。$$, $$にほんのえいがをみたことがありますか。$$, $$Você já viu algum filme japonês?$$),
    ('n5-grammar-62', $$私は一度も海外に行ったことがない。$$, $$わたしはいちどもかいがいにいったことがない。$$, $$Eu nunca fui ao exterior.$$),
    ('n5-grammar-62', $$この本は前に読んだことがあります。$$, $$このほんはまえによんだことがあります。$$, $$Já li este livro antes.$$),
    ('n5-grammar-62', $$納豆を食べたことがありますが、あまり好きじゃありません。$$, $$なっとうをたべたことがありますが、あまりすきじゃありません。$$, $$Já comi natto, mas não gosto muito.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$京都に行っ____。$$, $$Já fui a Kyoto.$$),
        (2, $$すしを食べ____か。$$, $$Você já comeu sushi?$$),
        (3, $$私は飛行機に乗っ____。$$, $$Eu nunca andei de avião.$$),
        (4, $$この歌は聞い____けど、名前を知りません。$$, $$Já ouvi esta música, mas não sei o nome.$$),
        (5, $$日本の小説を読ん____か。$$, $$Você já leu algum romance japonês?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-62', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たことがあります$$),
        (1, $$たことがある$$),
        (2, $$たことがあります$$),
        (3, $$たことがありません$$),
        (3, $$たことがない$$),
        (4, $$たことがある$$),
        (4, $$たことがあります$$),
        (5, $$だことがあります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-63 — 〜たい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-63',
    'grammar',
    'N5',
    $$〜たい$$,
    $$tai$$,
    $$Querer (fazer)$$,
    $$たい é usado para dizer que você quer fazer alguma coisa. Equivale a "querer" + verbo.

Ele é formado tirando ます do verbo e acrescentando たい. O resultado funciona como um adjetivo い, então se conjuga como tal: たくない (não quero), たかった (queria) e たくなかった (não queria).

O objeto do verbo pode ser marcado com を ou com が. Usar が dá um pouco mais de destaque ao objeto desejado.

たい expressa o desejo interno de quem fala. Por isso, em afirmações, é usado para "eu quero" e, em perguntas, para "você quer?". Para falar do desejo de outra pessoa, usa-se たがっている, ou cita-se o que ela disse.

Para querer uma coisa (substantivo), e não uma ação, usa-se ほしい.$$,
    $$Perguntar a um superior o que ele quer fazer com たいですか pode soar direto demais. Em situações formais, prefere-se uma pergunta mais indireta.

たい é diferente de つもり: たい expressa vontade, enquanto つもり expressa plano ou intenção.

Como たい é um adjetivo い, não se usa だ depois dele.$$,
    $$Verbo na forma ます sem ます + たい
Verbo sem ます + たいです (educado)

Negativo: たくない / たくないです / たくありません
Passado: たかった / たかったです
Passado negativo: たくなかった

Objeto: Substantivo + を / が + Verbo たい$$,
    $$たい$$,
    $$たい|たくない|たかった|たくなかった|たくありません$$,
    ARRAY['たい']::text[],
    ARRAY['たい', 'たいです', 'たくない', 'たくありません', 'たかった', 'たくなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-63', $$いつか日本へ行きたいです。$$, $$いつかにほんへいきたいです。$$, $$Algum dia quero ir ao Japão.$$),
    ('n5-grammar-63', $$冷たい水が飲みたい。$$, $$つめたいみずがのみたい。$$, $$Quero beber água gelada.$$),
    ('n5-grammar-63', $$今日は何もしたくない。$$, $$きょうはなにもしたくない。$$, $$Hoje não quero fazer nada.$$),
    ('n5-grammar-63', $$子供のころ、パイロットになりたかったです。$$, $$こどものころ、パイロットになりたかったです。$$, $$Quando eu era criança, queria ser piloto.$$),
    ('n5-grammar-63', $$将来、何をしたいですか。$$, $$しょうらい、なにをしたいですか。$$, $$O que você quer fazer no futuro?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$新しい車を買い____です。$$, $$Quero comprar um carro novo.$$),
        (2, $$疲れたから、早く寝____。$$, $$Estou cansado, então quero dormir cedo.$$),
        (3, $$今日は雨だから、出かけ____。$$, $$Hoje está chovendo, então não quero sair.$$),
        (4, $$子供のころは医者になり____。$$, $$Quando eu era criança, queria ser médico.$$),
        (5, $$夏休みに何をし____ですか。$$, $$O que você quer fazer nas férias de verão?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-63', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たい$$),
        (2, $$たい$$),
        (2, $$たいです$$),
        (3, $$たくない$$),
        (3, $$たくないです$$),
        (3, $$たくありません$$),
        (4, $$たかった$$),
        (4, $$たかったです$$),
        (5, $$たい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-64 — 〜たり〜たりする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-64',
    'grammar',
    'N5',
    $$〜たり〜たりする$$,
    $$tari ~ tari suru$$,
    $$Fazer coisas como... e... / Às vezes... às vezes...$$,
    $$たり〜たりする é usado para listar ações como exemplos, sem dizer que são as únicas. Equivale a "fazer coisas como A e B".

Cada verbo da lista vai para a forma た e recebe り. No final, a frase termina com する, que carrega o tempo e o nível de formalidade: します, しました, しています.

A ordem das ações não importa e não indica sequência. A ideia é apenas mostrar alguns exemplos do que se faz ou fez.

Quando os dois verbos são opostos, como vir e não vir, ou quente e frio, a estrutura indica alternância: "às vezes A, às vezes B".

Também é possível usar só um たり para dar um exemplo, deixando subentendido que há outras coisas.$$,
    $$Um erro comum é esquecer o する no final. Sem ele, a frase fica incompleta.

Para listar ações em ordem, uma depois da outra, o japonês usa a forma て, e não たり.

Com substantivos, a lista de exemplos é feita com や, que tem uma ideia parecida.$$,
    $$Verbo A na forma た + り + Verbo B na forma た + り + する
Verbo na forma た + り + する (um único exemplo)
Adjetivo い sem い + かったり
Substantivo / Adjetivo な + だったり

Com verbos cuja forma た termina em だ: だり$$,
    $$たり$$,
    $$たり|だり$$,
    ARRAY['たり', 'する']::text[],
    ARRAY['たり', 'だり', 'たりする', 'たりします', 'たりしました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-64', $$週末は掃除をしたり、洗濯をしたりします。$$, $$しゅうまつはそうじをしたり、せんたくをしたりします。$$, $$No fim de semana, faço coisas como limpar a casa e lavar roupa.$$),
    ('n5-grammar-64', $$休みの日は本を読んだり、映画を見たりしています。$$, $$やすみのひはほんをよんだり、えいがをみたりしています。$$, $$Nos dias de folga, fico lendo livros, vendo filmes e coisas assim.$$),
    ('n5-grammar-64', $$パーティーで歌ったり踊ったりしました。$$, $$パーティーでうたったりおどったりしました。$$, $$Na festa, cantamos, dançamos e tudo mais.$$),
    ('n5-grammar-64', $$最近、天気は暑かったり寒かったりします。$$, $$さいきん、てんきはあつかったりさむかったりします。$$, $$Ultimamente, o tempo às vezes está quente, às vezes frio.$$),
    ('n5-grammar-64', $$昨日は友達と買い物をしたりして、楽しかったです。$$, $$きのうはともだちとかいものをしたりして、たのしかったです。$$, $$Ontem fiz compras com amigos, entre outras coisas, e foi divertido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$日曜日はテレビを見____、ゲームをしたりします。$$, $$No domingo, faço coisas como ver TV e jogar videogame.$$),
        (2, $$夏休みは海で泳い____、山に登ったりしました。$$, $$Nas férias de verão, nadei no mar, subi montanhas e tudo mais.$$),
        (3, $$電車の中で音楽を聞い____、寝たりします。$$, $$No trem, faço coisas como ouvir música e dormir.$$),
        (4, $$彼は授業に来____来なかったりします。$$, $$Ele às vezes vem à aula, às vezes não.$$),
        (5, $$カフェで友達と話し____、お茶を飲んだりしました。$$, $$Na cafeteria, conversei com amigos, tomei chá e coisas assim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-64', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たり$$),
        (2, $$だり$$),
        (3, $$たり$$),
        (4, $$たり$$),
        (5, $$たり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-65 — 〜てある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-65',
    'grammar',
    'N5',
    $$〜てある$$,
    $$te aru$$,
    $$Estar feito / Ter sido deixado / Estar preparado$$,
    $$てある é usado para descrever o estado de algo que alguém fez de propósito. A ação já terminou, e o resultado continua visível.

A estrutura usa um verbo transitivo, ou seja, um verbo de ação que alguém faz em alguma coisa, como escrever, abrir, colocar e comprar. Esse verbo vai para a forma て e recebe ある.

Existem dois usos principais. O primeiro é descrever o que se vê: algo está escrito, aberto, colocado em algum lugar. Nesse caso, a coisa é marcada com が. O foco está no resultado, e não em quem fez.

O segundo é mostrar que algo foi feito com antecedência, como preparação. Nesse caso, a coisa costuma ser marcada com を e a frase passa a ideia de "já deixei feito".

É diferente de ている com verbos intransitivos, que só descreve um estado, sem a ideia de que alguém fez aquilo de propósito.$$,
    $$Compare: 窓が開いている descreve apenas que a janela está aberta. 窓が開けてある mostra que alguém abriu a janela de propósito, e ela continua assim.

てある não é usado com verbos intransitivos, como 開く ou 閉まる.

No uso de preparação, てある fica parecido com ておく, que aparece no N4. ておく foca na ação de preparar, e てある foca no estado já pronto.$$,
    $$Substantivo + が + Verbo transitivo na forma て + ある (estado visível)
Substantivo + を + Verbo transitivo na forma て + ある (preparação)

Educado: てあります
Passado: てあった / てありました$$,
    $$てある$$,
    $$てある|てあります|てあった|てありました$$,
    ARRAY['て', 'ある']::text[],
    ARRAY['てある', 'てあります', 'てあった', 'てありました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-65', $$壁に絵がかけてあります。$$, $$かべにえがかけてあります。$$, $$Tem um quadro pendurado na parede.$$),
    ('n5-grammar-65', $$部屋の窓が開けてあります。$$, $$へやのまどがあけてあります。$$, $$A janela do quarto foi deixada aberta.$$),
    ('n5-grammar-65', $$机の上にメモが置いてある。$$, $$つくえのうえにメモがおいてある。$$, $$Tem um bilhete deixado em cima da mesa.$$),
    ('n5-grammar-65', $$パーティーの飲み物はもう買ってあります。$$, $$パーティーののみものはもうかってあります。$$, $$As bebidas da festa já estão compradas.$$),
    ('n5-grammar-65', $$ホテルはもう予約してありますから、大丈夫ですよ。$$, $$ホテルはもうよやくしてありますから、だいじょうぶですよ。$$, $$O hotel já está reservado, então pode ficar tranquilo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ドアに名前が書い____。$$, $$O nome está escrito na porta.$$),
        (2, $$冷蔵庫にビールが冷やし____。$$, $$Tem cerveja gelando na geladeira.$$),
        (3, $$誰もいないのに、部屋の電気がつけ____。$$, $$Não tem ninguém, mas a luz do quarto foi deixada acesa.$$),
        (4, $$テーブルの上にお皿が並べ____。$$, $$Os pratos estão arrumados em cima da mesa.$$),
        (5, $$旅行の切符はもう買っ____から、心配しないで。$$, $$As passagens da viagem já estão compradas, então não se preocupe.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-65', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てあります$$),
        (1, $$てある$$),
        (2, $$てあります$$),
        (2, $$てある$$),
        (3, $$てあります$$),
        (3, $$てある$$),
        (4, $$てあります$$),
        (4, $$てある$$),
        (5, $$てある$$),
        (5, $$てあります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-66 — 〜ている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-66',
    'grammar',
    'N5',
    $$〜ている$$,
    $$te iru$$,
    $$Estar fazendo / Estar (em um estado) / Costumar fazer$$,
    $$ている é uma das estruturas mais importantes do japonês. Ela é formada pelo verbo na forma て + いる e tem três usos principais.

O primeiro é indicar uma ação em andamento, como o nosso gerúndio: estar comendo, estar lendo, estar chovendo.

O segundo é indicar um estado que resultou de uma ação já terminada. Com verbos como casar, morar, saber, abrir e morrer, ている mostra a situação atual, e não uma ação acontecendo. Por exemplo, estar casado significa que a pessoa casou e continua casada.

O terceiro é indicar hábitos ou atividades que a pessoa faz regularmente, como trabalhar em algum lugar ou praticar um esporte toda semana.

O sentido depende do tipo de verbo. Verbos de ação contínua costumam indicar ação em andamento, e verbos de mudança instantânea costumam indicar estado.$$,
    $$知っている é usado para "saber" ou "conhecer", mas o negativo é 知らない, e não 知っていない.

Na fala, ている é muito reduzido para てる, e ています para てます.

Para descrever roupas e acessórios que alguém está usando, também se usa ている, porque a pessoa vestiu e continua vestida.$$,
    $$Verbo na forma て + いる
Verbo na forma て + います (educado)

Negativo: ていない / ていません
Passado: ていた / ていました

Fala informal: Verbo て + る (てる)$$,
    $$ている$$,
    $$ている|ています|ていた|ていました|でいる|でいます|でいた|でいました|てる$$,
    ARRAY['て', 'いる']::text[],
    ARRAY['ている', 'ています', 'ていた', 'ていました', 'でいる', 'でいます', 'てる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-66', $$今、雨が降っています。$$, $$いま、あめがふっています。$$, $$Agora está chovendo.$$),
    ('n5-grammar-66', $$弟は部屋で本を読んでいる。$$, $$おとうとはへやでほんをよんでいる。$$, $$Meu irmão mais novo está lendo um livro no quarto.$$),
    ('n5-grammar-66', $$姉は結婚しています。$$, $$あねはけっこんしています。$$, $$Minha irmã mais velha é casada.$$),
    ('n5-grammar-66', $$私は東京に住んでいます。$$, $$わたしはとうきょうにすんでいます。$$, $$Eu moro em Tóquio.$$),
    ('n5-grammar-66', $$毎朝、ジョギングをしています。$$, $$まいあさ、ジョギングをしています。$$, $$Toda manhã, faço corrida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供たちは公園で遊ん____。$$, $$As crianças estão brincando no parque.$$),
        (2, $$「今、何をしていますか。」「ご飯を食べ____。」$$, $$"O que você está fazendo agora?" "Estou comendo."$$),
        (3, $$父は銀行で働い____。$$, $$Meu pai trabalha no banco.$$),
        (4, $$田中さんの電話番号を知っ____か。$$, $$Você sabe o número de telefone do Tanaka?$$),
        (5, $$あの店はもう閉まっ____。$$, $$Aquela loja já está fechada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-66', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でいます$$),
        (1, $$でいる$$),
        (2, $$ています$$),
        (3, $$ています$$),
        (3, $$ている$$),
        (4, $$ています$$),
        (5, $$ています$$),
        (5, $$ている$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-67 — 〜てから
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-67',
    'grammar',
    'N5',
    $$〜てから$$,
    $$te kara$$,
    $$Depois de / Desde que$$,
    $$てから é usado para dizer que uma ação acontece depois de outra. Equivale a "depois de fazer...".

A primeira ação fica na forma て + から, e a segunda vem em seguida. A ideia é que a primeira ação precisa terminar antes de a segunda começar. Por isso, てから destaca bem a ordem.

O tempo da frase, presente ou passado, fica no último verbo.

Com expressões de tempo, como "já faz três anos", てから significa "desde que": desde que algo aconteceu, passou certo tempo.$$,
    $$A forma て sozinha também liga ações em sequência, mas てから deixa a ordem mais clara e enfatiza que uma coisa vem só depois da outra.

Não confunda てから com から (porque). A diferença está na forma do verbo: com てから, o verbo está na forma て.

Para expressar "depois de" com o verbo no passado, existe também たあとで, que aparece no N4.$$,
    $$Verbo A na forma て + から + Verbo B
Verbo na forma て + から + Período de tempo (desde que)$$,
    $$てから$$,
    $$てから|でから$$,
    ARRAY['て', 'から']::text[],
    ARRAY['てから', 'でから']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-67', $$手を洗ってから、ご飯を食べます。$$, $$てをあらってから、ごはんをたべます。$$, $$Como depois de lavar as mãos.$$),
    ('n5-grammar-67', $$宿題をしてから、遊びに行きます。$$, $$しゅくだいをしてから、あそびにいきます。$$, $$Vou brincar depois de fazer a lição.$$),
    ('n5-grammar-67', $$昨日はシャワーを浴びてから寝ました。$$, $$きのうはシャワーをあびてからねました。$$, $$Ontem dormi depois de tomar banho.$$),
    ('n5-grammar-67', $$この本を読んでから、感想を書いてください。$$, $$このほんをよんでから、かんそうをかいてください。$$, $$Depois de ler este livro, escreva sua opinião, por favor.$$),
    ('n5-grammar-67', $$日本に来てから、もう三年になります。$$, $$にほんにきてから、もうさんねんになります。$$, $$Já faz três anos desde que vim para o Japão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎晩、歯を磨い____寝ます。$$, $$Toda noite, durmo depois de escovar os dentes.$$),
        (2, $$電話をかけ____、友達の家に行きました。$$, $$Depois de ligar, fui à casa do meu amigo.$$),
        (3, $$よく考え____、答えてください。$$, $$Pense bem antes de responder, por favor.$$),
        (4, $$薬を飲ん____、少し休みました。$$, $$Depois de tomar o remédio, descansei um pouco.$$),
        (5, $$大学を卒業し____、ずっとこの会社で働いています。$$, $$Desde que me formei na faculdade, trabalho nesta empresa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-67', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てから$$),
        (2, $$てから$$),
        (3, $$てから$$),
        (4, $$でから$$),
        (5, $$てから$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-68 — 〜てください
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-68',
    'grammar',
    'N5',
    $$〜てください$$,
    $$te kudasai$$,
    $$Por favor (faça) / Faça...$$,
    $$てください é usado para pedir que alguém faça alguma coisa. Equivale a "por favor, faça..." ou ao imperativo educado do português.

A estrutura junta o verbo na forma て com ください, que vem de くださる, um verbo respeitoso que significa "dar". A ideia literal é "faça isso por mim, por favor".

É usado em pedidos, instruções, orientações e convites gentis, como "entre, por favor" ou "fique à vontade".

Apesar de educado, てください ainda é um pedido direto. Com superiores ou desconhecidos, em pedidos maiores, o japonês prefere formas mais suaves, como てくださいませんか.

Na fala informal, ください costuma ser omitido, e o pedido fica só com a forma て.$$,
    $$Em instruções de professores, médicos e funcionários, てください é muito comum e não soa rude, porque faz parte do papel da pessoa orientar.

O oposto, para pedir que alguém não faça algo, é ないでください.

Para pedir uma coisa, e não uma ação, usa-se をください.$$,
    $$Verbo na forma て + ください
Verbo na forma て (informal, entre amigos e família)

Mais suave: てくださいませんか / てくれませんか$$,
    $$てください$$,
    $$てください|でください$$,
    ARRAY['て', 'ください']::text[],
    ARRAY['てください', 'でください']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-68', $$ちょっと待ってください。$$, $$ちょっとまってください。$$, $$Espere um pouco, por favor.$$),
    ('n5-grammar-68', $$ここに名前を書いてください。$$, $$ここになまえをかいてください。$$, $$Escreva seu nome aqui, por favor.$$),
    ('n5-grammar-68', $$もう少しゆっくり話してください。$$, $$もうすこしゆっくりはなしてください。$$, $$Fale um pouco mais devagar, por favor.$$),
    ('n5-grammar-68', $$この本を読んでください。$$, $$このほんをよんでください。$$, $$Leia este livro, por favor.$$),
    ('n5-grammar-68', $$駅に着いたら、電話してください。$$, $$えきについたら、でんわしてください。$$, $$Quando chegar à estação, me ligue, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$暑いですね。窓を開け____。$$, $$Está quente, né. Abra a janela, por favor.$$),
        (2, $$教科書の十ページを見____。$$, $$Olhem a página dez do livro, por favor.$$),
        (3, $$時間がありません。早く来____。$$, $$Não temos tempo. Venha rápido, por favor.$$),
        (4, $$この薬を一日三回飲ん____。$$, $$Tome este remédio três vezes ao dia, por favor.$$),
        (5, $$わからないときは、いつでも聞い____ね。$$, $$Quando não entender, pode perguntar a qualquer hora, tá?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-68', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てください$$),
        (2, $$てください$$),
        (3, $$てください$$),
        (4, $$でください$$),
        (5, $$てください$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-69 — 〜てはいけない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-69',
    'grammar',
    'N5',
    $$〜てはいけない$$,
    $$te wa ikenai$$,
    $$Não pode / É proibido / Não deve$$,
    $$てはいけない é usado para dizer que algo é proibido ou não deve ser feito. Equivale a "não pode" ou "é proibido".

Literalmente, a estrutura significa "fazer isso não está bem". O verbo vai para a forma て, recebe は e depois いけない. Quando a forma て termina em で, a estrutura fica ではいけない.

É usada para regras, leis, proibições e conselhos firmes. Pais, professores e avisos públicos usam muito essa forma.

Na forma educada, fica てはいけません. Na fala do dia a dia, é comum a versão contraída ちゃいけない / じゃいけない.

Por ser forte, てはいけない não costuma ser usado para proibir algo diretamente a um superior. Nesses casos, prefere-se uma forma indireta.$$,
    $$Para responder a um pedido de permissão feito com てもいいですか, a resposta negativa natural é いいえ、〜てはいけません, mas muitas vezes os japoneses suavizam com すみません、ちょっと….

As formas てはだめ e ちゃだめ têm sentido parecido e são mais coloquiais.

O oposto de てはいけない é てもいい (pode fazer).$$,
    $$Verbo na forma て + は + いけない
Verbo na forma て (terminada em で) + は + いけない

Educado: てはいけません
Contração falada: ちゃいけない / じゃいけない$$,
    $$てはいけない$$,
    $$てはいけない|てはいけません|ではいけない|ではいけません$$,
    ARRAY['て', 'は', 'いけない']::text[],
    ARRAY['てはいけない', 'てはいけません', 'ではいけない', 'ではいけません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-69', $$ここでタバコを吸ってはいけません。$$, $$ここでタバコをすってはいけません。$$, $$Não é permitido fumar aqui.$$),
    ('n5-grammar-69', $$授業中に携帯電話を使ってはいけない。$$, $$じゅぎょうちゅうにけいたいでんわをつかってはいけない。$$, $$Não pode usar o celular durante a aula.$$),
    ('n5-grammar-69', $$この川で泳いではいけません。$$, $$このかわでおよいではいけません。$$, $$Não é permitido nadar neste rio.$$),
    ('n5-grammar-69', $$美術館の中で写真を撮ってはいけません。$$, $$びじゅつかんのなかでしゃしんをとってはいけません。$$, $$Não é permitido tirar fotos dentro do museu.$$),
    ('n5-grammar-69', $$人の悪口を言ってはいけないよ。$$, $$ひとのわるくちをいってはいけないよ。$$, $$Não se deve falar mal dos outros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$図書館で食べ物を食べ____。$$, $$Não é permitido comer na biblioteca.$$),
        (2, $$ここに車を止め____。$$, $$Não é permitido estacionar aqui.$$),
        (3, $$テストのとき、辞書を見____。$$, $$Durante a prova, não pode olhar o dicionário.$$),
        (4, $$お酒を飲んだら、車を運転し____。$$, $$Depois de beber, não se deve dirigir.$$),
        (5, $$このボタンを押し____と言われました。$$, $$Me disseram que não posso apertar este botão.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-69', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てはいけません$$),
        (1, $$てはいけない$$),
        (2, $$てはいけません$$),
        (2, $$てはいけない$$),
        (3, $$てはいけません$$),
        (3, $$てはいけない$$),
        (4, $$てはいけません$$),
        (4, $$てはいけない$$),
        (5, $$てはいけない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-70 — 〜てもいいです
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-70',
    'grammar',
    'N5',
    $$〜てもいいです$$,
    $$te mo ii desu$$,
    $$Pode / É permitido / Tudo bem se$$,
    $$てもいいです é usado para dar ou pedir permissão. Equivale a "pode" ou "tudo bem se...".

Literalmente, a estrutura significa "mesmo fazendo isso, está bom". Ou seja, a ação é aceitável.

Em perguntas, てもいいですか é a forma padrão de pedir permissão educadamente, como "posso abrir a janela?". Em afirmações, serve para permitir algo a alguém.

Na fala informal, usa-se てもいい?, sem です. E, para soar mais leve, também se usa ても大丈夫.$$,
    $$Para responder positivamente a um pedido de permissão, as respostas mais comuns são はい、どうぞ e ええ、いいですよ.

Para negar, os japoneses costumam suavizar com すみません、ちょっと…, em vez de dizer てはいけません diretamente.

O oposto de てもいい é てはいけない. E o oposto de "precisar" é なくてもいい.$$,
    $$Verbo na forma て + も + いい / いいです
Pergunta: Verbo て + もいいですか
Informal: Verbo て + もいい？

Variações: ても大丈夫 / てもかまいません (mais formal)$$,
    $$てもいい$$,
    $$てもいい|でもいい|ても大丈夫|でも大丈夫|てもかまいません|でもかまいません$$,
    ARRAY['て', 'も', 'いい']::text[],
    ARRAY['てもいい', 'てもいいです', 'でもいい', 'ても大丈夫', 'てもかまいません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-70', $$窓を開けてもいいですか。$$, $$まどをあけてもいいですか。$$, $$Posso abrir a janela?$$),
    ('n5-grammar-70', $$ここで写真を撮ってもいいです。$$, $$ここでしゃしんをとってもいいです。$$, $$Pode tirar fotos aqui.$$),
    ('n5-grammar-70', $$この本、借りてもいい？$$, $$このほん、かりてもいい？$$, $$Posso pegar este livro emprestado?$$),
    ('n5-grammar-70', $$「入ってもいいですか。」「はい、どうぞ。」$$, $$「はいってもいいですか。」「はい、どうぞ。」$$, $$"Posso entrar?" "Sim, fique à vontade."$$),
    ('n5-grammar-70', $$鉛筆で書いても大丈夫ですよ。$$, $$えんぴつでかいてもだいじょうぶですよ。$$, $$Tudo bem se escrever a lápis.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$すみません、ちょっとトイレに行っ____か。$$, $$Com licença, posso ir ao banheiro rapidinho?$$),
        (2, $$ここに座っ____か。$$, $$Posso me sentar aqui?$$),
        (3, $$疲れたら、休ん____ですよ。$$, $$Se ficar cansado, pode descansar.$$),
        (4, $$このペン、使っ____？$$, $$Posso usar esta caneta?$$),
        (5, $$「タバコを吸っ____か。」「すみません、ここはちょっと…。」$$, $$"Posso fumar?" "Desculpe, aqui não dá..."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-70', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てもいいです$$),
        (2, $$てもいいです$$),
        (3, $$でもいい$$),
        (4, $$てもいい$$),
        (5, $$てもいいです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-71 — と
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-71',
    'grammar',
    'N5',
    $$と$$,
    $$to$$,
    $$E / Com$$,
    $$と é uma partícula com dois usos principais no N5.

O primeiro é ligar substantivos, com o sentido de "e". Quando se usa と, a lista é completa: são exatamente aquelas coisas, e nada mais. Isso é diferente de や, que dá apenas exemplos.

O segundo é indicar com quem uma ação é feita, com o sentido de "com". A pessoa vem antes de と. Para reforçar a ideia de "junto", pode-se acrescentar 一緒に.

Alguns verbos pedem と porque a ação precisa de duas pessoas, como casar, encontrar-se, conversar e brigar. Nesses casos, と indica a outra parte da ação.

Para comparar duas coisas em perguntas como "A ou B, qual é...?", também se usa と entre as opções.$$,
    $$と só liga substantivos. Para ligar verbos e adjetivos, usa-se a forma て, e não と.

と também é usada para citar o que alguém disse ou pensou, como em と言う e と思う. Esse uso aparece bastante e tem uma função diferente.

Em listas, o último と antes da partícula é opcional e geralmente omitido.$$,
    $$Substantivo A + と + Substantivo B (lista completa)
Pessoa + と + Verbo (com alguém)
Pessoa + と + 一緒に + Verbo
Pessoa + と + 結婚する / 会う / 話す / けんかする
A + と + B + と + どちらが + Adjetivo + ですか$$,
    $$と$$,
    $$と$$,
    ARRAY['と']::text[],
    ARRAY['と']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-71', $$パンと牛乳を買いました。$$, $$パンとぎゅうにゅうをかいました。$$, $$Comprei pão e leite.$$),
    ('n5-grammar-71', $$友達と映画を見ました。$$, $$ともだちとえいがをみました。$$, $$Vi um filme com um amigo.$$),
    ('n5-grammar-71', $$私の家族は父と母と弟です。$$, $$わたしのかぞくはちちとははとおとうとです。$$, $$Minha família é meu pai, minha mãe e meu irmão mais novo.$$),
    ('n5-grammar-71', $$昨日、先生と話しました。$$, $$きのう、せんせいとはなしました。$$, $$Ontem conversei com o professor.$$),
    ('n5-grammar-71', $$姉は去年、アメリカ人と結婚しました。$$, $$あねはきょねん、アメリカじんとけっこんしました。$$, $$Minha irmã mais velha se casou com um americano no ano passado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$かばんの中には財布____かぎがあります。それだけです。$$, $$Na bolsa tem a carteira e a chave. Só isso.$$),
        (2, $$昨日、母____買い物に行きました。$$, $$Ontem fui fazer compras com a minha mãe.$$),
        (3, $$日曜日、田中さん____テニスをしました。$$, $$No domingo, joguei tênis com o Tanaka.$$),
        (4, $$犬____猫と、どちらが好きですか。$$, $$Cachorro ou gato, de qual você gosta mais?$$),
        (5, $$来月、彼女____結婚します。$$, $$Mês que vem, vou me casar com a minha namorada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-71', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と$$),
        (2, $$と$$),
        (3, $$と$$),
        (4, $$と$$),
        (5, $$と$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-72 — 〜とき
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-72',
    'grammar',
    'N5',
    $$〜とき$$,
    $$toki$$,
    $$Quando / Na hora em que / Na época em que$$,
    $$とき significa "quando" e é usado para indicar o momento ou a época em que algo acontece. Literalmente, とき é "tempo" ou "momento".

Ele funciona como um substantivo. Por isso, a palavra que vem antes se liga a ele como se fosse descrever um substantivo: verbos e adjetivos い ficam na forma simples, adjetivos な recebem な, e substantivos recebem の.

Com verbos, o tempo do verbo antes de とき muda o sentido. Com a forma de dicionário, a ação de とき ainda não aconteceu no momento da outra ação. Com a forma た, a ação de とき já aconteceu.

Por exemplo, ao falar de uma viagem, "quando vou" pode indicar algo feito antes de partir, e "quando fui" indica algo feito já no destino.$$,
    $$O tempo do verbo antes de とき não depende do tempo da frase inteira, e sim da ordem das ações. Esse é um dos pontos que mais confundem estudantes.

とき costuma vir seguido de vírgula ou de partículas como に e は. A forma ときに destaca um momento específico.

Para dizer "quando eu era criança", usa-se 子供のとき ou 子供のころ. ころ dá uma ideia de época mais ampla.$$,
    $$Verbo (forma simples) + とき
Adjetivo い + とき
Adjetivo な + な + とき
Substantivo + の + とき

Escrita: とき / 時$$,
    $$とき$$,
    $$とき|時に|時は|時、|時の$$,
    ARRAY['とき']::text[],
    ARRAY['とき', '時', 'ときに', 'ときは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-72', $$子供のとき、よく川で遊びました。$$, $$こどものとき、よくかわであそびました。$$, $$Quando eu era criança, brincava muito no rio.$$),
    ('n5-grammar-72', $$暇なとき、何をしますか。$$, $$ひまなとき、なにをしますか。$$, $$O que você faz quando tem tempo livre?$$),
    ('n5-grammar-72', $$寒いとき、温かいスープを飲みます。$$, $$さむいとき、あたたかいスープをのみます。$$, $$Quando está frio, tomo uma sopa quente.$$),
    ('n5-grammar-72', $$日本へ行くとき、新しいかばんを買いました。$$, $$にほんへいくとき、あたらしいかばんをかいました。$$, $$Quando ia viajar para o Japão, comprei uma bolsa nova.$$),
    ('n5-grammar-72', $$日本へ行ったとき、友達におみやげを買いました。$$, $$にほんへいったとき、ともだちにおみやげをかいました。$$, $$Quando fui ao Japão, comprei lembrancinhas para os amigos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$学生の____、よく図書館に行きました。$$, $$Quando eu era estudante, ia muito à biblioteca.$$),
        (2, $$頭が痛い____、この薬を飲んでください。$$, $$Quando estiver com dor de cabeça, tome este remédio.$$),
        (3, $$道がわからない____、交番で聞きます。$$, $$Quando não sei o caminho, pergunto no posto policial.$$),
        (4, $$暇な____、遊びに来てください。$$, $$Quando tiver tempo, venha me visitar.$$),
        (5, $$家に帰った____、「ただいま」と言います。$$, $$Quando chego em casa, digo "tadaima".$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-72', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とき$$),
        (1, $$時$$),
        (2, $$とき$$),
        (2, $$時$$),
        (3, $$とき$$),
        (3, $$時$$),
        (4, $$とき$$),
        (4, $$時$$),
        (5, $$とき$$),
        (5, $$時$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-73 — とても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-73',
    'grammar',
    'N5',
    $$とても$$,
    $$totemo$$,
    $$Muito / Bastante$$,
    $$とても é um advérbio que significa "muito". Ele aumenta a intensidade de adjetivos, advérbios e alguns verbos.

Ele vem antes da palavra que intensifica. É muito comum antes de adjetivos い e な, como "muito bonito" ou "muito difícil".

とても é neutro e pode ser usado tanto em conversas educadas quanto em informais. Também funciona bem com sentimentos, como "fiquei muito feliz".

Normalmente とても é usado em frases afirmativas. Em frases negativas, para dizer "não muito", o japonês usa あまり.$$,
    $$Na fala casual, すごく e めっちゃ são muito usados no lugar de とても. すごく é comum em qualquer conversa informal, e めっちゃ é bem jovem e coloquial.

Em níveis mais avançados, とても aparece com verbos no negativo com o sentido de "de jeito nenhum consigo", mas esse uso é diferente do "muito" básico.

Repetir とても várias vezes seguidas pode soar infantil. Para variar, use たいへん em situações formais.$$,
    $$とても + Adjetivo い
とても + Adjetivo な
とても + Advérbio
とても + Verbo de sentimento ou estado$$,
    $$とても$$,
    $$とても$$,
    ARRAY['とても']::text[],
    ARRAY['とても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-73', $$この映画はとてもおもしろいです。$$, $$このえいがはとてもおもしろいです。$$, $$Este filme é muito interessante.$$),
    ('n5-grammar-73', $$今日はとても寒いですね。$$, $$きょうはとてもさむいですね。$$, $$Hoje está muito frio, né?$$),
    ('n5-grammar-73', $$彼女はとても上手に日本語を話します。$$, $$かのじょはとてもじょうずににほんごをはなします。$$, $$Ela fala japonês muito bem.$$),
    ('n5-grammar-73', $$この町はとても静かです。$$, $$このまちはとてもしずかです。$$, $$Esta cidade é muito tranquila.$$),
    ('n5-grammar-73', $$プレゼント、とてもうれしかったです。$$, $$プレゼント、とてもうれしかったです。$$, $$Fiquei muito feliz com o presente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$富士山は____高い山です。$$, $$O Monte Fuji é uma montanha muito alta.$$),
        (2, $$このケーキは____おいしいです。$$, $$Este bolo é muito gostoso.$$),
        (3, $$昨日のテストは____難しかったです。$$, $$A prova de ontem foi muito difícil.$$),
        (4, $$田中さんは____親切な人です。$$, $$O Tanaka é uma pessoa muito gentil.$$),
        (5, $$お手紙、____うれしかったです。$$, $$Fiquei muito feliz com a sua carta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-73', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とても$$),
        (2, $$とても$$),
        (3, $$とても$$),
        (4, $$とても$$),
        (5, $$とても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-74 — 〜つもり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-74',
    'grammar',
    'N5',
    $$〜つもり$$,
    $$tsumori$$,
    $$Pretender / Ter a intenção de / Planejar$$,
    $$つもり é usado para falar de planos e intenções. Equivale a "pretender", "ter a intenção de" ou "planejar".

Ele vem depois do verbo na forma de dicionário, para planos de fazer algo, ou na forma ない, para planos de não fazer algo. No final, usa-se です ou だ.

つもり mostra uma decisão que a pessoa já tomou, ainda que não seja definitiva. Por isso, é mais firme que たい, que só expressa vontade.

Para negar a intenção com força, usa-se つもりはない, que significa "não tenho a menor intenção de".

Em perguntas, つもりですか pergunta sobre os planos de alguém, mas pode soar direto quando dito a superiores.$$,
    $$A diferença entre つもり e たい é importante: たい é desejo ("queria"), つもり é plano ("pretendo"). Dá para querer algo sem ter a intenção de fazer.

Com superiores, perguntar つもりですか pode soar como cobrança. É mais natural perguntar de forma indireta, com 予定.

予定 também significa "plano", mas é usado para algo mais concreto e agendado, como uma viagem com data marcada.$$,
    $$Verbo na forma de dicionário + つもりです / つもりだ
Verbo na forma ない + つもりです (planeja não fazer)
Verbo na forma de dicionário + つもりはありません / つもりはない (sem intenção nenhuma)
Pergunta: 〜つもりですか$$,
    $$つもり$$,
    $$つもり$$,
    ARRAY['つもり']::text[],
    ARRAY['つもり', 'つもりです', 'つもりだ', 'つもりはない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-74', $$来年、日本に留学するつもりです。$$, $$らいねん、にほんにりゅうがくするつもりです。$$, $$Ano que vem, pretendo fazer intercâmbio no Japão.$$),
    ('n5-grammar-74', $$夏休みは国に帰るつもりです。$$, $$なつやすみはくににかえるつもりです。$$, $$Nas férias de verão, pretendo voltar para o meu país.$$),
    ('n5-grammar-74', $$今日は甘い物を食べないつもりです。$$, $$きょうはあまいものをたべないつもりです。$$, $$Hoje pretendo não comer doces.$$),
    ('n5-grammar-74', $$週末は何をするつもりですか。$$, $$しゅうまつはなにをするつもりですか。$$, $$O que você pretende fazer no fim de semana?$$),
    ('n5-grammar-74', $$彼と結婚するつもりはありません。$$, $$かれとけっこんするつもりはありません。$$, $$Não tenho a menor intenção de me casar com ele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日、図書館に行く____です。$$, $$Amanhã, pretendo ir à biblioteca.$$),
        (2, $$大学を卒業したら、医者になる____です。$$, $$Depois de me formar na faculdade, pretendo ser médico.$$),
        (3, $$今年はもうタバコを吸わない____です。$$, $$Este ano, pretendo não fumar mais.$$),
        (4, $$冬休みはどこへ行く____ですか。$$, $$Aonde você pretende ir nas férias de inverno?$$),
        (5, $$今の会社をやめる____はありません。$$, $$Não tenho intenção nenhuma de sair da empresa atual.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-74', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つもり$$),
        (2, $$つもり$$),
        (3, $$つもり$$),
        (4, $$つもり$$),
        (5, $$つもり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-75 — は
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-75',
    'grammar',
    'N5',
    $$は$$,
    $$wa$$,
    $$Quanto a / Falando de / Já (contraste)$$,
    $$は é a partícula que marca o tema da frase, ou seja, aquilo sobre o que se vai falar. Uma boa forma de entender é pensar em "falando de...", "quanto a...".

Depois de は, vem o comentário sobre esse tema. O tema costuma ser algo já conhecido ou que acabou de ser apresentado na conversa.

は também é usado para contraste. Quando duas coisas são comparadas, cada uma recebe は, mostrando que uma é assim e a outra é diferente.

は pode substituir が e を, ou vir depois de outras partículas, como に, で e と, formando には, では e とは. Nesses casos, ele transforma aquela parte em tema ou em ponto de contraste.

A diferença entre は e が é um dos pontos centrais do japonês: は apresenta o assunto, e が aponta exatamente quem ou o quê.$$,
    $$Como partícula, は é escrita com o caractere は, mas pronunciada "wa".

Em frases negativas, は aparece com frequência porque traz uma ideia de contraste: "isso, não".

Quando se apresenta algo novo, como em uma história, usa-se が na primeira vez e は nas vezes seguintes, porque a coisa já se tornou conhecida.$$,
    $$Substantivo + は + Comentário
Substantivo + partícula + は (には / では / とは / へは)
Contraste: A + は + …、B + は + …
Objeto como tema: Substantivo + は + Verbo$$,
    $$は$$,
    $$は$$,
    ARRAY['は']::text[],
    ARRAY['は']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-75', $$私はブラジル人です。$$, $$わたしはブラジルじんです。$$, $$Eu sou brasileiro.$$),
    ('n5-grammar-75', $$今日は天気がいいですね。$$, $$きょうはてんきがいいですね。$$, $$Hoje o tempo está bom, né?$$),
    ('n5-grammar-75', $$肉は好きですが、魚は好きじゃありません。$$, $$にくはすきですが、さかなはすきじゃありません。$$, $$Carne eu gosto, mas peixe não.$$),
    ('n5-grammar-75', $$東京には友達がたくさんいます。$$, $$とうきょうにはともだちがたくさんいます。$$, $$Em Tóquio, tenho muitos amigos.$$),
    ('n5-grammar-75', $$この本は先週買いました。$$, $$このほんはせんしゅうかいました。$$, $$Este livro, eu comprei semana passada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$田中さん____先生です。$$, $$O Tanaka é professor.$$),
        (2, $$父は医者ですが、母____看護師です。$$, $$Meu pai é médico, mas minha mãe é enfermeira.$$),
        (3, $$今度の日曜日____どこへも行きません。$$, $$No próximo domingo, não vou a lugar nenhum.$$),
        (4, $$「コーヒーは飲みますか。」「いいえ、コーヒー____飲みません。」$$, $$"Você bebe café?" "Não, café eu não bebo."$$),
        (5, $$家では英語を話しますが、学校で____日本語を話します。$$, $$Em casa falo inglês, mas na escola falo japonês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-75', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$は$$),
        (2, $$は$$),
        (3, $$は$$),
        (4, $$は$$),
        (5, $$は$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-76 — 〜は〜より〜です
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-76',
    'grammar',
    'N5',
    $$〜は〜より〜です$$,
    $$wa ~ yori ~ desu$$,
    $$A é mais... do que B$$,
    $$Essa estrutura é usada para comparar duas coisas, dizendo que uma tem mais de certa característica do que a outra. Equivale a "A é mais... do que B".

O primeiro elemento, marcado com は, é o tema: aquilo sobre o que se fala. O segundo, marcado com より, é o ponto de comparação, ou seja, o "do que".

Um detalhe importante: o japonês não precisa de uma palavra para "mais". O próprio より já indica a comparação. Basta colocar o adjetivo depois.

Para reforçar a diferença, usa-se ずっと (muito mais) ou もっと (ainda mais) antes do adjetivo.$$,
    $$Diferente do português, o adjetivo não muda: o mesmo adjetivo que significa "grande" serve para "maior", porque a comparação fica a cargo de より.

A ordem pode parecer estranha no começo, porque "do que B" vem antes do adjetivo. Pensar em "A, comparado a B, é grande" ajuda a acostumar.

Quando a pergunta é "qual é mais...?", a resposta natural usa ほうが, e não esta estrutura.$$,
    $$A + は + B + より + Adjetivo + です
A + は + B + より + Advérbio + Verbo
A + は + B + より + ずっと / もっと + Adjetivo + です$$,
    $$より$$,
    $$より$$,
    ARRAY['は', 'より']::text[],
    ARRAY['より']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-76', $$東京は大阪より大きいです。$$, $$とうきょうはおおさかよりおおきいです。$$, $$Tóquio é maior do que Osaka.$$),
    ('n5-grammar-76', $$今日は昨日より暖かいです。$$, $$きょうはきのうよりあたたかいです。$$, $$Hoje está mais quente do que ontem.$$),
    ('n5-grammar-76', $$電車はバスより速いです。$$, $$でんしゃはバスよりはやいです。$$, $$O trem é mais rápido do que o ônibus.$$),
    ('n5-grammar-76', $$兄は私よりずっと背が高いです。$$, $$あにはわたしよりずっとせがたかいです。$$, $$Meu irmão mais velho é muito mais alto do que eu.$$),
    ('n5-grammar-76', $$妹は私より上手に料理を作ります。$$, $$いもうとはわたしよりじょうずにりょうりをつくります。$$, $$Minha irmã mais nova cozinha melhor do que eu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏は冬____暑いです。$$, $$O verão é mais quente do que o inverno.$$),
        (2, $$この本はあの本____おもしろいです。$$, $$Este livro é mais interessante do que aquele.$$),
        (3, $$飛行機は新幹線____速いです。$$, $$O avião é mais rápido do que o trem-bala.$$),
        (4, $$田中さんは山田さん____若いです。$$, $$O Tanaka é mais novo do que o Yamada.$$),
        (5, $$この犬はあの猫____ずっと大きいです。$$, $$Este cachorro é muito maior do que aquele gato.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-76', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$より$$),
        (2, $$より$$),
        (3, $$より$$),
        (4, $$より$$),
        (5, $$より$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-77 — 〜はどうですか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-77',
    'grammar',
    'N5',
    $$〜はどうですか$$,
    $$wa dou desu ka$$,
    $$Que tal...? / Como está...? / Como é...?$$,
    $$はどうですか é usado para perguntar a opinião ou a impressão de alguém sobre algo. Equivale a "como está...?", "como é...?" ou "o que você acha de...?".

どう significa "como", e a pergunta pede uma avaliação: se algo está bom, ruim, difícil, divertido.

Ela também serve para fazer sugestões e propostas, com o sentido de "que tal...?". Por exemplo, para propor um dia, um lugar ou uma opção.

Para perguntar sobre algo que já passou, usa-se はどうでしたか, como ao perguntar sobre uma viagem ou uma prova.

Para oferecer algo, como comida ou bebida, a forma mais educada é はいかがですか.$$,
    $$いかが é a versão educada de どう. Atendentes de lojas e restaurantes usam muito いかがですか para oferecer produtos.

Ao sugerir, はどうですか é mais suave do que dizer diretamente "vamos fazer isso", porque deixa o outro decidir.

A resposta pode ser uma opinião curta, como いいですね, ou uma descrição com adjetivos.$$,
    $$Substantivo + は + どうですか
Substantivo + は + どうでしたか (passado)
Substantivo + は + いかがですか (mais educado)
Substantivo + は + どう？ (informal)$$,
    $$はどうですか$$,
    $$はどう|はいかが$$,
    ARRAY['は', 'どう', 'ですか']::text[],
    ARRAY['はどうですか', 'はどうでしたか', 'はいかがですか', 'はどう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-77', $$新しい仕事はどうですか。$$, $$あたらしいしごとはどうですか。$$, $$Como está o novo trabalho?$$),
    ('n5-grammar-77', $$日本の生活はどうですか。$$, $$にほんのせいかつはどうですか。$$, $$Como é a vida no Japão?$$),
    ('n5-grammar-77', $$「明日はどうですか。」「明日は大丈夫です。」$$, $$「あしたはどうですか。」「あしたはだいじょうぶです。」$$, $$"Que tal amanhã?" "Amanhã está bom."$$),
    ('n5-grammar-77', $$旅行はどうでしたか。$$, $$りょこうはどうでしたか。$$, $$Como foi a viagem?$$),
    ('n5-grammar-77', $$コーヒーはいかがですか。$$, $$コーヒーはいかがですか。$$, $$Aceita um café?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$最近、体の調子____。$$, $$Como anda a sua saúde ultimamente?$$),
        (2, $$「今週の土曜日____。」「いいですよ。」$$, $$"Que tal este sábado?" "Pode ser."$$),
        (3, $$昨日のテスト____。$$, $$Como foi a prova de ontem?$$),
        (4, $$お茶____。$$, $$Aceita um chá?$$),
        (5, $$この赤いシャツ____？$$, $$Que tal esta camisa vermelha?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-77', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はどうですか$$),
        (2, $$はどうですか$$),
        (3, $$はどうでしたか$$),
        (4, $$はいかがですか$$),
        (4, $$はどうですか$$),
        (5, $$はどう$$),
        (5, $$はどうですか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-78 — や
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-78',
    'grammar',
    'N5',
    $$や$$,
    $$ya$$,
    $$E (entre outros) / Como... e...$$,
    $$や é usado para listar substantivos como exemplos, deixando claro que existem outras coisas além das mencionadas. Equivale a "e" com a ideia de "entre outros".

Essa é a grande diferença em relação a と. Com と, a lista é completa. Com や, a lista é parcial: são só alguns exemplos.

や costuma aparecer junto com など no final da lista, que reforça a ideia de "e outras coisas", "etc.".

Assim como と, や liga apenas substantivos. Para listar ações como exemplos, usa-se たり〜たりする.$$,
    $$Na fala, também é comum usar とか no lugar de や, com um tom mais casual.

Quando se usa や, o ouvinte entende automaticamente que há mais coisas. Por isso, ele é ótimo para descrições gerais, como o que tem em um lugar ou o que se costuma fazer.

や liga substantivos, mas não verbos nem adjetivos.$$,
    $$Substantivo A + や + Substantivo B
Substantivo A + や + Substantivo B + など
Substantivo A + や + Substantivo B + など + partícula$$,
    $$や$$,
    $$や$$,
    ARRAY['や']::text[],
    ARRAY['や']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-78', $$かばんの中に本やノートがあります。$$, $$かばんのなかにほんやノートがあります。$$, $$Na bolsa tem livros, cadernos e outras coisas.$$),
    ('n5-grammar-78', $$週末は掃除や洗濯をします。$$, $$しゅうまつはそうじやせんたくをします。$$, $$No fim de semana, faço coisas como limpar a casa e lavar roupa.$$),
    ('n5-grammar-78', $$机の上にペンや鉛筆などがあります。$$, $$つくえのうえにペンやえんぴつなどがあります。$$, $$Em cima da mesa tem canetas, lápis e outras coisas.$$),
    ('n5-grammar-78', $$旅行で京都や奈良に行きました。$$, $$りょこうできょうとやならにいきました。$$, $$Na viagem, fui a lugares como Kyoto e Nara.$$),
    ('n5-grammar-78', $$私はりんごやみかんなど、果物が好きです。$$, $$わたしはりんごやみかんなど、くだものがすきです。$$, $$Eu gosto de frutas, como maçã e mexerica.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$冷蔵庫に肉____野菜などがあります。$$, $$Na geladeira tem carne, verduras e outras coisas.$$),
        (2, $$公園に子供____犬などがいました。$$, $$No parque tinha crianças, cachorros e outros.$$),
        (3, $$パーティーで、すし____てんぷらなどを食べました。$$, $$Na festa, comemos sushi, tempurá e outras coisas.$$),
        (4, $$机の上に本____雑誌などが置いてあります。$$, $$Em cima da mesa há livros, revistas e outras coisas.$$),
        (5, $$夏休みに、北海道____沖縄などへ行きたいです。$$, $$Nas férias de verão, quero ir a lugares como Hokkaido e Okinawa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-78', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$や$$),
        (2, $$や$$),
        (3, $$や$$),
        (4, $$や$$),
        (5, $$や$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-79 — よ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-79',
    'grammar',
    'N5',
    $$よ$$,
    $$yo$$,
    $$Viu / Sabia? / Olha$$,
    $$よ é uma partícula de final de frase usada para transmitir uma informação que o ouvinte provavelmente não sabe. Ela dá um tom de "viu?", "sabia?" ou "olha...".

Com よ, quem fala mostra confiança no que está dizendo e quer que o outro preste atenção. É comum ao dar avisos, recomendações, correções ou informações úteis.

A diferença entre よ e ね é a direção da informação. ね busca concordância sobre algo que os dois já sabem ou sentem. よ apresenta algo novo para o outro.

Com substantivos e adjetivos な na forma simples, usa-se だよ.$$,
    $$Usar よ com muita força, ou o tempo todo, pode soar insistente ou mandão. Principalmente com superiores, é bom usar com moderação.

A combinação よね mostra que quem fala tem quase certeza, mas quer a confirmação do outro.

Em avisos de perigo, よ é muito natural e ajuda a chamar a atenção rapidamente.$$,
    $$Frase (forma educada) + よ
Frase (forma simples) + よ
Substantivo / Adjetivo な + ですよ / だよ
よね (informação + confirmação)$$,
    $$よ$$,
    $$よ$$,
    ARRAY['よ']::text[],
    ARRAY['よ', 'よね']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-79', $$この店のラーメン、おいしいですよ。$$, $$このみせのラーメン、おいしいですよ。$$, $$O ramen desta loja é gostoso, viu?$$),
    ('n5-grammar-79', $$もう八時だよ。早く起きて。$$, $$もうはちじだよ。はやくおきて。$$, $$Já são oito horas, viu? Levanta logo.$$),
    ('n5-grammar-79', $$明日は休みですよ。$$, $$あしたはやすみですよ。$$, $$Amanhã é folga, sabia?$$),
    ('n5-grammar-79', $$「この席、空いていますか。」「ええ、空いていますよ。」$$, $$「このせき、あいていますか。」「ええ、あいていますよ。」$$, $$"Este lugar está livre?" "Sim, está livre."$$),
    ('n5-grammar-79', $$危ないよ！$$, $$あぶないよ！$$, $$Cuidado, é perigoso!$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$すみません、財布が落ちました____。$$, $$Com licença, sua carteira caiu, viu?$$),
        (2, $$その映画、おもしろかった____。$$, $$Esse filme foi bem interessante, viu?$$),
        (3, $$早くしないと、遅れる____。$$, $$Se você não se apressar, vai se atrasar, viu?$$),
        (4, $$「田中さんはどこですか。」「会議室にいます____。」$$, $$"Onde está o Tanaka?" "Ele está na sala de reunião."$$),
        (5, $$大丈夫だ____。心配しないで。$$, $$Está tudo bem, viu? Não se preocupe.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-79', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$よ$$),
        (2, $$よ$$),
        (3, $$よ$$),
        (4, $$よ$$),
        (5, $$よ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-80 — 〜より〜ほうが
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-80',
    'grammar',
    'N5',
    $$〜より〜ほうが$$,
    $$yori ~ hou ga$$,
    $$B é mais... do que A / Prefiro B a A$$,
    $$より〜ほうが é usado para comparar duas coisas e destacar qual delas tem mais de certa característica. Equivale a "B é mais... do que A".

A palavra ほう significa "lado" ou "opção". Assim, a ideia é: "comparado a A, o lado de B é mais...". A opção destacada recebe ほうが.

Essa estrutura é a resposta natural para perguntas do tipo "A ou B, qual é mais...?", feitas com どちら. Na resposta, muitas vezes a parte com より nem aparece.

Com substantivos, usa-se の antes de ほう. Com verbos, o verbo na forma de dicionário vem direto antes de ほう.

Ela também é muito usada para expressar preferências, com 好き ou いい.$$,
    $$A diferença para は〜より〜です é o foco: aqui, a atenção está na opção escolhida, e não no tema da conversa.

Em perguntas com どちら, não se usa 一番, porque a comparação é entre apenas duas coisas.

A mesma palavra ほう aparece em ほうがいい, usada para conselhos. Nos dois casos, a ideia é "escolher um lado".$$,
    $$A + より + B + の + ほうが + Adjetivo
Verbo A + より + Verbo B + ほうが + Adjetivo
B + の + ほうが + Adjetivo (resposta curta)

Pergunta: A と B と どちらが + Adjetivo + ですか

Escrita: ほう / 方$$,
    $$ほうが$$,
    $$ほうが|方が$$,
    ARRAY['より', 'ほう', 'が']::text[],
    ARRAY['ほうが', '方が', 'のほうが', 'の方が']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-80', $$バスより電車のほうが速いです。$$, $$バスよりでんしゃのほうがはやいです。$$, $$O trem é mais rápido do que o ônibus.$$),
    ('n5-grammar-80', $$夏より冬のほうが好きです。$$, $$なつよりふゆのほうがすきです。$$, $$Gosto mais do inverno do que do verão.$$),
    ('n5-grammar-80', $$「犬と猫とどちらが好きですか。」「猫のほうが好きです。」$$, $$「いぬとねことどちらがすきですか。」「ねこのほうがすきです。」$$, $$"De qual você gosta mais, cachorro ou gato?" "Gosto mais de gato."$$),
    ('n5-grammar-80', $$外で遊ぶより家でゲームをするほうが楽しい。$$, $$そとであそぶよりいえでゲームをするほうがたのしい。$$, $$Jogar videogame em casa é mais divertido do que brincar lá fora.$$),
    ('n5-grammar-80', $$この店より、あの店の方が安いですよ。$$, $$このみせより、あのみせのほうがやすいですよ。$$, $$Aquela loja é mais barata do que esta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$東京より大阪の____物価が安いです。$$, $$Em Osaka, o custo de vida é mais barato do que em Tóquio.$$),
        (2, $$私は肉より魚の____好きです。$$, $$Eu gosto mais de peixe do que de carne.$$),
        (3, $$「コーヒーと紅茶とどちらがいいですか。」「紅茶の____いいです。」$$, $$"Café ou chá, qual você prefere?" "Prefiro chá."$$),
        (4, $$電話するより、メールを送る____早いです。$$, $$Mandar e-mail é mais rápido do que telefonar.$$),
        (5, $$一人で行くより、みんなで行く____楽しいですよ。$$, $$Ir com todo mundo é mais divertido do que ir sozinho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-80', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほうが$$),
        (1, $$方が$$),
        (2, $$ほうが$$),
        (2, $$方が$$),
        (3, $$ほうが$$),
        (3, $$方が$$),
        (4, $$ほうが$$),
        (4, $$方が$$),
        (5, $$ほうが$$),
        (5, $$方が$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-81 — 〜ます・〜ません・〜ました・〜ませんでした
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-81',
    'grammar',
    'N5',
    $$〜ます・〜ません・〜ました・〜ませんでした$$,
    $$masu / masen / mashita / masen deshita$$,
    $$Faço / Não faço / Fiz / Não fiz$$,
    $$Essas são as quatro formas básicas dos verbos na linguagem educada. Elas são usadas com desconhecidos, no trabalho, na escola e em qualquer situação em que se queira falar com respeito.

• ます: afirmativo, presente ou futuro ("faço", "vou fazer").
• ません: negativo, presente ou futuro ("não faço", "não vou fazer").
• ました: afirmativo no passado ("fiz").
• ませんでした: negativo no passado ("não fiz").

Em japonês, o presente e o futuro usam a mesma forma. O contexto, ou palavras como 明日 e 来週, mostra quando a ação acontece.

Para formar essas terminações, primeiro é preciso encontrar a "base ます" do verbo. Ela muda conforme o grupo do verbo: nos verbos do grupo 1, o último som muda de "u" para "i"; nos verbos do grupo 2, tira-se o る; e する e 来る são irregulares.$$,
    $$Alguns verbos terminados em る pertencem ao grupo 1, como 帰る, 入る e 走る. Por isso, a forma ます deles é 帰ります, e não 帰ます.

O passado negativo ませんでした é formado juntando ません com でした. É uma das formas mais longas dos verbos educados.

Na conversa entre amigos, usa-se a forma simples: dicionário, ない, た e なかった.$$,
    $$Base ます + ます / ません / ました / ませんでした

Grupo 1: troque o som final "u" por "i" (書く → 書き / 飲む → 飲み / 買う → 買い)
Grupo 2: tire o る (食べる → 食べ / 見る → 見)
Irregulares: する → し / 来る → 来 (き)$$,
    $$ます$$,
    $$ます|ません|ました|ませんでした$$,
    ARRAY['ます', 'ません', 'ました', 'ませんでした']::text[],
    ARRAY['ます', 'ません', 'ました', 'ませんでした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-81', $$毎朝、コーヒーを飲みます。$$, $$まいあさ、コーヒーをのみます。$$, $$Toda manhã, tomo café.$$),
    ('n5-grammar-81', $$私はお酒を飲みません。$$, $$わたしはおさけをのみません。$$, $$Eu não bebo álcool.$$),
    ('n5-grammar-81', $$昨日、駅で友達に会いました。$$, $$きのう、えきでともだちにあいました。$$, $$Ontem encontrei um amigo na estação.$$),
    ('n5-grammar-81', $$昨日は雨で、どこにも行きませんでした。$$, $$きのうはあめで、どこにもいきませんでした。$$, $$Ontem choveu e não fui a lugar nenhum.$$),
    ('n5-grammar-81', $$明日、母が東京に来ます。$$, $$あした、ははがとうきょうにきます。$$, $$Amanhã minha mãe vem a Tóquio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎晩十一時に寝____。$$, $$Toda noite, durmo às onze.$$),
        (2, $$私は肉を食べ____。$$, $$Eu não como carne.$$),
        (3, $$先週、京都へ行き____。$$, $$Semana passada, fui a Kyoto.$$),
        (4, $$昨日は疲れて、宿題をし____。$$, $$Ontem estava cansado e não fiz a lição.$$),
        (5, $$来週、友達がブラジルから来____。$$, $$Semana que vem, um amigo vem do Brasil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-81', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ます$$),
        (2, $$ません$$),
        (3, $$ました$$),
        (4, $$ませんでした$$),
        (5, $$ます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-82 — 〜でした・〜ではありませんでした
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-82',
    'grammar',
    'N5',
    $$〜でした・〜ではありませんでした$$,
    $$deshita / dewa arimasen deshita$$,
    $$Era / Foi / Não era / Não foi$$,
    $$でした e ではありませんでした são as formas do passado de です. Elas servem para dizer o que algo "era" ou "foi", e o que "não era" ou "não foi".

São usadas depois de substantivos e de adjetivos な. Por exemplo, para dizer que ontem foi domingo, que alguém era estudante ou que uma prova não foi fácil.

でした é o passado afirmativo. ではありませんでした é o passado negativo, e é formado juntando ではありません com でした. Na fala, では costuma virar じゃ, formando じゃありませんでした.

Existe ainda outra forma educada para o passado negativo: ではなかったです ou じゃなかったです. Ela é um pouco mais leve e muito usada na conversa.

Atenção: com adjetivos い, essas formas não são usadas. O passado do adjetivo い é formado pelo próprio adjetivo, com かった.$$,
    $$Um erro clássico é dizer おいしいでした. Com adjetivos い, o passado correto é おいしかったです.

ではありませんでした soa mais formal e escrito. じゃなかったです é mais comum na conversa do dia a dia.

Essas formas também aparecem depois de の em explicações, como em のでした, mas esse uso é mais avançado.$$,
    $$Substantivo / Adjetivo な + でした
Substantivo / Adjetivo な + ではありませんでした
Substantivo / Adjetivo な + じゃありませんでした
Substantivo / Adjetivo な + ではなかったです / じゃなかったです

Informal: だった / じゃなかった / ではなかった$$,
    $$でした$$,
    $$でした|ではありませんでした|じゃありませんでした|ではなかった|じゃなかった$$,
    ARRAY['でした', 'ではありませんでした']::text[],
    ARRAY['でした', 'ではありませんでした', 'じゃありませんでした', 'ではなかったです', 'じゃなかったです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-82', $$昨日は日曜日でした。$$, $$きのうはにちようびでした。$$, $$Ontem foi domingo.$$),
    ('n5-grammar-82', $$子供のころ、私は静かな子でした。$$, $$こどものころ、わたしはしずかなこでした。$$, $$Quando criança, eu era uma criança quieta.$$),
    ('n5-grammar-82', $$昨日の試験は簡単ではありませんでした。$$, $$きのうのしけんはかんたんではありませんでした。$$, $$A prova de ontem não foi fácil.$$),
    ('n5-grammar-82', $$先週は休みじゃありませんでした。$$, $$せんしゅうはやすみじゃありませんでした。$$, $$Semana passada não foi folga.$$),
    ('n5-grammar-82', $$あの店は、前は有名ではなかったです。$$, $$あのみせは、まえはゆうめいではなかったです。$$, $$Aquela loja, antes, não era famosa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昨日はいい天気____。$$, $$Ontem fez um tempo bom.$$),
        (2, $$父は昔、先生____。$$, $$Meu pai, antigamente, era professor.$$),
        (3, $$昨日のパーティーはあまりにぎやか____。$$, $$A festa de ontem não foi muito animada.$$),
        (4, $$子供のころ、野菜が嫌い____。$$, $$Quando criança, eu não gostava de verdura.$$),
        (5, $$「昨日は暇でしたか。」「いいえ、暇____。」$$, $$"Você estava livre ontem?" "Não, não estava livre."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-82', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でした$$),
        (2, $$でした$$),
        (3, $$ではありませんでした$$),
        (3, $$じゃありませんでした$$),
        (3, $$ではなかったです$$),
        (3, $$じゃなかったです$$),
        (4, $$でした$$),
        (5, $$ではありませんでした$$),
        (5, $$じゃありませんでした$$),
        (5, $$ではなかったです$$),
        (5, $$じゃなかったです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-83 — これ・それ・あれ・どれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-83',
    'grammar',
    'N5',
    $$これ・それ・あれ・どれ$$,
    $$kore / sore / are / dore$$,
    $$Isto / Isso / Aquilo / Qual$$,
    $$これ, それ, あれ e どれ são pronomes usados para apontar coisas. Eles funcionam sozinhos, no lugar de um substantivo.

A escolha depende da distância entre a coisa, quem fala e quem ouve:
• これ: algo perto de quem fala ("isto").
• それ: algo perto de quem ouve ("isso").
• あれ: algo longe dos dois ("aquilo").
• どれ: a pergunta "qual?", usada para escolher entre três ou mais coisas.

Esses pronomes recebem partículas normalmente, como は, が e を.

それ também é usado para se referir a algo que o outro acabou de dizer, e あれ, para algo que os dois conhecem e lembram.$$,
    $$Esses pronomes fazem parte do sistema こ・そ・あ・ど, que aparece em várias palavras: この / その / あの / どの, ここ / そこ / あそこ / どこ e こちら / そちら / あちら / どちら.

Para escolher entre apenas duas coisas, usa-se どちら, e não どれ.

Para pessoas, usar これ ou あれ pode soar rude. O mais educado é この人, あの人 ou, de forma respeitosa, この方 e あの方.$$,
    $$これ / それ / あれ + は / が / を / も
どれ + が / を / ですか

これ: perto de quem fala
それ: perto de quem ouve
あれ: longe dos dois
どれ: qual (entre três ou mais)$$,
    $$これ$$,
    $$これ|それ|あれ|どれ$$,
    ARRAY['これ', 'それ', 'あれ', 'どれ']::text[],
    ARRAY['これ', 'それ', 'あれ', 'どれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-83', $$これは私のかばんです。$$, $$これはわたしのかばんです。$$, $$Esta é a minha bolsa.$$),
    ('n5-grammar-83', $$それは何ですか。$$, $$それはなんですか。$$, $$O que é isso?$$),
    ('n5-grammar-83', $$あれは東京タワーです。$$, $$あれはとうきょうタワーです。$$, $$Aquilo é a Torre de Tóquio.$$),
    ('n5-grammar-83', $$あなたの傘はどれですか。$$, $$あなたのかさはどれですか。$$, $$Qual é o seu guarda-chuva?$$),
    ('n5-grammar-83', $$すみません、それを見せてください。$$, $$すみません、それをみせてください。$$, $$Com licença, me mostre isso, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あなたの手にある____は何ですか。$$, $$O que é isso na sua mão?$$),
        (2, $$「田中さんの車は____ですか。」「あの白い車です。」$$, $$"Qual é o carro do Tanaka?" "É aquele carro branco."$$),
        (3, $$私の手の中の____は日本のお金です。$$, $$Isto aqui na minha mão é dinheiro japonês.$$),
        (4, $$遠くに見える____は富士山ですか。$$, $$Aquilo que se vê ao longe é o Monte Fuji?$$),
        (5, $$この中で、____が一番好きですか。$$, $$Destes aqui, qual você mais gosta?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-83', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$それ$$),
        (2, $$どれ$$),
        (3, $$これ$$),
        (4, $$あれ$$),
        (5, $$どれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-84 — ここ・そこ・あそこ・どこ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-84',
    'grammar',
    'N5',
    $$ここ・そこ・あそこ・どこ$$,
    $$koko / soko / asoko / doko$$,
    $$Aqui / Aí / Lá / Onde$$,
    $$ここ, そこ, あそこ e どこ são palavras para indicar lugares. Elas seguem a mesma lógica de distância de これ, それ e あれ.

• ここ: o lugar onde está quem fala ("aqui").
• そこ: o lugar perto de quem ouve ("aí").
• あそこ: um lugar longe dos dois ("lá", "ali").
• どこ: a pergunta "onde?".

Elas funcionam como substantivos e podem receber partículas como に, で, へ, を e は.

Quando quem fala e quem ouve estão no mesmo lugar, ここ indica o lugar onde os dois estão, そこ indica um lugar um pouco afastado, e あそこ indica um lugar mais distante.$$,
    $$Em situações educadas, como em lojas e recepções, usa-se こちら, そちら, あちら e どちら no lugar de ここ, そこ, あそこ e どこ.

そこ também pode indicar um lugar que acabou de ser mencionado na conversa, mesmo que não esteja fisicamente perto do ouvinte.

Note que a forma "lá" é あそこ, e não あこ. É a única irregular do grupo.$$,
    $$ここ / そこ / あそこ / どこ + は / が / に / で / へ / を
Substantivo + は + ここ / そこ / あそこ / どこ + です

ここ: perto de quem fala
そこ: perto de quem ouve
あそこ: longe dos dois
どこ: onde$$,
    $$ここ$$,
    $$ここ|そこ|あそこ|どこ$$,
    ARRAY['ここ', 'そこ', 'あそこ', 'どこ']::text[],
    ARRAY['ここ', 'そこ', 'あそこ', 'どこ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-84', $$ここは私の部屋です。$$, $$ここはわたしのへやです。$$, $$Aqui é o meu quarto.$$),
    ('n5-grammar-84', $$すみません、トイレはどこですか。$$, $$すみません、トイレはどこですか。$$, $$Com licença, onde fica o banheiro?$$),
    ('n5-grammar-84', $$あそこに銀行があります。$$, $$あそこにぎんこうがあります。$$, $$Ali tem um banco.$$),
    ('n5-grammar-84', $$どうぞ、そこに座ってください。$$, $$どうぞ、そこにすわってください。$$, $$Por favor, sente-se aí.$$),
    ('n5-grammar-84', $$「駅はどこですか。」「あそこです。」$$, $$「えきはどこですか。」「あそこです。」$$, $$"Onde fica a estação?" "É lá."$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$すみません、出口は____ですか。$$, $$Com licença, onde fica a saída?$$),
        (2, $$私たちが今いる____は、昔、学校でした。$$, $$Este lugar onde estamos agora antigamente era uma escola.$$),
        (3, $$遠くに白い建物が見えるでしょう。____が私の会社です。$$, $$Dá para ver um prédio branco ao longe, né? Lá é a minha empresa.$$),
        (4, $$「私の眼鏡、知らない？」「あなたの足の下、____にあるよ。」$$, $$"Você viu meus óculos?" "Estão aí, debaixo do seu pé."$$),
        (5, $$夏休みは____へ行きたいですか。$$, $$Aonde você quer ir nas férias de verão?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-84', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どこ$$),
        (2, $$ここ$$),
        (3, $$あそこ$$),
        (4, $$そこ$$),
        (5, $$どこ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-85 — この・その・あの・どの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-85',
    'grammar',
    'N5',
    $$この・その・あの・どの$$,
    $$kono / sono / ano / dono$$,
    $$Este / Esse / Aquele / Qual$$,
    $$この, その, あの e どの são usados antes de um substantivo para apontar qual coisa ou pessoa está sendo mencionada. Eles nunca aparecem sozinhos: sempre precisam de um substantivo depois.

A lógica de distância é a mesma de これ, それ e あれ:
• この: perto de quem fala ("este").
• その: perto de quem ouve ("esse").
• あの: longe dos dois ("aquele").
• どの: a pergunta "qual?", para escolher entre três ou mais.

A diferença em relação a これ e それ é a função: これ substitui o substantivo, enquanto この acompanha o substantivo.

あの também é usado para lembrar algo que os dois conhecem, como uma época ou um lugar do passado.$$,
    $$Um erro comum é usar この sozinho, sem substantivo. Quando o substantivo não aparece, o certo é usar これ.

Para escolher entre apenas duas opções, o mais natural é どちらの.

A palavra あのう, com som alongado, é uma interjeição usada para chamar a atenção ou hesitar, como "hum...". Não tem a função de あの + substantivo.$$,
    $$この / その / あの / どの + Substantivo

この: perto de quem fala
その: perto de quem ouve
あの: longe dos dois / algo que os dois conhecem
どの: qual (entre três ou mais)$$,
    $$この$$,
    $$この|その|あの|どの$$,
    ARRAY['この', 'その', 'あの', 'どの']::text[],
    ARRAY['この', 'その', 'あの', 'どの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-85', $$この本はおもしろいです。$$, $$このほんはおもしろいです。$$, $$Este livro é interessante.$$),
    ('n5-grammar-85', $$その傘は誰のですか。$$, $$そのかさはだれのですか。$$, $$De quem é esse guarda-chuva?$$),
    ('n5-grammar-85', $$あの人は誰ですか。$$, $$あのひとはだれですか。$$, $$Quem é aquela pessoa?$$),
    ('n5-grammar-85', $$どの電車に乗りますか。$$, $$どのでんしゃにのりますか。$$, $$Em qual trem você vai entrar?$$),
    ('n5-grammar-85', $$あの時は本当に楽しかったね。$$, $$あのときはほんとうにたのしかったね。$$, $$Aquela época foi muito divertida, né?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私が持っている____かばんは新しいです。$$, $$Esta bolsa que estou segurando é nova.$$),
        (2, $$あなたが持っている____ペン、ちょっと貸して。$$, $$Me empresta essa caneta que você está segurando?$$),
        (3, $$遠くに見える____山の名前を知っていますか。$$, $$Você sabe o nome daquela montanha que se vê ao longe?$$),
        (4, $$この三つの中で、____色が好きですか。$$, $$Destas três, de qual cor você gosta?$$),
        (5, $$子供のころ住んでいた____町に、もう一度行きたいです。$$, $$Quero ir mais uma vez àquela cidade onde morei quando criança.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-85', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$この$$),
        (2, $$その$$),
        (3, $$あの$$),
        (4, $$どの$$),
        (5, $$あの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-86 — 疑問詞（何・誰・いつ・いくら・いくつ）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-86',
    'grammar',
    'N5',
    $$疑問詞（何・誰・いつ・いくら・いくつ）$$,
    $$gimonshi (nani / dare / itsu / ikura / ikutsu)$$,
    $$O que / Quem / Quando / Quanto custa / Quantos$$,
    $$疑問詞 são as palavras interrogativas, usadas para fazer perguntas abertas. No N5, as mais importantes são:
• 何 (なに / なん): "o que".
• 誰 (だれ): "quem".
• いつ: "quando".
• いくら: "quanto custa" ou "quanto" para preços e valores.
• いくつ: "quantos" para coisas, e também "quantos anos" para idade.

Em japonês, a palavra interrogativa não precisa ir para o começo da frase. Ela fica no mesmo lugar onde estaria a resposta. Por isso, a ordem da pergunta e da resposta é igual.

何 tem duas leituras. Antes de sons como t, d e n, e antes de contadores, costuma ser lido なん. Antes de partículas como を e が, costuma ser lido なに.

Quando a palavra interrogativa é o sujeito, ela é marcada com が, e nunca com は.$$,
    $$いつ normalmente não leva に, mesmo quando pergunta sobre um momento.

Para perguntar a idade de alguém de forma educada, usa-se おいくつですか. Para crianças, também é comum 何歳ですか.

Com も e o verbo negativo, as palavras interrogativas formam ideias como "nada" e "ninguém". Com か, formam "algo" e "alguém".$$,
    $$何 (なに) + を / が / に
何 (なん) + です / の / contador (何時 / 何人 / 何曜日)
誰 + が / に / と / の
いつ + Verbo / ですか
いくら + ですか
いくつ + ありますか / ですか (idade)

Formas educadas: どなた (quem) / おいくつ (idade)$$,
    $$何$$,
    $$何|誰|いつ|いくら|いくつ|なに|なん|だれ$$,
    ARRAY['何', '誰', 'いつ', 'いくら', 'いくつ']::text[],
    ARRAY['何', 'なに', 'なん', '誰', 'だれ', 'いつ', 'いくら', 'いくつ', 'どなた', 'おいくつ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-86', $$これは何ですか。$$, $$これはなんですか。$$, $$O que é isto?$$),
    ('n5-grammar-86', $$あの人は誰ですか。$$, $$あのひとはだれですか。$$, $$Quem é aquela pessoa?$$),
    ('n5-grammar-86', $$誕生日はいつですか。$$, $$たんじょうびはいつですか。$$, $$Quando é o seu aniversário?$$),
    ('n5-grammar-86', $$このシャツはいくらですか。$$, $$このシャツはいくらですか。$$, $$Quanto custa esta camisa?$$),
    ('n5-grammar-86', $$箱の中にりんごはいくつありますか。$$, $$はこのなかにりんごはいくつありますか。$$, $$Quantas maçãs tem dentro da caixa?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「昨日、____を食べましたか。」「カレーを食べました。」$$, $$"O que você comeu ontem?" "Comi curry."$$),
        (2, $$「____が来ましたか。」「田中さんが来ました。」$$, $$"Quem veio?" "O Tanaka veio."$$),
        (3, $$「夏休みは____からですか。」「七月二十日からです。」$$, $$"A partir de quando são as férias de verão?" "A partir de 20 de julho."$$),
        (4, $$「この時計は____ですか。」「三千円です。」$$, $$"Quanto custa este relógio?" "Três mil ienes."$$),
        (5, $$「弟さんは____ですか。」「十歳です。」$$, $$"Quantos anos tem o seu irmão mais novo?" "Dez anos."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-86', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$何$$),
        (1, $$なに$$),
        (2, $$誰$$),
        (2, $$だれ$$),
        (3, $$いつ$$),
        (4, $$いくら$$),
        (5, $$いくつ$$),
        (5, $$おいくつ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-87 — ない形
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-87',
    'grammar',
    'N5',
    $$ない形$$,
    $$nai-kei$$,
    $$Forma negativa simples / Não (fazer)$$,
    $$A forma ない é a forma negativa simples dos verbos. Ela é usada na fala informal, com amigos e família, e também serve de base para muitas outras gramáticas, como ないでください e なくてもいい.

Ela equivale a "não faço" ou "não vou fazer". Para o passado, troca-se ない por なかった ("não fiz").

A formação depende do grupo do verbo:
• Grupo 1: o último som muda de "u" para "a" e recebe ない. Verbos terminados em う viram わ, e não あ.
• Grupo 2: tira-se o る e acrescenta-se ない.
• Irregulares: する vira しない, e 来る vira 来ない (こない).

O verbo ある é especial: sua forma negativa é simplesmente ない.

Depois de formado, o verbo na forma ない se comporta como um adjetivo い: o passado é なかった, e a forma educada pode ser ないです.$$,
    $$Verbos como 帰る, 入る e 走る parecem do grupo 2, mas são do grupo 1. Por isso, a forma ない deles é 帰らない, 入らない e 走らない.

A leitura de 来ない é こない, com o som "ko", e não "ki".

Na fala muito casual de algumas regiões, ない pode virar ん, mas esse uso é dialetal ou bem informal.$$,
    $$Grupo 1: troque o som final "u" por "a" + ない (書く → 書かない / 飲む → 飲まない)
Grupo 1 terminados em う: う → わ + ない (買う → 買わない)
Grupo 2: tire o る + ない (食べる → 食べない / 見る → 見ない)
Irregulares: する → しない / 来る → 来ない (こない)
Especial: ある → ない

Passado: ない → なかった$$,
    $$ない$$,
    $$ない|なかった$$,
    ARRAY['ない']::text[],
    ARRAY['ない', 'なかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-87', $$私はタバコを吸わない。$$, $$わたしはタバコをすわない。$$, $$Eu não fumo.$$),
    ('n5-grammar-87', $$今日は学校に行かない。$$, $$きょうはがっこうにいかない。$$, $$Hoje não vou à escola.$$),
    ('n5-grammar-87', $$弟は野菜を食べない。$$, $$おとうとはやさいをたべない。$$, $$Meu irmão mais novo não come verdura.$$),
    ('n5-grammar-87', $$昨日は誰も来なかった。$$, $$きのうはだれもこなかった。$$, $$Ontem ninguém veio.$$),
    ('n5-grammar-87', $$明日は雨だから、出かけない。$$, $$あしたはあめだから、でかけない。$$, $$Amanhã vai chover, então não vou sair.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私はコーヒーを飲ま____。$$, $$Eu não bebo café.$$),
        (2, $$父は朝ご飯を食べ____。$$, $$Meu pai não toma café da manhã.$$),
        (3, $$昨日はテレビを見____。$$, $$Ontem não vi TV.$$),
        (4, $$今日は疲れたから、宿題を____。$$, $$Hoje estou cansado, então não vou fazer a lição.$$),
        (5, $$明日、田中さんは学校に____。$$, $$Amanhã, o Tanaka não vem à escola.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-87', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ない$$),
        (2, $$ない$$),
        (3, $$なかった$$),
        (4, $$しない$$),
        (5, $$来ない$$),
        (5, $$こない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-88 — 助数詞（つ・人・枚・本・個 など）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-88',
    'grammar',
    'N5',
    $$助数詞（つ・人・枚・本・個 など）$$,
    $$josuushi (tsu / nin / mai / hon / ko)$$,
    $$Contadores / Palavras para contar$$,
    $$助数詞 são os contadores: palavras que vêm depois dos números para contar coisas. Em japonês, não se diz apenas "três canetas": o número precisa de um contador que combine com o tipo de objeto.

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

A pronúncia de alguns números muda quando se juntam ao contador, como acontece com 本, 匹 e 人.$$,
    $$Os números um e dois de pessoas são irregulares: ひとり e ふたり. A partir de três, usa-se o número + にん.

Com 本, a leitura muda: いっぽん, にほん, さんぼん, よんほん, ろっぽん. O mesmo tipo de mudança acontece com 匹: いっぴき, にひき, さんびき.

Quando não se sabe o contador certo, つ é uma opção segura para objetos, até nove.$$,
    $$Número + Contador
Substantivo + が / を + Número + Contador + Verbo
Número + Contador + の + Substantivo

Perguntas: いくつ / 何人 / 何枚 / 何本 / 何個 / 何台 / 何匹 / 何冊

つ: ひとつ / ふたつ / みっつ / よっつ / いつつ / むっつ / ななつ / やっつ / ここのつ / とお
人: ひとり / ふたり / さんにん / よにん …$$,
    $$つ$$,
    $$つ|人|枚|本|個|台|匹|冊$$,
    ARRAY['つ', '人', '枚', '本', '個']::text[],
    ARRAY['つ', '人', '枚', '本', '個', '台', '匹', '冊']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-88', $$りんごを三つ買いました。$$, $$りんごをみっつかいました。$$, $$Comprei três maçãs.$$),
    ('n5-grammar-88', $$教室に学生が二十人います。$$, $$きょうしつにがくせいがにじゅうにんいます。$$, $$Tem vinte alunos na sala de aula.$$),
    ('n5-grammar-88', $$切手を五枚ください。$$, $$きってをごまいください。$$, $$Me dê cinco selos, por favor.$$),
    ('n5-grammar-88', $$かばんの中に鉛筆が二本あります。$$, $$かばんのなかにえんぴつがにほんあります。$$, $$Tem dois lápis dentro da bolsa.$$),
    ('n5-grammar-88', $$家に犬が一匹と猫が二匹います。$$, $$いえにいぬがいっぴきとねこがにひきいます。$$, $$Em casa tem um cachorro e dois gatos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私の家族は四____です。$$, $$Minha família tem quatro pessoas.$$),
        (2, $$すみません、コピーを十____お願いします。$$, $$Com licença, dez cópias, por favor.$$),
        (3, $$ビールを二____ください。$$, $$Me dê duas garrafas de cerveja, por favor.$$),
        (4, $$スーパーで卵を三____買ってきてください。$$, $$Compre três ovos no supermercado, por favor.$$),
        (5, $$姉は車を一____持っています。$$, $$Minha irmã mais velha tem um carro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-88', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$人$$),
        (2, $$枚$$),
        (3, $$本$$),
        (4, $$個$$),
        (4, $$つ$$),
        (5, $$台$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-89 — 〜が好き・〜が嫌い
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-89',
    'grammar',
    'N5',
    $$〜が好き・〜が嫌い$$,
    $$ga suki / ga kirai$$,
    $$Gostar de / Não gostar de / Detestar$$,
    $$が好き e が嫌い são usados para falar do que alguém gosta ou não gosta. Equivalem a "gostar de" e "não gostar de".

好き e 嫌い não são verbos, e sim adjetivos な. Por isso, a coisa de que se gosta é marcada com が, e não com を. A pessoa que sente o gosto costuma vir com は.

Para dar mais força, usa-se 大好き (adorar) e 大嫌い (detestar).

Para falar de ações, como gostar de ler ou de nadar, é preciso transformar o verbo em substantivo com の: のが好き.

Antes de um substantivo, eles recebem な, como em "comida favorita" ou "pessoa de quem não gosto".$$,
    $$嫌い soa forte em japonês. Para dizer de forma mais suave que não gosta de algo, os japoneses preferem あまり好きじゃない.

Embora 嫌い termine em い, ele é um adjetivo な. O negativo é 嫌いじゃない, e não 嫌くない.

好き também é usado para falar de gostar de uma pessoa no sentido romântico, dependendo do contexto.$$,
    $$Substantivo + が + 好き / 嫌い + です / だ
Substantivo + が + 大好き / 大嫌い + です / だ
Verbo + のが + 好き / 嫌い
好きな / 嫌いな + Substantivo

Negativo: が好きじゃない / が好きではありません
Passado: が好きでした / が嫌いでした

Escrita: 好き / すき, 嫌い / きらい$$,
    $$好き$$,
    $$が好き|が嫌い|がすき|がきらい|が大好き|が大嫌い|がだいすき|がだいきらい$$,
    ARRAY['が', '好き', '嫌い']::text[],
    ARRAY['が好き', 'が嫌い', 'がすき', 'がきらい', 'が大好き', 'が大嫌い']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-89', $$私は猫が好きです。$$, $$わたしはねこがすきです。$$, $$Eu gosto de gatos.$$),
    ('n5-grammar-89', $$弟は野菜が嫌いです。$$, $$おとうとはやさいがきらいです。$$, $$Meu irmão mais novo não gosta de verdura.$$),
    ('n5-grammar-89', $$母は花が大好きです。$$, $$はははながだいすきです。$$, $$Minha mãe adora flores.$$),
    ('n5-grammar-89', $$田中さんはどんな音楽が好きですか。$$, $$たなかさんはどんなおんがくがすきですか。$$, $$Que tipo de música o Tanaka gosta?$$),
    ('n5-grammar-89', $$子供のころ、牛乳が嫌いでした。$$, $$こどものころ、ぎゅうにゅうがきらいでした。$$, $$Quando era criança, eu não gostava de leite.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私は日本の料理____です。$$, $$Eu gosto de comida japonesa.$$),
        (2, $$兄は虫____です。$$, $$Meu irmão mais velho detesta insetos.$$),
        (3, $$どんなスポーツ____ですか。$$, $$De que esporte você gosta?$$),
        (4, $$子供のころ、勉強____でした。$$, $$Quando era criança, eu não gostava de estudar.$$),
        (5, $$私はあまりお酒____じゃありません。$$, $$Eu não gosto muito de bebida alcoólica.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-89', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$が好き$$),
        (1, $$がすき$$),
        (1, $$が大好き$$),
        (1, $$がだいすき$$),
        (2, $$が嫌い$$),
        (2, $$がきらい$$),
        (2, $$が大嫌い$$),
        (2, $$がだいきらい$$),
        (3, $$が好き$$),
        (3, $$がすき$$),
        (4, $$が嫌い$$),
        (4, $$がきらい$$),
        (4, $$が大嫌い$$),
        (4, $$がだいきらい$$),
        (5, $$が好き$$),
        (5, $$がすき$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-90 — 〜ができる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-90',
    'grammar',
    'N5',
    $$〜ができる$$,
    $$ga dekiru$$,
    $$Saber (fazer) / Conseguir / Poder$$,
    $$ができる é usado para dizer que alguém sabe fazer algo, consegue fazer algo ou que algo pode ser feito em um lugar. Equivale a "saber", "conseguir" ou "poder".

A coisa que se sabe ou se pode fazer é marcada com が, e não com を. Isso acontece porque できる indica uma capacidade ou possibilidade, e não uma ação direta.

Os usos mais comuns são:
• Habilidade: saber um idioma, um esporte, tocar um instrumento.
• Possibilidade: uma atividade que pode ser feita em um lugar.
• Surgimento: algo que foi criado, construído ou ficou pronto, como uma loja nova ou um prato que ficou pronto.

Com verbos, a estrutura é ことができる, que aparece no N4.$$,
    $$Quando できる indica que algo surgiu ou foi construído, ele não fala de habilidade. O contexto mostra qual é o sentido.

Para dizer "pronto!" quando algo fica pronto, como comida ou um trabalho, os japoneses dizem できた.

Para falar de habilidade com mais modéstia, também se usa 少しできます.$$,
    $$Substantivo + が + できる
Lugar + で(は) + Substantivo + が + できる

Educado: ができます
Negativo: ができない / ができません
Passado: ができた / ができました
Passado negativo: ができなかった / ができませんでした$$,
    $$できる$$,
    $$ができる|ができます|ができない|ができなかった|ができません|ができた|ができました$$,
    ARRAY['が', 'できる']::text[],
    ARRAY['ができる', 'ができます', 'ができない', 'ができません', 'ができた', 'ができました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-90', $$私は英語ができます。$$, $$わたしはえいごができます。$$, $$Eu sei inglês.$$),
    ('n5-grammar-90', $$姉はピアノができる。$$, $$あねはピアノができる。$$, $$Minha irmã mais velha sabe tocar piano.$$),
    ('n5-grammar-90', $$弟はまだ料理ができません。$$, $$おとうとはまだりょうりができません。$$, $$Meu irmão mais novo ainda não sabe cozinhar.$$),
    ('n5-grammar-90', $$このホテルでは、テニスができます。$$, $$このホテルでは、テニスができます。$$, $$Neste hotel, dá para jogar tênis.$$),
    ('n5-grammar-90', $$駅の前に新しい店ができました。$$, $$えきのまえにあたらしいみせができました。$$, $$Abriu uma loja nova em frente à estação.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$田中さんは中国語____。$$, $$O Tanaka sabe chinês.$$),
        (2, $$私は水泳____。$$, $$Eu não sei nadar.$$),
        (3, $$この公園ではバーベキュー____か。$$, $$Dá para fazer churrasco neste parque?$$),
        (4, $$子供のころは、スキー____。$$, $$Quando era criança, eu não sabia esquiar.$$),
        (5, $$先月、家の近くに大きいスーパー____。$$, $$Mês passado, abriu um supermercado grande perto de casa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-90', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ができます$$),
        (1, $$ができる$$),
        (2, $$ができません$$),
        (2, $$ができない$$),
        (3, $$ができます$$),
        (4, $$ができませんでした$$),
        (4, $$ができなかった$$),
        (5, $$ができました$$),
        (5, $$ができた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n5-grammar-91 — 〜から〜まで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-91',
    'grammar',
    'N5',
    $$〜から〜まで$$,
    $$kara ~ made$$,
    $$De... até... / Desde... até...$$,
    $$から〜まで é usado para indicar o começo e o fim de algo, seja no espaço ou no tempo. Equivale a "de... até...".

から marca o ponto de partida, e まで marca o ponto final. Juntos, eles mostram um intervalo completo: de um lugar a outro, de um horário a outro, de um dia a outro.

É muito usado para falar de horários de funcionamento, trajetos, períodos de férias e duração de atividades.

Também pode indicar a abrangência de um grupo, com o sentido de "desde... até...", mostrando que todos dentro daquele intervalo estão incluídos.$$,
    $$Também é possível usar só から ou só まで quando um dos pontos já está claro pelo contexto.

Para dizer quanto tempo leva um trajeto, a estrutura costuma terminar com かかります.

Lembre que まで indica algo contínuo até o fim. Para prazos, como "entregar até sexta", usa-se までに.$$,
    $$Lugar A + から + Lugar B + まで
Tempo A + から + Tempo B + まで
Substantivo A + から + Substantivo B + まで + です$$,
    $$から$$,
    $$から|まで$$,
    ARRAY['から', 'まで']::text[],
    ARRAY['から', 'まで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-91', $$授業は九時から三時までです。$$, $$じゅぎょうはくじからさんじまでです。$$, $$As aulas são das nove às três.$$),
    ('n5-grammar-91', $$家から駅まで歩いて十分です。$$, $$いえからえきまであるいてじっぷんです。$$, $$De casa até a estação são dez minutos a pé.$$),
    ('n5-grammar-91', $$月曜日から金曜日まで働きます。$$, $$げつようびからきんようびまではたらきます。$$, $$Trabalho de segunda a sexta.$$),
    ('n5-grammar-91', $$東京から大阪まで新幹線で二時間半かかります。$$, $$とうきょうからおおさかまでしんかんせんでにじかんはんかかります。$$, $$De Tóquio até Osaka leva duas horas e meia de trem-bala.$$),
    ('n5-grammar-91', $$夏休みは七月二十日から八月三十一日までです。$$, $$なつやすみはしちがつはつかからはちがつさんじゅういちにちまでです。$$, $$As férias de verão vão de 20 de julho até 31 de agosto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$銀行は九時____三時までです。$$, $$O banco funciona das nove às três.$$),
        (2, $$家から学校____自転車で行きます。$$, $$Vou de casa até a escola de bicicleta.$$),
        (3, $$東京____京都まで、新幹線で行きました。$$, $$Fui de Tóquio até Kyoto de trem-bala.$$),
        (4, $$昼休みは十二時から一時____です。$$, $$O intervalo de almoço é do meio-dia à uma.$$),
        (5, $$このお祭りには、子供____お年寄りまで、たくさんの人が来ます。$$, $$Neste festival vêm muitas pessoas, das crianças aos idosos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-91', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$から$$),
        (2, $$まで$$),
        (3, $$から$$),
        (4, $$まで$$),
        (5, $$から$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

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

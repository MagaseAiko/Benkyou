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

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

-- n3-grammar-113 — すなわち
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-113',
    'grammar',
    'N3',
    $$すなわち$$,
    $$sunawachi$$,
    $$Ou seja / Isto é / Quer dizer$$,
    $$すなわち é uma conjunção usada para explicar, definir ou dizer a mesma coisa com outras palavras. Equivale a "ou seja", "isto é" ou "quer dizer".

Ela é usada para:
• Esclarecer quem ou o que é algo: "a irmã mais velha da minha mãe, ou seja, minha tia".
• Dar uma equivalência: "uma semana, isto é, sete dias".
• Tirar uma conclusão lógica: "ele passou na prova. Quer dizer, a partir do ano que vem é universitário".

すなわち é bem formal e aparece principalmente em textos escritos, discursos, livros e explicações acadêmicas.

Na conversa do dia a dia, os japoneses preferem つまり, que tem o mesmo sentido.$$,
    $$つまり é a forma mais comum na fala; すなわち soa literário e formal.

すなわち costuma ligar duas coisas que são exatamente equivalentes, enquanto つまり pode também resumir de forma mais livre.

Em textos de filosofia e em provérbios, すなわち aparece para definir ideias.$$,
    $$A、 + すなわち + B (A, ou seja, B)
Frase 1 (com ponto final) + すなわち、 + Conclusão / Explicação

Escrita: すなわち / 即ち$$,
    $$すなわち$$,
    $$すなわち|即ち$$,
    ARRAY['すなわち']::text[],
    ARRAY['すなわち', '即ち']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-113', $$日本の首都、すなわち東京は人口が多い。$$, $$にほんのしゅと、すなわちとうきょうはじんこうがおおい。$$, $$A capital do Japão, ou seja, Tóquio, tem uma grande população.$$),
    ('n3-grammar-113', $$母の姉、すなわち私のおばは先生です。$$, $$ははのあね、すなわちわたしのおばはせんせいです。$$, $$A irmã mais velha da minha mãe, ou seja, minha tia, é professora.$$),
    ('n3-grammar-113', $$彼は試験に合格した。すなわち、来年から大学生だ。$$, $$かれはしけんにごうかくした。すなわち、らいねんからだいがくせいだ。$$, $$Ele passou na prova. Quer dizer, a partir do ano que vem é universitário.$$),
    ('n3-grammar-113', $$夏には一週間、すなわち七日間の休みがある。$$, $$なつにはいっしゅうかん、すなわちなのかかんのやすみがある。$$, $$No verão há uma semana, isto é, sete dias de folga.$$),
    ('n3-grammar-113', $$学ぶことは、すなわち生きることだ。$$, $$まなぶことは、すなわちいきることだ。$$, $$Aprender é, ou seja, viver.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父の弟、____私のおじは医者だ。$$, $$O irmão mais novo do meu pai, ou seja, meu tio, é médico.$$),
        (2, $$来月の一日、____四月一日から新学期が始まる。$$, $$No dia primeiro do mês que vem, ou seja, primeiro de abril, começa o novo semestre.$$),
        (3, $$彼は返事をしなかった。____、反対だということだ。$$, $$Ele não respondeu. Quer dizer, ele é contra.$$),
        (4, $$地球の衛星、____月について調べた。$$, $$Pesquisei sobre o satélite da Terra, isto é, a Lua.$$),
        (5, $$「時は金なり」とは、____時間は大切だという意味だ。$$, $$"Tempo é dinheiro" significa, ou seja, que o tempo é precioso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-113', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$すなわち$$),
        (2, $$すなわち$$),
        (3, $$すなわち$$),
        (4, $$すなわち$$),
        (5, $$すなわち$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

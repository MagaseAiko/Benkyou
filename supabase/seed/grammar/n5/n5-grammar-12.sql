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

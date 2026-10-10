-- n4-grammar-13 — 〜が必要
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-13',
    'grammar',
    'N4',
    $$〜が必要$$,
    $$ga hitsuyou$$,
    $$Precisar de / Ser necessário$$,
    $$が必要 é usado para dizer que algo é necessário. Equivale a "precisar de" ou "ser necessário".

必要 é um adjetivo な que significa "necessário". A coisa necessária é marcada com が. Para dizer para quem ou para quê ela é necessária, usa-se には.

É muito comum em instruções, regras e explicações, como documentos para um processo, habilidades para um trabalho ou materiais para uma receita.

Para dizer que é preciso fazer uma ação, a estrutura é diferente: usa-se 必要がある com um verbo.$$,
    $$O oposto é 不要 (desnecessário), mais formal, ou 要らない, na fala do dia a dia.

Antes de um substantivo, 必要 recebe な, como em 必要な物 (coisas necessárias).

A forma 〜には〜が必要 é muito usada para dar requisitos, como em processos de matrícula e emprego.$$,
    $$Substantivo + が + 必要です / 必要だ
[Pessoa / Finalidade] + には + Substantivo + が + 必要です
Verbo na forma de dicionário + には + Substantivo + が + 必要です
必要な + Substantivo

Negativo: が必要ではない / 必要ありません$$,
    $$必要$$,
    $$が必要|がひつよう$$,
    ARRAY['が', '必要']::text[],
    ARRAY['が必要', 'が必要です', 'が必要だ', 'がひつよう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-13', $$旅行にはパスポートが必要です。$$, $$りょこうにはパスポートがひつようです。$$, $$Para viajar, é preciso passaporte.$$),
    ('n4-grammar-13', $$この仕事には経験が必要だ。$$, $$このしごとにはけいけんがひつようだ。$$, $$Este trabalho exige experiência.$$),
    ('n4-grammar-13', $$子供には親の愛が必要です。$$, $$こどもにはおやのあいがひつようです。$$, $$As crianças precisam do amor dos pais.$$),
    ('n4-grammar-13', $$入学には健康診断書が必要です。$$, $$にゅうがくにはけんこうしんだんしょがひつようです。$$, $$Para a matrícula, é necessário um atestado médico.$$),
    ('n4-grammar-13', $$もう少し時間が必要かもしれません。$$, $$もうすこしじかんがひつようかもしれません。$$, $$Talvez seja preciso um pouco mais de tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$車を運転するには免許____です。$$, $$Para dirigir um carro, é preciso carteira de motorista.$$),
        (2, $$植物には水と光____です。$$, $$As plantas precisam de água e luz.$$),
        (3, $$この料理を作るには、卵____だ。$$, $$Para fazer esta comida, precisa de ovo.$$),
        (4, $$今の私には休み____。$$, $$O que eu preciso agora é de descanso.$$),
        (5, $$会員になるには、何____ですか。$$, $$O que é necessário para se tornar sócio?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-13', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$が必要$$),
        (1, $$がひつよう$$),
        (2, $$が必要$$),
        (2, $$がひつよう$$),
        (3, $$が必要$$),
        (3, $$がひつよう$$),
        (4, $$が必要です$$),
        (4, $$が必要だ$$),
        (5, $$が必要$$),
        (5, $$がひつよう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

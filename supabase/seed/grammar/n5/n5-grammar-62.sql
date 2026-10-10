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

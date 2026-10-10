-- n3-grammar-44 — 〜切る
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-44',
    'grammar',
    'N3',
    $$〜切る$$,
    $$kiru$$,
    $$Fazer por completo / Até o fim / Totalmente$$,
    $$切る, ligado a outro verbo, indica que uma ação foi feita completamente, até o fim, sem deixar nada. Equivale a "por completo", "até o fim" ou "totalmente".

A estrutura junta o verbo na forma ます sem ます com 切る. O resultado funciona como um verbo do grupo 1.

Os usos mais comuns são:
• Terminar tudo: usar todo o dinheiro, ler o livro inteiro, correr a distância completa.
• Estado extremo: 疲れ切る (ficar completamente exausto), 冷え切る (ficar completamente gelado).
• Afirmar com convicção: 言い切る significa "afirmar com toda a certeza".

Muitas vezes, há uma ideia de esforço ou de esgotamento, como em "correr os quarenta e dois quilômetros até o fim".$$,
    $$売り切れ (esgotado) vem dessa mesma ideia: vender até acabar tudo.

疲れ切った, antes de um substantivo, descreve alguém completamente exausto.

A forma potencial negativa 切れない (não conseguir fazer até o fim) é outra gramática importante do N3.$$,
    $$Verbo na forma ます sem ます + 切る

Passado: 切った / 切りました
Estado: 切っている / 切った + Substantivo

Combinações comuns: 使い切る / 読み切る / 走り切る / 疲れ切る / 言い切る / 売り切れる$$,
    $$切る$$,
    $$切っ|切り|切る|切れ|きっ|きり$$,
    ARRAY['切る']::text[],
    ARRAY['切る', '切った', '切りました', '切って']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-44', $$マラソンで四十二キロを走り切った。$$, $$マラソンでよんじゅうにキロをはしりきった。$$, $$Corri os quarenta e dois quilômetros da maratona até o fim.$$),
    ('n3-grammar-44', $$旅行でお金を全部使い切ってしまった。$$, $$りょこうでおかねをぜんぶつかいきってしまった。$$, $$Na viagem, acabei gastando todo o dinheiro.$$),
    ('n3-grammar-44', $$彼は疲れ切った顔をしていた。$$, $$かれはつかれきったかおをしていた。$$, $$Ele estava com cara de completamente exausto.$$),
    ('n3-grammar-44', $$一晩でこの本を読み切った。$$, $$ひとばんでこのほんをよみきった。$$, $$Li este livro inteiro em uma noite.$$),
    ('n3-grammar-44', $$彼は「絶対に勝つ」と言い切った。$$, $$かれは「ぜったいにかつ」といいきった。$$, $$Ele afirmou com toda a certeza: "Vou vencer".$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$料理で冷蔵庫の野菜を全部使い____。$$, $$Na comida, usei todas as verduras da geladeira.$$),
        (2, $$苦しかったが、最後まで泳ぎ____。$$, $$Foi difícil, mas nadei até o fim.$$),
        (3, $$一日中働いて、疲れ____。$$, $$Trabalhei o dia inteiro e fiquei completamente exausto.$$),
        (4, $$長い小説を三日で読み____。$$, $$Li o romance longo inteiro em três dias.$$),
        (5, $$彼は自分が正しいと言い____。$$, $$Ele afirmou com convicção que estava certo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-44', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$切った$$),
        (1, $$切りました$$),
        (1, $$きった$$),
        (2, $$切った$$),
        (2, $$切りました$$),
        (3, $$切った$$),
        (3, $$切っている$$),
        (3, $$切っています$$),
        (4, $$切った$$),
        (4, $$切りました$$),
        (5, $$切った$$),
        (5, $$切りました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-47 — 〜こそ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-47',
    'grammar',
    'N3',
    $$〜こそ$$,
    $$koso$$,
    $$Justamente / É que / Desta vez sim$$,
    $$こそ é uma partícula de ênfase. Ela destaca uma palavra como a mais importante da frase, com o sentido de "justamente esse", "esse sim" ou "é exatamente isso".

Os usos mais comuns são:
• Determinação: 今度こそ / 今年こそ significam "desta vez sim", "este ano sem falta", mostrando vontade forte depois de tentativas que não deram certo.
• Resposta educada: こちらこそ significa "eu é que agradeço", "igualmente", em resposta a agradecimentos e cumprimentos.
• Destacar o motivo: からこそ significa "justamente porque...", mostrando que aquele motivo é o verdadeiro ou o mais importante.
• Destacar algo como o verdadeiro: これこそ significa "este sim é...", "este é exatamente o...".

こそ substitui は e が, e vem depois de outras partículas, como からこそ e にこそ.$$,
    $$こちらこそよろしくお願いします é a resposta mais natural quando alguém diz よろしくお願いします.

からこそ dá uma ideia de que o motivo citado, que poderia parecer negativo, é na verdade o que trouxe o resultado.

こそ não é usado com coisas negativas para criticar diretamente; ele valoriza ou enfatiza.$$,
    $$Substantivo + こそ
今度 / 今年 / 明日 + こそ (determinação)
こちらこそ (resposta educada)
Frase + からこそ (justamente porque)
これ / それ + こそ + Substantivo + だ$$,
    $$こそ$$,
    $$こそ$$,
    ARRAY['こそ']::text[],
    ARRAY['こそ', 'からこそ', 'こちらこそ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-47', $$去年は落ちたから、今度こそ合格したい。$$, $$きょねんはおちたから、こんどこそごうかくしたい。$$, $$No ano passado reprovei, então desta vez quero passar sem falta.$$),
    ('n3-grammar-47', $$「よろしくお願いします。」「こちらこそ。」$$, $$「よろしくおねがいします。」「こちらこそ。」$$, $$"Conto com você." "Eu é que conto com você."$$),
    ('n3-grammar-47', $$努力したからこそ、成功できた。$$, $$どりょくしたからこそ、せいこうできた。$$, $$Justamente por ter me esforçado, consegui ter sucesso.$$),
    ('n3-grammar-47', $$これこそ私が探していた本だ。$$, $$これこそわたしがさがしていたほんだ。$$, $$Este é exatamente o livro que eu estava procurando.$$),
    ('n3-grammar-47', $$今年こそ、毎日日記を書こう。$$, $$ことしこそ、まいにちにっきをかこう。$$, $$Este ano, sem falta, vou escrever um diário todos os dias.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$来年____、日本へ行くぞ。$$, $$Ano que vem, sem falta, vou ao Japão!$$),
        (2, $$「ありがとう。」「いえ、こちら____ありがとう。」$$, $$"Obrigado." "Não, eu é que agradeço."$$),
        (3, $$失敗したから____、学べることがある。$$, $$Justamente por ter errado, há coisas que se pode aprender.$$),
        (4, $$健康____一番大切なものだ。$$, $$A saúde é justamente a coisa mais importante.$$),
        (5, $$今日も寝坊した。明日____早く起きよう。$$, $$Hoje dormi demais de novo. Amanhã, sem falta, vou acordar cedo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-47', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こそ$$),
        (2, $$こそ$$),
        (3, $$こそ$$),
        (4, $$こそ$$),
        (5, $$こそ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n4-grammar-24 — いたします
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-24',
    'grammar',
    'N4',
    $$いたします$$,
    $$itashimasu$$,
    $$Fazer (humilde) / Farei$$,
    $$いたします é a forma humilde (謙譲語) de します. Ela significa "fazer", mas quem fala se coloca em posição modesta para mostrar respeito ao ouvinte.

No 謙譲語, a ideia é rebaixar as próprias ações. Por isso, いたします é usado só para ações de quem fala ou do seu grupo, como a própria empresa. Nunca é usado para ações de clientes ou superiores.

É muito comum em situações de trabalho, atendimento ao cliente e anúncios. Também aparece em expressões fixas, como お願いいたします e 失礼いたします.

Com verbos do tipo "substantivo + する", basta trocar する por いたします. A combinação com お / ご, como em ご案内いたします, deixa a frase ainda mais humilde.$$,
    $$よろしくお願いいたします é uma das frases mais usadas em e-mails de trabalho no Japão. É mais formal que よろしくお願いします.

Para ações de outras pessoas que merecem respeito, a forma correta é a respeitosa なさる, e não いたします.

Na escrita, いたします costuma ser escrito em hiragana quando é auxiliar, e com o kanji 致します em alguns contextos.$$,
    $$Substantivo de ação + いたします
お / ご + Substantivo de ação + いたします

Passado: いたしました
Informal humilde: いたす

Expressões fixas: よろしくお願いいたします / 失礼いたします / 承知いたしました$$,
    $$いたす$$,
    $$いたし|致し$$,
    ARRAY['いたします']::text[],
    ARRAY['いたします', 'いたしました', 'いたす', '致します']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-24', $$会場まで私がご案内いたします。$$, $$かいじょうまでわたしがごあんないいたします。$$, $$Eu vou guiá-lo até o local.$$),
    ('n4-grammar-24', $$今後ともよろしくお願いいたします。$$, $$こんごともよろしくおねがいいたします。$$, $$Conto com o seu apoio daqui em diante.$$),
    ('n4-grammar-24', $$明日、こちらからお電話いたします。$$, $$あした、こちらからおでんわいたします。$$, $$Amanhã, nós ligamos para o senhor.$$),
    ('n4-grammar-24', $$会議は十時から開始いたします。$$, $$かいぎはじゅうじからかいしいたします。$$, $$A reunião começará às dez.$$),
    ('n4-grammar-24', $$先ほどは大変失礼いたしました。$$, $$さきほどはたいへんしつれいいたしました。$$, $$Peço desculpas pelo que aconteceu há pouco.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$後ほどご連絡____。$$, $$Entraremos em contato mais tarde.$$),
        (2, $$お荷物は私がお持ち____。$$, $$Eu carrego a sua bagagem.$$),
        (3, $$どうぞよろしくお願い____。$$, $$Muito prazer, conto com o senhor.$$),
        (4, $$昨日は大変失礼____。$$, $$Peço desculpas por ontem.$$),
        (5, $$それでは、会議を始めることに____。$$, $$Então, daremos início à reunião.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-24', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いたします$$),
        (2, $$いたします$$),
        (3, $$いたします$$),
        (4, $$いたしました$$),
        (5, $$いたします$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-191 — 〜手前
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-191',
    'grammar',
    'N1',
    $$〜手前$$,
    $$temae$$,
    $$Por consideração a / Diante de / Já que$$,
    $$手前 indica que, por causa de algo que a pessoa disse, fez ou por causa da presença de alguém, ela sente que precisa agir de certa forma para manter a reputação. Equivale a "já que" ou "por consideração a".

A pessoa age assim para não passar vergonha ou não perder a credibilidade. Por exemplo, "já que eu disse que faria, não posso desistir agora".

Também é usado com pessoas, como "diante dos filhos, não posso chorar".$$,
    $$A segunda parte costuma ter expressões como わけにはいかない, しかない ou なければならない.

Não se confunde com 手前 com sentido de "na frente de" ou "antes de", como 駅の手前.$$,
    $$Verbo (forma simples) + 手前
Substantivo + の + 手前$$,
    $$手前$$,
    $$手前|てまえ$$,
    ARRAY['手前']::text[],
    ARRAY['手前', 'の手前']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-191', $$やると言った手前、今さらやめられない。$$, $$やるといったてまえ、いまさらやめられない。$$, $$Já que eu disse que faria, não posso desistir agora.$$),
    ('n1-grammar-191', $$子供の手前、泣くわけにはいかなかった。$$, $$こどものてまえ、なくわけにはいかなかった。$$, $$Diante dos filhos, eu não podia chorar.$$),
    ('n1-grammar-191', $$約束した手前、行かないわけにはいかない。$$, $$やくそくしたてまえ、いかないわけにはいかない。$$, $$Já que prometi, não posso deixar de ir.$$),
    ('n1-grammar-191', $$部下の手前、ミスを認めにくかった。$$, $$ぶかのてまえ、ミスをみとめにくかった。$$, $$Diante dos subordinados, foi difícil admitir o erro.$$),
    ('n1-grammar-191', $$みんなに自慢した手前、失敗はできない。$$, $$みんなにじまんしたてまえ、しっぱいはできない。$$, $$Já que me gabei para todos, não posso falhar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大丈夫だと言った____、助けを求められない。$$, $$Já que eu disse que estava tudo bem, não posso pedir ajuda.$$),
        (2, $$客の____、店員同士でけんかはできない。$$, $$Diante dos clientes, os atendentes não podem brigar entre si.$$),
        (3, $$先生に推薦してもらった____、頑張らなければならない。$$, $$Já que o professor me recomendou, preciso me esforçar.$$),
        (4, $$家族の____、弱音を吐くわけにはいかない。$$, $$Diante da família, não posso me queixar.$$),
        (5, $$引き受けた____、最後までやるしかない。$$, $$Já que aceitei, só me resta fazer até o fim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-191', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$手前$$),
        (2, $$手前$$),
        (3, $$手前$$),
        (4, $$手前$$),
        (5, $$手前$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

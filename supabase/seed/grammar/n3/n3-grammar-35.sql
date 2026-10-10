-- n3-grammar-35 — 〜か何か
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-35',
    'grammar',
    'N3',
    $$〜か何か$$,
    $$ka nanika$$,
    $$Ou algo assim / Ou alguma coisa do tipo$$,
    $$か何か é usado depois de um substantivo para dar um exemplo, deixando claro que pode ser aquilo ou algo parecido. Equivale a "ou algo assim" ou "ou alguma coisa do tipo".

Ele é útil quando a pessoa não quer ou não consegue ser exata. Por exemplo, ao oferecer "um café ou algo assim", ao supor que alguém faltou "por causa de um resfriado ou algo do tipo", ou ao pedir "uma caneta ou alguma coisa para escrever".

As partículas como を, が e で vêm depois de か何か.

É uma forma natural e informal de deixar a frase mais vaga e flexível.$$,
    $$Para pessoas, usa-se か誰か ("ou alguém"), e para lugares, かどこか ("ou algum lugar").

か何か deixa a frase mais suave, especialmente em ofertas e pedidos.

Em suposições, か何かで aparece muito para explicar ausências: 病気か何かで休んでいる.$$,
    $$Substantivo + か何か + partícula + Verbo
Substantivo + か何か + で (motivo vago)
Substantivo + か何か + Substantivo descritivo (書くもの / 飲むもの)$$,
    $$か何か$$,
    $$か何か|かなにか$$,
    ARRAY['か', '何', 'か']::text[],
    ARRAY['か何か', 'かなにか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-35', $$コーヒーか何か飲みませんか。$$, $$コーヒーかなにかのみませんか。$$, $$Quer beber um café ou algo assim?$$),
    ('n3-grammar-35', $$風邪か何かで、彼は休んでいる。$$, $$かぜかなにかで、かれはやすんでいる。$$, $$Ele faltou por causa de um resfriado ou algo do tipo.$$),
    ('n3-grammar-35', $$誕生日に本か何かをあげたい。$$, $$たんじょうびにほんかなにかをあげたい。$$, $$Quero dar um livro ou alguma coisa assim de aniversário.$$),
    ('n3-grammar-35', $$ペンか何か、書くものを貸してください。$$, $$ペンかなにか、かくものをかしてください。$$, $$Me empresta uma caneta ou alguma coisa para escrever, por favor.$$),
    ('n3-grammar-35', $$駅前で事故か何かがあったようだ。$$, $$えきまえでじこかなにかがあったようだ。$$, $$Parece que houve um acidente ou algo assim em frente à estação.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雑誌____、読むものはありますか。$$, $$Tem uma revista ou alguma coisa para ler?$$),
        (2, $$疲れたから、お茶____飲みましょうか。$$, $$Estou cansado, vamos tomar um chá ou algo assim?$$),
        (3, $$田中さんは病気____で、学校を休んだらしい。$$, $$Parece que o Tanaka faltou à escola por causa de alguma doença ou algo do tipo.$$),
        (4, $$ハンカチ____、拭くものを持っていますか。$$, $$Você tem um lenço ou alguma coisa para enxugar?$$),
        (5, $$駅前で祭り____をやっている。$$, $$Está acontecendo um festival ou algo assim em frente à estação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-35', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$か何か$$),
        (1, $$かなにか$$),
        (2, $$か何か$$),
        (2, $$かなにか$$),
        (3, $$か何か$$),
        (3, $$かなにか$$),
        (4, $$か何か$$),
        (4, $$かなにか$$),
        (5, $$か何か$$),
        (5, $$かなにか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

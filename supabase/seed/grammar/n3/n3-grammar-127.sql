-- n3-grammar-127 — 〜てからでないと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-127',
    'grammar',
    'N3',
    $$〜てからでないと$$,
    $$te kara de nai to$$,
    $$Só depois de / Enquanto não / Sem antes$$,
    $$てからでないと é usado para dizer que uma ação só pode acontecer depois de outra. Se a primeira não acontecer antes, a segunda é impossível ou não deve acontecer. Equivale a "só depois de", "enquanto não..." ou "sem antes...".

A estrutura junta てから (depois de) com でないと (se não for). A ideia literal é "se não for depois de fazer isso, não dá".

A segunda parte é quase sempre negativa: não poder, não dever ou não conseguir. Por exemplo, "só depois de lavar as mãos pode comer" ou "enquanto não falar com meus pais, não posso responder".

A forma てからでなければ tem o mesmo sentido e é um pouco mais formal.$$,
    $$A segunda parte normalmente tem verbos potenciais negativos (できない, 行けない) ou てはいけない.

É muito usada para explicar regras e condições, como em lojas e escolas.

Comparado a てから (depois de), てからでないと destaca a condição obrigatória.$$,
    $$Verbo na forma て + からでないと、 + Frase negativa
Verbo na forma て + からでなければ、 + Frase negativa (mais formal)

Fala casual: てからじゃないと$$,
    $$てからでないと$$,
    $$てからでないと|てからでなければ|でからでないと|でからでなければ|てからじゃないと$$,
    ARRAY['て', 'から', 'でないと']::text[],
    ARRAY['てからでないと', 'てからでなければ', 'てからじゃないと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-127', $$手を洗ってからでないと、ご飯を食べてはいけません。$$, $$てをあらってからでないと、ごはんをたべてはいけません。$$, $$Só depois de lavar as mãos é que pode comer.$$),
    ('n3-grammar-127', $$実際に見てからでないと、買うかどうか決められない。$$, $$じっさいにみてからでないと、かうかどうかきめられない。$$, $$Enquanto não vir pessoalmente, não consigo decidir se compro ou não.$$),
    ('n3-grammar-127', $$宿題をしてからでないと、遊びに行けない。$$, $$しゅくだいをしてからでないと、あそびにいけない。$$, $$Sem antes fazer a lição, não posso ir brincar.$$),
    ('n3-grammar-127', $$両親に相談してからでないと、返事できません。$$, $$りょうしんにそうだんしてからでないと、へんじできません。$$, $$Enquanto não conversar com meus pais, não posso responder.$$),
    ('n3-grammar-127', $$二十歳になってからでなければ、お酒は飲めない。$$, $$はたちになってからでなければ、おさけはのめない。$$, $$Só depois de completar vinte anos é que se pode beber.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このレストランは予約し____、入れません。$$, $$Neste restaurante, só dá para entrar com reserva.$$),
        (2, $$詳しい説明を聞い____、わかりません。$$, $$Sem antes ouvir uma explicação detalhada, não dá para entender.$$),
        (3, $$部長に聞い____、決められない。$$, $$Enquanto não perguntar ao gerente, não posso decidir.$$),
        (4, $$試験が終わっ____、遊べない。$$, $$Só depois de a prova acabar é que vou poder me divertir.$$),
        (5, $$食後の薬を飲ん____、寝てはいけない。$$, $$Sem antes tomar o remédio de depois da refeição, não pode dormir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-127', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てからでないと$$),
        (2, $$てからでないと$$),
        (3, $$てからでないと$$),
        (4, $$てからでないと$$),
        (5, $$でからでないと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

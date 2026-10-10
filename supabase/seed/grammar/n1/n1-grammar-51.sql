-- n1-grammar-51 — 〜かたがた
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-51',
    'grammar',
    'N1',
    $$〜かたがた$$,
    $$katagata$$,
    $$Aproveitando para / Ao mesmo tempo / Também para$$,
    $$かたがた indica que, ao fazer uma ação, a pessoa aproveita para cumprir também outro objetivo. Equivale a "aproveitando para" ou "também para".

É uma expressão muito formal, usada principalmente em cartas, e-mails de trabalho e cumprimentos. Por exemplo, "venho visitá-lo para agradecer e também para me apresentar".

A segunda parte costuma ser um verbo de visita ou de comunicação.$$,
    $$Expressões comuns são お礼かたがた, ご挨拶かたがた e お見舞いかたがた.

É parecido com がてら, mas かたがた é muito mais formal e usado em situações de cortesia.$$,
    $$Substantivo (ação) + かたがた + Verbo de visita / comunicação$$,
    $$かたがた$$,
    $$かたがた$$,
    ARRAY['かたがた']::text[],
    ARRAY['かたがた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-51', $$お礼かたがた、ご挨拶に伺いました。$$, $$おれいかたがた、ごあいさつにうかがいました。$$, $$Vim cumprimentá-lo e, ao mesmo tempo, agradecer.$$),
    ('n1-grammar-51', $$ご報告かたがた、お手紙を差し上げます。$$, $$ごほうこくかたがた、おてがみをさしあげます。$$, $$Envio esta carta também para lhe dar notícias.$$),
    ('n1-grammar-51', $$お見舞いかたがた、先生のお宅を訪ねた。$$, $$おみまいかたがた、せんせいのおたくをたずねた。$$, $$Visitei a casa do professor, aproveitando para ver como ele estava.$$),
    ('n1-grammar-51', $$近くまで来たので、ご挨拶かたがた寄らせていただきました。$$, $$ちかくまできたので、ごあいさつかたがたよらせていただきました。$$, $$Como vim até aqui perto, passei para cumprimentá-lo.$$),
    ('n1-grammar-51', $$お詫びかたがた、ご説明に参りました。$$, $$おわびかたがた、ごせつめいにまいりました。$$, $$Vim pedir desculpas e também dar explicações.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$就職のご報告____、恩師を訪ねた。$$, $$Visitei meu antigo professor, aproveitando para contar sobre o novo emprego.$$),
        (2, $$お礼____、お電話いたしました。$$, $$Liguei também para agradecer.$$),
        (3, $$ご挨拶____、新しい名刺をお渡しします。$$, $$Aproveitando para cumprimentá-lo, entrego meu novo cartão de visita.$$),
        (4, $$出張の報告____、本社に伺った。$$, $$Fui à matriz, aproveitando para relatar a viagem de negócios.$$),
        (5, $$お祝い____、お伺いしてもよろしいでしょうか。$$, $$Posso visitá-lo também para dar os parabéns?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-51', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かたがた$$),
        (2, $$かたがた$$),
        (3, $$かたがた$$),
        (4, $$かたがた$$),
        (5, $$かたがた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

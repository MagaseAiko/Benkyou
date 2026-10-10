-- n2-grammar-06 — 〜ばかりに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-06',
    'grammar',
    'N2',
    $$〜ばかりに$$,
    $$bakari ni$$,
    $$Só por causa de / Simplesmente porque / Por um simples$$,
    $$ばかりに é usado para dizer que um único motivo, muitas vezes pequeno, causou um resultado ruim. Equivale a "só por causa de", "simplesmente porque" ou "por um simples...".

O tom é de arrependimento ou lamento: se não fosse aquele motivo, tudo teria dado certo. Por exemplo, "só porque dormi demais, me atrasei para a prova" ou "por ter dito uma palavra a mais, acabei deixando ela brava".

A segunda parte é sempre negativa ou indesejada.

Ele vem depois da forma simples de verbos e adjetivos, de adjetivos な com な e de substantivos com である.$$,
    $$Com たい, a forma たいばかりに significa "só por querer muito...", mostrando que a pessoa fez algo extremo por um desejo forte: 会いたいばかりに.

A diferença em relação a せいで é que ばかりに destaca que o motivo foi pequeno ou único, o que torna o resultado ainda mais lamentável.

A segunda parte não pode ser uma vontade ou um pedido.$$,
    $$Verbo / Adjetivo い (forma simples) + ばかりに、 + Resultado negativo
Adjetivo な + な + ばかりに
Substantivo + である + ばかりに$$,
    $$ばかりに$$,
    $$ばかりに$$,
    ARRAY['ばかり', 'に']::text[],
    ARRAY['ばかりに', 'たいばかりに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-06', $$寝坊したばかりに、試験に遅れた。$$, $$ねぼうしたばかりに、しけんにおくれた。$$, $$Só porque dormi demais, me atrasei para a prova.$$),
    ('n2-grammar-06', $$一言言ったばかりに、彼女を怒らせてしまった。$$, $$ひとこといったばかりに、かのじょをおこらせてしまった。$$, $$Por uma simples palavra, acabei deixando ela brava.$$),
    ('n2-grammar-06', $$お金がないばかりに、大学に行けなかった。$$, $$おかねがないばかりに、だいがくにいけなかった。$$, $$Só por falta de dinheiro, não pude ir para a faculdade.$$),
    ('n2-grammar-06', $$確認しなかったばかりに、大きな失敗をした。$$, $$かくにんしなかったばかりに、おおきなしっぱいをした。$$, $$Só por não ter conferido, cometi um grande erro.$$),
    ('n2-grammar-06', $$背が低いばかりに、モデルになれなかった。$$, $$せがひくいばかりに、モデルになれなかった。$$, $$Só por ser baixa, não consegui ser modelo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$傘を忘れた____、びしょ濡れになった。$$, $$Só por ter esquecido o guarda-chuva, fiquei encharcado.$$),
        (2, $$一度うそをついた____、信用をなくした。$$, $$Só por ter mentido uma vez, perdi a confiança.$$),
        (3, $$英語ができない____、チャンスを逃した。$$, $$Só por não saber inglês, perdi a oportunidade.$$),
        (4, $$ほんの少し遅れた____、電車に乗れなかった。$$, $$Só por ter me atrasado um pouquinho, não consegui pegar o trem.$$),
        (5, $$余計なことを言った____、けんかになった。$$, $$Só por ter falado o que não devia, virou briga.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-06', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかりに$$),
        (2, $$ばかりに$$),
        (3, $$ばかりに$$),
        (4, $$ばかりに$$),
        (5, $$ばかりに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

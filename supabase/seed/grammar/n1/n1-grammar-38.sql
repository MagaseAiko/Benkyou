-- n1-grammar-38 — 〜いかんを問わず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-38',
    'grammar',
    'N1',
    $$〜いかんを問わず$$,
    $$ikan wo towazu$$,
    $$Independentemente de / Seja qual for / Sem levar em conta$$,
    $$いかんを問わず indica que algo vale para todos os casos, sem depender de uma condição. Equivale a "independentemente de" ou "seja qual for".

É uma expressão muito formal, usada principalmente em regras, contratos e avisos oficiais. Por exemplo, "independentemente do motivo, não é possível devolver o valor".

As formas いかんによらず e いかんにかかわらず têm o mesmo sentido.$$,
    $$É uma forma ainda mais formal de に関わらず e を問わず.

Expressões comuns são 理由のいかんを問わず e 結果のいかんにかかわらず.$$,
    $$Substantivo + の + いかんを問わず
Substantivo + の + いかんによらず
Substantivo + の + いかんにかかわらず$$,
    $$いかんを問わず$$,
    $$いかんを問わず|いかんをとわず|いかんによらず|いかんにかかわらず|いかんに関わらず$$,
    ARRAY['いかん', 'を', '問わず']::text[],
    ARRAY['いかんを問わず', 'いかんによらず', 'いかんにかかわらず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-38', $$理由のいかんを問わず、返金はいたしません。$$, $$りゆうのいかんをとわず、へんきんはいたしません。$$, $$Independentemente do motivo, não faremos reembolso.$$),
    ('n1-grammar-38', $$結果のいかんにかかわらず、報告してください。$$, $$けっかのいかんにかかわらず、ほうこくしてください。$$, $$Seja qual for o resultado, faça o relatório.$$),
    ('n1-grammar-38', $$国籍のいかんによらず、応募できます。$$, $$こくせきのいかんによらず、おうぼできます。$$, $$É possível se candidatar independentemente da nacionalidade.$$),
    ('n1-grammar-38', $$事情のいかんを問わず、遅刻は認めません。$$, $$じじょうのいかんをとわず、ちこくはみとめません。$$, $$Seja qual for a circunstância, atrasos não serão aceitos.$$),
    ('n1-grammar-38', $$年齢のいかんを問わず、誰でも参加できる。$$, $$ねんれいのいかんをとわず、だれでもさんかできる。$$, $$Qualquer pessoa pode participar, independentemente da idade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$理由の____、無断欠席は許されない。$$, $$Seja qual for o motivo, faltar sem avisar não é permitido.$$),
        (2, $$性別の____、採用します。$$, $$Contratamos sem levar em conta o sexo.$$),
        (3, $$天候の____、イベントは予定通り行います。$$, $$Independentemente do tempo, o evento será realizado conforme previsto.$$),
        (4, $$経験の____、やる気のある方を歓迎します。$$, $$Independentemente da experiência, damos as boas-vindas a quem tem vontade.$$),
        (5, $$結果の____、全力を尽くすことが大切だ。$$, $$Seja qual for o resultado, o importante é dar o seu melhor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-38', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いかんを問わず$$),
        (1, $$いかんをとわず$$),
        (1, $$いかんによらず$$),
        (1, $$いかんにかかわらず$$),
        (2, $$いかんを問わず$$),
        (2, $$いかんをとわず$$),
        (2, $$いかんによらず$$),
        (2, $$いかんにかかわらず$$),
        (3, $$いかんを問わず$$),
        (3, $$いかんをとわず$$),
        (3, $$いかんによらず$$),
        (3, $$いかんにかかわらず$$),
        (4, $$いかんを問わず$$),
        (4, $$いかんをとわず$$),
        (4, $$いかんによらず$$),
        (4, $$いかんにかかわらず$$),
        (5, $$いかんを問わず$$),
        (5, $$いかんをとわず$$),
        (5, $$いかんによらず$$),
        (5, $$いかんにかかわらず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

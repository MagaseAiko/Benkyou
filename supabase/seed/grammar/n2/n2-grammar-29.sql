-- n2-grammar-29 — 一応
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-29',
    'grammar',
    'N2',
    $$一応$$,
    $$ichiou$$,
    $$Por via das dúvidas / Mais ou menos / Pelo menos / Por enquanto$$,
    $$一応 é um advérbio muito comum na conversa, com alguns usos ligados à ideia de "não é perfeito, mas serve".

• Por via das dúvidas: fazer algo como precaução, mesmo sem ter certeza de que é necessário. Por exemplo, "vou levar o guarda-chuva, por via das dúvidas".
• Mais ou menos / de certa forma: algo está feito ou é verdade, mas não totalmente. Por exemplo, "terminei a lição, mais ou menos, mas não tenho confiança".
• Pelo menos formalmente: algo é assim no nome, mas não na prática. Por exemplo, "ele é professor, pelo menos no papel".

Também é usado para dar modéstia às respostas: "sei cozinhar, mais ou menos".$$,
    $$念のため também significa "por via das dúvidas" e é mais formal. 一応 é mais casual.

Usar 一応 em respostas pode deixar a frase mais humilde, mostrando que você não quer parecer convencido.

Em e-mails de trabalho, 一応ご確認ください significa "por favor, confira, por via das dúvidas".$$,
    $$一応 + Verbo (por via das dúvidas)
一応 + Verbo passado (mais ou menos feito)
一応 + Substantivo + だ (pelo menos no papel)

Escrita: 一応 / いちおう$$,
    $$一応$$,
    $$一応|いちおう$$,
    ARRAY['一応']::text[],
    ARRAY['一応', 'いちおう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-29', $$雨は降らないと思うけど、一応、傘を持っていこう。$$, $$あめはふらないとおもうけど、いちおう、かさをもっていこう。$$, $$Acho que não vai chover, mas vou levar o guarda-chuva por via das dúvidas.$$),
    ('n2-grammar-29', $$宿題は一応終わったけど、自信がない。$$, $$しゅくだいはいちおうおわったけど、じしんがない。$$, $$Terminei a lição, mais ou menos, mas não tenho confiança.$$),
    ('n2-grammar-29', $$一応、彼にも連絡しておきます。$$, $$いちおう、かれにもれんらくしておきます。$$, $$Por via das dúvidas, vou avisá-lo também.$$),
    ('n2-grammar-29', $$料理は一応できますが、上手ではありません。$$, $$りょうりはいちおうできますが、じょうずではありません。$$, $$Sei cozinhar mais ou menos, mas não muito bem.$$),
    ('n2-grammar-29', $$念のため、一応確認してください。$$, $$ねんのため、いちおうかくにんしてください。$$, $$Por via das dúvidas, confira, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨が降るかもしれないので、____傘を持っていく。$$, $$Pode ser que chova, então vou levar guarda-chuva por via das dúvidas.$$),
        (2, $$レポートは____書き終わった。$$, $$Terminei de escrever o relatório, mais ou menos.$$),
        (3, $$彼は____先生だが、あまり教えていない。$$, $$Ele é professor, pelo menos no papel, mas quase não dá aulas.$$),
        (4, $$大丈夫だと思うけど、____病院に行っておこう。$$, $$Acho que está tudo bem, mas vou ao hospital por via das dúvidas.$$),
        (5, $$英語は____話せますが、上手ではないです。$$, $$Falo inglês mais ou menos, mas não bem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-29', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一応$$),
        (1, $$いちおう$$),
        (2, $$一応$$),
        (2, $$いちおう$$),
        (3, $$一応$$),
        (3, $$いちおう$$),
        (4, $$一応$$),
        (4, $$いちおう$$),
        (5, $$一応$$),
        (5, $$いちおう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-81 — 〜ものを
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-81',
    'grammar',
    'N1',
    $$〜ものを$$,
    $$mono wo$$,
    $$Se tivesse... teria / Mas / E no entanto$$,
    $$ものを expressa lamento, reclamação ou frustração porque algo não aconteceu como deveria. Equivale a "se tivesse..., teria" ou "e no entanto...".

Muitas vezes a pessoa diz que, se outra coisa tivesse sido feita, o resultado seria melhor. Por exemplo, "se tivesse me contado, eu teria ajudado".

É parecido com のに, mas soa mais formal e literário.$$,
    $$Muitas vezes vem com ば ou たら, falando de algo que não aconteceu.

Também pode ficar no fim da frase, como uma reclamação.$$,
    $$Verbo / Adjetivo (forma simples) + ものを
Verbo (forma ば) + 〜ものを$$,
    $$ものを$$,
    $$ものを$$,
    ARRAY['もの', 'を']::text[],
    ARRAY['ものを']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-81', $$言ってくれれば手伝ったものを。$$, $$いってくれればてつだったものを。$$, $$Se tivesse me dito, eu teria ajudado.$$),
    ('n1-grammar-81', $$早く病院に行けば治ったものを、彼は我慢してしまった。$$, $$はやくびょういんにいけばなおったものを、かれはがまんしてしまった。$$, $$Se tivesse ido logo ao hospital, teria sarado, mas ele aguentou calado.$$),
    ('n1-grammar-81', $$素直に謝ればいいものを、彼は言い訳ばかりする。$$, $$すなおにあやまればいいものを、かれはいいわけばかりする。$$, $$Bastava pedir desculpas com sinceridade, mas ele só dá desculpas.$$),
    ('n1-grammar-81', $$黙っていればわからなかったものを。$$, $$だまっていればわからなかったものを。$$, $$Se tivesse ficado calado, ninguém teria descoberto.$$),
    ('n1-grammar-81', $$一言相談してくれれば、いい方法を教えたものを。$$, $$ひとことそうだんしてくれれば、いいほうほうをおしえたものを。$$, $$Se tivesse me consultado, eu teria ensinado um bom jeito.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$もう少し早く出れば間に合った____。$$, $$Se tivesse saído um pouco mais cedo, teria dado tempo.$$),
        (2, $$知っていれば教えてあげた____。$$, $$Se eu soubesse, teria te contado.$$),
        (3, $$断ればいい____、彼女は引き受けてしまった。$$, $$Bastava recusar, mas ela acabou aceitando.$$),
        (4, $$勉強していれば合格できた____。$$, $$Se tivesse estudado, teria passado.$$),
        (5, $$連絡してくれれば迎えに行った____。$$, $$Se tivesse me avisado, eu teria ido te buscar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-81', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものを$$),
        (2, $$ものを$$),
        (3, $$ものを$$),
        (4, $$ものを$$),
        (5, $$ものを$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

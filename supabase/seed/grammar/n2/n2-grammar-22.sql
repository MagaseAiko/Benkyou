-- n2-grammar-22 — 再び
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-22',
    'grammar',
    'N2',
    $$再び$$,
    $$futatabi$$,
    $$Novamente / De novo / Outra vez$$,
    $$再び é um advérbio que significa "novamente", "de novo" ou "outra vez". Ele indica que algo acontece uma segunda vez, depois de ter acontecido antes ou de ter parado.

O sentido é o mesmo de また e もう一度, mas 再び soa mais formal e escrito. Por isso, é comum em notícias, textos, discursos e narrativas.

Por exemplo, "ele visitou o Japão novamente" ou "a chuva voltou a cair".

Também aparece em frases sobre não repetir erros: "tomar cuidado para não cometer o mesmo erro outra vez".$$,
    $$Na conversa casual, また é mais natural. 再び soa solene ou jornalístico.

Palavras relacionadas são 再会 (reencontro) e 再開 (retomada), que usam o mesmo kanji 再.

Em notícias sobre desastres ou crises, 再び aparece para indicar que algo voltou a acontecer.$$,
    $$再び + Verbo

Escrita: 再び / ふたたび$$,
    $$再び$$,
    $$再び|ふたたび$$,
    ARRAY['再び']::text[],
    ARRAY['再び', 'ふたたび']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-22', $$彼は五年後、再び日本を訪れた。$$, $$かれはごねんご、ふたたびにほんをおとずれた。$$, $$Cinco anos depois, ele visitou o Japão novamente.$$),
    ('n2-grammar-22', $$一度やんだ雨が再び降り出した。$$, $$いちどやんだあめがふたたびふりだした。$$, $$A chuva, que tinha parado, voltou a cair.$$),
    ('n2-grammar-22', $$二人は十年後に再び会った。$$, $$ふたりはじゅうねんごにふたたびあった。$$, $$Os dois se reencontraram dez anos depois.$$),
    ('n2-grammar-22', $$再び同じ失敗をしないように注意する。$$, $$ふたたびおなじしっぱいをしないようにちゅういする。$$, $$Vou tomar cuidado para não cometer o mesmo erro outra vez.$$),
    ('n2-grammar-22', $$休憩の後、会議が再び始まった。$$, $$きゅうけいのあと、かいぎがふたたびはじまった。$$, $$Depois do intervalo, a reunião recomeçou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$治療の後、彼は____歩けるようになった。$$, $$Depois do tratamento, ele voltou a conseguir andar.$$),
        (2, $$一度やんだ雪が____降り始めた。$$, $$A neve, que tinha parado, começou a cair de novo.$$),
        (3, $$____この町に来られてうれしい。$$, $$Estou feliz por poder vir a esta cidade novamente.$$),
        (4, $$一度は落ちたが、彼は____試験に挑戦した。$$, $$Ele foi reprovado uma vez, mas tentou a prova outra vez.$$),
        (5, $$同じ事故が____起きないようにしたい。$$, $$Quero evitar que o mesmo acidente aconteça de novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-22', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$再び$$),
        (1, $$ふたたび$$),
        (2, $$再び$$),
        (2, $$ふたたび$$),
        (3, $$再び$$),
        (3, $$ふたたび$$),
        (4, $$再び$$),
        (4, $$ふたたび$$),
        (5, $$再び$$),
        (5, $$ふたたび$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

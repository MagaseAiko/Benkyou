-- n1-grammar-32 — 〜ぐるみ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-32',
    'grammar',
    'N1',
    $$〜ぐるみ$$,
    $$gurumi$$,
    $$Inteiro / Todo o / Junto com$$,
    $$ぐるみ indica que algo envolve um grupo inteiro, incluindo todos os seus membros. Equivale a "inteiro" ou "todo o".

Por exemplo, 家族ぐるみ significa "envolvendo toda a família", e 町ぐるみ significa "a cidade inteira".

Também pode significar "junto com", como em 身ぐるみ, "tudo o que se tem no corpo".$$,
    $$Expressões comuns são 家族ぐるみの付き合い, 町ぐるみ, 会社ぐるみ e 身ぐるみはがされる.

会社ぐるみ costuma aparecer em notícias sobre fraudes que envolvem a empresa inteira.$$,
    $$Substantivo (grupo) + ぐるみ + で / の$$,
    $$ぐるみ$$,
    $$ぐるみ$$,
    ARRAY['ぐるみ']::text[],
    ARRAY['ぐるみ', 'ぐるみで', 'ぐるみの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-32', $$彼とは家族ぐるみの付き合いをしている。$$, $$かれとはかぞくぐるみのつきあいをしている。$$, $$Nossa amizade com ele envolve a família inteira.$$),
    ('n1-grammar-32', $$町ぐるみで祭りの準備をした。$$, $$まちぐるみでまつりのじゅんびをした。$$, $$A cidade inteira preparou o festival.$$),
    ('n1-grammar-32', $$会社ぐるみの不正が発覚した。$$, $$かいしゃぐるみのふせいがはっかくした。$$, $$Foi descoberta uma fraude envolvendo a empresa inteira.$$),
    ('n1-grammar-32', $$旅行先で身ぐるみはがされた。$$, $$りょこうさきでみぐるみはがされた。$$, $$No destino da viagem, me roubaram tudo o que eu tinha.$$),
    ('n1-grammar-32', $$地域ぐるみで子供たちを見守っている。$$, $$ちいきぐるみでこどもたちをみまもっている。$$, $$A comunidade inteira cuida das crianças.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家族____でキャンプに行った。$$, $$Fomos acampar com a família inteira.$$),
        (2, $$村____の反対運動が起こった。$$, $$Surgiu um movimento de oposição envolvendo a vila inteira.$$),
        (3, $$学校____で、ボランティア活動をしている。$$, $$A escola inteira faz trabalho voluntário.$$),
        (4, $$組織____の犯罪だった。$$, $$Foi um crime envolvendo a organização inteira.$$),
        (5, $$彼らは家族____で仲がいい。$$, $$Eles se dão bem com as famílias inteiras.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-32', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ぐるみ$$),
        (2, $$ぐるみ$$),
        (3, $$ぐるみ$$),
        (4, $$ぐるみ$$),
        (5, $$ぐるみ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

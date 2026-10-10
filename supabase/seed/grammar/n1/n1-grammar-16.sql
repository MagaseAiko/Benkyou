-- n1-grammar-16 — 〜だの〜だの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-16',
    'grammar',
    'N1',
    $$〜だの〜だの$$,
    $$dano ~ dano$$,
    $$Que isso... que aquilo / Entre... e / Isso e aquilo$$,
    $$だの〜だの serve para listar exemplos, geralmente de coisas que alguém diz ou reclama. Equivale a "que isso..., que aquilo..." ou "isso e aquilo".

O tom costuma ser negativo, de reclamação ou irritação, mostrando que havia muitas coisas incômodas. Por exemplo, "ele fica dizendo que está cansado, que está com fome, e não trabalha".

É uma expressão coloquial.$$,
    $$É parecido com とか〜とか e やら〜やら, mas だの〜だの tem um tom mais negativo.

Muitas vezes vem com verbos como 言う, 文句を言う ou うるさい.$$,
    $$Substantivo + だの + Substantivo + だの
Verbo / Adjetivo (forma simples) + だの + Verbo / Adjetivo + だの$$,
    $$だの〜だの$$,
    $$だの$$,
    ARRAY['だの']::text[],
    ARRAY['だの〜だの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-16', $$彼は疲れただの、お腹がすいただの言って、全然働かない。$$, $$かれはつかれただの、おなかがすいただのいって、ぜんぜんはたらかない。$$, $$Ele fica dizendo que está cansado, que está com fome, e não trabalha nada.$$),
    ('n1-grammar-16', $$母は勉強しろだの、早く寝ろだの、うるさい。$$, $$はははべんきょうしろだの、はやくねろだの、うるさい。$$, $$Minha mãe fica enchendo: estude, vá dormir cedo.$$),
    ('n1-grammar-16', $$部屋には本だの服だのが散らかっている。$$, $$へやにはほんだのふくだのがちらかっている。$$, $$O quarto está bagunçado com livros e roupas.$$),
    ('n1-grammar-16', $$高いだの遠いだのと文句ばかり言う。$$, $$たかいだのとおいだのともんくばかりいう。$$, $$Só reclama que é caro, que é longe.$$),
    ('n1-grammar-16', $$引っ越しだの仕事だので、毎日忙しい。$$, $$ひっこしだのしごとだので、まいにちいそがしい。$$, $$Entre mudança e trabalho, estou ocupado todos os dias.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供は、おもちゃを買ってだの、ゲームがほしい____と言う。$$, $$A criança fica pedindo: compra brinquedo, quero videogame.$$),
        (2, $$暑いだの寒い____と、彼はいつも文句を言っている。$$, $$Ele vive reclamando que está quente, que está frio.$$),
        (3, $$机の上にはペン____ノートだのが置いてある。$$, $$Na mesa há canetas, cadernos e coisas assim.$$),
        (4, $$つまらないだの、長い____、みんな映画の悪口を言った。$$, $$Todos falaram mal do filme: que era chato, que era longo.$$),
        (5, $$会議だの出張____で、休む暇がない。$$, $$Entre reuniões e viagens de negócios, não tenho tempo para descansar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-16', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だの$$),
        (2, $$だの$$),
        (3, $$だの$$),
        (4, $$だの$$),
        (5, $$だの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-153 — 〜をものともせずに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-153',
    'grammar',
    'N1',
    $$〜をものともせずに$$,
    $$wo mono tomo sezu ni$$,
    $$Sem se deixar abater por / Desafiando / Apesar de$$,
    $$をものともせずに indica que alguém enfrenta uma dificuldade sem se deixar abater por ela. Equivale a "sem se deixar abater por" ou "desafiando".

O tom é de admiração pela coragem ou força da pessoa. Por exemplo, "sem se deixar abater pela lesão, ele terminou a corrida".

É uma expressão formal, comum em notícias e relatos.$$,
    $$Não se usa para falar de si mesmo, apenas de outras pessoas.

É parecido com にもかかわらず e を顧みず, mas をものともせずに destaca a força e a coragem.$$,
    $$Substantivo + をものともせずに / をものともせず$$,
    $$をものともせずに$$,
    $$をものともせずに|をものともせず$$,
    ARRAY['を', 'もの', 'とも', 'せず', 'に']::text[],
    ARRAY['をものともせずに', 'をものともせず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-153', $$彼はけがをものともせずに、最後まで走った。$$, $$かれはけがをものともせずに、さいごまではしった。$$, $$Sem se deixar abater pela lesão, ele correu até o fim.$$),
    ('n1-grammar-153', $$選手たちは雨をものともせず、試合を続けた。$$, $$せんしゅたちはあめをものともせず、しあいをつづけた。$$, $$Desafiando a chuva, os atletas continuaram a partida.$$),
    ('n1-grammar-153', $$彼女は周囲の反対をものともせずに、夢を追い続けた。$$, $$かのじょはしゅういのはんたいをものともせずに、ゆめをおいつづけた。$$, $$Sem se deixar abater pela oposição de todos, ela continuou perseguindo o sonho.$$),
    ('n1-grammar-153', $$登山隊は吹雪をものともせず、頂上を目指した。$$, $$とざんたいはふぶきをものともせず、ちょうじょうをめざした。$$, $$A expedição seguiu rumo ao topo, desafiando a nevasca.$$),
    ('n1-grammar-153', $$彼は貧しさをものともせずに、大学を卒業した。$$, $$かれはまずしさをものともせずに、だいがくをそつぎょうした。$$, $$Apesar da pobreza, ele se formou na universidade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$救助隊は危険____、現場に向かった。$$, $$A equipe de resgate foi ao local desafiando o perigo.$$),
        (2, $$彼女は病気____、仕事を続けている。$$, $$Sem se deixar abater pela doença, ela continua trabalhando.$$),
        (3, $$チームは強い相手____、勝利をつかんだ。$$, $$O time conquistou a vitória, sem se intimidar com o adversário forte.$$),
        (4, $$彼は年齢____、マラソンに挑戦した。$$, $$Desafiando a idade, ele tentou correr uma maratona.$$),
        (5, $$子供たちは寒さ____、外で元気に遊んでいる。$$, $$As crianças brincam animadas lá fora, sem se importar com o frio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-153', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をものともせずに$$),
        (1, $$をものともせず$$),
        (2, $$をものともせずに$$),
        (2, $$をものともせず$$),
        (3, $$をものともせずに$$),
        (3, $$をものともせず$$),
        (4, $$をものともせずに$$),
        (4, $$をものともせず$$),
        (5, $$をものともせずに$$),
        (5, $$をものともせず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

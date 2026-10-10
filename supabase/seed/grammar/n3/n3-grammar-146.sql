-- n3-grammar-146 — 〜途中で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-146',
    'grammar',
    'N3',
    $$〜途中で$$,
    $$tochuu de$$,
    $$No meio do caminho / No meio de / A caminho de$$,
    $$途中で significa "no meio do caminho" ou "no meio de". Ele indica que algo acontece enquanto uma ação ou um deslocamento ainda não terminou.

Ele tem dois usos principais. O primeiro é no deslocamento: "a caminho da escola, encontrei um amigo". Nesse caso, vem depois do verbo na forma de dicionário, como 行く途中で ou 帰る途中で.

O segundo é no meio de uma atividade ou evento: "no meio do filme, peguei no sono" ou "no meio da conversa, o telefone tocou". Nesse caso, vem depois de substantivos com の.

Com に, 途中に indica um lugar ou parada no meio do trajeto, como "passei numa loja de conveniência no caminho de volta".

Sozinho, antes de um verbo, 途中で significa "pela metade", como em "desistir do trabalho pela metade".$$,
    $$途中で降りる significa "descer no meio do caminho", por exemplo, de um trem.

途中まで significa "até a metade": 途中まで一緒に行こう (vamos juntos até o meio do caminho).

Comparado a 最中に, 途中で é mais neutro e não tem necessariamente a ideia de interrupção desagradável.$$,
    $$Verbo na forma de dicionário + 途中で / 途中に (no caminho)
Substantivo + の + 途中で (no meio de)
途中で + Verbo (pela metade: 途中でやめる)

Escrita: 途中 / とちゅう$$,
    $$途中で$$,
    $$途中で|途中に|とちゅう$$,
    ARRAY['途中', 'で']::text[],
    ARRAY['途中で', '途中に', '途中まで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-146', $$学校へ行く途中で、友達に会った。$$, $$がっこうへいくとちゅうで、ともだちにあった。$$, $$A caminho da escola, encontrei um amigo.$$),
    ('n3-grammar-146', $$疲れていて、映画の途中で寝てしまった。$$, $$つかれていて、えいがのとちゅうでねてしまった。$$, $$Estava cansado e acabei dormindo no meio do filme.$$),
    ('n3-grammar-146', $$話の途中で、電話が鳴った。$$, $$はなしのとちゅうで、でんわがなった。$$, $$O telefone tocou no meio da conversa.$$),
    ('n3-grammar-146', $$帰る途中に、コンビニに寄った。$$, $$かえるとちゅうに、コンビニによった。$$, $$No caminho de volta, passei numa loja de conveniência.$$),
    ('n3-grammar-146', $$仕事を途中でやめてはいけない。$$, $$しごとをとちゅうでやめてはいけない。$$, $$Não se deve largar o trabalho pela metade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅へ行く____、雨が降り出した。$$, $$A caminho da estação, começou a chover.$$),
        (2, $$サッカーの試合の____、けがをした。$$, $$Me machuquei no meio da partida de futebol.$$),
        (3, $$家に帰る____、本屋に寄りました。$$, $$No caminho de casa, passei numa livraria.$$),
        (4, $$足が痛くなって、マラソンを____やめてしまった。$$, $$Meu pé começou a doer e acabei desistindo da maratona no meio.$$),
        (5, $$授業の____、先生が教室を出た。$$, $$No meio da aula, o professor saiu da sala.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-146', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$途中で$$),
        (1, $$途中に$$),
        (2, $$途中で$$),
        (3, $$途中で$$),
        (3, $$途中に$$),
        (4, $$途中で$$),
        (5, $$途中で$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

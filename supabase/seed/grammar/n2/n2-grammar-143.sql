-- n2-grammar-143 — それなら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-143',
    'grammar',
    'N2',
    $$それなら$$,
    $$sore nara$$,
    $$Então / Nesse caso / Se é assim$$,
    $$それなら é usado para reagir ao que a outra pessoa disse, dando uma sugestão, uma decisão ou uma conclusão. Equivale a "então" ou "nesse caso".

A pessoa recebe uma informação e responde com base nela. Por exemplo, "estou cansado." "Então descanse um pouco".

É muito comum em conversas. A forma mais curta e coloquial é なら, e a mais informal é じゃあ.$$,
    $$É parecido com じゃあ e では, mas それなら deixa mais claro que a resposta é baseada no que o outro disse.

Também pode ser usado para tirar uma conclusão lógica.$$,
    $$(Fala do outro) + それなら、 + Sugestão / Decisão$$,
    $$それなら$$,
    $$それなら$$,
    ARRAY['それ', 'なら']::text[],
    ARRAY['それなら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-143', $$「疲れた。」「それなら、少し休もう。」$$, $$「つかれた。」「それなら、すこしやすもう。」$$, $$Estou cansado. Então vamos descansar um pouco.$$),
    ('n2-grammar-143', $$「明日は雨らしいよ。」「それなら、傘を持っていこう。」$$, $$「あしたはあめらしいよ。」「それなら、かさをもっていこう。」$$, $$Parece que amanhã vai chover. Nesse caso, vamos levar guarda-chuva.$$),
    ('n2-grammar-143', $$「この店、高いね。」「それなら、別の店にしよう。」$$, $$「このみせ、たかいね。」「それなら、べつのみせにしよう。」$$, $$Esta loja é cara, né? Então vamos em outra.$$),
    ('n2-grammar-143', $$「時間がないんです。」「それなら、また今度にしましょう。」$$, $$「じかんがないんです。」「それなら、またこんどにしましょう。」$$, $$Estou sem tempo. Nesse caso, vamos deixar para outra vez.$$),
    ('n2-grammar-143', $$「道がわからない。」「それなら、地図を見せてあげる。」$$, $$「みちがわからない。」「それなら、ちずをみせてあげる。」$$, $$Não sei o caminho. Então eu te mostro o mapa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「お腹がすいた。」「____、何か食べに行こう。」$$, $$Estou com fome. Então vamos comer alguma coisa.$$),
        (2, $$「頭が痛いんです。」「____、今日は早く帰ってください。」$$, $$Estou com dor de cabeça. Nesse caso, vá embora cedo hoje.$$),
        (3, $$「電車が止まっているって。」「____、タクシーで行こう。」$$, $$Dizem que o trem parou. Então vamos de táxi.$$),
        (4, $$「日曜日なら空いてるよ。」「____、日曜日に会おう。」$$, $$No domingo estou livre. Então vamos nos encontrar no domingo.$$),
        (5, $$「この服、少し大きいです。」「____、小さいサイズをお持ちします。」$$, $$Esta roupa está um pouco grande. Nesse caso, trarei um tamanho menor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-143', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$それなら$$),
        (2, $$それなら$$),
        (3, $$それなら$$),
        (4, $$それなら$$),
        (5, $$それなら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

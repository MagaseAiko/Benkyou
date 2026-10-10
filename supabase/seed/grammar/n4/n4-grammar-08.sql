-- n4-grammar-08 — 〜だけで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-08',
    'grammar',
    'N4',
    $$〜だけで$$,
    $$dake de$$,
    $$Só de / Apenas com / Só por$$,
    $$だけで é usado para dizer que basta uma coisa simples para que um resultado aconteça. Equivale a "só de", "apenas com" ou "só por".

だけ indica o limite ("só isso"), e で indica o meio ou a condição. Juntos, eles mostram que aquele pouco já é suficiente.

É muito usado para sentimentos e reações: só de pensar em algo, a pessoa já fica com medo; só de ouvir uma música, já fica feliz.

Também aparece para indicar que uma ação simples é suficiente para conseguir algo, como apertar um botão ou mostrar um documento.$$,
    $$Muitas vezes, だけで aparece com verbos como 考える, 想像する, 聞く e 見る, para mostrar uma reação forte a algo pequeno.

Com いい, a forma だけでいい significa "basta só...", "é só...".

Na forma negativa, だけでは〜ない indica que aquilo sozinho não é suficiente.$$,
    $$Verbo na forma de dicionário + だけで
Verbo na forma た / ている + だけで
Substantivo + だけで$$,
    $$だけで$$,
    $$だけで$$,
    ARRAY['だけ', 'で']::text[],
    ARRAY['だけで', 'だけでは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-08', $$この歌を聞くだけで、楽しくなります。$$, $$このうたをきくだけで、たのしくなります。$$, $$Só de ouvir esta música, já fico feliz.$$),
    ('n4-grammar-08', $$考えるだけで、怖いです。$$, $$かんがえるだけで、こわいです。$$, $$Só de pensar, já fico com medo.$$),
    ('n4-grammar-08', $$このアプリは、ボタンを押すだけで使えます。$$, $$このアプリは、ボタンをおすだけでつかえます。$$, $$Este aplicativo funciona apenas apertando um botão.$$),
    ('n4-grammar-08', $$一人だけで、この仕事をするのは無理です。$$, $$ひとりだけで、このしごとをするのはむりです。$$, $$É impossível fazer este trabalho sozinho.$$),
    ('n4-grammar-08', $$見ているだけで、お腹がすいてきた。$$, $$みているだけで、おなかがすいてきた。$$, $$Só de olhar, já fiquei com fome.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ここに名前を書く____いいです。$$, $$Basta escrever o nome aqui.$$),
        (2, $$彼の声を聞く____、元気になります。$$, $$Só de ouvir a voz dele, já fico animado.$$),
        (3, $$旅行のことを想像する____、わくわくします。$$, $$Só de imaginar a viagem, já fico empolgado.$$),
        (4, $$説明を読んだ____はわかりませんでした。$$, $$Só lendo a explicação, não consegui entender.$$),
        (5, $$この券を見せる____、無料で入れます。$$, $$Basta mostrar este ingresso para entrar de graça.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-08', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけで$$),
        (2, $$だけで$$),
        (3, $$だけで$$),
        (4, $$だけで$$),
        (5, $$だけで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

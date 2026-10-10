import glob, sys, pglast
d = sys.argv[1]
ok = bad = 0
for f in sorted(glob.glob(d + '/' + sys.argv[2] + '/*.sql')) + [d + '/' + sys.argv[2] + '_all.sql']:
    try:
        stmts = pglast.parse_sql(open(f, encoding='utf-8').read()); ok += 1
    except Exception as e:
        bad += 1; print(f, e)
print('ok', ok, 'erro', bad, '| stmts no agregado:', len(stmts))

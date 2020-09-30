N = 139713689065649193238602077859960857468098993135221000039102730899547298927683962573562384690733560045229965690142223836971463635696618075169874035306125645096696682021038045841133380609849851790395591047968701652975799368468556274243238594974251982826875184190103880810901174411829635180158201629467635591810569775155092318675639049754541256014635438864801255760305914815607547032463796789980267388517787537827413511219215383011915710116907720461035152786018808394261912036183662986050428253151429051345333273081222126466016921456969903177087878715836995228953335073770833282613911892360743789453583070756075529298371748549

c = 124685720137286087974637083454831701339966293804422893085596270389405855619404156520743766929373287868106538299589424038783043194334560243812640561592652200368376115611247891237635032352102375266455486004707355213472127905734695141272493858057378951812357840535403155691798886254882859468912066573675006464518263526982997249121158520551576258448776707985773899806354192979203812074933169737618274419084890323034162520302687449736028470908248699174457011959674081295825304524826030316907668167104468182549336009917924574890737992068942209504351840515837871695539713067102504739121645006079782283023187240752494388988784497294

hidden = 512
tmp = isqrt((N)/(1337*7331))
q_approx = 7331*tmp - 2**512
F.<x> = PolynomialRing(Zmod(N), implementation='NTL')
f = x - q_approx
roots = f.small_roots(X=2**hidden, beta=0.5)
for delta in roots:
    print('delta', delta)
    print('q_approx - delta', q_approx-delta)
    q = q_approx-delta
    p = int(N)/int(q)
    d = inverse_mod(65537, (p-1)*(q-1))
    print("d", d)
    decrypted = hex(int(pow(c,d,N)))
    print('flag =', decrypted[2:-1].decode("hex"))
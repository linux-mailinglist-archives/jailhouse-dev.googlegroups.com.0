Return-Path: <jailhouse-dev+bncBCL6VO4KUEHBB5HOW2RQMGQEIRMPZHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113c.google.com (mail-yw1-x113c.google.com [IPv6:2607:f8b0:4864:20::113c])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD6170EEEF
	for <lists+jailhouse-dev@lfdr.de>; Wed, 24 May 2023 09:06:30 +0200 (CEST)
Received: by mail-yw1-x113c.google.com with SMTP id 00721157ae682-561deb0b6efsf12419337b3.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 24 May 2023 00:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684911989; x=1687503989;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dJVPZ4wAd/i+SdyeNLu7XonkJcrW0KlqkQiAKMwDvNw=;
        b=Qa5QWCt91WtAVkW+k5TM5o93DR/ZDErSKo1nzwJEOPYDhi6VTPiqso4jOnGoBqo8Rg
         du3pru9rPtfOlZxyRnzQah5iEqVnZaQk7Pt6jDZzv+FDAoMG45m9BGghN0Ok7h+7XOCt
         VMyDRGjWcwGE2N6U4l5DP4Q+0fKKlV5f6OfcYhkDO63tJtFuY6qKZtUXoFT6SuJ5LB+9
         FJqqRm8zWyeV1BK4EjXJM+w3RGeiCgkb/5/+Xn72sAOzwy34MRaNGvsf+lJWsIhZ0Vyt
         GedZJReTT2nNvJEN7g7A/ftukdnGIB9lLVc2cji89+3nPEmZd3/5q0BZyFS7I1PNOWOB
         3Y4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684911989; x=1687503989;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJVPZ4wAd/i+SdyeNLu7XonkJcrW0KlqkQiAKMwDvNw=;
        b=BDOdKqaJgQbh3sTJVhJNMkHTtIXuw7UqR86F5J6egEiCFiLa0z4PrU2zZeyBLcOE/H
         9GUs/wYIjIHTce+Y1QG0oNQJ9h9iUG/9kYMS0wSj7adyG/HHgarmCSDTw5OeFX2j/fwd
         Ek77KJ5qYl8JmnZiAZuPSth3JH3huKMbUuGtoMntix33LOlOcp/LA7ocF6SzS612NreC
         nPL40cbXqkLw5NUk6duNfYGTqeLuevvKVtOeM6rXzuc5OmsxdjWC2rpxfppE5FiaIuxe
         lvr4kFAqy8PsX3FL8gDMTUXeRRdsbOzbRolfLOjYCq3va1s1jdFj2HHDPJ9bavTYOLNA
         VeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684911989; x=1687503989;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dJVPZ4wAd/i+SdyeNLu7XonkJcrW0KlqkQiAKMwDvNw=;
        b=d3BQdA93xmfaj1xX8U5k/7nMVi9/gIUWnvp4LXDGYGvOvr6qvtnnQgspqqBqEuuS2o
         b+8BJdIevgS6uoPUqXFQxEi0EDMnzNMk/+MrSeeFRnYEmr/ebwLnM94QkPbCTNs46Mih
         4NPOgkE0xl5MFReOEDPaWpbLewrdfK+E+9oiY/cHFTZNiG06DXqEFzGJwOg2BJKrVW6w
         cqIBNQ2yTaZRrWTUawgM++JBWJdWtR+4+pRvK81FaZFeSe1Z4UcBqF2J/46MC/ThlDJ2
         Zy3SURU8FLJm/DbxiKiKOP3+qEJRdx8Vi9Up/CUsuPjSXh7Hi1V8pbYcCNWzrVWzCl3I
         /IIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxvCef1/a7xSpWEE4iN4CoMRtcE7k9AVvhDSf7pccAdOTkwrgLR
	8KOc08gE2ZSd1coN6xXzOxg=
X-Google-Smtp-Source: ACHHUZ4Zuxxk3snMOwJQX9XSdIkAaGBHOeVJYi3InDhwzU/6AyTfb7dy7jJ/U1XnuQKze/4WrWL6aQ==
X-Received: by 2002:a81:af23:0:b0:561:b8d1:743b with SMTP id n35-20020a81af23000000b00561b8d1743bmr10420817ywh.10.1684911989200;
        Wed, 24 May 2023 00:06:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:37d7:0:b0:ba8:3d58:96e6 with SMTP id e206-20020a2537d7000000b00ba83d5896e6ls323472yba.1.-pod-prod-06-us;
 Wed, 24 May 2023 00:06:28 -0700 (PDT)
X-Received: by 2002:a25:8c08:0:b0:ba8:456a:fac7 with SMTP id k8-20020a258c08000000b00ba8456afac7mr9937104ybl.0.1684911988277;
        Wed, 24 May 2023 00:06:28 -0700 (PDT)
Date: Wed, 24 May 2023 00:06:27 -0700 (PDT)
From: meiyan xiao <meiyanxiao0319@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2fa70dc0-b445-4176-b19f-3dace98358a1n@googlegroups.com>
In-Reply-To: <a185b8ff-0b39-4864-bbf2-ca937835ac70n@googlegroups.com>
References: <10331404-4fab-410c-ba3f-77f4ed6ccbebn@googlegroups.com>
 <a185b8ff-0b39-4864-bbf2-ca937835ac70n@googlegroups.com>
Subject: Re: install and run jailhouse on rpi4 board
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1604_1956732655.1684911987658"
X-Original-Sender: meiyanxiao0319@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_1604_1956732655.1684911987658
Content-Type: multipart/alternative; 
	boundary="----=_Part_1605_1936598313.1684911987658"

------=_Part_1605_1936598313.1684911987658
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello, I want to build the jailhouse in RPI4, but I meet some errors. Could=
=20
you please give me some guidances, it could be better if you could give me=
=20
your document in Chinese.?
I am waiting your positive reply, thanks a lot.

=E5=9C=A82021=E5=B9=B46=E6=9C=889=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8=
 13:47:34<=E6=9C=B1=E8=8B=A5=E5=87=A1> =E5=86=99=E9=81=93=EF=BC=9A

> hello, I have an document for rpi4b board to install jailhouse with its=
=20
> own kernel, where I can change some code of jailhouse .  I try a lot and=
=20
> finally install it. But I only use deconfig of rpi4.cell for no auto tool=
s=20
> to build root cell config . What's more, unfortunately the document is in=
=20
> chinese .  If you need it , mail me.
>
> =E5=9C=A82021=E5=B9=B46=E6=9C=884=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC=
+8 =E4=B8=8B=E5=8D=886:24:49<nmiliak...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A
>
>> Dear all,=20
>>
>> I am student in ECE NTUA and I am studying Jailhouse for my diploma=20
>> thesis. So far I managed to install and run jailhouse in virtual=20
>> environment (QEMU) in x86 and use ready-to-use jailhouse images for virt=
=20
>> environment for both x86 and arm architecture. Now I am assigned to inst=
all=20
>> it on rpi4 board.=20
>>
>> I know there is this repo https://github.com/siemens/jailhouse-images=20
>> with ready to use image for rpi4, but I would like to install it manuall=
y=20
>> to explore better all the options provided, write some code on my own an=
d=20
>> test it.=20
>>
>> I have already explored the internet and this google group for further=
=20
>> information, and apart from some general guidance, I didnt find anything=
=20
>> specific/(or maybe I coudn't understand some key points).=20
>>
>>
>> I would really appreciate it if someone could give me some=20
>> advice/guidance on this subject.
>>
>> Thank you all in advance.=20
>>
>> Nikoleta Iliakopoulou
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2fa70dc0-b445-4176-b19f-3dace98358a1n%40googlegroups.com.

------=_Part_1605_1936598313.1684911987658
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello, I want to build the jailhouse in RPI4, but I meet some errors. Could=
 you please give me some guidances, it could be better if you could give me=
 your document in Chinese.?<br />I am waiting your positive reply, thanks a=
 lot.<br /><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmai=
l_attr">=E5=9C=A82021=E5=B9=B46=E6=9C=889=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=
=89 UTC+8 13:47:34&lt;=E6=9C=B1=E8=8B=A5=E5=87=A1> =E5=86=99=E9=81=93=EF=BC=
=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">hello, I =
have an document for rpi4b board to install jailhouse with its own kernel, =
where I can change some code of jailhouse .=C2=A0 I try a lot and finally i=
nstall it. But I only use deconfig of rpi4.cell for no auto tools to build =
root cell config . What&#39;s more, unfortunately the document is in chines=
e .=C2=A0 If you need it , mail me.<br><br><div class=3D"gmail_quote"><div =
dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B46=E6=9C=884=E6=97=
=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+8 =E4=B8=8B=E5=8D=886:24:49&lt;<a href d=
ata-email-masked rel=3D"nofollow">nmiliak...@gmail.com</a>&gt; =E5=86=99=E9=
=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Dear a=
ll,=C2=A0<div><br></div><div>I am student in ECE NTUA and I am studying Jai=
lhouse for my diploma thesis. So far I managed to install and run jailhouse=
 in virtual environment (QEMU) in x86 and use ready-to-use jailhouse images=
 for virt environment for both x86 and arm architecture. Now I am assigned =
to install it on rpi4 board.=C2=A0</div><div><br></div><div>I know there is=
 this repo=C2=A0<a href=3D"https://github.com/siemens/jailhouse-images" rel=
=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.=
com/url?hl=3Dzh-CN&amp;q=3Dhttps://github.com/siemens/jailhouse-images&amp;=
source=3Dgmail&amp;ust=3D1684998146679000&amp;usg=3DAOvVaw2GrUL3z4QKEf023Dd=
NFN_r">https://github.com/siemens/jailhouse-images</a> with ready to use im=
age for rpi4, but I would like to install it manually to explore better all=
 the options provided, write some code on my own and test it.=C2=A0</div><d=
iv><br></div><div>I have already explored the internet and this google grou=
p for further information, and apart from some general guidance, I didnt fi=
nd anything specific/(or maybe I coudn&#39;t understand some key points).=
=C2=A0</div><div><br></div><div><br></div><div>I would really appreciate it=
 if someone could give me some advice/guidance on this subject.</div><div><=
br></div><div>Thank you all in advance.=C2=A0</div><div><br></div><div>Niko=
leta Iliakopoulou</div></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2fa70dc0-b445-4176-b19f-3dace98358a1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2fa70dc0-b445-4176-b19f-3dace98358a1n%40googlegroups.co=
m</a>.<br />

------=_Part_1605_1936598313.1684911987658--

------=_Part_1604_1956732655.1684911987658--

Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBKUZ5XUQKGQEMYXGKIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AFF771AD
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 20:55:39 +0200 (CEST)
Received: by mail-ot1-x33c.google.com with SMTP id a21sf29543194otk.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 11:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2J0De2m4QtDzK+kQfAa6+Q0gXrRfGaiQbMCed2CDuxM=;
        b=qu+I12LqNROm7BOwprH72DQMVlDQ0IWcBRv1SAiJwUuPjjNCGIcOGW9g/QlpTFFDfK
         DEooynkfdpfnjLC1lagtx5Fiip6BrIakLBbuwPU4zolmWblEkrPeNlKgVEjqtVf+6Z3A
         WlwN7bxPvoZtWo3U/EnbYQWsZ7j/h+Z7uzSbFcZXN/3UerqLnHeXJ4OAwZKiU5W4ubQf
         QAxQtJwpC4sSufKDPu1PpASk/KxIG5yEGmq2JCitJw/VWdItkn1SL5gVApd3hm4BUkP6
         kClkBeONVMp8oLMlzcxN6Yy2zDSKNPW8Y99bwP9UyR38MF9k7QUn8WmSagvn3MoUUI1V
         /bIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2J0De2m4QtDzK+kQfAa6+Q0gXrRfGaiQbMCed2CDuxM=;
        b=nz995gY5eEUzXR3DU71M6CaxMeOWcTZMi9xU4GiHXrUk9WX+Sm3L3D9zKeWkbQY32J
         ns4md3PfaWRbOF0kyuuDRqiIHZRhef0wG3COTcgjAZ5kqmFaSaPDGWnmbgc6gbHTp4BO
         Gd7agtWVZVwcNa8DscfRH7BRvVMSHRGW0guHL+TJhjO4d8aAxlSLl0Q1tc4oA0HrDarK
         Nv9TjqcgggWVuwFXrevjouOwgCRbH4uP2grjktMZggPdZFjmpcPUTSv+ebXx+30Fm6LO
         pT0HEl6fjnjMvc4R1cTrvzWuaJzVaMFFv63lyQbegrk/2l417JpIb1oWx/H4AfZH8LwR
         iz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=2J0De2m4QtDzK+kQfAa6+Q0gXrRfGaiQbMCed2CDuxM=;
        b=fk+QBjfYeycTVo/Xbjx3Q/d4Bg+K/HvaCdrxRd7iOfDUxwWNdPD2QNsfW0A4n0vkKj
         FniTX5dbBWXQ2sA/vPvwfH9oCFmSNYhI5fF4c+Uy9QaZowHcZXhnqt2q80p78Vd3j35S
         Fyv2rhUr7ODt4RleUBbQeFURHf9pkQYRCgCtbxT7QUxfAjiL0SGJy60WKZFSMuhYtxbs
         rZw3FJy+LSW5MM3TseH5CSTg1htcKqNf85GjRitYdru/XKx3DfC2jMH5Y5ZmeDQzCfh4
         wVUPlfmLewHhakWHqTqAxEg6yTwkWRBRtETIMmE/rUnZkbYfoxbMxzWub1pwkFnbirNz
         L+MQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWmwef0bn7YYNch5cine9RSdfNVclY5+bsgJJL9yRBGlU3HCIrv
	H1pE7wnGwcK/G/87jK/uc1o=
X-Google-Smtp-Source: APXvYqy+fN22UJmxrmMxhJs0xq7mW6HP4NPsAXgYQf3pEwp2RgYOOmEdNgcwpK9GU56nLiW1McbTPA==
X-Received: by 2002:a05:6808:182:: with SMTP id w2mr13311865oic.56.1564167338344;
        Fri, 26 Jul 2019 11:55:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:47d2:: with SMTP id u201ls7525954oia.2.gmail; Fri, 26
 Jul 2019 11:55:37 -0700 (PDT)
X-Received: by 2002:a54:4694:: with SMTP id k20mr7303554oic.136.1564167337738;
        Fri, 26 Jul 2019 11:55:37 -0700 (PDT)
Date: Fri, 26 Jul 2019 11:55:37 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ce8d5010-9396-446b-821f-306272fa9e7d@googlegroups.com>
In-Reply-To: <d3462382-811e-62dd-bd1f-cd39a1b41948@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <de716a1a-110f-4fac-864c-54043152997e@googlegroups.com>
 <62f33b9f-a7f6-34cb-3740-2fca02468b0f@siemens.com>
 <907a0d23-c664-432b-849f-8d536d14488f@googlegroups.com>
 <421d16ea-f517-a1f0-750d-65b9f856d1e6@siemens.com>
 <942a4151-1921-4bd2-ad02-c9a98411ac36@googlegroups.com>
 <d3462382-811e-62dd-bd1f-cd39a1b41948@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7923_1621464679.1564167337134"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_7923_1621464679.1564167337134
Content-Type: multipart/alternative; 
	boundary="----=_Part_7924_210382877.1564167337134"

------=_Part_7924_210382877.1564167337134
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My distro is Ubuntu 16.04.6 LTS

sexta-feira, 26 de Julho de 2019 =C3=A0s 18:43:57 UTC+1, Jan Kiszka escreve=
u:
>
> On 26.07.19 19:35, Jo=C3=A3o Reis wrote:=20
> > pyjailhouse was installed on /usr/local/lib/python2.7/dist-packages, an=
d=20
> that is=20
> > the directory i have to add to the script in order for it to find=20
> pyjailhouse.=20
> >=20
>
> Hmm, must be some distro thing: When I call "pip install ...", my distro=
=20
> directs=20
> the result to /usr/lib/python2.7/site-packages, and that is already in th=
e=20
> search path of the python installation.=20
>
> Which distro are you on?=20
>
> Jan=20
>
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> Corporate Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ce8d5010-9396-446b-821f-306272fa9e7d%40googlegroups.com.

------=_Part_7924_210382877.1564167337134
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My distro is Ubuntu 16.04.6 LTS<br><br>sexta-feira, 26 de =
Julho de 2019 =C3=A0s 18:43:57 UTC+1, Jan Kiszka escreveu:<blockquote class=
=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #cc=
c solid;padding-left: 1ex;">On 26.07.19 19:35, Jo=C3=A3o Reis wrote:
<br>&gt; pyjailhouse was installed on=C2=A0/usr/local/lib/python2.7/<wbr>di=
st-packages, and that is
<br>&gt; the directory i have to add to the script in order for it to find =
pyjailhouse.
<br>&gt;=20
<br>
<br>Hmm, must be some distro thing: When I call &quot;pip install ...&quot;=
, my distro directs
<br>the result to /usr/lib/python2.7/site-<wbr>packages, and that is alread=
y in the
<br>search path of the python installation.
<br>
<br>Which distro are you on?
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ce8d5010-9396-446b-821f-306272fa9e7d%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/ce8d5010-9396-446b-821f-306272fa9e7d%40googlegroups.com<=
/a>.<br />

------=_Part_7924_210382877.1564167337134--

------=_Part_7923_1621464679.1564167337134--

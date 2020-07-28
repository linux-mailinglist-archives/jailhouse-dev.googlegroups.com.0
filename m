Return-Path: <jailhouse-dev+bncBCT7DIPSUIGBBTXS734AKGQEO6RWBEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF292301D6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 07:36:16 +0200 (CEST)
Received: by mail-qt1-x837.google.com with SMTP id d2sf9625328qtn.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 22:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=b2m5ANZUrKPNlJ81pAf/LNXtx8U311ltUdXaMQhSw20=;
        b=UWcIbgVeCKxBrSer/qXejPLklWIvHyYABsSehCsjMQevnEXBlTBR8sAPBwKCHeNkUS
         IUIg/qz8B3fAO3nTTFjTsR7JiDhx2NvMjG/OtsRPV22iWsSK96E0DnciE+s0YogKOcwG
         tCcC/7OwqxesfRmuSLTLQHV8brPkb9PDvYQCYbKF8RhHq/RQsjStcl5sv6WZt16OXBy3
         +N4SImuUhDC+jluqMl4LMzp+CTRhD0vI1Vxyc2xY04eL9KIZRO+yIOvzIIM0EfmyBfWC
         5qjcI2uRA/lF+srd8hjUaXmKM6WkpHqLZY6xpbH/v8B4R5dYvuupdD+dP4X32nf+fw7i
         APEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=b2m5ANZUrKPNlJ81pAf/LNXtx8U311ltUdXaMQhSw20=;
        b=fsO6BqU4dQrZSiu+KiPkGEqRwHmFuLadN2WU65Klorf/uXDqF5Jza3fDzF2iiKde2v
         B/elG905fl/bxoKSHOSY2kQOIg2vEUflU1TfkKILFhFaavHdL9XfcWISH655vPHI1cdu
         cR48OVJOvwE4btB1Gl3q0Ib6//alpdRkxgzKwGsp0+jlR33jZZXB2bjD5UdNuXPJfCxY
         ctNDCeBbd6lUws++T2AUbi3LI7AzRgrup+fRSyNCkuAYP9cp0gr8P/pvCXolBvLHuSsG
         0kYkaJBhvbZXjb9mk3jEvMQYXtNOKKQGye4OYvWNFhSAoJT2tIxInWcibVV1Z3/ZBZYW
         N1pg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Q+RfWS+ijTTWyqgb/fn85aJYKzvyKv5jiM/QPqNtwE7Pps47z
	PuzZ7cOzzo67jjk+kc1QpAA=
X-Google-Smtp-Source: ABdhPJzTSWmfYPssO4/2ASGAHKoWr+wicdWM6TualZX3tO1Vvgb0VCydLMZxb2jENdfvwNkpLH1XEA==
X-Received: by 2002:a05:620a:1105:: with SMTP id o5mr26446012qkk.434.1595914575137;
        Mon, 27 Jul 2020 22:36:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:16ca:: with SMTP id d10ls4460907qvz.7.gmail; Mon,
 27 Jul 2020 22:36:14 -0700 (PDT)
X-Received: by 2002:ad4:5382:: with SMTP id i2mr17617459qvv.40.1595914574485;
        Mon, 27 Jul 2020 22:36:14 -0700 (PDT)
Date: Mon, 27 Jul 2020 22:36:13 -0700 (PDT)
From: Rick Xu <cutfield@126.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2a2c06bb-71a7-40b2-abcb-91580ec3b3c0n@googlegroups.com>
In-Reply-To: <9e0650df-e049-614b-0fbd-9f978b66b9e0@siemens.com>
References: <4f73eee2-1784-4049-8fc0-6a889e2ea419o@googlegroups.com>
 <1e8a7abd-91e8-26b2-3446-e9734bcf8d86@siemens.com>
 <830ae788-2f93-4f55-a38b-640bd4acb560n@googlegroups.com>
 <9e0650df-e049-614b-0fbd-9f978b66b9e0@siemens.com>
Subject: Re: Is Jailhouse already used on products? And if not what's the
 gap?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_662_1284117856.1595914573321"
X-Original-Sender: cutfield@126.com
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

------=_Part_662_1284117856.1595914573321
Content-Type: multipart/alternative; 
	boundary="----=_Part_663_1277707384.1595914573321"

------=_Part_663_1277707384.1595914573321
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I encountered a problem. Our hardware does not support SMMU. How will this=
=20
affect the use of Jailhouse?

=E5=9C=A82020=E5=B9=B47=E6=9C=8821=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+=
8 =E4=B8=8B=E5=8D=889:58:13<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A

> On 21.07.20 14:36, Rick Xu wrote:
> > Jan,
> >   Thanks for your detailed reply~
> >   Chinese characters are hieroglyphs. What is interesting is that=20
> > Jailhouse translated into Chinese is "=E5=9B=B9=E5=9C=84".
> > "=E5=9B=B9=E5=9C=84" is very similar to the architecture diagram of Jai=
lhouse.
>
> Nice! Thanks a lot for sharing. :)
>
> >=20
> > "Is there any plan to pass ISO26262 certification?"----My colleague's=
=20
> > question.
> >=20
>
> In [3], we are looking into IEC 61508, and that should allow to derive=20
> ISO26262 certification (being based on IEC).
>
> > Our company's Soc and hardware  will be available soon, with an ARMv8-A=
=20
> > CPU and our own AI Acceleration unit,
> > I'll try to make jailhouse running on our hardware. Is there any=20
> > relevant documentation to guide my adaptation work=EF=BC=9F
> >=20
>
> The basic ideas and guidelines from [4][5] still apply, but the rest=20
> depends on SoC details, which features used etc. However, if you have a=
=20
> booting Linux on your board, enabling Jailhouse for development and demo=
=20
> purposes is rather simple. Locking things down will surely require more=
=20
> effort, though. One of them might be partitioning of the AI unit - if=20
> that is needed.
>
> Just drop questions here if you run into issues.
>
> Jan
>
> [4]=20
>
> https://events.linuxfoundation.org/sites/events/files/slides/ELCE2016-Jai=
lhouse-Tutorial.pdf
> [5] https://youtu.be/7fiJbwmhnRw?list=3DPLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51=
q
>
> >=20
> >=20
> > =E5=9C=A82020=E5=B9=B47=E6=9C=8821=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C =
UTC+8 =E4=B8=8A=E5=8D=885:27:54<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=
=EF=BC=9A
> >=20
> > On 20.07.20 09:57, Rick Xu wrote:
> > > Hi,
> > >     I'm very interested in this project.
> > > For 3 reasons, first, it uses a LINUX as a host OS and then
> > changes it
> > > to a guest OS, so a running host OS was saved.
> > > Second, less virtualization and more real-time.
> > > Third,  it's easy to use.
> > > So, I want to evaluate the feasibility of using it in an
> > automotive system.
> > > I want to know is it mature enough to already been used in some
> > > products, so I can use this information to enhance the customer's
> > > confidence.
> > > And if it has not been used for products, why?
> > > Looking forward to your reply.
> > >
> >=20
> > Jailhouse is primarily useful in two application areas. One is
> > real-time, splitting of high-performance cores in a AMP setups without
> > much hacking while providing minimal latencies. There are users out
> > there, at least one stepped forward officially, see [1]. Furthermore,
> > Jailhouse is part of processor SDKs that TI and NXP are shipping to
> > their customers, and not only that just led to [2] - which I think
> > speaks for itself.
> >=20
> > The second, still more research-like area is functional safety. This is
> > our (Siemens) primary focus with Jailhouse. And while we are still
> > waiting for and even collaborating on developing [3] a certifiable
> > high-performance multicore hardware, our discussions with external
> > experts and certification authority made us confident that a key
> > element
> > of the software for complex mixed-critial multicore systems - Jailhouse
> > - will be very well suited and efficiently usable. Once we have a
> > hardware.
> >=20
> > Jan
> >=20
> > [1]
> > https://elinux.org/images/6/6e/ELCE2019_Poster-Stojkov-Jailhouse.pdf
> > [2]
> >=20
> https://github.com/siemens/jailhouse/commit/b6715a3731249ec09a280b2fdbf5e=
4385b1e6677
> >=20
> > [3] https://www.selene-project.eu/
> >=20
> > --=20
> > Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> > Corporate Competence Center Embedded Linux
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/830ae788-2f93-4f55-a38b-6=
40bd4acb560n%40googlegroups.com=20
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/830ae788-2f93-4f55-a38b-6=
40bd4acb560n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2a2c06bb-71a7-40b2-abcb-91580ec3b3c0n%40googlegroups.com.

------=_Part_663_1277707384.1595914573321
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I encountered a problem. Our hardware does not support SMMU. How will this =
affect the use of Jailhouse?<br><br><div class=3D"gmail_quote"><div dir=3D"=
auto" class=3D"gmail_attr">=E5=9C=A82020=E5=B9=B47=E6=9C=8821=E6=97=A5=E6=
=98=9F=E6=9C=9F=E4=BA=8C UTC+8 =E4=B8=8B=E5=8D=889:58:13&lt;j.kiszka...@gma=
il.com> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204=
); padding-left: 1ex;">On 21.07.20 14:36, Rick Xu wrote:
<br>&gt; Jan,
<br>&gt;  =C2=A0 Thanks for your detailed reply~
<br>&gt;  =C2=A0 Chinese characters are hieroglyphs. What is interesting is=
 that=20
<br>&gt; Jailhouse translated into Chinese is &quot;=E5=9B=B9=E5=9C=84&quot=
;.
<br>&gt; &quot;=E5=9B=B9=E5=9C=84&quot; is very similar to the architecture=
 diagram of Jailhouse.
<br>
<br>Nice! Thanks a lot for sharing. :)
<br>
<br>&gt;=20
<br>&gt; &quot;Is there any plan to pass ISO26262 certification?&quot;----M=
y colleague&#39;s=20
<br>&gt; question.
<br>&gt;=20
<br>
<br>In [3], we are looking into IEC 61508, and that should allow to derive=
=20
<br>ISO26262 certification (being based on IEC).
<br>
<br>&gt; Our company&#39;s Soc and hardware=C2=A0 will be available soon, w=
ith an ARMv8-A=20
<br>&gt; CPU and our own AI Acceleration unit,
<br>&gt; I&#39;ll try to make jailhouse running on our hardware. Is there a=
ny=20
<br>&gt; relevant documentation to guide my adaptation work=EF=BC=9F
<br>&gt;=20
<br>
<br>The basic ideas and guidelines from [4][5] still apply, but the rest=20
<br>depends on SoC details, which features used etc. However, if you have a=
=20
<br>booting Linux on your board, enabling Jailhouse for development and dem=
o=20
<br>purposes is rather simple. Locking things down will surely require more=
=20
<br>effort, though. One of them might be partitioning of the AI unit - if=
=20
<br>that is needed.
<br>
<br>Just drop questions here if you run into issues.
<br>
<br>Jan
<br>
<br>[4]=20
<br><a href=3D"https://events.linuxfoundation.org/sites/events/files/slides=
/ELCE2016-Jailhouse-Tutorial.pdf" target=3D"_blank" rel=3D"nofollow" data-s=
aferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://eve=
nts.linuxfoundation.org/sites/events/files/slides/ELCE2016-Jailhouse-Tutori=
al.pdf&amp;source=3Dgmail&amp;ust=3D1596000627860000&amp;usg=3DAFQjCNHhWfMv=
9f8EXH1B61q4KKTD5XU2LQ">https://events.linuxfoundation.org/sites/events/fil=
es/slides/ELCE2016-Jailhouse-Tutorial.pdf</a>
<br>[5] <a href=3D"https://youtu.be/7fiJbwmhnRw?list=3DPLbzoR-pLrL6pRFP6SOy=
wVJWdEHlmQE51q" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"=
https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://youtu.be/7fiJbwmhnRw?=
list%3DPLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51q&amp;source=3Dgmail&amp;ust=3D1596=
000627860000&amp;usg=3DAFQjCNHrT7HUvlKJRyi9FcA83Z8ccv-ikA">https://youtu.be=
/7fiJbwmhnRw?list=3DPLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51q</a>
<br>
<br>&gt;=20
<br>&gt;=20
<br>&gt; =E5=9C=A82020=E5=B9=B47=E6=9C=8821=E6=97=A5=E6=98=9F=E6=9C=9F=E4=
=BA=8C UTC+8 =E4=B8=8A=E5=8D=885:27:54&lt;<a href data-email-masked rel=3D"=
nofollow">j.kiszka...@gmail.com</a>&gt; =E5=86=99=E9=81=93=EF=BC=9A
<br>&gt;=20
<br>&gt;     On 20.07.20 09:57, Rick Xu wrote:
<br>&gt;      &gt; Hi,
<br>&gt;      &gt; =C2=A0 =C2=A0 I&#39;m very interested in this project.
<br>&gt;      &gt; For 3 reasons, first, it uses a LINUX as a host OS and t=
hen
<br>&gt;     changes it
<br>&gt;      &gt; to a guest OS, so a running host OS was saved.
<br>&gt;      &gt; Second, less virtualization and more real-time.
<br>&gt;      &gt; Third,=C2=A0 it&#39;s easy to use.
<br>&gt;      &gt; So, I want to evaluate the feasibility of using it in an
<br>&gt;     automotive system.
<br>&gt;      &gt; I want to know is it mature enough to already been used =
in some
<br>&gt;      &gt; products, so I can use this information to enhance the c=
ustomer&#39;s
<br>&gt;      &gt; confidence.
<br>&gt;      &gt; And if it has not been used for products, why?
<br>&gt;      &gt; Looking forward to your reply.
<br>&gt;      &gt;
<br>&gt;=20
<br>&gt;     Jailhouse is primarily useful in two application areas. One is
<br>&gt;     real-time, splitting of high-performance cores in a AMP setups=
 without
<br>&gt;     much hacking while providing minimal latencies. There are user=
s out
<br>&gt;     there, at least one stepped forward officially, see [1]. Furth=
ermore,
<br>&gt;     Jailhouse is part of processor SDKs that TI and NXP are shippi=
ng to
<br>&gt;     their customers, and not only that just led to [2] - which I t=
hink
<br>&gt;     speaks for itself.
<br>&gt;=20
<br>&gt;     The second, still more research-like area is functional safety=
. This is
<br>&gt;     our (Siemens) primary focus with Jailhouse. And while we are s=
till
<br>&gt;     waiting for and even collaborating on developing [3] a certifi=
able
<br>&gt;     high-performance multicore hardware, our discussions with exte=
rnal
<br>&gt;     experts and certification authority made us confident that a k=
ey
<br>&gt;     element
<br>&gt;     of the software for complex mixed-critial multicore systems - =
Jailhouse
<br>&gt;     - will be very well suited and efficiently usable. Once we hav=
e a
<br>&gt;     hardware.
<br>&gt;=20
<br>&gt;     Jan
<br>&gt;=20
<br>&gt;     [1]
<br>&gt;     <a href=3D"https://elinux.org/images/6/6e/ELCE2019_Poster-Stoj=
kov-Jailhouse.pdf" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://elinux.org/images=
/6/6e/ELCE2019_Poster-Stojkov-Jailhouse.pdf&amp;source=3Dgmail&amp;ust=3D15=
96000627860000&amp;usg=3DAFQjCNGcHvcWx68fvEXVaP4RkZAGe_p5eA">https://elinux=
.org/images/6/6e/ELCE2019_Poster-Stojkov-Jailhouse.pdf</a>
<br>&gt;     [2]
<br>&gt;     <a href=3D"https://github.com/siemens/jailhouse/commit/b6715a3=
731249ec09a280b2fdbf5e4385b1e6677" target=3D"_blank" rel=3D"nofollow" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://gi=
thub.com/siemens/jailhouse/commit/b6715a3731249ec09a280b2fdbf5e4385b1e6677&=
amp;source=3Dgmail&amp;ust=3D1596000627860000&amp;usg=3DAFQjCNEbVl4ivCYTwe8=
7LvRvK-X8PQo6PA">https://github.com/siemens/jailhouse/commit/b6715a3731249e=
c09a280b2fdbf5e4385b1e6677</a>
<br>&gt;=20
<br>&gt;     [3] <a href=3D"https://www.selene-project.eu/" target=3D"_blan=
k" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Dzh-CN&amp;q=3Dhttps://www.selene-project.eu/&amp;source=3Dgmail&amp;ust=
=3D1596000627860000&amp;usg=3DAFQjCNF3j1Aop3jV8g3ZWV8hYrzQ7c6tOw">https://w=
ww.selene-project.eu/</a>
<br>&gt;=20
<br>&gt;     --=20
<br>&gt;     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>&gt;     Corporate Competence Center Embedded Linux
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/830ae78=
8-2f93-4f55-a38b-640bd4acb560n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/830ae788-2f93-4f55-a3=
8b-640bd4acb560n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D15960006=
27860000&amp;usg=3DAFQjCNGPVKEvzgyZBJSp6PaLs--MZZIUrA">https://groups.googl=
e.com/d/msgid/jailhouse-dev/830ae788-2f93-4f55-a38b-640bd4acb560n%40googleg=
roups.com</a>=20
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/830=
ae788-2f93-4f55-a38b-640bd4acb560n%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.google.=
com/d/msgid/jailhouse-dev/830ae788-2f93-4f55-a38b-640bd4acb560n%2540googleg=
roups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;u=
st=3D1596000627861000&amp;usg=3DAFQjCNGu1yGW7chH2tAEyJjk-IWMmjWCWQ">https:/=
/groups.google.com/d/msgid/jailhouse-dev/830ae788-2f93-4f55-a38b-640bd4acb5=
60n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
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
om/d/msgid/jailhouse-dev/2a2c06bb-71a7-40b2-abcb-91580ec3b3c0n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2a2c06bb-71a7-40b2-abcb-91580ec3b3c0n%40googlegroups.co=
m</a>.<br />

------=_Part_663_1277707384.1595914573321--

------=_Part_662_1284117856.1595914573321--

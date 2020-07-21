Return-Path: <jailhouse-dev+bncBCT7DIPSUIGBBNWC3P4AKGQEOVN5EPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEB2228009
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 14:36:08 +0200 (CEST)
Received: by mail-oi1-x237.google.com with SMTP id j202sf9393095oib.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 05:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3T3qLoXJFyzAU55vXsgJxe9wRh+sZ8uGNOdGYjcTMTs=;
        b=HgnJLV70LfaWDEUdv6Rro2bJ9Isf1uVoNuu9pKrjObjm8Hm5vf2aqA6JjMMYjAZ7fC
         yUyCQNO9v8cZEp+ry6okLcU1a+4ZkyVp7JZgG8nwa1mAVv2rro5DkIr7hHKMJTQEbslB
         /Mf6w4fT7dYy4OYTB5x38TepGjDz8m1vTgkoHn3oqhAy980Cfodxay3fze4icJgWAOsQ
         R/6qa2yJ44Udrlk+rgjYg7wCeUJWlifdXsDJ43GQxH4+rfjMATY7okBkng8r/jo7sHyw
         m06X8Zx66UNkAZCktb+XcwPCiXceUpdIgo6vQTqdp30bABTWLlh0MiqiV/WFdHKu5kYY
         KFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3T3qLoXJFyzAU55vXsgJxe9wRh+sZ8uGNOdGYjcTMTs=;
        b=Th5vtCSH987bZhlLmiI+VwOk0I8VYl1p1/YOnyeCYjJxlhlgpyDISoUCEb+kPjR4zY
         SAWxnO4JPSnAv9vAF463G2eBidlAskZPhjKWFE6kMexCfyQfgvUBUzB5lMroN1CwimZ2
         EMU4Xk/EU0eAKwygGT3BkiF6c8dMSCurGafwrKAYTL3VnFI3klk6cXdwa2i0YN9nFI/l
         jc6sUb5eNneQj4brgZF1/PAaZgXAId69tpdZzKl65poXxrM68coRTGUkzHCoW5OzVvt4
         Rs9OVXOTP4xer0vB7f6s29kWm0zWl2nfzB5aAccM3hyDUQ6XVqNcygqJC/StyrlnfE9u
         Ecpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532eZl33KRRvXoqgQQV4mC1ukuIyTtodtex3zeIveHcdH5kuA7AJ
	XhSzcGJOCwki4JbPz5xXkgQ=
X-Google-Smtp-Source: ABdhPJyeQMW59r+ovC44spayQfSToMO1c/+gNoRsdzAnbwtiLTHubmzAGT1KZna0d0CNTmVBXyRB5Q==
X-Received: by 2002:a9d:1c7:: with SMTP id e65mr22048867ote.147.1595334967221;
        Tue, 21 Jul 2020 05:36:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6a11:: with SMTP id g17ls3898375otn.9.gmail; Tue, 21 Jul
 2020 05:36:06 -0700 (PDT)
X-Received: by 2002:a9d:701b:: with SMTP id k27mr22492223otj.227.1595334966097;
        Tue, 21 Jul 2020 05:36:06 -0700 (PDT)
Date: Tue, 21 Jul 2020 05:36:05 -0700 (PDT)
From: Rick Xu <cutfield@126.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <830ae788-2f93-4f55-a38b-640bd4acb560n@googlegroups.com>
In-Reply-To: <1e8a7abd-91e8-26b2-3446-e9734bcf8d86@siemens.com>
References: <4f73eee2-1784-4049-8fc0-6a889e2ea419o@googlegroups.com>
 <1e8a7abd-91e8-26b2-3446-e9734bcf8d86@siemens.com>
Subject: Re: Is Jailhouse already used on products? And if not what's the
 gap?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1216_1547272802.1595334965398"
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

------=_Part_1216_1547272802.1595334965398
Content-Type: multipart/alternative; 
	boundary="----=_Part_1217_548809486.1595334965398"

------=_Part_1217_548809486.1595334965398
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jan,
  Thanks for your detailed reply~
  Chinese characters are hieroglyphs. What is interesting is that Jailhouse=
=20
translated into Chinese is "=E5=9B=B9=E5=9C=84".
"=E5=9B=B9=E5=9C=84" is very similar to the architecture diagram of Jailhou=
se.

"Is there any plan to pass ISO26262 certification?"----My colleague's=20
question.

Our company's Soc and hardware  will be available soon, with an ARMv8-A CPU=
=20
and our own AI Acceleration unit,
I'll try to make jailhouse running on our hardware. Is there any relevant=
=20
documentation to guide my adaptation work=EF=BC=9F=20



=E5=9C=A82020=E5=B9=B47=E6=9C=8821=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+=
8 =E4=B8=8A=E5=8D=885:27:54<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A

> On 20.07.20 09:57, Rick Xu wrote:
> > Hi,
> >     I'm very interested in this project.
> > For 3 reasons, first, it uses a LINUX as a host OS and then changes it=
=20
> > to a guest OS, so a running host OS was saved.
> > Second, less virtualization and more real-time.
> > Third,  it's easy to use.
> > So, I want to evaluate the feasibility of using it in an automotive=20
> system.
> > I want to know is it mature enough to already been used in some=20
> > products, so I can use this information to enhance the customer's=20
> > confidence.
> > And if it has not been used for products, why?
> > Looking forward to your reply.
> >=20
>
> Jailhouse is primarily useful in two application areas. One is=20
> real-time, splitting of high-performance cores in a AMP setups without=20
> much hacking while providing minimal latencies. There are users out=20
> there, at least one stepped forward officially, see [1]. Furthermore,=20
> Jailhouse is part of processor SDKs that TI and NXP are shipping to=20
> their customers, and not only that just led to [2] - which I think=20
> speaks for itself.
>
> The second, still more research-like area is functional safety. This is=
=20
> our (Siemens) primary focus with Jailhouse. And while we are still=20
> waiting for and even collaborating on developing [3] a certifiable=20
> high-performance multicore hardware, our discussions with external=20
> experts and certification authority made us confident that a key element=
=20
> of the software for complex mixed-critial multicore systems - Jailhouse=
=20
> - will be very well suited and efficiently usable. Once we have a hardwar=
e.
>
> Jan
>
> [1] https://elinux.org/images/6/6e/ELCE2019_Poster-Stojkov-Jailhouse.pdf
> [2]=20
>
> https://github.com/siemens/jailhouse/commit/b6715a3731249ec09a280b2fdbf5e=
4385b1e6677
> [3] https://www.selene-project.eu/
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
jailhouse-dev/830ae788-2f93-4f55-a38b-640bd4acb560n%40googlegroups.com.

------=_Part_1217_548809486.1595334965398
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jan,<div>&nbsp; Thanks for your detailed reply~</div><div>&nbsp; Chinese ch=
aracters are hieroglyphs. What is interesting is that Jailhouse translated =
into Chinese is "<font size=3D"5">=E5=9B=B9=E5=9C=84</font>".</div><div>"=
=E5=9B=B9=E5=9C=84" is very similar to the architecture diagram of Jailhous=
e.</div><div><br></div><div>"Is there any plan to pass ISO26262 certificati=
on?"----My colleague's question.<br></div><div><br></div><div>Our company's=
 Soc and hardware&nbsp; will be available soon, with an ARMv8-A CPU and our=
 own AI Acceleration unit,</div><div>I'll try to make jailhouse running on =
our hardware. Is there any relevant documentation to guide my adaptation wo=
rk=EF=BC=9F&nbsp;</div><div><br><div><br><br></div></div><div class=3D"gmai=
l_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82020=E5=B9=B47=E6=
=9C=8821=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+8 =E4=B8=8A=E5=8D=885:27:5=
4&lt;j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquo=
te class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px sol=
id rgb(204, 204, 204); padding-left: 1ex;">On 20.07.20 09:57, Rick Xu wrote=
:
<br>&gt; Hi,
<br>&gt;  =C2=A0 =C2=A0 I&#39;m very interested in this project.
<br>&gt; For 3 reasons, first, it uses a LINUX as a host OS and then change=
s it=20
<br>&gt; to a guest OS, so a running host OS was saved.
<br>&gt; Second, less virtualization and more real-time.
<br>&gt; Third,=C2=A0 it&#39;s easy to use.
<br>&gt; So, I want to evaluate the feasibility of using it in an automotiv=
e system.
<br>&gt; I want to know is it mature enough to already been used in some=20
<br>&gt; products, so I can use this information to enhance the customer&#3=
9;s=20
<br>&gt; confidence.
<br>&gt; And if it has not been used for products, why?
<br>&gt; Looking forward to your reply.
<br>&gt;=20
<br>
<br>Jailhouse is primarily useful in two application areas. One is=20
<br>real-time, splitting of high-performance cores in a AMP setups without=
=20
<br>much hacking while providing minimal latencies. There are users out=20
<br>there, at least one stepped forward officially, see [1]. Furthermore,=
=20
<br>Jailhouse is part of processor SDKs that TI and NXP are shipping to=20
<br>their customers, and not only that just led to [2] - which I think=20
<br>speaks for itself.
<br>
<br>The second, still more research-like area is functional safety. This is=
=20
<br>our (Siemens) primary focus with Jailhouse. And while we are still=20
<br>waiting for and even collaborating on developing [3] a certifiable=20
<br>high-performance multicore hardware, our discussions with external=20
<br>experts and certification authority made us confident that a key elemen=
t=20
<br>of the software for complex mixed-critial multicore systems - Jailhouse=
=20
<br>- will be very well suited and efficiently usable. Once we have a hardw=
are.
<br>
<br>Jan
<br>
<br>[1] <a href=3D"https://elinux.org/images/6/6e/ELCE2019_Poster-Stojkov-J=
ailhouse.pdf" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"ht=
tps://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://elinux.org/images/6/6e/=
ELCE2019_Poster-Stojkov-Jailhouse.pdf&amp;source=3Dgmail&amp;ust=3D15954159=
30842000&amp;usg=3DAFQjCNE-M5sPqIwAAJEn7iF72uJQHfqUgw">https://elinux.org/i=
mages/6/6e/ELCE2019_Poster-Stojkov-Jailhouse.pdf</a>
<br>[2]=20
<br><a href=3D"https://github.com/siemens/jailhouse/commit/b6715a3731249ec0=
9a280b2fdbf5e4385b1e6677" target=3D"_blank" rel=3D"nofollow" data-saferedir=
ecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://github.com/=
siemens/jailhouse/commit/b6715a3731249ec09a280b2fdbf5e4385b1e6677&amp;sourc=
e=3Dgmail&amp;ust=3D1595415930842000&amp;usg=3DAFQjCNG7qNET3mAMk5RxX7MEOV9f=
iOkHtA">https://github.com/siemens/jailhouse/commit/b6715a3731249ec09a280b2=
fdbf5e4385b1e6677</a>
<br>[3] <a href=3D"https://www.selene-project.eu/" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&am=
p;q=3Dhttps://www.selene-project.eu/&amp;source=3Dgmail&amp;ust=3D159541593=
0842000&amp;usg=3DAFQjCNG3WdiYKF3Qge2WuH3l4xzjbt5_qA">https://www.selene-pr=
oject.eu/</a>
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
om/d/msgid/jailhouse-dev/830ae788-2f93-4f55-a38b-640bd4acb560n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/830ae788-2f93-4f55-a38b-640bd4acb560n%40googlegroups.co=
m</a>.<br />

------=_Part_1217_548809486.1595334965398--

------=_Part_1216_1547272802.1595334965398--

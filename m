Return-Path: <jailhouse-dev+bncBCWY74EX3IPRB74W36TQMGQES35MK3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33f.google.com (mail-ot1-x33f.google.com [IPv6:2607:f8b0:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D39C7932F9
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 Sep 2023 02:44:50 +0200 (CEST)
Received: by mail-ot1-x33f.google.com with SMTP id 46e09a7af769-6b9d34de264sf3634590a34.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Sep 2023 17:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1693961088; x=1694565888; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NMSkce/R46kB7nOQULfDAFPnkovq2d4nSlJv7SOH7RE=;
        b=SaP5u3iuDD/aerdoF6smaHSqdh7Z42QdYZs6TeJTN+PkmuFGC75G9klvcX31wLjavN
         3BXjxVTZ2pcjHqLwUG9q+A+p1WbRLpiepzsFAyUjqSLYaGO5l9nJHfapFn364Iw9lJ7I
         54UvOygIUIKwCA7HemQBv+yOm8FGR2yDtpajMkfPVsb51LET0oPSiGoIimsUPMOem9NO
         ivAzpgqTMpzg05x37kA6d+idd+LVGH5VXtcBroDNV7BldHMQ+L2L7NCce/wjNzHGihiS
         YPwy1JZ88mHEV2RXt6JyUxN/fiuCTBPhRSXpkIsvbjsy0+oTY2dXDgBi1SJH4bKpOyOK
         W41w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693961088; x=1694565888; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMSkce/R46kB7nOQULfDAFPnkovq2d4nSlJv7SOH7RE=;
        b=Pakpc8lJP/ytbIvhXEAYjrLfOtXNZNV7uZQqSpC+r7KQc+ESegFG7P87nOam37vl8J
         mZvUG6JLWE69fKc3jYiNFs+zqsYA567aX+T1LoyW0CF1Sn1V9JcUG9PisUcp9QlJch8Y
         9Dla6AyjOnkMP+rV76sV9OsYoaW3VHNzvW9HPJQIfn4UyBxzaOYk9I4DEOZt3r5U8MSW
         nYk0z8UF3Kvza5fhgphOPemZVKIbpCZgk8rkPNpb3qsZfcP9/Wjq0odOTHwY5kcmSpzE
         9X3wa32iHQSL+AWoRS5QIAWYddVg8Sf0Ux6qbCaJrbMyitoC44Su7jEWhiyzsAlGGyLY
         N4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693961088; x=1694565888;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NMSkce/R46kB7nOQULfDAFPnkovq2d4nSlJv7SOH7RE=;
        b=SywmSevJOtqCFZCF/naK05nEkqv/gW9apf9Ck71QNoygszLMASJXVxoXz3j5nvNwZZ
         tGELIedQhLuLBEL1Vj1fmyNpabKXNjV13CG9Qe1Y4DVzvj8epYFh4OV2yW7vo6ho/xVE
         LmfXJfNk6AMtD2K5nEPQSf3RTDYpd8BdYTv/zVd0Ts80oENNRq7PNF+LG+kDLkJScccO
         wPfR/UyWZ9Zp66lO9AzPMD3ZwTbQ5OGccVexALmdCKDBClSi7YfDfGQUBIS2DKNvDbV4
         OXB0/JqtqnAHWqX5Jt4rW35viiVl5z6BSFQg6ugnAxuN+4kRe5R1rKMxxQqavOhx1XQW
         mB1A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YyyWLrAh4L6ORcz9AU7EDDrb/VDN5Sm+cXKbFd6qNGAWaXWtHtS
	Un9P74NymS+o5vcJ+sRtS8A=
X-Google-Smtp-Source: AGHT+IGGKZb0xXAoA+oax8PA3SHBJ4ZzFF/67EUG5b53bwSsPgA1AQYxhgX7VOBaxfwoSAdVOySLmA==
X-Received: by 2002:a05:6358:4429:b0:134:c984:ab74 with SMTP id z41-20020a056358442900b00134c984ab74mr1689960rwc.9.1693961088503;
        Tue, 05 Sep 2023 17:44:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:358b:b0:268:f0b:2429 with SMTP id
 mm11-20020a17090b358b00b002680f0b2429ls5231195pjb.1.-pod-prod-08-us; Tue, 05
 Sep 2023 17:44:47 -0700 (PDT)
X-Received: by 2002:a17:90a:e281:b0:268:200c:4a9f with SMTP id d1-20020a17090ae28100b00268200c4a9fmr3482245pjz.2.1693961086928;
        Tue, 05 Sep 2023 17:44:46 -0700 (PDT)
Date: Tue, 5 Sep 2023 17:44:45 -0700 (PDT)
From: Zhan Zheng <zzlossdev@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c43555c0-b479-43c3-8afc-41208516a92bn@googlegroups.com>
In-Reply-To: <a4c85fc2-4bf4-4c07-830f-67a60a6d40a6@oth-regensburg.de>
References: <ca381c51-0921-42cf-ad8f-2b6f6727ce6dn@googlegroups.com>
 <a5a7147d-750d-4000-87f5-6ca0cc93fcb2n@googlegroups.com>
 <a4c85fc2-4bf4-4c07-830f-67a60a6d40a6@oth-regensburg.de>
Subject: Re: when enter_hypervisor on rk3568, system reboot without oops
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_17408_2143336604.1693961085877"
X-Original-Sender: zzlossdev@gmail.com
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

------=_Part_17408_2143336604.1693961085877
Content-Type: multipart/alternative; 
	boundary="----=_Part_17409_672600043.1693961085877"

------=_Part_17409_672600043.1693961085877
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


%% ./jailhouse-config-check ~/works/jailhouse/configs/arm64/rk3568.cell=20
Reading configuration set:
  Architecture:  arm64
  Root cell:     RK3568=20
(/home/zyz/works/jailhouse/configs/arm64/rk3568.cell)
Overlapping memory regions inside cell: None
Overlapping memory regions with hypervisor: None
Missing PCI MMCONFIG interceptions: None
Missing resource interceptions for architecture arm64: None
=E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+8=
 18:26:26<Ralf Ramsauer> =E5=86=99=E9=81=93=EF=BC=9A

> Hi,
>
> What does jailhouse config-check report on your system configuration?
>
> Ralf
>
> On 05/09/2023 10:52, Zhan Zheng wrote:
> > dmesg in `screen-exchange`
> >=20
> > =E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C U=
TC+8 16:00:57<Zhan Zheng> =E5=86=99=E9=81=93=EF=BC=9A
> >=20
> > hello, everyone. I'm porting jailhouse to rk3568 which running open
> > harmony.
> > jailhouse.ko, jailhouse.bin, jailhouse were ready, and i wrote a
> > basic root cell to test it.
> > but when i `jailhouse enable rk3568.cell`, the system reboot. can
> > someone help me pls?
> > thanks
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
> https://groups.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6=
ca0cc93fcb2n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6=
ca0cc93fcb2n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>
> --=20
> Mit freundlichen Gr=C3=BC=C3=9Fen
>
> Dr. Ralf Ramsauer
> Labor f=C3=BCr Digitalisierung
> Fakult=C3=A4t f=C3=BCr Informatik und Mathematik
>
> Ostbayerische Technische Hochschule Regensburg
> Galgenbergstrasse 32
> 93053 Regensburg
>
> Tel.: +49 (0)941 943-9267 <+49%20941%209439267>
> E-Mail: ralf.r...@oth-regensburg.de
> http://www.oth-regensburg.de
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c43555c0-b479-43c3-8afc-41208516a92bn%40googlegroups.com.

------=_Part_17409_672600043.1693961085877
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />%% ./jailhouse-config-check ~/works/jailhouse/configs/arm64/rk3568.ce=
ll <br />Reading configuration set:<br />=C2=A0 Architecture: =C2=A0arm64<b=
r />=C2=A0 Root cell: =C2=A0 =C2=A0 RK3568 (/home/zyz/works/jailhouse/confi=
gs/arm64/rk3568.cell)<br />Overlapping memory regions inside cell: None<br =
/>Overlapping memory regions with hypervisor: None<br />Missing PCI MMCONFI=
G interceptions: None<br />Missing resource interceptions for architecture =
arm64: None<br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmai=
l_attr">=E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=
=8C UTC+8 18:26:26&lt;Ralf Ramsauer> =E5=86=99=E9=81=93=EF=BC=9A<br/></div>=
<blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left=
: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi,
<br>
<br>What does jailhouse config-check report on your system configuration?
<br>
<br>   Ralf
<br>
<br>On 05/09/2023 10:52, Zhan Zheng wrote:
<br>&gt; dmesg in `screen-exchange`
<br>&gt;=20
<br>&gt; =E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=
=8C UTC+8 16:00:57&lt;Zhan Zheng&gt; =E5=86=99=E9=81=93=EF=BC=9A
<br>&gt;=20
<br>&gt;     hello, everyone. I&#39;m porting jailhouse to rk3568 which run=
ning open
<br>&gt;     harmony.
<br>&gt;     jailhouse.ko, jailhouse.bin, jailhouse were ready, and i wrote=
 a
<br>&gt;     basic root cell to test it.
<br>&gt;     but when i `jailhouse enable rk3568.cell`, the system reboot. =
can
<br>&gt;     someone help me pls?
<br>&gt;     thanks
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a5a7147=
d-750d-4000-87f5-6ca0cc93fcb2n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87=
f5-6ca0cc93fcb2n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16940473=
68463000&amp;usg=3DAOvVaw06a8HVkAHdrtD_v_hdvB6y">https://groups.google.com/=
d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6ca0cc93fcb2n%40googlegroups.=
com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a5a7=
147d-750d-4000-87f5-6ca0cc93fcb2n%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirectu=
rl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.google.c=
om/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6ca0cc93fcb2n%2540googlegr=
oups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;us=
t=3D1694047368463000&amp;usg=3DAOvVaw1PjlFAeM06GuZA3HGy6lDu">https://groups=
.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6ca0cc93fcb2n%40g=
ooglegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br>
<br>--=20
<br>Mit freundlichen Gr=C3=BC=C3=9Fen
<br>
<br>Dr. Ralf Ramsauer
<br>Labor f=C3=BCr Digitalisierung
<br>Fakult=C3=A4t f=C3=BCr Informatik und Mathematik
<br>
<br>Ostbayerische Technische Hochschule Regensburg
<br>Galgenbergstrasse 32
<br>93053 Regensburg
<br>
<br>Tel.: <a href=3D"tel:+49%20941%209439267" value=3D"+499419439267" targe=
t=3D"_blank" rel=3D"nofollow">+49 (0)941 943-9267</a>
<br>E-Mail: <a href data-email-masked rel=3D"nofollow">ralf.r...@oth-regens=
burg.de</a>
<br><a href=3D"http://www.oth-regensburg.de" target=3D"_blank" rel=3D"nofol=
low" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3D=
http://www.oth-regensburg.de&amp;source=3Dgmail&amp;ust=3D1694047368463000&=
amp;usg=3DAOvVaw3L7QRLMweBCSEA1tskSPTT">http://www.oth-regensburg.de</a>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c43555c0-b479-43c3-8afc-41208516a92bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c43555c0-b479-43c3-8afc-41208516a92bn%40googlegroups.co=
m</a>.<br />

------=_Part_17409_672600043.1693961085877--

------=_Part_17408_2143336604.1693961085877--

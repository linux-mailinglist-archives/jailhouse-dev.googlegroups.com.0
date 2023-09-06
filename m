Return-Path: <jailhouse-dev+bncBCPOLQPRTECBBWPJ36TQMGQE3QFQJ6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1037.google.com (mail-pj1-x1037.google.com [IPv6:2607:f8b0:4864:20::1037])
	by mail.lfdr.de (Postfix) with ESMTPS id 595F079342F
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 Sep 2023 05:41:15 +0200 (CEST)
Received: by mail-pj1-x1037.google.com with SMTP id 98e67ed59e1d1-26cf9b8f209sf3394871a91.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Sep 2023 20:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1693971674; x=1694576474; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gKh3iiosb1+KdlBFr3yuOrcesX/Qe5dvHxJuhRyqoYs=;
        b=ZBfstWjEJpX7+9wXdOr8kknj6/zR8hGDGYjDsbbhRvN1DGKP7gaohg1P++9HJ5HbWt
         3tg5xgzX9/n7ObnZ+n/Ad+A5HPi7YrvyinhO2V2qcNgztFPHx2Nz4LplKvR4xq/iZP3e
         UTOiPMxhjv+HYZb8T+5aWvH7ZjzSOqS+P8kN1CRsUH/jFQUPL+IuqGHfPTfInYq0oF8A
         KLLERYdxRMpy54pD7sTA25VfxFPDQxFylpqyQOhd2StAvmJgNtR15YZlk0NOsGFgG7pl
         XI46/cR1IuTRjQag8eUaSyWrEzyvsUX4vrYzryglWCryGnY6QCoBX1bgCM3pkYYzDEFa
         acLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693971674; x=1694576474; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKh3iiosb1+KdlBFr3yuOrcesX/Qe5dvHxJuhRyqoYs=;
        b=PD5vQxIdLk0kr5BKxQytMkKVCUqtBCZNg4u1C61ltvg/ke87z2n8nY8bs3SAslPcup
         lvUZKr+LOh5HXTthsQlbESYFu1NHjvHUp9Eqa+6vhMgcD9Mo3mwIabMLW4whWmJVpc1E
         l8P4XWduDj22JiNyRQ/TE9MU+kMynBNCpUFXQiDIuVsWDcSJpLGRogsPlhCuV0ulyRgx
         AirXWOQ/bdyLOGzQt/HmSRx2KMY5qHQSDsZc6xiI5dW2FoeEfODGCd7dofmmbqB9Woz/
         7v+DKA5l5Yo5hPrgpY779FG6RYSfdLmNtkgeIQUoAI1I7E2cA/O+X2VFGpTbZ7u3efND
         8lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693971674; x=1694576474;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gKh3iiosb1+KdlBFr3yuOrcesX/Qe5dvHxJuhRyqoYs=;
        b=AfEyud33/U+uA2Au9+8z3Q0mCyoGPQOuFF886edkj+HcGdjyiuqRXPP1WHJWvS8+gp
         G6kACfcMU++D7kC8lh9dUPYL8oBkMC6CZsci/l9+DO7ZUBOomIakq1gtkndJqVFuB8YD
         LvOAs4QSq4MJ1eso2xM8MOoyIejKiWPpBzPFxRTRfaRB6c2jUa/Nv8pE/JJzFTsbtkQU
         CSNPxC9Y6fMbP33LGbF/S28Vff++sKn66xVW6YAnQ5DBdMVhhEe95cLKZDhCSVkTUc/g
         560kzeP4iMDMewLSN1f2n6gVRkau9OUyIIsF4bLiroTOa0cCjXf3IMb/bM90uZ1uHEqc
         LE6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxAXcs4otTGn8cEmUpjtz8phm56HfC1gXJpJef86Ur+fXv1CXvP
	pKI0KN/DKbkXW9JwQzXptm4=
X-Google-Smtp-Source: AGHT+IFhAdSgEXK6EHiGQNPSXiKlYDjTLNHYl5TvxdRN3J/wYQq44Yg6A+G6dP2irIM+2nRAivxYOg==
X-Received: by 2002:a17:90b:1e0c:b0:26b:6df8:eb69 with SMTP id pg12-20020a17090b1e0c00b0026b6df8eb69mr11339103pjb.1.1693971673819;
        Tue, 05 Sep 2023 20:41:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:1882:b0:268:14f6:5312 with SMTP id
 mn2-20020a17090b188200b0026814f65312ls5309700pjb.2.-pod-prod-08-us; Tue, 05
 Sep 2023 20:41:12 -0700 (PDT)
X-Received: by 2002:a17:90a:fe8b:b0:268:5c5d:25cf with SMTP id co11-20020a17090afe8b00b002685c5d25cfmr3545925pjb.4.1693971672616;
        Tue, 05 Sep 2023 20:41:12 -0700 (PDT)
Date: Tue, 5 Sep 2023 20:41:11 -0700 (PDT)
From: bot crack <unintialized@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <30d1fba1-3c8e-4ffd-9740-e5e11b544ff3n@googlegroups.com>
In-Reply-To: <6c49d31b-6f95-4311-a02f-597fa6617c2en@googlegroups.com>
References: <ca381c51-0921-42cf-ad8f-2b6f6727ce6dn@googlegroups.com>
 <a5a7147d-750d-4000-87f5-6ca0cc93fcb2n@googlegroups.com>
 <a4c85fc2-4bf4-4c07-830f-67a60a6d40a6@oth-regensburg.de>
 <c43555c0-b479-43c3-8afc-41208516a92bn@googlegroups.com>
 <6c49d31b-6f95-4311-a02f-597fa6617c2en@googlegroups.com>
Subject: Re: when enter_hypervisor on rk3568, system reboot without oops
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_14702_1035476914.1693971671696"
X-Original-Sender: unintialized@gmail.com
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

------=_Part_14702_1035476914.1693971671696
Content-Type: multipart/alternative; 
	boundary="----=_Part_14703_532120158.1693971671696"

------=_Part_14703_532120158.1693971671696
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Does linux enable CONFIG_VIRTUALIZATION? What about KVM?

On Wednesday, September 6, 2023 at 11:18:25=E2=80=AFAM UTC+8 Zhan Zheng wro=
te:

> i tracked the codes, and found out the 'hypervisor/arch/arm64/entry.S: hv=
c=20
> #0' turn the machine reboot, can anyone point out the reason for me?
> thanks
>
> =E5=9C=A82023=E5=B9=B49=E6=9C=886=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC=
+8 08:44:46<Zhan Zheng> =E5=86=99=E9=81=93=EF=BC=9A
>
>>
>> %% ./jailhouse-config-check ~/works/jailhouse/configs/arm64/rk3568.cell=
=20
>> Reading configuration set:
>>   Architecture:  arm64
>>   Root cell:     RK3568=20
>> (/home/zyz/works/jailhouse/configs/arm64/rk3568.cell)
>> Overlapping memory regions inside cell: None
>> Overlapping memory regions with hypervisor: None
>> Missing PCI MMCONFIG interceptions: None
>> Missing resource interceptions for architecture arm64: None
>> =E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UT=
C+8 18:26:26<Ralf Ramsauer> =E5=86=99=E9=81=93=EF=BC=9A
>>
>>> Hi,=20
>>>
>>> What does jailhouse config-check report on your system configuration?=
=20
>>>
>>> Ralf=20
>>>
>>> On 05/09/2023 10:52, Zhan Zheng wrote:=20
>>> > dmesg in `screen-exchange`=20
>>> >=20
>>> > =E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C=
 UTC+8 16:00:57<Zhan Zheng> =E5=86=99=E9=81=93=EF=BC=9A=20
>>> >=20
>>> > hello, everyone. I'm porting jailhouse to rk3568 which running open=
=20
>>> > harmony.=20
>>> > jailhouse.ko, jailhouse.bin, jailhouse were ready, and i wrote a=20
>>> > basic root cell to test it.=20
>>> > but when i `jailhouse enable rk3568.cell`, the system reboot. can=20
>>> > someone help me pls?=20
>>> > thanks=20
>>> >=20
>>> > --=20
>>> > You received this message because you are subscribed to the Google=20
>>> > Groups "Jailhouse" group.=20
>>> > To unsubscribe from this group and stop receiving emails from it, sen=
d=20
>>> > an email to jailhouse-de...@googlegroups.com=20
>>> > <mailto:jailhouse-de...@googlegroups.com>.=20
>>> > To view this discussion on the web visit=20
>>> >=20
>>> https://groups.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5=
-6ca0cc93fcb2n%40googlegroups.com=20
>>> <
>>> https://groups.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5=
-6ca0cc93fcb2n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=
=20
>>>
>>>
>>> --=20
>>> Mit freundlichen Gr=C3=BC=C3=9Fen=20
>>>
>>> Dr. Ralf Ramsauer=20
>>> Labor f=C3=BCr Digitalisierung=20
>>> Fakult=C3=A4t f=C3=BCr Informatik und Mathematik=20
>>>
>>> Ostbayerische Technische Hochschule Regensburg=20
>>> Galgenbergstrasse 32=20
>>> 93053 Regensburg=20
>>>
>>> Tel.: +49 (0)941 943-9267 <+49%20941%209439267>=20
>>> E-Mail: ralf.r...@oth-regensburg.de=20
>>> http://www.oth-regensburg.de=20
>>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/30d1fba1-3c8e-4ffd-9740-e5e11b544ff3n%40googlegroups.com.

------=_Part_14703_532120158.1693971671696
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Does linux enable CONFIG_VIRTUALIZATION? What about KVM?<br /><br /><div cl=
ass=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Wednesday, Se=
ptember 6, 2023 at 11:18:25=E2=80=AFAM UTC+8 Zhan Zheng wrote:<br/></div><b=
lockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: =
1px solid rgb(204, 204, 204); padding-left: 1ex;">i tracked the codes, and =
found out the &#39;hypervisor/arch/arm64/entry.S: hvc #0&#39; turn the mach=
ine reboot, can anyone point out the reason for me?<div>thanks<br><br></div=
><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=
=A82023=E5=B9=B49=E6=9C=886=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8 08:44=
:46&lt;Zhan Zheng&gt; =E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><br>%% ./jailhouse-config-check ~/works/jailhou=
se/configs/arm64/rk3568.cell <br>Reading configuration set:<br>=C2=A0 Archi=
tecture: =C2=A0arm64<br>=C2=A0 Root cell: =C2=A0 =C2=A0 RK3568 (/home/zyz/w=
orks/jailhouse/configs/arm64/rk3568.cell)<br>Overlapping memory regions ins=
ide cell: None<br>Overlapping memory regions with hypervisor: None<br>Missi=
ng PCI MMCONFIG interceptions: None<br>Missing resource interceptions for a=
rchitecture arm64: None<br><div class=3D"gmail_quote"><div dir=3D"auto" cla=
ss=3D"gmail_attr">=E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=
=9F=E4=BA=8C UTC+8 18:26:26&lt;Ralf Ramsauer&gt; =E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,
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
<br>&gt; an email to <a rel=3D"nofollow">jailhouse-de...@googlegroups.com</=
a>=20
<br>&gt; &lt;mailto:<a rel=3D"nofollow">jailhouse-de...@googlegroups.com</a=
>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a5a7147=
d-750d-4000-87f5-6ca0cc93fcb2n%40googlegroups.com" rel=3D"nofollow" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;=
q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5=
-6ca0cc93fcb2n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1694057822=
266000&amp;usg=3DAOvVaw2yIOxeCUFqR4tHet9xoQlU">https://groups.google.com/d/=
msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6ca0cc93fcb2n%40googlegroups.co=
m</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a5a714=
7d-750d-4000-87f5-6ca0cc93fcb2n%40googlegroups.com?utm_medium=3Demail&amp;u=
tm_source=3Dfooter" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6ca0cc93fcb2n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
694057822266000&amp;usg=3DAOvVaw0m-fIK6Yfz6DnHsGS-AMuj">https://groups.goog=
le.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6ca0cc93fcb2n%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
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
<br>Tel.: <a href=3D"tel:+49%20941%209439267" value=3D"+499419439267" rel=
=3D"nofollow" target=3D"_blank">+49 (0)941 943-9267</a>
<br>E-Mail: <a rel=3D"nofollow">ralf.r...@oth-regensburg.de</a>
<br><a href=3D"http://www.oth-regensburg.de" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
p://www.oth-regensburg.de&amp;source=3Dgmail&amp;ust=3D1694057822266000&amp=
;usg=3DAOvVaw1ec6N2lX7uGmTzuinTEJwi">http://www.oth-regensburg.de</a>
<br></blockquote></div></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/30d1fba1-3c8e-4ffd-9740-e5e11b544ff3n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/30d1fba1-3c8e-4ffd-9740-e5e11b544ff3n%40googlegroups.co=
m</a>.<br />

------=_Part_14703_532120158.1693971671696--

------=_Part_14702_1035476914.1693971671696--

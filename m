Return-Path: <jailhouse-dev+bncBDQKRTU7ZIKBBJXH3SMAMGQE56NPZBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x39.google.com (mail-oa1-x39.google.com [IPv6:2001:4860:4864:20::39])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FA45AE6DE
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Sep 2022 13:48:56 +0200 (CEST)
Received: by mail-oa1-x39.google.com with SMTP id 586e51a60fabf-126cb03a64esf3889906fac.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 06 Sep 2022 04:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date;
        bh=oAUS+7GvgqwJLNhlzQjx1SAs05gCPup+ac9AKKb4E3s=;
        b=feTyN1pwz8EuX86RXbrz2ucQAoKSUQnLMCjjw+ataVFm/xhYWayN9yPdAPVyHn8q3Z
         FbXSyj24DBwdW4WXC3cb7WP2nMsj7sqR1Jb1oGuGlwfr+4KBNhUZSCYhCJrtkAz08TBC
         51kflJwbaxabORO8UdCT0oCxB4h3E4fUmHmwTZay6LER5BOpMns7kQYrW1yoclYBz7Oy
         gTDMAmAL4Rhs/zWNWLXFceWwTC+/+svZjdjZDCctCTPwTK50JeQsEyZGE4/GMkhA4zmU
         qei8YHWJ/5t09oCB2CXuOqLwOcEzGa5zBMHaPkjvywf3FoKkJWxQwaTg6HaDVgRPePhP
         9+6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date;
        bh=oAUS+7GvgqwJLNhlzQjx1SAs05gCPup+ac9AKKb4E3s=;
        b=o9KnkVYdjS0xMO8LzmFvtVySZuGrSRPYEi0LZ0jivTl4MIg6j1M5y/SdFR0UYc2ecc
         DkNRgwxB7Uc64XVLHB4j2oRZzGuVIkG1Tsiy/s7cy2zQAQ/498Nv6V3QGqDFu3jQpA6a
         9iYcNNqaZNadyzF46ZoUSplk5Fys3eZL48YSDuOalGxbILIo0Ua0qCgF9BOtU9bdv5QY
         Ozp+9ynj8lL51JR2K1tv1xrWgwIGl409Y72faB++7NhPFXJvujLdXUvEKHjkGyAupLE/
         GD9Py9HczXuEned+di4FqkTWc3x556V52JoMRZiLOeMwRX5eQ2QoUqHnV3I3sNpnsFuz
         uAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date;
        bh=oAUS+7GvgqwJLNhlzQjx1SAs05gCPup+ac9AKKb4E3s=;
        b=gNmXp7fbq0DnwT57PylpbXSC4J+IIEZTxfazv80PS9GSvSievqdLL5GGudvqx0sadL
         jXhL8UlxIXjvyG4/Kj09Kx1nb8X6YW/B7wFcUdD1nNEdeHd79aVJoju/3SAvIE+U7vRX
         vC59axK0KWyRGU0P/crfx/cgffdbncDkgx48KXt3nDIDhynSBJpIgodYXUb5xbVdUmWk
         +9NlTpM8WUlJQhgMFKXSkVF9R1uy2nmnnj1IXkYY5tefVD0BaMcnA206p/A85sxeTIpq
         9FcqmWObTNAHz8XGZXCN+KpfhJ75GJcOcOfu37ObsiSSDeyQyl3cAIRtnMp1HD9XMnVb
         KUsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo3S7VKbq47rKuUE8VZUIREs89m2L3emX3du6UbBsDAMnXe6b+2O
	1IiqAmpcWvcs4Z5rzDCAVqw=
X-Google-Smtp-Source: AA6agR4zuWE9muKp/LECmoiTDEwiGTvFE6kiZN1HNXRB8nTM5fFmJuacs8vCZieh22wmKBEWI1urig==
X-Received: by 2002:a05:6830:43a8:b0:637:21f6:7d23 with SMTP id s40-20020a05683043a800b0063721f67d23mr21576044otv.146.1662464935316;
        Tue, 06 Sep 2022 04:48:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:5b55:0:b0:344:ef1b:a321 with SMTP id p82-20020aca5b55000000b00344ef1ba321ls4420396oib.9.-pod-prod-gmail;
 Tue, 06 Sep 2022 04:48:54 -0700 (PDT)
X-Received: by 2002:aca:d845:0:b0:345:4295:e957 with SMTP id p66-20020acad845000000b003454295e957mr9375364oig.199.1662464934321;
        Tue, 06 Sep 2022 04:48:54 -0700 (PDT)
Date: Tue, 6 Sep 2022 04:48:53 -0700 (PDT)
From: star sun <sunxing960116@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <94711c27-9271-416b-936b-4f4eb6a96dabn@googlegroups.com>
In-Reply-To: <CAEfxd-9GKVN9AeoZj8-c+8NYt=BpFU7987_eCHfbEpftn9oo5g@mail.gmail.com>
References: <3fdb914d-9ec7-4a5b-93e4-d07333100ff3n@googlegroups.com>
 <20220811133427.336a5da7@md1za8fc.ad001.siemens.net>
 <ca47dc3f-0b85-47ad-8c9e-64713730e19dn@googlegroups.com>
 <CAEfxd-9GKVN9AeoZj8-c+8NYt=BpFU7987_eCHfbEpftn9oo5g@mail.gmail.com>
Subject: =?UTF-8?Q?Re:_Ask_for_help=EF=BC=8Cabout_cpu_d?=
 =?UTF-8?Q?own_after_jailhouse_enable=E3=80=82=E3=80=82?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5728_1812851227.1662464933747"
X-Original-Sender: sunxing960116@gmail.com
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

------=_Part_5728_1812851227.1662464933747
Content-Type: multipart/alternative; 
	boundary="----=_Part_5729_1318116613.1662464933747"

------=_Part_5729_1318116613.1662464933747
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


You are right! Thank you very much for your help!=20
I have successfully executed the jailhouse on my device.

But I have another question. I noticed that Jailhouse shuts down the CPU vi=
rtually instead of physically. What's the purpose of this?=20
I tried to power off the CPU without going through EL2, but the result was =
that it could not be powered back on. Of course I changed some parameters s=
tate parameters in the structure, if not ignored ones. Is it feasible?

Thank you again for your time~ =20




=E5=9C=A82022=E5=B9=B48=E6=9C=8816=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+=
8 21:09:43<van.f...@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A

> You are using Android with Trusty in inmate cell? jailhouse not support t=
rusty SMC handler. So you need add that SMC handler in jailhouse.
>
>
> Regards,
>
> Peng
>
>
> star sun <sunxin...@gmail.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=8812=E6=97=
=A5=E5=91=A8=E4=BA=94 13:47=E5=86=99=E9=81=93=EF=BC=9A
>
>>
>> Thanks for your reply!
>>
>> Before jailhouse enable, the CPU can be powered on and off normally.=20
>>
>> But after that,  offline cpu(echo 0 > /sys/devices/system/cpu/cpu3/onlin=
e) causes panic,  even without jailhouse create. =20
>>
>>
>> =E5=9C=A82022=E5=B9=B48=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B U=
TC+8 19:34:32<Henning Schild> =E5=86=99=E9=81=93=EF=BC=9A
>>
>>> Am Wed, 10 Aug 2022 23:29:16 -0700 (PDT)=20
>>> schrieb star sun <sunxin...@gmail.com>:=20
>>>
>>> > i want make jailhouse working in one phone with 4 cortex-a53 cpu.=20
>>> >=20
>>> > I feel like I've successfully executed jailhouse enbale.=20
>>> > unfortunately, there is a kernel panic when i down one cpu for a=20
>>> > non-root-cell during jialhouse cell create .=20
>>> >=20
>>> > This question has puzzled me for a long time Do you have any good=20
>>> > methods? thank you=20
>>>
>>> You could try offlining one or more CPUs with your stock kernel and not=
=20
>>> even the jailhouse module loaded. If that also causes problems you are=
=20
>>> likely dealing with a vendor kernel that has been patched to become=20
>>> sort of broken.=20
>>>
>>> echo 0 > /sys/devices/system/cpu/cpu3/online=20
>>>
>>> writing a 1 will bring it back.=20
>>>
>>> This should work before you even start with jailhouse.=20
>>>
>>> Henning=20
>>>
>> --=20
>> You received this message because you are subscribed to the Google Group=
s=20
>> "Jailhouse" group.
>> To unsubscribe from this group and stop receiving emails from it, send a=
n=20
>> email to jailhouse-de...@googlegroups.com.
>> To view this discussion on the web visit=20
>> https://groups.google.com/d/msgid/jailhouse-dev/ca47dc3f-0b85-47ad-8c9e-=
64713730e19dn%40googlegroups.com=20
>> <https://groups.google.com/d/msgid/jailhouse-dev/ca47dc3f-0b85-47ad-8c9e=
-64713730e19dn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
>> .
>>
>
>
> --=20
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/94711c27-9271-416b-936b-4f4eb6a96dabn%40googlegroups.com.

------=_Part_5729_1318116613.1662464933747
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div>You&nbsp;are&nbsp;right!&nbsp;Thank&nbsp;you&nbsp;very&nbsp;=
much&nbsp;for&nbsp;your&nbsp;help!&nbsp;<br>I&nbsp;have&nbsp;successfully&n=
bsp;executed&nbsp;the&nbsp;jailhouse&nbsp;on&nbsp;my&nbsp;device.<br><br>Bu=
t&nbsp;I&nbsp;have&nbsp;another&nbsp;question.&nbsp;I&nbsp;noticed&nbsp;tha=
t&nbsp;Jailhouse&nbsp;shuts&nbsp;down&nbsp;the&nbsp;CPU&nbsp;virtually&nbsp=
;instead&nbsp;of&nbsp;physically.&nbsp;What's&nbsp;the&nbsp;purpose&nbsp;of=
&nbsp;this?&nbsp;<br>I&nbsp;tried&nbsp;to&nbsp;power&nbsp;off&nbsp;the&nbsp=
;CPU&nbsp;without&nbsp;going&nbsp;through&nbsp;EL2,&nbsp;but&nbsp;the&nbsp;=
result&nbsp;was&nbsp;that&nbsp;it&nbsp;could&nbsp;not&nbsp;be&nbsp;powered&=
nbsp;back&nbsp;on.&nbsp;Of&nbsp;course&nbsp;I&nbsp;changed&nbsp;some&nbsp;p=
arameters&nbsp;state&nbsp;parameters&nbsp;in&nbsp;the&nbsp;structure,&nbsp;=
if&nbsp;not&nbsp;ignored&nbsp;ones.&nbsp;Is&nbsp;it&nbsp;feasible?<br><br>T=
hank&nbsp;you&nbsp;again&nbsp;for&nbsp;your&nbsp;time~&nbsp;&nbsp;<br><br><=
br><br><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr=
">=E5=9C=A82022=E5=B9=B48=E6=9C=8816=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UT=
C+8 21:09:43&lt;van.f...@gmail.com&gt; =E5=86=99=E9=81=93=EF=BC=9A<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-lef=
t: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div dir=3D"ltr"><pre =
style=3D"font-family:&quot;Courier New&quot;,Courier,monospace,arial,sans-s=
erif;margin-top:0px;margin-bottom:0px;white-space:pre-wrap;color:rgb(0,0,0)=
;font-size:14px">You are using Android with Trusty in inmate cell? jailhous=
e not support trusty SMC handler. So you need add that SMC handler in jailh=
ouse.</pre><pre style=3D"font-family:&quot;Courier New&quot;,Courier,monosp=
ace,arial,sans-serif;margin-top:0px;margin-bottom:0px;white-space:pre-wrap;=
color:rgb(0,0,0);font-size:14px"><br></pre><pre style=3D"font-family:&quot;=
Courier New&quot;,Courier,monospace,arial,sans-serif;margin-top:0px;margin-=
bottom:0px;white-space:pre-wrap;color:rgb(0,0,0);font-size:14px">Regards,</=
pre><pre style=3D"font-family:&quot;Courier New&quot;,Courier,monospace,ari=
al,sans-serif;margin-top:0px;margin-bottom:0px;white-space:pre-wrap;color:r=
gb(0,0,0);font-size:14px">Peng</pre></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">star sun &lt;<a href=3D"" data-email-ma=
sked=3D"" rel=3D"nofollow">sunxin...@gmail.com</a>&gt; =E4=BA=8E2022=E5=B9=
=B48=E6=9C=8812=E6=97=A5=E5=91=A8=E4=BA=94 13:47=E5=86=99=E9=81=93=EF=BC=9A=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"></blockquote></=
div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>Thanks&nbsp;for&nbsp;your&nbsp;reply!<br><br>Before&nbsp;jailhous=
e&nbsp;enable,&nbsp;the&nbsp;CPU&nbsp;can&nbsp;be&nbsp;powered&nbsp;on&nbsp=
;and&nbsp;off&nbsp;normally.&nbsp;<br>But&nbsp;after&nbsp;that,&nbsp;&nbsp;=
offline&nbsp;cpu(echo&nbsp;0&nbsp;&gt;&nbsp;/sys/devices/system/cpu/cpu3/on=
line)&nbsp;causes&nbsp;panic,&nbsp;&nbsp;even&nbsp;without&nbsp;jailhouse&n=
bsp;create.&nbsp;&nbsp;<br><br><br><div class=3D"gmail_quote"><div dir=3D"a=
uto" class=3D"gmail_attr">=E5=9C=A82022=E5=B9=B48=E6=9C=8811=E6=97=A5=E6=98=
=9F=E6=9C=9F=E5=9B=9B UTC+8 19:34:32&lt;Henning Schild&gt; =E5=86=99=E9=81=
=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am =
Wed, 10 Aug 2022 23:29:16 -0700 (PDT)
<br>schrieb star sun &lt;<a rel=3D"nofollow">sunxin...@gmail.com</a>&gt;:
<br>
<br>&gt;  i want make jailhouse working in one phone with 4 cortex-a53 cpu.
<br>&gt;=20
<br>&gt; I feel like I've successfully executed jailhouse enbale.
<br>&gt; unfortunately, there is a kernel panic    when i down one cpu for =
a=20
<br>&gt; non-root-cell during jialhouse cell create .
<br>&gt;=20
<br>&gt; This question has puzzled me for a long time    Do you have any go=
od=20
<br>&gt; methods? thank you
<br>
<br>You could try offlining one or more CPUs with your stock kernel and not
<br>even the jailhouse module loaded. If that also causes problems you are
<br>likely dealing with a vendor kernel that has been patched to become
<br>sort of broken.
<br>
<br>echo 0 &gt; /sys/devices/system/cpu/cpu3/online
<br>
<br>writing a 1 will bring it back.
<br>
<br>This should work before you even start with jailhouse.
<br>
<br>Henning
<br></blockquote></div>

<p></p></blockquote></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">

-- <br>
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"" data-email-masked=3D"" rel=3D"nofollow">jailhouse-de..=
.@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ca47dc3f-0b85-47ad-8c9e-64713730e19dn%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/ca47dc3f-0b85-47ad-8c=
9e-64713730e19dn%2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfoo=
ter&amp;source=3Dgmail&amp;ust=3D1662551052341000&amp;usg=3DAOvVaw0l92l5RrY=
liiCoAisyPRLD">https://groups.google.com/d/msgid/jailhouse-dev/ca47dc3f-0b8=
5-47ad-8c9e-64713730e19dn%40googlegroups.com</a>.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><br></div></div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/94711c27-9271-416b-936b-4f4eb6a96dabn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/94711c27-9271-416b-936b-4f4eb6a96dabn%40googlegroups.co=
m</a>.<br />

------=_Part_5729_1318116613.1662464933747--

------=_Part_5728_1812851227.1662464933747--

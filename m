Return-Path: <jailhouse-dev+bncBCW4LL4WQ4PBBFVO52LQMGQE76AEPZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113b.google.com (mail-yw1-x113b.google.com [IPv6:2607:f8b0:4864:20::113b])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B4A595CDB
	for <lists+jailhouse-dev@lfdr.de>; Tue, 16 Aug 2022 15:09:44 +0200 (CEST)
Received: by mail-yw1-x113b.google.com with SMTP id 00721157ae682-3328a211611sf54478737b3.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 16 Aug 2022 06:09:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1660655383; cv=pass;
        d=google.com; s=arc-20160816;
        b=UDT6WQMeyetV4C2A9HA17LjF7nDtvIEzFYXLMdqpsE7kCa/8kaM4TjaySz7MRzoera
         HUfldEA6Iu5v2IgPBgw9EMZ07lP7G41bzYO+CC7P/sg5QAzS8dVGnFfPOPWuT2752eJG
         B7OAc26ZGOhN5YfKAoxpij6vBcNIB/62RVJWv0lw/Yz9RBcfFh2MF+UbDczrjFbDFndm
         4o9pKmF4K0vcOps+q6Ekyb7Ua4EiGMcgSGsqeB+AP1FpEbpoaXA/8v1ocPfnLqx8/nm5
         KXDegwnsui8OfOPxGyq17wuu2KzaQoVlmvs/nqiQNw37BrA5B9yLjeZ9j+Eq4oZssHDG
         /Fzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=hs3QtvhVtgsxjU2ysNoXeu0n6cD+TZvinNctiPMS4/k=;
        b=vO91WYmRXvFmOah9dkfYDNcyYU1HwYDcqJZbTvnsaKEdIwZlihwQ8clGnAKKawW9PC
         MtcpSFxYDslHkFqzOCilrZ/jCAmtGzJD7fS9SP97MtjII11CkJB5ebkxONyx8hwCglUg
         IRlAoxL13vsTJuR4ro8oIZbwBDDiqeDy1L/RhW9QMrXgbDhMvBd0EVuAcWdyQOY+jGR0
         qhChL6sST0g3hxfCB5AO0HKFTY3B185SK11vIEuArz3dZlyFBM8e+jcmLETxyLK8Bdem
         WTPzX8eZ4ZPKJJgEu4m2DLkgt/eBKWTkSM8hS2KxY/l8q18BDh9adyqcy/HeWXLCd7Te
         ULyg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=EZErm0SW;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f31 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc;
        bh=hs3QtvhVtgsxjU2ysNoXeu0n6cD+TZvinNctiPMS4/k=;
        b=CttFqcY15/u5DUceQqSyp47sfZSZouYG4+0hGwFOPYm8j52snpblKaMQGTHBb7M6/9
         yJsRN9cat9WVr0SxLjmzW5sGSwloHzIuQqEZlpvUCzxggqKt3LjNF1VbpVSr043kRkl7
         8jPddmO+piC241IZclLemEh/BU+zrMXRBDQrfUaJTjz6rvmIPn8W5kLVHrJH+gNl5Ahq
         z+Aj0Nw2pcPV5ckwOkEiLge/x4hpSAyUWQ23SuyT5dVvKftTMBwBJiHNfPdZ3zF+7NL3
         /bz0TkiS9WxYosUYgw2wx/U1v3b3cJXScz/3xydXXBr70nU2VoWSNTmu5RdctrqC1LcP
         alPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc;
        bh=hs3QtvhVtgsxjU2ysNoXeu0n6cD+TZvinNctiPMS4/k=;
        b=iwOOkKF8UmaX8l5LDJMH+tyteP7PHAoyZVT8VVG5mjiuS5/5JxqDPB8K93IBkxdg3M
         m1+yUKtxQL1mJ2v6K6CZV9j3vgui+fWSMgFKsbJU9UFEBEBLfE7YL7pFemajmlPxfDev
         oFcb3bVRla1vxuytKPxrKLkhK6vXxx4BsAvIXeuXcdZxir27rrGpft39CT3b1RsSCyR8
         dO8ccnsbZDxrPU5pvfPr1ZoUXaS+JoHLoEt9p1HCMpwMfZO2nXdbpjqKVLOcA9zyjhaY
         nwJYJvbauQCuxCJOhdOggP0kAv/LHg16rgqD+e1TTeHzVIC09YsbvhJNSleh7pC1FlJK
         hsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc;
        bh=hs3QtvhVtgsxjU2ysNoXeu0n6cD+TZvinNctiPMS4/k=;
        b=TO7/fVtteoguBklZlZWxN7r6paQllwqRv9EKifHreXzvFTWRalIJXQQf1ghYDEHkVr
         MYTD07UtcevUPTBuprxK1u9KxA7Q2BZqFOU3MvQ88tf/o3vpnBgD8wnPHML7+nRkdVS/
         WnNyQxmybXOOA6WZxzHfcjyHNqZens3i0r7xDkvLvC+RK8g3NFfKnHEP3tQ8F/28cJNj
         JiMOl7+0mIyg4zYSlG0qI24dBvYqFR/PPC+b9DFKRSkThPHAXWc91Sr5eSzIKlujg5DH
         AKy4gMUNuPZDaVJJliDp+e4ML+qHEvKBb7fAeYF/Fk4dmQv2BPNMR1eSjbNzSSi/Zkrn
         Vcaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo32rMoCjEuPPJA+XkglfMWuPBFLZDMKjMd8Pyn+uyfKrBdI0mJy
	VAszTpLMUAW2DSv4Q3mRJtA=
X-Google-Smtp-Source: AA6agR5R4rPB3jN4+TsEp1phZ45xK8rirHFKM1G3DokNXBR1/CtzdTx5RkelB8TxhWdVVSfg23KZrA==
X-Received: by 2002:a25:cc43:0:b0:67c:2e26:fb1a with SMTP id l64-20020a25cc43000000b0067c2e26fb1amr15609072ybf.636.1660655383237;
        Tue, 16 Aug 2022 06:09:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:1cc:0:b0:31e:dfc9:3ae7 with SMTP id 195-20020a8101cc000000b0031edfc93ae7ls6250911ywb.7.-pod-prod-gmail;
 Tue, 16 Aug 2022 06:09:42 -0700 (PDT)
X-Received: by 2002:a81:4956:0:b0:31f:3d0c:822a with SMTP id w83-20020a814956000000b0031f3d0c822amr16209561ywa.357.1660655382158;
        Tue, 16 Aug 2022 06:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660655382; cv=none;
        d=google.com; s=arc-20160816;
        b=cBXQ11+5NYP15V5ovNDT1w3KDh4ra31tSAZdFypa5gr36IMAOnll93onQ0sGUenXrR
         5LhFxBKkNt3g+zMhRqZ4D1eHkbTcdSvpBHkEaTX7GUJUoe+xa/y9PBOz0PHzonTVLLx1
         iaItUC+SK5jDIUVskrBMSbOBfbnqoRwlvxb5osMxbOLaXwU8wEyrsDn9FkMeO1JZarMg
         7zJb3Zkfa33AUVeUmiUU+wJZ58jKr3WMR/ouAnMxzYdT8RDEYuQtL8QNkqsyaUa4vfi8
         D5rroxM0X149Zbixk/cczBOLjOrxP12yP3VUfoqxS+MPxViS+aKkLq4Ta8A1XVuvR3OJ
         GPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v0SBpB/73k8DJlWP9H/+4A4lujih9xM/21fd5bxX9YY=;
        b=x7WrMS0MCtVfoBikN/Yw2k+TUMgkgypTF/4RXMqszMZUYOcxUYGZOTCzNzvidvzfcf
         dZQm8/pmHjgOXNcCAgCD1nfrMDr9mQF4+cm70CBxDqGaQm0ROzn42jJXfDgM4FOlQi3r
         tc6N2WjTgAAkFprKQlm4kMzCKFACK97w5c7+fY8CQk0AStTAsvlkD9i2xXTySSDZcE/F
         5HjDQZNN4EjDpTu3ZqCU/H7WILKVGEF7Oi9xHzKlax7McJnmNV7aYewSoc/t59EWI8qr
         iGipGGSpvpSgodcZZ+aQN2Rb+sOBklj4k+szHxGp7nD8Qaeby0c7PHCjL1Q/jYbv/lwk
         68mQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=EZErm0SW;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f31 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com. [2607:f8b0:4864:20::f31])
        by gmr-mx.google.com with ESMTPS id ck26-20020a05690c0b9a00b00330253b8e8asi579627ywb.0.2022.08.16.06.09.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 06:09:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f31 as permitted sender) client-ip=2607:f8b0:4864:20::f31;
Received: by mail-qv1-xf31.google.com with SMTP id y11so7788712qvn.3
        for <jailhouse-dev@googlegroups.com>; Tue, 16 Aug 2022 06:09:42 -0700 (PDT)
X-Received: by 2002:a05:6214:2121:b0:476:a741:92a8 with SMTP id
 r1-20020a056214212100b00476a74192a8mr17802574qvc.117.1660655381561; Tue, 16
 Aug 2022 06:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <3fdb914d-9ec7-4a5b-93e4-d07333100ff3n@googlegroups.com>
 <20220811133427.336a5da7@md1za8fc.ad001.siemens.net> <ca47dc3f-0b85-47ad-8c9e-64713730e19dn@googlegroups.com>
In-Reply-To: <ca47dc3f-0b85-47ad-8c9e-64713730e19dn@googlegroups.com>
From: Peng Fan <van.freenix@gmail.com>
Date: Tue, 16 Aug 2022 21:09:30 +0800
Message-ID: <CAEfxd-9GKVN9AeoZj8-c+8NYt=BpFU7987_eCHfbEpftn9oo5g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Ask_for_help=EF=BC=8Cabout_cpu_down_after_jailhouse_en?=
	=?UTF-8?Q?able=E3=80=82=E3=80=82?=
To: star sun <sunxing960116@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000001cc6e605e65b7635"
X-Original-Sender: Van.Freenix@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=EZErm0SW;       spf=pass
 (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::f31
 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000001cc6e605e65b7635
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You are using Android with Trusty in inmate cell? jailhouse not
support trusty SMC handler. So you need add that SMC handler in
jailhouse.


Regards,

Peng


star sun <sunxing960116@gmail.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=8812=E6=97=
=A5=E5=91=A8=E4=BA=94 13:47=E5=86=99=E9=81=93=EF=BC=9A

>
> Thanks for your reply!
>
> Before jailhouse enable, the CPU can be powered on and off normally.
>
> But after that,  offline cpu(echo 0 > /sys/devices/system/cpu/cpu3/online=
) causes panic,  even without jailhouse create.
>
>
> =E5=9C=A82022=E5=B9=B48=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UT=
C+8 19:34:32<Henning Schild> =E5=86=99=E9=81=93=EF=BC=9A
>
>> Am Wed, 10 Aug 2022 23:29:16 -0700 (PDT)
>> schrieb star sun <sunxin...@gmail.com>:
>>
>> > i want make jailhouse working in one phone with 4 cortex-a53 cpu.
>> >
>> > I feel like I've successfully executed jailhouse enbale.
>> > unfortunately, there is a kernel panic when i down one cpu for a
>> > non-root-cell during jialhouse cell create .
>> >
>> > This question has puzzled me for a long time Do you have any good
>> > methods? thank you
>>
>> You could try offlining one or more CPUs with your stock kernel and not
>> even the jailhouse module loaded. If that also causes problems you are
>> likely dealing with a vendor kernel that has been patched to become
>> sort of broken.
>>
>> echo 0 > /sys/devices/system/cpu/cpu3/online
>>
>> writing a 1 will bring it back.
>>
>> This should work before you even start with jailhouse.
>>
>> Henning
>>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/ca47dc3f-0b85-47ad-8c9e-6=
4713730e19dn%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/ca47dc3f-0b85-47ad-8c9e-=
64713730e19dn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
> .
>


--

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAEfxd-9GKVN9AeoZj8-c%2B8NYt%3DBpFU7987_eCHfbEpftn9oo5g%40mai=
l.gmail.com.

--0000000000001cc6e605e65b7635
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-aLF-aPX-K0-aPE" style=3D"font-family:&=
quot;Courier New&quot;,Courier,monospace,arial,sans-serif;margin-top:0px;ma=
rgin-bottom:0px;white-space:pre-wrap;color:rgb(0,0,0);font-size:14px">You a=
re using Android with Trusty in inmate cell? jailhouse not support trusty S=
MC handler. So you need add that SMC handler in jailhouse.</pre><pre class=
=3D"gmail-aLF-aPX-K0-aPE" style=3D"font-family:&quot;Courier New&quot;,Cour=
ier,monospace,arial,sans-serif;margin-top:0px;margin-bottom:0px;white-space=
:pre-wrap;color:rgb(0,0,0);font-size:14px"><br></pre><pre class=3D"gmail-aL=
F-aPX-K0-aPE" style=3D"font-family:&quot;Courier New&quot;,Courier,monospac=
e,arial,sans-serif;margin-top:0px;margin-bottom:0px;white-space:pre-wrap;co=
lor:rgb(0,0,0);font-size:14px">Regards,</pre><pre class=3D"gmail-aLF-aPX-K0=
-aPE" style=3D"font-family:&quot;Courier New&quot;,Courier,monospace,arial,=
sans-serif;margin-top:0px;margin-bottom:0px;white-space:pre-wrap;color:rgb(=
0,0,0);font-size:14px">Peng</pre></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">star sun &lt;<a href=3D"mailto:sunxing9601=
16@gmail.com">sunxing960116@gmail.com</a>&gt; =E4=BA=8E2022=E5=B9=B48=E6=9C=
=8812=E6=97=A5=E5=91=A8=E4=BA=94 13:47=E5=86=99=E9=81=93=EF=BC=9A<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><br>Thanks=C2=A0for=C2=A0=
your=C2=A0reply!<br><br>Before=C2=A0jailhouse=C2=A0enable,=C2=A0the=C2=A0CP=
U=C2=A0can=C2=A0be=C2=A0powered=C2=A0on=C2=A0and=C2=A0off=C2=A0normally.=C2=
=A0<br>But=C2=A0after=C2=A0that,=C2=A0=C2=A0offline=C2=A0cpu(echo=C2=A00=C2=
=A0&gt;=C2=A0/sys/devices/system/cpu/cpu3/online)=C2=A0causes=C2=A0panic,=
=C2=A0=C2=A0even=C2=A0without=C2=A0jailhouse=C2=A0create.=C2=A0=C2=A0<br><b=
r><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=
=9C=A82022=E5=B9=B48=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC+8 1=
9:34:32&lt;Henning Schild&gt; =E5=86=99=E9=81=93=EF=BC=9A<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Am Wed, 10 Aug 2022 23:29:16 -070=
0 (PDT)
<br>schrieb star sun &lt;<a rel=3D"nofollow">sunxin...@gmail.com</a>&gt;:
<br>
<br>&gt;  i want make jailhouse working in one phone with 4 cortex-a53 cpu.
<br>&gt;=20
<br>&gt; I feel like I&#39;ve successfully executed jailhouse enbale.
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

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" targe=
t=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ca47dc3f-0b85-47ad-8c9e-64713730e19dn%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank">https:=
//groups.google.com/d/msgid/jailhouse-dev/ca47dc3f-0b85-47ad-8c9e-64713730e=
19dn%40googlegroups.com</a>.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAEfxd-9GKVN9AeoZj8-c%2B8NYt%3DBpFU7987_eCHfbEpftn=
9oo5g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAEfxd-9GKVN9AeoZj8-c%2B8NYt%3DBpFU7987=
_eCHfbEpftn9oo5g%40mail.gmail.com</a>.<br />

--0000000000001cc6e605e65b7635--

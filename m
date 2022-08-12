Return-Path: <jailhouse-dev+bncBDQKRTU7ZIKBB2GS26LQMGQE22ANLMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3b.google.com (mail-oo1-xc3b.google.com [IPv6:2607:f8b0:4864:20::c3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0DC590B9A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Aug 2022 07:47:22 +0200 (CEST)
Received: by mail-oo1-xc3b.google.com with SMTP id x20-20020a4a6214000000b0044896021930sf92079ooc.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Aug 2022 22:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc;
        bh=5XDZIxI23zYGiOEzKB+DhrRqJhuMdEIO5TlbtcBdBrk=;
        b=C1KZ/JjL8gALqsGpMkVaOBGWWjdSBaE68Us8GTptXkzn9YZl/1vRDcKhAkbA765t9s
         u5j0dVTTib6Cn9Uh32wRdlCJDHNoPAmsDHTNalqQNflZkwNHDWQ6U72449F3WRb/xCww
         wKGlLTxSCC6t4dfRcmrYudk58wyllhCiqNYVH20eFsmKqDH4Ql9ZHwz+nqLR/seIUS5W
         +orynvep8tjBnKCd0S9FGTolcn3SEPJd3p0gat+ZUa4tZtqZgqJYwzGdqdtyP3OzxB3S
         aDCqPa7RZVnjHP+iuYR8Zk/JexU0QnXxJE5IwouvuVAuNM79Ou4FzSY0xphCPsKF0VHP
         2Clw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc;
        bh=5XDZIxI23zYGiOEzKB+DhrRqJhuMdEIO5TlbtcBdBrk=;
        b=P9cz9GQqZ8avuHVEytuqv8HbDIb2oGbHRfEtn1guuIRHid7m1R7d3/fm5Nx14LrM2e
         YuKRA5q73j0AglxQ8W2aWa6mgO1T2XvGb/N4JAmjFypoM4VBGBHyCPOXcWBQjvmfKQ9i
         d2lIHDfArOQ8gCmkLxZiF5bQL4jyNI3NjcK/YThplRVijSizX64jY+Ubw9nPnePbPSwb
         jGDlfZB06QTUbj3xuBdD9ulCNHpT+q5+j2j4wrxMDft/QGAfTMVaShW5blR8b2aKT85K
         4Yk8hEUXnvJdndg3+WVlQrpiikW3CPLKOcKCbR8BnNt98tlYSSwV0iHSomuYalfjGVKz
         qs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc;
        bh=5XDZIxI23zYGiOEzKB+DhrRqJhuMdEIO5TlbtcBdBrk=;
        b=KzeNfAOXeSnXVnVbt42TBJ97KPIRcbw52K5CKryFug7PVC+8Q7vNRpAdrqJ85rD44L
         4NONHzeIYI3bkspyXC0WqwhB1oUS64eXxu6nJqqwu8Wyu1pi9QEP92SImtVMDeVVFtl1
         prNJ+sF4ymna0Ac3R8SKBZYAuqboFAuhC6CsE25yeDFRK5KY7IDI0uzDpLNTar+ikcxU
         NUA2LpoTvRKMdgRkUKFUD6P25KMPW8ko7Dne4GKl9ap6pS1wSLtQQxNY+BOCyRrrWRzc
         3PKDMBm6m3dVgoHz0N4yMn5QrsELKOSI8Ed7i1pQ0wYag4mh7ziDy8RTKi1eUp3gE8Wy
         hWfw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo039m9tT8K2JuHP472h4pd1v158ZVy/NIFCMYHxfSrNCm+vPAWn
	xn85q2DXbIy3IQpqrT5tnFo=
X-Google-Smtp-Source: AA6agR7seA64Bacqo4jVe80KLoOIev/rFNfuXWVWhi8nU3eV9bwSdO3JX9N26mnqXD5ty0EFxGPUSw==
X-Received: by 2002:a4a:892a:0:b0:440:ed6d:d245 with SMTP id f39-20020a4a892a000000b00440ed6dd245mr712531ooi.74.1660283241205;
        Thu, 11 Aug 2022 22:47:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:4946:b0:116:c21d:f9c3 with SMTP id
 fl6-20020a056870494600b00116c21df9c3ls1031740oab.10.-pod-prod-gmail; Thu, 11
 Aug 2022 22:47:20 -0700 (PDT)
X-Received: by 2002:a05:6871:b06:b0:10f:d0c:cab8 with SMTP id fq6-20020a0568710b0600b0010f0d0ccab8mr5025007oab.251.1660283240623;
        Thu, 11 Aug 2022 22:47:20 -0700 (PDT)
Date: Thu, 11 Aug 2022 22:47:20 -0700 (PDT)
From: star sun <sunxing960116@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ca47dc3f-0b85-47ad-8c9e-64713730e19dn@googlegroups.com>
In-Reply-To: <20220811133427.336a5da7@md1za8fc.ad001.siemens.net>
References: <3fdb914d-9ec7-4a5b-93e4-d07333100ff3n@googlegroups.com>
 <20220811133427.336a5da7@md1za8fc.ad001.siemens.net>
Subject: =?UTF-8?Q?Re:_Ask_for_help=EF=BC=8Cabout_cpu_d?=
 =?UTF-8?Q?own_after_jailhouse_enable=E3=80=82=E3=80=82?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7428_713639922.1660283240051"
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

------=_Part_7428_713639922.1660283240051
Content-Type: multipart/alternative; 
	boundary="----=_Part_7429_1648437586.1660283240051"

------=_Part_7429_1648437586.1660283240051
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Thanks for your reply!

Before jailhouse enable, the CPU can be powered on and off normally.=20
But after that,  offline cpu(echo 0 > /sys/devices/system/cpu/cpu3/online) =
causes panic,  even without jailhouse create. =20


=E5=9C=A82022=E5=B9=B48=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC+=
8 19:34:32<Henning Schild> =E5=86=99=E9=81=93=EF=BC=9A

> Am Wed, 10 Aug 2022 23:29:16 -0700 (PDT)=20
> schrieb star sun <sunxin...@gmail.com>:=20
>
> > i want make jailhouse working in one phone with 4 cortex-a53 cpu.=20
> >=20
> > I feel like I've successfully executed jailhouse enbale.=20
> > unfortunately, there is a kernel panic when i down one cpu for a=20
> > non-root-cell during jialhouse cell create .=20
> >=20
> > This question has puzzled me for a long time Do you have any good=20
> > methods? thank you=20
>
> You could try offlining one or more CPUs with your stock kernel and not=
=20
> even the jailhouse module loaded. If that also causes problems you are=20
> likely dealing with a vendor kernel that has been patched to become=20
> sort of broken.=20
>
> echo 0 > /sys/devices/system/cpu/cpu3/online=20
>
> writing a 1 will bring it back.=20
>
> This should work before you even start with jailhouse.=20
>
> Henning=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ca47dc3f-0b85-47ad-8c9e-64713730e19dn%40googlegroups.com.

------=_Part_7429_1648437586.1660283240051
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br>Thanks&nbsp;for&nbsp;your&nbsp;reply!<br><br>Before&nbsp;jailhouse&nbsp=
;enable,&nbsp;the&nbsp;CPU&nbsp;can&nbsp;be&nbsp;powered&nbsp;on&nbsp;and&n=
bsp;off&nbsp;normally.&nbsp;<br>But&nbsp;after&nbsp;that,&nbsp;&nbsp;offlin=
e&nbsp;cpu(echo&nbsp;0&nbsp;&gt;&nbsp;/sys/devices/system/cpu/cpu3/online)&=
nbsp;causes&nbsp;panic,&nbsp;&nbsp;even&nbsp;without&nbsp;jailhouse&nbsp;cr=
eate.&nbsp;&nbsp;<br><br><br><div class=3D"gmail_quote"><div dir=3D"auto" c=
lass=3D"gmail_attr">=E5=9C=A82022=E5=B9=B48=E6=9C=8811=E6=97=A5=E6=98=9F=E6=
=9C=9F=E5=9B=9B UTC+8 19:34:32&lt;Henning Schild&gt; =E5=86=99=E9=81=93=EF=
=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Am Wed,=
 10 Aug 2022 23:29:16 -0700 (PDT)
<br>schrieb star sun &lt;<a href=3D"" data-email-masked=3D"" rel=3D"nofollo=
w">sunxin...@gmail.com</a>&gt;:
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

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ca47dc3f-0b85-47ad-8c9e-64713730e19dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ca47dc3f-0b85-47ad-8c9e-64713730e19dn%40googlegroups.co=
m</a>.<br />

------=_Part_7429_1648437586.1660283240051--

------=_Part_7428_713639922.1660283240051--

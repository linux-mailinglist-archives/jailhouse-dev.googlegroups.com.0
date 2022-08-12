Return-Path: <jailhouse-dev+bncBDQKRTU7ZIKBBBOP26LQMGQELM2SE6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc40.google.com (mail-oo1-xc40.google.com [IPv6:2607:f8b0:4864:20::c40])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BEC590B90
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Aug 2022 07:39:20 +0200 (CEST)
Received: by mail-oo1-xc40.google.com with SMTP id k9-20020a4a8509000000b004357aae682asf65774ooh.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Aug 2022 22:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc;
        bh=1H0YjsMg1asSnU8IL2gxm1vtg9bdAHTGvV0eKecbTNA=;
        b=PqW1Yhh29dJJ+FFt5qojocMCdWyoTVjGxRjwb5vbzwTqfEymdM0V6RhzhMmyMkhkb8
         xUTh+MMgFRJlReMayuDgf6iSwbU/40N3kK/Qx6SsfTHcwqYfTLfT60TcY+zubMMaXTAe
         jVZ/qXFvLsP+UszCcD4HE7Cn9VphlPHR/FWJRPJkdiY9YhgKSxzT+794GNBVP49ks2NA
         q7gYDL8bbXVF/Q/rrUIDfhKeiFPavEyw/zFR10/KjudXm4Ee9OCkUcZMcM22RnDj5Tq+
         ti4wUL4U4Fv2wWn+WQI8sNQExrqZB6vYM3uC/wunQ1FpbUejTThgXhxPWEEburb6uZvI
         HiLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc;
        bh=1H0YjsMg1asSnU8IL2gxm1vtg9bdAHTGvV0eKecbTNA=;
        b=SWZpG/KFlE22Z0iYADIwnaP/TFZJIbOUhnL+OiriECa6gpGInb8dXdzQ/OQTzPLgr4
         5utzNSPziH5ld5Pa2ERZSGvZgM/k/UTSrq2ovJXCenWSz04HNg5wb6oeuDgg3HGM/tmJ
         fgL3PCD2X5ac1ixs7u1Bn4vhiHQOW4EmdBEKrxpAnh3BSgouMiK3xrqw1uewmR1YSbWV
         9RQw7s0gGCj2M+yTUHclxk8+LcHxbdPnFGRP1k+lAba1d52LWjFC7AnqRfwq9rGGujkh
         Sf7ui/92WWEfeIkZvQYo2FxW0PdLqk1YfpOX8qRjpmKXeBnIEy3PQjK+aXwzkuAtdlSC
         OQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc;
        bh=1H0YjsMg1asSnU8IL2gxm1vtg9bdAHTGvV0eKecbTNA=;
        b=3ipeQrkg1F/8gijH5oKIvHUiJ06Wb8KxgMC6/55FsQbGMbb7tSZsJMe0CU5T7kVlSf
         g2NgS3BEUEcx06R30pcnLBSMdwKkZZcnfR6SLySUWJKPpdCtrFN6fGus98KF6QFtbxle
         Yg7AKZtaxXKgF94GUagOu8VzIX1RsFKmFJXG/aIa55g0ZtYr2tdSy9I4za69icJApqU4
         IA9wtTvDOJsOq0nJ95iOEDYNNJS4qsSiJ5IvzY6SXWkrRMvGotQP38P5GQDFBsOcm1EV
         2vUuncAMNE+Jd5eBAQXnSdauoTt9NqFKPi4EKFrpEkzyzuwMQ1hfAoPPgl5HPM94y4Qd
         n2aw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo2pbvF67E+zkHs5/iwd+cKxXDQimNeI5F1AoxPtI+vBWmuSa7L1
	NFKbrO/SWVVxk+EcxliEJlA=
X-Google-Smtp-Source: AA6agR7mKrBFooJk99uZqBLNfz287pz11qRsTn4GgDEZm//nhC5BpIKJOgW4DC4QMInr4+kiJcssgQ==
X-Received: by 2002:a05:6870:1601:b0:101:5e61:d8ee with SMTP id b1-20020a056870160100b001015e61d8eemr983845oae.244.1660282758495;
        Thu, 11 Aug 2022 22:39:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:d9b:b0:10e:63ad:7cff with SMTP id
 mj27-20020a0568700d9b00b0010e63ad7cffls1031494oab.7.-pod-prod-gmail; Thu, 11
 Aug 2022 22:39:17 -0700 (PDT)
X-Received: by 2002:a05:6870:c0c1:b0:10d:96:737f with SMTP id e1-20020a056870c0c100b0010d0096737fmr5195546oad.101.1660282757488;
        Thu, 11 Aug 2022 22:39:17 -0700 (PDT)
Date: Thu, 11 Aug 2022 22:39:16 -0700 (PDT)
From: star sun <sunxing960116@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <53be4d0d-50ad-4064-acda-6c72af5e701dn@googlegroups.com>
In-Reply-To: <20220811133427.336a5da7@md1za8fc.ad001.siemens.net>
References: <3fdb914d-9ec7-4a5b-93e4-d07333100ff3n@googlegroups.com>
 <20220811133427.336a5da7@md1za8fc.ad001.siemens.net>
Subject: =?UTF-8?Q?Re:_Ask_for_help=EF=BC=8Cabout_cpu_d?=
 =?UTF-8?Q?own_after_jailhouse_enable=E3=80=82=E3=80=82?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3232_2049979951.1660282756738"
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

------=_Part_3232_2049979951.1660282756738
Content-Type: multipart/alternative; 
	boundary="----=_Part_3233_692714266.1660282756738"

------=_Part_3233_692714266.1660282756738
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


thanks for your reply

Before jailhouse enable, the CPU can be powered on and off normally.=20
But after that,  offline cpu(echo 0 > /sys/devices/system/cpu/cpu3/online)=
=20
causes panic,  even without jailhouse create.

=E5=9C=A82022=E5=B9=B48=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC+=
8 19:34:32<Henning Schild> =E5=86=99=E9=81=93=EF=BC=9A

> Am Wed, 10 Aug 2022 23:29:16 -0700 (PDT)
> schrieb star sun <sunxin...@gmail.com>:
>
> > i want make jailhouse working in one phone with 4 cortex-a53 cpu.
> >=20
> > I feel like I've successfully executed jailhouse enbale.
> > unfortunately, there is a kernel panic when i down one cpu for a=20
> > non-root-cell during jialhouse cell create .
> >=20
> > This question has puzzled me for a long time Do you have any good=20
> > methods? thank you
>
> You could try offlining one or more CPUs with your stock kernel and not
> even the jailhouse module loaded. If that also causes problems you are
> likely dealing with a vendor kernel that has been patched to become
> sort of broken.
>
> echo 0 > /sys/devices/system/cpu/cpu3/online
>
> writing a 1 will bring it back.
>
> This should work before you even start with jailhouse.
>
> Henning
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/53be4d0d-50ad-4064-acda-6c72af5e701dn%40googlegroups.com.

------=_Part_3233_692714266.1660282756738
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br>thanks for your reply<div><br></div><div>Before jailhouse enable, the C=
PU can be powered on and off normally.&nbsp;</div><div>But after that,&nbsp=
; offline cpu(echo 0 &gt; /sys/devices/system/cpu/cpu3/online) causes panic=
,&nbsp; even without jailhouse create.</div><div><a><br></a></div><div clas=
s=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82022=E5=
=B9=B48=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC+8 19:34:32&lt;He=
nning Schild> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gm=
ail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 20=
4, 204); padding-left: 1ex;">Am Wed, 10 Aug 2022 23:29:16 -0700 (PDT)
<br>schrieb star sun &lt;<a href data-email-masked rel=3D"nofollow">sunxin.=
..@gmail.com</a>&gt;:
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

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/53be4d0d-50ad-4064-acda-6c72af5e701dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/53be4d0d-50ad-4064-acda-6c72af5e701dn%40googlegroups.co=
m</a>.<br />

------=_Part_3233_692714266.1660282756738--

------=_Part_3232_2049979951.1660282756738--

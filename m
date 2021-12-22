Return-Path: <jailhouse-dev+bncBCWJRXUWVQPBBRHORSHAMGQEEM2KA5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id DB81247D3C2
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 15:33:41 +0100 (CET)
Received: by mail-qk1-x737.google.com with SMTP id j19-20020a05620a411300b0046dcad11010sf1871886qko.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 06:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=v1LThEdh6DC4fQs3gDLKfvNk2BMacoHetpL6xivPskg=;
        b=lltUtFNI7qegZRk7G3XZGAEF79pRE/RM9AhwhWuYAJf1W2IDGs22oTderQsknfy97d
         JKHZga4MgkZdo0J8I4RRw9WdHry2etizdx2vpMz5sN9cZlur+9IYLZ3nkK09rlXwzDbm
         FfuDdA9V+Bqvws4btbXtpinX3XQtVWOQuwzpmb20sjsFi/33rqJcBf6FS79FAMEZsVKg
         xHQp4dWn/S0nNqzwHIz8TW+ecKcA6SJHHpjUe1KRl789Lytt5KuDYb8cV6+1SRLjqimm
         6LXLFxEwmTr6lmpzodZCHYokN21lSsZkrxOWqDnOLFhe8V/+QqLL3meriyT9eZwJMV3v
         Nxbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=v1LThEdh6DC4fQs3gDLKfvNk2BMacoHetpL6xivPskg=;
        b=PMI7ajtZaYfbmx8wbQGLFk+4d8tZvlEvLkGBWo9WJgrAnJNWfb9W1xc9liKGFEdmL3
         3YEp3DED/DMr2ygIuVLoJ8E3TWRumCuk4QCT7QEOawOjEoaTdFqGyWFMzl+ZchAByFEu
         xEtFH2KT7UQxduqJMw4BDxmGOwgUbdRjKiQ1GDvubg4dhwaNDZhc2ny/9ON81eGEKbrC
         TNxOpYtSME9GztesrKDKld39QVe1Rhgw6oD49xISiBWsOyykZtwsqsrgFDktKzpxnuDz
         tSte6IeQyT04wXufv+VbwdtOCxWo8Ve8oanKwvycnZ9b6VHBY1iPgCBRAjNs5mJUO/sT
         lbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=v1LThEdh6DC4fQs3gDLKfvNk2BMacoHetpL6xivPskg=;
        b=EZqLThALVjZFXz5UvlnH04z1rO+6GjV0NHszlATv2j66LvnQgDo2pED7y7JFXQosYC
         hQZ9NZ5Jrj+rj+ilARbm8hGOqRXC83fTcQOnptfhytbH/mF2nUSxhoLnB5U9WrsXUbB/
         RvSdhMmlD24wiCvRccP42xKaWYVARp3CQCRatBtIkcNFFE7oULQL7SM603Jz7b7ENVKW
         jGVC1ZXi+37MTHAtL0hTXs/mQTVe2M8UIgvj/14t2/tw8zZPT5zw9LjeXwVXmLVNJEYl
         wioqjOzViT6Pui+mWy7am/q9Z24atOmTJ88f3RGJgOtCqmRusc2bNCLaBse09CVQrXEp
         KyFg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533U9+uTmD7q9g0asbgcETUNFAwPkv3LCkpVaO8uDVmNX/3enC47
	DmUnPPvUw/bD2zWCpQ0kXAE=
X-Google-Smtp-Source: ABdhPJzAy3ilcnWZFQMyLZ4b3uaXv8ooiow4H9UFTF+6Ct/OCDubULQyTlOyFeTvCNjmljrQZhol1w==
X-Received: by 2002:ac8:5712:: with SMTP id 18mr2323158qtw.584.1640183621013;
        Wed, 22 Dec 2021 06:33:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:1aa2:: with SMTP id bl34ls1171240qkb.11.gmail; Wed,
 22 Dec 2021 06:33:40 -0800 (PST)
X-Received: by 2002:a37:6316:: with SMTP id x22mr2113803qkb.239.1640183620514;
        Wed, 22 Dec 2021 06:33:40 -0800 (PST)
Date: Wed, 22 Dec 2021 06:33:39 -0800 (PST)
From: jiajun huang <huangjiajun145041@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2be13d89-1023-411b-ba9e-1d10044824e5n@googlegroups.com>
In-Reply-To: <64fa037aefed1d130bc0d3a49ccc3d09d5b504bc.camel@siemens.com>
References: <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAA>
 <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
 <64fa037aefed1d130bc0d3a49ccc3d09d5b504bc.camel@siemens.com>
Subject: Re: FATAL: Unhandled VM-Exit, reason 2
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_11640_1367856563.1640183619985"
X-Original-Sender: huangjiajun145041@gmail.com
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

------=_Part_11640_1367856563.1640183619985
Content-Type: multipart/alternative; 
	boundary="----=_Part_11641_2035453339.1640183619985"

------=_Part_11641_2035453339.1640183619985
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I will try as you suggest.
Currently I try to run this open source project=20
https://github.com/fixstars/cRTOS/blob/master/Installation.md. I used to=20
follow the guidelines of this project to successfully run linux+nuttx on=20
QEMU, but I found that the ivshmem-net device on qemu does not seem to=20
work. I suspect it is because the mmio area created by jailhouse for=20
ivshmem-net devices is not registered in QEMU. So I decided to try to run=
=20
this project on the server. I want to know if the ivshmem device is=20
supported by QEMU?


=E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC=
+8 22:17:37<Bezdeka, Florian> =E5=86=99=E9=81=93=EF=BC=9A

> On Wed, 2021-12-22 at 05:39 -0800, jiajun huang wrote:
> > Dear Jailhouse community=EF=BC=8C
> > This bug occurred when I tried to start nuttx on a none-root cell on
> > the server. I added two ivshmem devices for nuttx. Below is my
> > configuration file. I am not sure if there is a problem with the mmio
> > area in the configuration file. What is the communication area? In
> > addition, if jailhouse runs in QEMU, can two virtual machines
> > communicate with each other through ivshmem-net?
> >=20
> > Below is my root-cell , nuttx configuration and log output from the
> > port.
>
> Have you validated your cell configurations with the jailhouse config
> checker? I did not look into your configuration in detail, but nearly
> all of your inmate memory blocks are tagged with
> "JAILHOUSE_MEM_ROOTSHARED" which seems uncommon.
>
> I would start step by step. So start from a configuration where you
> know that both cells are booting up. Add virtual NICs afterwards and
> make sure that IRQs are delivered to ivshmem devices.
>
> Are you able to follow the boot log of your inmate? Hopefully you will
> see the reason for the VM exit there.
>
> HTH,
> Florian
>
> >=20
> > Best regards,
> >=20
> > Jiajun Huang
> >=20
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2be13d89-1023-411b-ba9e-1d10044824e5n%40googlegroups.com.

------=_Part_11641_2035453339.1640183619985
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div>I will try as you suggest.<br>Currently I try to run this open sour=
ce project https://github.com/fixstars/cRTOS/blob/master/Installation.md. I=
 used to follow the guidelines of this project to successfully run linux+nu=
ttx on QEMU, but I found that the ivshmem-net device on qemu does not seem =
to work. I suspect it is because the mmio area created by jailhouse for ivs=
hmem-net devices is not registered in QEMU. So I decided to try to run this=
 project on the server. I want to know if the ivshmem device is supported b=
y QEMU?</div><div><br><br></div><div class=3D"gmail_quote"><div dir=3D"auto=
" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=
=9F=E6=9C=9F=E4=B8=89 UTC+8 22:17:37&lt;Bezdeka, Florian> =E5=86=99=E9=81=
=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0=
 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">=
On Wed, 2021-12-22 at 05:39 -0800, jiajun huang wrote:
<br>&gt; Dear Jailhouse community=EF=BC=8C
<br>&gt; This bug occurred when I tried to start nuttx on a none-root cell =
on
<br>&gt; the server. I added two ivshmem devices for nuttx. Below is my
<br>&gt; configuration file. I am not sure if there is a problem with the m=
mio
<br>&gt; area in the configuration file. What is the communication area? In
<br>&gt; addition, if jailhouse runs in QEMU, can two virtual machines
<br>&gt; communicate with each other through ivshmem-net?
<br>&gt;=20
<br>&gt; Below is my root-cell , nuttx configuration and log output from th=
e
<br>&gt; port.
<br>
<br>Have you validated your cell configurations with the jailhouse config
<br>checker? I did not look into your configuration in detail, but nearly
<br>all of your inmate memory blocks are tagged with
<br>&quot;JAILHOUSE_MEM_ROOTSHARED&quot; which seems uncommon.
<br>
<br>I would start step by step. So start from a configuration where you
<br>know that both cells are booting up. Add virtual NICs afterwards and
<br>make sure that IRQs are delivered to ivshmem devices.
<br>
<br>Are you able to follow the boot log of your inmate? Hopefully you will
<br>see the reason for the VM exit there.
<br>
<br>HTH,
<br>Florian
<br>
<br>&gt;=20
<br>&gt; Best regards,
<br>&gt;=20
<br>&gt; Jiajun Huang
<br>&gt;=20
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2be13d89-1023-411b-ba9e-1d10044824e5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2be13d89-1023-411b-ba9e-1d10044824e5n%40googlegroups.co=
m</a>.<br />

------=_Part_11641_2035453339.1640183619985--

------=_Part_11640_1367856563.1640183619985--

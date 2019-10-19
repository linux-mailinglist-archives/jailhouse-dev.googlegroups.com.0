Return-Path: <jailhouse-dev+bncBC2N5U4PRAPBB572VTWQKGQEONTC7FQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E02DD9B1
	for <lists+jailhouse-dev@lfdr.de>; Sat, 19 Oct 2019 18:44:41 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id t7sf4633140otm.4
        for <lists+jailhouse-dev@lfdr.de>; Sat, 19 Oct 2019 09:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Tz7JW1X7o3zh8BM8iKqYvST6LSV/c9lRCNX95aIexjc=;
        b=CT5FYW/P0Qi9L5+43FIi5E0M5Q89Ta+D6p2nBc1lrzwlNmcvuo1FP4wNjRgfgYZKmH
         cRTHTBU8vLAfLXAFhGntWCt82m7auVgIctNk4pBHCdcOjqbRJAS2MhWW6DiETDF7xETx
         +FPnXGY8vwlH6tjoQU3F4q3dQ07ZZGJd+w3yoYV0qAG79lreo3cHtWRbPWDu3QhIcGW8
         QjwzHdnAn55enyPdUt6LNwedw8HQmVWJE4Xw9AxM1vYsBwTMMvoIoak92NU2IM1Y3LjK
         wiXmC2ZD243yH8TmQgf2hd0Jk80H8oA6E3rinu+q0fnXN4TkjllfAGvqBykdvecRUpJv
         si1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Tz7JW1X7o3zh8BM8iKqYvST6LSV/c9lRCNX95aIexjc=;
        b=YZi93epH+RP7xXTseeCG1EnANOG08bQK1W0B4CWRykM4CSLI0zGizWJWD/9oqIAA/I
         KZ70IIq49ZajS0vX85pPRbVx9jODAYG0Ov+w4ilecsjDCCsFetyH1q6e0/svotqZu20I
         QkX+mliTrLR+qwWRQq291Rdc72StT5lg85fLpzcXgnwl3kwcwDQpcPMd5WhPIKUTN4Rr
         /yUrmUN8+vX73BSkJNKCfOCIOHECZ4xpmMReZrR/k67Qhx9bd+Issqv4a2msehh1J5UB
         QfE0C5MvMpNTtNiW7tynsg5MHbGc0pPK0y5O/AGb/l6DgxcYzSaJriOnN6KlkkhBXjzn
         trLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Tz7JW1X7o3zh8BM8iKqYvST6LSV/c9lRCNX95aIexjc=;
        b=MtEDoM0Fp7INkSLlugxAZxFEEqSwPKMTUb9G/12yiM/lh/qh8u6E6/rjXX6api19Jf
         pdCxGbpdrJpdIGfPWwkQqq5OBS/JAAdYUlO3Dsxs3EDhdvqKoZGpeOIT90VmQZCtCo+1
         2QVD5nNJoYjce03xEsLplSKmxMkpIaOAmijK5BinKcOFtvhOQNuKHQ9H1s2DGvEFzRbR
         UKuoIsquCbyMx+UrTxeuHP5eTIsqE7ZwHT+pARyTFW64eQ29ziPrzynH9tYAioH3vslI
         PNC0vf6QPNtnZcBwRc7PRwpx+8gOUZtj7tnwwuKF6yy4M7ZFH6EJUWrp8mIgnwmuy9Lh
         YYbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWIMKc6F3AIeOXVCWSnUtpAisddnonLQJwMj84NhZvC0GxBapW3
	Z++6kNooGK6PAUS8Xedbwgk=
X-Google-Smtp-Source: APXvYqyLilUktj4CkY4hU2wYZ/R42tG0pte9EDwK7FPVU9AxrxC5N4Zz8J4F0WfmcTtlIhfOeahWJQ==
X-Received: by 2002:a05:6830:16cd:: with SMTP id l13mr4555820otr.285.1571503479749;
        Sat, 19 Oct 2019 09:44:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:4fcd:: with SMTP id d196ls1517545oib.16.gmail; Sat, 19
 Oct 2019 09:44:39 -0700 (PDT)
X-Received: by 2002:a54:4519:: with SMTP id l25mr12114405oil.143.1571503478820;
        Sat, 19 Oct 2019 09:44:38 -0700 (PDT)
Date: Sat, 19 Oct 2019 09:44:38 -0700 (PDT)
From: josemartins90@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f20aa680-8ada-4137-84eb-d306a4dda06c@googlegroups.com>
In-Reply-To: <5eccb011-381f-4bdc-a6e3-768c86ce9887@googlegroups.com>
References: <5eccb011-381f-4bdc-a6e3-768c86ce9887@googlegroups.com>
Subject: Re: gic-demo on ZCU102 fails to print to second UART
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1413_123055745.1571503478313"
X-Original-Sender: josemartins90@gmail.com
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

------=_Part_1413_123055745.1571503478313
Content-Type: multipart/alternative; 
	boundary="----=_Part_1414_380374465.1571503478314"

------=_Part_1414_380374465.1571503478314
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So, I got this work simply by completely removing UART1/serial1 from the=20
root cell's device tree.

Thank you anyway!

On Saturday, 19 October 2019 13:45:34 UTC+1, josema...@gmail.com wrote:
>
> Hello all,
>
> I'm trying to run the gic demo on a ZCU102 using petalinux 2019.1 for the=
=20
> root cell. However the demo cell fails to print to the second UART and no=
=20
> error messages appear on jailhouse's console.
>
> As suggested on your setup guide for ZCU102 (
> https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-z=
ynqmp-zcu102.md)=20
> I've tried to use an older device tree. However, when using this device=
=20
> tree Linux boot hangs on "Waiting for root device /dev/mmcblk0p2...".
>
> I've also changed the phys_start of the zynqmp-zcu102-gic-demo.c UART mem=
=20
> region configuration to UART0's base address (0xff000000). With this I se=
e=20
> the jitter messages print to UART0 console, so the cell is running as=20
> expected.
>
> Any idea what I might be doing wrong?
>
> Thank you in advance,
> Jos=C3=A9
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f20aa680-8ada-4137-84eb-d306a4dda06c%40googlegroups.com.

------=_Part_1414_380374465.1571503478314
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So, I got this work simply by completely removing UART1/se=
rial1 from the root cell&#39;s device tree.<div><br></div><div>Thank you an=
yway!<br><br>On Saturday, 19 October 2019 13:45:34 UTC+1, josema...@gmail.c=
om  wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left:=
 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;"><div dir=3D"ltr">Hel=
lo all,<div><br></div><div>I&#39;m trying to run the gic demo on a ZCU102 u=
sing petalinux 2019.1 for the root cell. However the demo cell fails to pri=
nt to the second UART and no error messages appear on jailhouse&#39;s conso=
le.</div><div><br></div><div>As suggested on your setup guide for ZCU102 (<=
a href=3D"https://github.com/siemens/jailhouse/blob/master/Documentation/se=
tup-on-zynqmp-zcu102.md" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"=
this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2=
Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2FDocumentation%2Fsetup-on-zynqmp-zcu1=
02.md\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHI_KgzVkJ9KdafY-Z5aCcbY8pEhg&=
#39;;return true;" onclick=3D"this.href=3D&#39;https://www.google.com/url?q=
\x3dhttps%3A%2F%2Fgithub.com%2Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2FDocume=
ntation%2Fsetup-on-zynqmp-zcu102.md\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjC=
NHI_KgzVkJ9KdafY-Z5aCcbY8pEhg&#39;;return true;">https://github.com/siemens=
/<wbr>jailhouse/blob/master/<wbr>Documentation/setup-on-zynqmp-<wbr>zcu102.=
md</a>) I&#39;ve tried to use an older device tree. However, when using thi=
s device tree Linux boot hangs on &quot;Waiting for root device /dev/mmcblk=
0p2...&quot;.</div><div><br></div><div>I&#39;ve also changed the=C2=A0phys_=
start of the zynqmp-zcu102-gic-demo.c UART mem region configuration to UART=
0&#39;s base address (0xff000000). With this I see the jitter messages prin=
t to UART0 console, so the cell is running as expected.</div><div><br></div=
><div>Any idea what I might be doing wrong?</div><div><br></div><div>Thank =
you in advance,</div><div>Jos=C3=A9</div></div></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f20aa680-8ada-4137-84eb-d306a4dda06c%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/f20aa680-8ada-4137-84eb-d306a4dda06c%40googlegroups.com<=
/a>.<br />

------=_Part_1414_380374465.1571503478314--

------=_Part_1413_123055745.1571503478313--

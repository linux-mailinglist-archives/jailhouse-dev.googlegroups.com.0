Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBTOF62AQMGQEHIN3W2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73c.google.com (mail-qk1-x73c.google.com [IPv6:2607:f8b0:4864:20::73c])
	by mail.lfdr.de (Postfix) with ESMTPS id E366C3295A7
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Mar 2021 03:28:30 +0100 (CET)
Received: by mail-qk1-x73c.google.com with SMTP id v184sf15645896qkd.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Mar 2021 18:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LFeKTyPigg2LEl16WYCOVN4sdXLPmZdp+d8N57zEGbo=;
        b=OIdnjyWfv7hW01P3DijlVislnoygHpVsuoJ/4x3l0mDfzSPm7FRUOC8iSz8S8MnJF8
         t1JokwkfP4oD+XEOrFZGY+wfSmUYJ8RXMxBqrwbJahk+H2pZB6irsij57teSWvz/Tx0v
         XrLKBl1pFGkC64WVY0sW1eId6ag8JlDMv5I3vyf1PoxeZWRQMhKF9GUq8ifEdSXfyi7T
         gyURR/79KQQSYApYoHi75X5jUpgYnJNuzhyUU/NMN7iiAlUUqfZqQXuqS0blFzcVlfSI
         EzdsjpMPc8SmKNFYhH5V6eLq6xuRbx3wxaiO3DEfrZQYbLriEyO4qCpOyIa50BBQQdaV
         n5hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LFeKTyPigg2LEl16WYCOVN4sdXLPmZdp+d8N57zEGbo=;
        b=kfkmMoxFJLWG/rGyXpnbbMqM+PSEm4OFyWbm9Jih43ubJ7XLBRyuZdWAHg2dL2w1eE
         OA291EqZc3p3UqodmjfJvsK/1As0grt7AnjkQDwF6YchUB1zPX70v27wujqDYjsyQ1DW
         fEg03m4oxeKNCgR51c9hdatL8V/RTHBEjhyFB5eyB8jF+2DX0Ub5sRK00Iw851uq2pEN
         TRxrlRJz3weHEboktTPVjrHZ8Z9Ii1M5ce5jZiGLWx39rsG/rbmIy2EbuCDuCAw0+w2C
         07L1IWQi4F1Ibelvf3MKsE3l7BxVHXTY8/LilofWoyoa2nIQWRrdEgDka7XcCfJxetHD
         kgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LFeKTyPigg2LEl16WYCOVN4sdXLPmZdp+d8N57zEGbo=;
        b=rDw27Lj1S8xwweZw8Pxlp9zt8kktXOi4ry1mxsy+SmE3zORmMJ2Jn6mFelfpYnCrrF
         GY4vM1RzSUTZgRCF5prmfES9qPbZJqcIwTcDw9GBagtZcFJMRGO7/sKYHO6okRJeFzGd
         L+N10d1MORYAtNiGH+24W0Hk7db5yV5mB5SOFyoxyRKapLqFdKyjVG3sGGCI9OAmQ7MV
         uEnPxO/Fd001Z59Ki5ebG4C/QDkIPXRCwTV1yEmiE5QldKN2X6ydCwELUODmY5Dl1lAY
         vlnKGiSfkEnBBNS5ALYRip/pfUZjpAmPczevzuXGDpSqdfzFiuPPSZx9cpQ3eWQDkYOC
         zdxQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530ErFzsP4RRDFaM+52VdlZ9bH5dR/0f1ixx4DyHG+nfk7O/ZagD
	e4ivEBI8yUR0BZNPhol2zWc=
X-Google-Smtp-Source: ABdhPJxSZZXPjuazFwyGER5M3KI85f6ALLV7E6h9XIxXzFdBPiMES1rGUNLnDrhB+44Oh7CQ2KWRiA==
X-Received: by 2002:ac8:5809:: with SMTP id g9mr7003021qtg.97.1614652109631;
        Mon, 01 Mar 2021 18:28:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:f202:: with SMTP id h2ls4982902qvk.4.gmail; Mon, 01 Mar
 2021 18:28:29 -0800 (PST)
X-Received: by 2002:a05:6214:1624:: with SMTP id e4mr10194297qvw.58.1614652109028;
        Mon, 01 Mar 2021 18:28:29 -0800 (PST)
Date: Mon, 1 Mar 2021 18:28:28 -0800 (PST)
From: Smith li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6efcb671-5747-4572-804e-631319b44b9fn@googlegroups.com>
In-Reply-To: <20a0834c-e41a-855c-71b3-2fea4ff89d14@siemens.com>
References: <254a573f-0b4a-4c6e-a5d5-19d0734cf6ebn@googlegroups.com>
 <20a0834c-e41a-855c-71b3-2fea4ff89d14@siemens.com>
Subject: Re: how to run linux with root in none root cell ?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3920_1237611737.1614652108420"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_3920_1237611737.1614652108420
Content-Type: multipart/alternative; 
	boundary="----=_Part_3921_1930752282.1614652108420"

------=_Part_3921_1930752282.1614652108420
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thank you for your advice.

=E5=9C=A82021=E5=B9=B43=E6=9C=882=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+8=
 =E4=B8=8A=E5=8D=881:30:15<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A

> On 25.02.21 13:32, Smith li wrote:
> > Dear Community,
> >         I have compile the jailhouse-images repository, and run the dem=
o.
> >=20
> >   the command to start linux in a cell is like this:
> >=20
> > #jailhouse cell linux /etc/jailhouse/rpi4-linux-demo.cell \
> >                         /boot/vmlinuz* \
> >                         -d /etc/jailhouse/dts/inmate-rpi4.dtb \
> >                         -i /usr/libexec/jailhouse/demos/rootfs.cpio \
> >                         -c "console=3DttyS0,115200 ip=3D192.168.19.2"
> >=20
> > What I want to know is : how to set the root to a dir or disk ?
> >=20
> > I see some   use   root=3D/dev/nfs   ip=3D192.168.1.1::****** :eth0  in=
 this
> > page.
> > [1]
> https://groups.google.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAgAJ
> >=20
> > Can't we set the linux root to a disk partition or a dir ?
> > Will somebody tell me ?
> > Thanks very much !
>
>
> Jailhouse does not provide regular virtual devices like other
> hypervisors. Everything is mapped to shared memory devices.
>
> You may use network-based storage for the non-root cell, nfs as
> suggested above or nbd. There is also experimental virtio-block, backed
> by a simplistic process in the root cell. But integration into
> jailhouse-images is missing, so trying that out can be tough.
>
> Jan
>
> --=20
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6efcb671-5747-4572-804e-631319b44b9fn%40googlegroups.com.

------=_Part_3921_1930752282.1614652108420
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thank you for your advice.<br><br><div class=3D"gmail_quote"><div dir=3D"au=
to" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B43=E6=9C=882=E6=97=A5=E6=98=
=9F=E6=9C=9F=E4=BA=8C UTC+8 =E4=B8=8A=E5=8D=881:30:15&lt;j.kiszka...@gmail.=
com> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote=
" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); =
padding-left: 1ex;">On 25.02.21 13:32, Smith li wrote:
<br>&gt; Dear Community,
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 I have compile the jailhouse-images re=
pository, and run the demo.
<br>&gt;=20
<br>&gt; =C2=A0 the command to start linux in a cell is like this:
<br>&gt;=20
<br>&gt; #jailhouse cell linux /etc/jailhouse/rpi4-linux-demo.cell \
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /boot/vmlinuz* \
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -d /etc/jailhouse/dts/inmate-rpi4.dtb \
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -i /usr/libexec/jailhouse/demos/rootfs.cpio \
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -c &quot;console=3DttyS0,115200 ip=3D192.168.19.2&quot;
<br>&gt;=20
<br>&gt; What I want to know is : how to set the root to a dir or disk ?
<br>&gt;=20
<br>&gt; I see some=C2=A0 =C2=A0use=C2=A0 =C2=A0root=3D/dev/nfs=C2=A0 =C2=
=A0ip=3D192.168.1.1::****** :eth0=C2=A0 in this
<br>&gt; page.
<br>&gt; [1]<a href=3D"https://groups.google.com/g/jailhouse-dev/c/vXD4tzCP=
DG4/m/zX_hHNxJAgAJ" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.google.com=
/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAgAJ&amp;source=3Dgmail&amp;ust=3D=
1614738405785000&amp;usg=3DAFQjCNHFkdphwTgEiO3QauyehJomladjrw">https://grou=
ps.google.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAgAJ</a>
<br>&gt;=20
<br>&gt; Can&#39;t we set the linux root to a disk partition or a dir ?
<br>&gt; Will somebody tell me ?
<br>&gt; Thanks very much !
<br>
<br>
<br>Jailhouse does not provide regular virtual devices like other
<br>hypervisors. Everything is mapped to shared memory devices.
<br>
<br>You may use network-based storage for the non-root cell, nfs as
<br>suggested above or nbd. There is also experimental virtio-block, backed
<br>by a simplistic process in the root cell. But integration into
<br>jailhouse-images is missing, so trying that out can be tough.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
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
om/d/msgid/jailhouse-dev/6efcb671-5747-4572-804e-631319b44b9fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6efcb671-5747-4572-804e-631319b44b9fn%40googlegroups.co=
m</a>.<br />

------=_Part_3921_1930752282.1614652108420--

------=_Part_3920_1237611737.1614652108420--

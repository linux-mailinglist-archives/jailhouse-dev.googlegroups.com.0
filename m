Return-Path: <jailhouse-dev+bncBD7236HKXYJRBKP6SXYQKGQE4GQQVBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x240.google.com (mail-oi1-x240.google.com [IPv6:2607:f8b0:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B42142823
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 11:21:31 +0100 (CET)
Received: by mail-oi1-x240.google.com with SMTP id n130sf11990155oib.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 02:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TDb23LQd6Vhk2K3ziG1WioTtCTYfftUFaKNI1XciP+8=;
        b=fje9QTSzrqUGcfD0hw5rKjJxXg6G+SC0Ir6H7ecZ0EvImYhbjnGQpzmcknnuPK8pS7
         6f6hxLJPnyfVyEy3Ya9isbdeo1hFRiTRLWteYnHJcyPmnk6hc9/U18NQO1brxWtJWP8y
         ev6MBvU8llZIZnIsKBaRgYVTukorGaVZgAQQP3oAuL3IwOR3cALgWpmCabeRaXvjkd9A
         VDAVu0Om3jOc59/EPL1bcxYS2CL1rNC9KLwOU8EWJIxgD7deQubn9XbYnemq1s1D6upw
         2tx2axZcXQnclZn+F9K/nJEmfMv19DmSkS5U4W+4W15aY8BMkCG4N87nhVKXBMAcYMAZ
         /xhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TDb23LQd6Vhk2K3ziG1WioTtCTYfftUFaKNI1XciP+8=;
        b=ATUZMwMbwDroEUuxkacsBCKCWQVNMNffeBwbzxLCcXYQwJuBsAqzMhS0V7lXw6Sc6S
         vCVQaA08uHTtXnTxXljbz1dMfirhxeCSH2VSBuuz6FCayr8w2AsmlpG2QA9s7+lvYwUB
         Myw13SS7OhTDvdPql35wgT/NwPQs4/9zZNHGKQZGQW6we1SAV202Ld0xuppSzrFJCaMc
         zp13bB7FvEurceoOaD+T5dwvXfH0EQ6qNLsireEkH4+wZHM71/sBBe3DWigFY+bBIpg+
         dPjbX8kx9/Pd6uvqHca0sqSG5GDtcIufdR3l+DXyZVX6m9ZPTou1aoFC28u+9XR3udRF
         qx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TDb23LQd6Vhk2K3ziG1WioTtCTYfftUFaKNI1XciP+8=;
        b=oM8GE8r4MzFSsPfRbCua0c4i9iaO2d1/joV2nn9jW6y062zzpo+iDZD1tYP281GEJt
         02xRjrHTi6EYF82f6dmwK+eNFq6v7+s+yCXbqcsbUoJSeUvguTaBkS9KiLc+e+TPvcYl
         Oh2HiwAwWF1ZDlnpFYR32qRUOabNpQ1hticH6LXuDl25pDy3QX9zbmcFliITez7uQvkA
         nXJ3DgTaKJS/pV+/uL7eSAAKPAGehh4/Ou7l5sKpjUYH/p7AmVvQ3OdHB8FaG9z+sZrE
         45ufx3eOcl88Wh2pbRCWu6HV6hJdbRlnGA+EZXdwtxJA8wfldeieLWTRS1xPyRqK108W
         KI8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU2uzFFunyejx8cbAniVSVwBIDWn3TJg/7QrerLbuOp4v11W1Tg
	Uy53Gh63zFAaqRIeY4iXCxQ=
X-Google-Smtp-Source: APXvYqxDeuhIJJl2JRRS8M9b+mOy2hXHJrA3emNPNgwCNQA22Z+aGdtqqr5QsvR1nn+euFZP6RqZjA==
X-Received: by 2002:a9d:6b8a:: with SMTP id b10mr15703020otq.322.1579515690069;
        Mon, 20 Jan 2020 02:21:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:5753:: with SMTP id l80ls5693703oib.15.gmail; Mon, 20
 Jan 2020 02:21:29 -0800 (PST)
X-Received: by 2002:a05:6808:84:: with SMTP id s4mr12309780oic.60.1579515689339;
        Mon, 20 Jan 2020 02:21:29 -0800 (PST)
Date: Mon, 20 Jan 2020 02:21:28 -0800 (PST)
From: Thorsten Schulz <contact.thorsten@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <81dbcae7-6d89-4d29-b457-a6532d902d91@googlegroups.com>
In-Reply-To: <c95ae0f5-9510-86c5-b4db-8939980399bd@siemens.com>
References: <764a07bc-d7c3-4b06-a7fd-ed8358dd8037@googlegroups.com>
 <c95ae0f5-9510-86c5-b4db-8939980399bd@siemens.com>
Subject: Re (brief feedback): Reach-out for help getting qemu-e1000-demo
 config right+working
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_957_2130723718.1579515688765"
X-Original-Sender: contact.thorsten@gmail.com
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

------=_Part_957_2130723718.1579515688765
Content-Type: multipart/alternative; 
	boundary="----=_Part_958_1141672345.1579515688766"

------=_Part_958_1141672345.1579515688766
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

thanks for pointing to the intros. Yes, I fell for all the novice mistakes.=
=20
Note, the link to the slides has moved:
https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jai=
lhouse-Tutorial.pdf

For everyone else stumbling into the same initial pitfalls:

The most important slide was (31) - "Traps & Pitfalls =E2=80=93 x86 Edition=
".
I had to flag a few more caps as "JAILHOUSE_PCICAPS_WRITE" (as joked in the=
=20
talk-video, just set all), removed a region that I "imported" wrongly from=
=20
the original qemu-root-cell and rechecked the indices of the shm-regions,=
=20
which I completely missed, after moving the regions around.

Then the e1000-demo and the non-root-Linux worked for me in qemu.
Well, one needs 2 Qemus of the same setup on a local bridge for the=20
e1000-demo - then they talk.

Two traps of note:
As I always forget this: one needs to pass a different mac-address to the=
=20
e1000 device in the second qemu-instance.

When one wants to pass through an e1000 card to the non-root Linux in the=
=20
QEMU-demo, you need to copy some of the kernel-modules, as they were not=20
baked into the inner non-root-rootfs. Then, pinging the outer world works=
=20
nicely.

cheers,
Thorsten

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/81dbcae7-6d89-4d29-b457-a6532d902d91%40googlegroups.com.

------=_Part_958_1141672345.1579515688766
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jan,<br></div><div><br></div><div>thanks for point=
ing to the intros. Yes, I fell for all the novice mistakes. Note, the link =
to the slides has moved:</div><div>https://events.static.linuxfound.org/sit=
es/events/files/slides/ELCE2016-Jailhouse-Tutorial.pdf</div><div><br></div>=
<div>For everyone else stumbling into the same initial pitfalls:</div><div>=
<br></div><div>The most important slide was (31) - &quot;Traps &amp; Pitfal=
ls =E2=80=93 x86 Edition&quot;.</div><div>I had to flag a few more caps as =
&quot;JAILHOUSE_PCICAPS_WRITE&quot; (as joked in the talk-video, just set a=
ll), removed a region that I &quot;imported&quot; wrongly from the original=
 qemu-root-cell and rechecked the indices of the shm-regions, which I compl=
etely missed, after moving the regions around.</div><div><br></div><div>The=
n the e1000-demo and the non-root-Linux worked for me in qemu.</div><div>We=
ll, one needs 2 Qemus of the same setup on a local bridge for the e1000-dem=
o - then they talk.</div><div><br></div><div>Two traps of note:</div><div>A=
s I always forget this: one needs to pass a different mac-address to the e1=
000 device in the second qemu-instance.</div><div><br></div><div>When one w=
ants to pass through an e1000 card to the non-root Linux in the QEMU-demo, =
you need to copy some of the kernel-modules, as they were not baked into th=
e inner non-root-rootfs. Then, pinging the outer world works nicely.<br></d=
iv><div><br></div><div>cheers,<br>Thorsten<br></div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/81dbcae7-6d89-4d29-b457-a6532d902d91%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/81dbcae7-6d89-4d29-b457-a6532d902d91%40googlegroups.com<=
/a>.<br />

------=_Part_958_1141672345.1579515688766--

------=_Part_957_2130723718.1579515688765--

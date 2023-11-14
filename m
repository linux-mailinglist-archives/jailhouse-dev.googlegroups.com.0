Return-Path: <jailhouse-dev+bncBD6ZDC4GXENBBP5IZSVAMGQEGOOTE5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103b.google.com (mail-pj1-x103b.google.com [IPv6:2607:f8b0:4864:20::103b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9909D7EAA83
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Nov 2023 07:31:29 +0100 (CET)
Received: by mail-pj1-x103b.google.com with SMTP id 98e67ed59e1d1-28016806be2sf6310290a91.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Nov 2023 22:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1699943488; x=1700548288; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=747z2q2DdY0n/fq1zmVdx3laGiobmi5BWrCPkehCAWc=;
        b=JTXivvdkdPiMrWuyBpywa/tIghY11cbqkiVrpd9+N+u7MWlL5uXGrRW23cBq9pNJmp
         f430uG7zpTGGoqFOKzY4hmC0ArsAPRsfCj7wl2+FpPc/xjiRGy/C3h/dOoAk4VG0tYIM
         TkmBOjv3Iw4JRTjTanCgGgxB9vtHd2okaOOrMp/QWMCBtFPFhxi223POfU/wubq+96FE
         MTVpxm/11Dp/u8wdLVBBr+GXDDRJem0Moddba9PkTEOKk+lrQroKuAeyTwU9NTba6COB
         +TNXJWzSCt+ZtRSjlUxL0ulyhrLnQwDmcQQt5nuR4EqIx0/xuTwpwMZNoOXieCeKQxXN
         36AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699943488; x=1700548288; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=747z2q2DdY0n/fq1zmVdx3laGiobmi5BWrCPkehCAWc=;
        b=OHEnE/2g8GRrTlTFYH4KZheSdyIReIyiu1MtZpXaS1+8VAelOIJDp0tBrep4YD0lmO
         bEZZzwC+21Q/qUJ6b83SOScVlEqePp99AcKaX0v+hgII5ukNKfCHHhNR+lryuxJwt4NZ
         QAG4DKTHNwAU02JP4N+ddgWeu1MDcJyMMow02ESIwOLxrGnra9SDef/khhg35Vj0f7XR
         kt1BrTp+pgaUpZQa3CR9Vg0V/2lhDsxZH6cbVTFywGhCWq/p8hXQcwO0uWqVnqu/Dy9P
         krmi83L14a+NKlL1TwdxVWkWyOYMJMktwqkh5VTJ3ujI66bMoDAPm7/vnrffs6KlxG0z
         Yywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699943488; x=1700548288;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=747z2q2DdY0n/fq1zmVdx3laGiobmi5BWrCPkehCAWc=;
        b=vpKNTb0hi0jvxqQYDPcKO0Q1BVYD+ToAqmH0RURzXI6mQBsWDSm+4QXJqwNVtFAU5u
         O1Z+jJN0jerUujH8BXLjMw2I/3fOkNFyjjkLhS09m6ZCy2s3SKCvPcMTKdnWMDEbuN17
         4XztPyF6jbEsr5uv/GLppU0NCdhoOVt7rJy3kfE70ZyBjAfh57jsrMWNPhmV8RYfi+tt
         Nk3AIpAKl1yomJSH2w/q1pbWkSZNEeBA/XzAeu/5sblKEUEUFII9krAZYnSlTWCGmu8o
         AjT15ACgZ/Wc6ODLdRKOgT5OslxAqMdps12GqLZmY3C97JT3FmwRggIV0Bj4D+xyNtZL
         oLYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yw1fpblQo3wd4F7QGxIIstXqBxHOllzzMA8Ahzfz7p6IgB+vt7p
	qMoCyXg698t5FsxfDSaOSEk=
X-Google-Smtp-Source: AGHT+IEQZ7v+MrlLRY4VA87mKqH9lbmdyz8Qvt53etd5EtbeYNKg8Zro3K30fTcVO1p3rAm6BeYFHg==
X-Received: by 2002:a17:90b:4f84:b0:280:892a:75ab with SMTP id qe4-20020a17090b4f8400b00280892a75abmr2582758pjb.10.1699943487885;
        Mon, 13 Nov 2023 22:31:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:bf06:b0:280:87c:818e with SMTP id
 c6-20020a17090abf0600b00280087c818els4447340pjs.1.-pod-prod-08-us; Mon, 13
 Nov 2023 22:31:26 -0800 (PST)
X-Received: by 2002:a17:90a:9406:b0:27d:e40a:96d3 with SMTP id r6-20020a17090a940600b0027de40a96d3mr2562960pjo.2.1699943486575;
        Mon, 13 Nov 2023 22:31:26 -0800 (PST)
Date: Mon, 13 Nov 2023 22:31:25 -0800 (PST)
From: xin zhang <zhangxin6483@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <8b7c90c6-73bb-4e57-b705-ec1f1b692ee4n@googlegroups.com>
Subject: jailhouse enable linux kernel error
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_85003_2030242069.1699943485662"
X-Original-Sender: zhangxin6483@gmail.com
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

------=_Part_85003_2030242069.1699943485662
Content-Type: multipart/alternative; 
	boundary="----=_Part_85004_132490027.1699943485662"

------=_Part_85004_132490027.1699943485662
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


What is the reason for the following error printed when using Jailhouse to=
=20
start Linux in Linux? Replacing the image is also not feasible
 the error log as follows=EF=BC=9A

[    0.092570][  0] Unable to handle kernel paging request at virtual=20
address 0000400000000008
[    0.101012][  0] Mem abort info:
[    0.104266][  0]   ESR =3D 0x96000005
[    0.107785][  0]   Exception class =3D DABT (current EL), IL =3D 32 bits
[    0.114204][  0]   SET =3D 0, FnV =3D 0
[    0.117723][  0]   EA =3D 0, S1PTW =3D 0
[    0.121328][  0] Data abort info:
[    0.124671][  0]   ISV =3D 0, ISS =3D 0x00000005
[    0.128980][  0]   CM =3D 0, WnR =3D 0
[    0.132410][  0] [0000400000000008] user address but active_mm is swappe=
r
[    0.139270][  0] Internal error: Oops: 96000005 [#1] SMP
[    0.144636][  0] Modules linked in:
[    0.148156][  0] Process kthreadd (pid: 2, stack limit =3D=20
0x(____ptrval____))
[    0.155281][  0] CPU: 0 PID: 2 Comm: kthreadd Not tainted 4.19.90-69+ #3
[    0.162052][  0] Source Version: a22085976f26303c72a6bc7cc0d4ee20ff890cf=
9
[    0.168912][  0] Hardware name: FT-2000/4-D4-DSK Development Board (DT)
[    0.175596][  0] pstate: 60000085 (nZCv daIf -PAN -UAO)
[    0.180876][  0] pc : get_partial_node.isra.24+0x38/0x298
[    0.186330][  0] lr : ___slab_alloc+0x3b8/0x528
[    0.190903][  0] sp : ffff80000a143b10
[    0.194685][  0] x29: ffff80000a143b10 x28: 0000400000000000
[    0.200490][  0] x27: ffff80000a0fbc00 x26: ffff800023e55de0
[    0.206294][  0] x25: 0000000000000000 x24: 0000000000000035
[    0.212099][  0] x23: ffff0000080edc34 x22: ffff000009539b08
[    0.217903][  0] x21: 0000000000000000 x20: 0000000000000001
[    0.223707][  0] x19: 00000000007080c0 x18: 0000000000000001
[    0.229511][  0] x17: 0000000000000000 x16: 0000000000000000
[    0.235315][  0] x15: ffff000089b4cbb7 x14: 0000000000000003
[    0.241120][  0] x13: ffff000009b4cbca x12: 0000000000000000
[    0.246924][  0] x11: ffff00000990e2a8 x10: ffff7fe000028520
[    0.252728][  0] x9 : ffff80000a143d90 x8 : ffff80000a126e20
[    0.258532][  0] x7 : 0000000000000000 x6 : 0000000080080008
[    0.264337][  0] x5 : 0000000000000000 x4 : ffff7fe000028520
[    0.270141][  0] x3 : 00000000007080c0 x2 : ffff800023e55df0
[    0.275945][  0] x1 : 0000400000000000 x0 : ffff000008315028
[    0.281749][  0] Call trace:
[    0.284654][  0]  get_partial_node.isra.24+0x38/0x298
[    0.289755][  0]  ___slab_alloc+0x3b8/0x528
[    0.293978][  0]  __slab_alloc+0x5c/0x78
[    0.297937][  0]  kmem_cache_alloc_node+0xd8/0x220
[    0.302774][  0]  copy_process.isra.8+0x1dc/0x1308
[    0.307611][  0]  _do_fork+0x78/0x370
[    0.311306][  0]  kernel_thread+0x48/0x58
[    0.315352][  0]  kthreadd+0x1c8/0x268
[    0.319135][  0]  ret_from_fork+0x10/0x18
[    0.323182][  0] Code: b90067a3 f90037a2 d503201f b400117c (f9400780)
[    0.329784][  0] ---[ end trace df01b2bd811dec5e ]---
[    0.334885][  0] Kernel panic - not syncing: Fatal exception
[    0.340604][  0] Rebooting in 30 seconds..
[   30.346222][  0] Reboot failed -- System halted



thanks.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8b7c90c6-73bb-4e57-b705-ec1f1b692ee4n%40googlegroups.com.

------=_Part_85004_132490027.1699943485662
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br /><div>What is the reason for the following error printed when using Ja=
ilhouse to start Linux in Linux? Replacing the image is also not feasible<b=
r /></div><div>=C2=A0the error log as follows=EF=BC=9A</div><div><br /></di=
v><div>[ =C2=A0 =C2=A00.092570][ =C2=A00] Unable to handle kernel paging re=
quest at virtual address 0000400000000008<br />[ =C2=A0 =C2=A00.101012][ =
=C2=A00] Mem abort info:<br />[ =C2=A0 =C2=A00.104266][ =C2=A00] =C2=A0 ESR=
 =3D 0x96000005<br />[ =C2=A0 =C2=A00.107785][ =C2=A00] =C2=A0 Exception cl=
ass =3D DABT (current EL), IL =3D 32 bits<br />[ =C2=A0 =C2=A00.114204][ =
=C2=A00] =C2=A0 SET =3D 0, FnV =3D 0<br />[ =C2=A0 =C2=A00.117723][ =C2=A00=
] =C2=A0 EA =3D 0, S1PTW =3D 0<br />[ =C2=A0 =C2=A00.121328][ =C2=A00] Data=
 abort info:<br />[ =C2=A0 =C2=A00.124671][ =C2=A00] =C2=A0 ISV =3D 0, ISS =
=3D 0x00000005<br />[ =C2=A0 =C2=A00.128980][ =C2=A00] =C2=A0 CM =3D 0, WnR=
 =3D 0<br />[ =C2=A0 =C2=A00.132410][ =C2=A00] [0000400000000008] user addr=
ess but active_mm is swapper<br />[ =C2=A0 =C2=A00.139270][ =C2=A00] Intern=
al error: Oops: 96000005 [#1] SMP<br />[ =C2=A0 =C2=A00.144636][ =C2=A00] M=
odules linked in:<br />[ =C2=A0 =C2=A00.148156][ =C2=A00] Process kthreadd =
(pid: 2, stack limit =3D 0x(____ptrval____))<br />[ =C2=A0 =C2=A00.155281][=
 =C2=A00] CPU: 0 PID: 2 Comm: kthreadd Not tainted 4.19.90-69+ #3<br />[ =
=C2=A0 =C2=A00.162052][ =C2=A00] Source Version: a22085976f26303c72a6bc7cc0=
d4ee20ff890cf9<br />[ =C2=A0 =C2=A00.168912][ =C2=A00] Hardware name: FT-20=
00/4-D4-DSK Development Board (DT)<br />[ =C2=A0 =C2=A00.175596][ =C2=A00] =
pstate: 60000085 (nZCv daIf -PAN -UAO)<br />[ =C2=A0 =C2=A00.180876][ =C2=
=A00] pc : get_partial_node.isra.24+0x38/0x298<br />[ =C2=A0 =C2=A00.186330=
][ =C2=A00] lr : ___slab_alloc+0x3b8/0x528<br />[ =C2=A0 =C2=A00.190903][ =
=C2=A00] sp : ffff80000a143b10<br />[ =C2=A0 =C2=A00.194685][ =C2=A00] x29:=
 ffff80000a143b10 x28: 0000400000000000<br />[ =C2=A0 =C2=A00.200490][ =C2=
=A00] x27: ffff80000a0fbc00 x26: ffff800023e55de0<br />[ =C2=A0 =C2=A00.206=
294][ =C2=A00] x25: 0000000000000000 x24: 0000000000000035<br />[ =C2=A0 =
=C2=A00.212099][ =C2=A00] x23: ffff0000080edc34 x22: ffff000009539b08<br />=
[ =C2=A0 =C2=A00.217903][ =C2=A00] x21: 0000000000000000 x20: 0000000000000=
001<br />[ =C2=A0 =C2=A00.223707][ =C2=A00] x19: 00000000007080c0 x18: 0000=
000000000001<br />[ =C2=A0 =C2=A00.229511][ =C2=A00] x17: 0000000000000000 =
x16: 0000000000000000<br />[ =C2=A0 =C2=A00.235315][ =C2=A00] x15: ffff0000=
89b4cbb7 x14: 0000000000000003<br />[ =C2=A0 =C2=A00.241120][ =C2=A00] x13:=
 ffff000009b4cbca x12: 0000000000000000<br />[ =C2=A0 =C2=A00.246924][ =C2=
=A00] x11: ffff00000990e2a8 x10: ffff7fe000028520<br />[ =C2=A0 =C2=A00.252=
728][ =C2=A00] x9 : ffff80000a143d90 x8 : ffff80000a126e20<br />[ =C2=A0 =
=C2=A00.258532][ =C2=A00] x7 : 0000000000000000 x6 : 0000000080080008<br />=
[ =C2=A0 =C2=A00.264337][ =C2=A00] x5 : 0000000000000000 x4 : ffff7fe000028=
520<br />[ =C2=A0 =C2=A00.270141][ =C2=A00] x3 : 00000000007080c0 x2 : ffff=
800023e55df0<br />[ =C2=A0 =C2=A00.275945][ =C2=A00] x1 : 0000400000000000 =
x0 : ffff000008315028<br />[ =C2=A0 =C2=A00.281749][ =C2=A00] Call trace:<b=
r />[ =C2=A0 =C2=A00.284654][ =C2=A00] =C2=A0get_partial_node.isra.24+0x38/=
0x298<br />[ =C2=A0 =C2=A00.289755][ =C2=A00] =C2=A0___slab_alloc+0x3b8/0x5=
28<br />[ =C2=A0 =C2=A00.293978][ =C2=A00] =C2=A0__slab_alloc+0x5c/0x78<br =
/>[ =C2=A0 =C2=A00.297937][ =C2=A00] =C2=A0kmem_cache_alloc_node+0xd8/0x220=
<br />[ =C2=A0 =C2=A00.302774][ =C2=A00] =C2=A0copy_process.isra.8+0x1dc/0x=
1308<br />[ =C2=A0 =C2=A00.307611][ =C2=A00] =C2=A0_do_fork+0x78/0x370<br /=
>[ =C2=A0 =C2=A00.311306][ =C2=A00] =C2=A0kernel_thread+0x48/0x58<br />[ =
=C2=A0 =C2=A00.315352][ =C2=A00] =C2=A0kthreadd+0x1c8/0x268<br />[ =C2=A0 =
=C2=A00.319135][ =C2=A00] =C2=A0ret_from_fork+0x10/0x18<br />[ =C2=A0 =C2=
=A00.323182][ =C2=A00] Code: b90067a3 f90037a2 d503201f b400117c (f9400780)=
<br />[ =C2=A0 =C2=A00.329784][ =C2=A00] ---[ end trace df01b2bd811dec5e ]-=
--<br />[ =C2=A0 =C2=A00.334885][ =C2=A00] Kernel panic - not syncing: Fata=
l exception<br />[ =C2=A0 =C2=A00.340604][ =C2=A00] Rebooting in 30 seconds=
..<br />[ =C2=A0 30.346222][ =C2=A00] Reboot failed -- System halted<br /><=
/div><div><br /></div><div><br /></div><div><br /></div><div>thanks.</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8b7c90c6-73bb-4e57-b705-ec1f1b692ee4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/8b7c90c6-73bb-4e57-b705-ec1f1b692ee4n%40googlegroups.co=
m</a>.<br />

------=_Part_85004_132490027.1699943485662--

------=_Part_85003_2030242069.1699943485662--

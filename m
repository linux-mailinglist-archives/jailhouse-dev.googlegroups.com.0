Return-Path: <jailhouse-dev+bncBCPOLQPRTECBB7MV6CTQMGQES4D3HCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x440.google.com (mail-pf1-x440.google.com [IPv6:2607:f8b0:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 545C0799685
	for <lists+jailhouse-dev@lfdr.de>; Sat,  9 Sep 2023 08:04:48 +0200 (CEST)
Received: by mail-pf1-x440.google.com with SMTP id d2e1a72fcca58-68a3b41fa66sf3530009b3a.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 08 Sep 2023 23:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1694239486; x=1694844286; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zT1byEE3nl8iJ029YsEJnhI6pOmSuXkitX/ZB70nnI=;
        b=LX11Yey4fJ8E77LZyQ2bZicu2xaU5pvzT3ZFOUyh/9jnJbuZT/fGVfPPm/cSUq9oJq
         LDQjdgjSFL/iDX5qbbM5ByEu6HopJ0iDhtKaX1RTbbSNJPNxI4xaDhhMY/TPibfyKoPy
         jJ4psg76z5n0aX9aCSv4VJdb0H7FXXFVrET+d2lQ8Scm6Jn8c4ltnl7x23nSpixxpGxe
         knZfegp6/g6fTYxGFeyPJmYjpeiqxJ7qtRAN8SICGgkJWSXXDetJ+sfQsl36WXsFafVT
         SvmylEoqApfKX6PMRPK+RjB9ASUAZEgrBab8S119cCBdasc89TlOkdTvPKaJjeNlQJC2
         3x6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694239486; x=1694844286; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zT1byEE3nl8iJ029YsEJnhI6pOmSuXkitX/ZB70nnI=;
        b=SC8nHmA8Dio83AEiZBqmo2lUZUnr5/8dUGZZaJ91iuMokq9WIC4qDXd2TC9s99g4FE
         acaq2Sc976bE9CNCOzg1eX4y5KIxvITosh14DPmssroEu1V227GzgetgEz/TQzLxw2Kx
         zmSgTAY1xPlBkTNrCz+o/XTLp2Y+NJgCBblX5tudqzdqiq+0foGGgieBfV+DRmI1H/FB
         H/yLyETzsx6s7n6oga38Z5QjpGbd+3CaFNVPMxvkJnzGJu/3fBbX5W1k1+DyWiYZ48kf
         UNw92JDPkqB7S9UEoL2+BF5aa8891s5eWwVu/0QGJRhlop7uV+ybPmrtBDthWSQZtuck
         xlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694239486; x=1694844286;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zT1byEE3nl8iJ029YsEJnhI6pOmSuXkitX/ZB70nnI=;
        b=fOy+S7ukJ8C3YgRUqosannldYCxkmOFmeUt/cb7aSzag/OOlQSPcKX0B6QM9W1AKmM
         c3xvJgCDLtpFDK7JhQX4XUzZ44heAF+pKjId7+MGYzIF59Bb/3axurANH+R9P5MhuXrW
         /0aqv9Jy/EG+9MVBJbITO+appP/dxAZi6Qyzd4IHHHzRwqdAdSJuMHKp9JUnai5JS+Sg
         deIASp4HVKighs1SOJORXNfhHO4YVOWQJyFnhD3dkOLq5CFibLmzCMOqse6SyNpKDPrD
         O5qgf0D4Oj1kfWoXTa2W/fxtbSh+kZVl5hVhpSXdkA2MMVKB27mBrp6tjB644/c+YhIf
         Ljsw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yzx80CX7s9kf7pWdrZZwwotyRrmtx7nsawmrMwOvwaHp4GBFw0H
	oZsFVVnGzA8KFG4nd/crg18=
X-Google-Smtp-Source: AGHT+IHFoxOrt+vKHxQehS+mhnzVuDiOG528+scRgb+j5CvvkMdJpJ1TOPB21huRVFz6mtUE7pWQtA==
X-Received: by 2002:a05:6a21:3291:b0:13f:8153:7e31 with SMTP id yt17-20020a056a21329100b0013f81537e31mr4725789pzb.20.1694239486458;
        Fri, 08 Sep 2023 23:04:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:fa82:b0:271:95b4:8f2a with SMTP id
 cu2-20020a17090afa8200b0027195b48f2als2245783pjb.2.-pod-prod-00-us-canary;
 Fri, 08 Sep 2023 23:04:45 -0700 (PDT)
X-Received: by 2002:a17:902:e88f:b0:1b9:fef8:9af1 with SMTP id w15-20020a170902e88f00b001b9fef89af1mr1672852plg.5.1694239485002;
        Fri, 08 Sep 2023 23:04:45 -0700 (PDT)
Date: Fri, 8 Sep 2023 23:04:43 -0700 (PDT)
From: bot crack <unintialized@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3ffc8cc2-0592-463f-ab65-bd51c2d0ed83n@googlegroups.com>
Subject: How to set the value of pci_mmconfig_base in rootcell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_39160_1188549493.1694239483971"
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

------=_Part_39160_1188549493.1694239483971
Content-Type: multipart/alternative; 
	boundary="----=_Part_39161_867594572.1694239483971"

------=_Part_39161_867594572.1694239483971
Content-Type: text/plain; charset="UTF-8"

Hi, everybody

I encountered some problems when using ivshmem-demo. How should I set the 
value of pci_mmconfig_base?

my rootcell: 






*.platform_info = { .pci_mmconfig_base = 0x7BC00000, .pci_mmconfig_end_bus 
= 0, .pci_is_virtual = 1, .pci_domain = 1, .arm = { .gic_version = 3,*

.......


my linux dts:

















*&reserved_memory { jailhouse: jailhouse@0x70000000{ reg = <0x0 0x70000000 
0x0 0xBC00000>; alignment = <0x1000>; no-map; status = "okay"; }; 
pci_reserved: pci@0x7BC00000{ reg = <0x0 0x7BC00000 0x0 0x00200000>; 
alignment = <0x1000>; no-map; status = "okay"; };};*
Kernel output after inserting jailhouse.ko








*[  264.612191] jailhouse: loading out-of-tree module taints kernel.[ 
 264.624958] pci-host-generic 7bc00000.pci: host bridge /pci@0 ranges:[ 
 264.625007] pci-host-generic 7bc00000.pci:      MEM 
0x007bd00000..0x007bd01fff -> 0x007bd00000[  264.625028] pci-host-generic 
7bc00000.pci: resource collision: [mem 0x7bd00000-0x7bd01fff] conflicts 
with reserved [mem 0x70000000-0x7bdfffff][  264.625051] pci-host-generic: 
probe of 7bc00000.pci failed with error -12[  264.625475] The Jailhouse is 
opening.[  264.792429] psci: CPU3 killed (polled 0 ms)[  264.794210] 
Created Jailhouse cell "inmate-demo"*
The operating environment is arm64, linux5.10.160

*How should I set the value of pci_mmconfig_base?*

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3ffc8cc2-0592-463f-ab65-bd51c2d0ed83n%40googlegroups.com.

------=_Part_39161_867594572.1694239483971
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, everybody<div><br />I encountered some problems when using ivshmem-demo=
. How should I set the value of pci_mmconfig_base?<br /><br />my rootcell: =
<br /><i>.platform_info =3D {<br /><span style=3D"white-space: pre;">	</spa=
n><font color=3D"#ff0000">.pci_mmconfig_base =3D 0x7BC00000, </font><br /><=
span style=3D"white-space: pre;">	</span>.pci_mmconfig_end_bus =3D 0,<br />=
<span style=3D"white-space: pre;">	</span>.pci_is_virtual =3D 1,<br /><span=
 style=3D"white-space: pre;">	</span>.pci_domain =3D 1,<br /><span style=3D=
"white-space: pre;">	</span>.arm =3D {<br /><span style=3D"white-space: pre=
;">		</span>.gic_version =3D 3,</i><br /><br />.......<br /><br /><br />my =
linux dts:<br /><i>&amp;reserved_memory {<br /><br /><span style=3D"white-s=
pace: pre;">	</span>jailhouse: jailhouse@0x70000000{<br /><span style=3D"wh=
ite-space: pre;">		</span>reg =3D &lt;0x0 0x70000000 0x0 0xBC00000&gt;;<br =
/><span style=3D"white-space: pre;">		</span>alignment =3D &lt;0x1000&gt;;<=
br /><span style=3D"white-space: pre;">		</span>no-map;<br /><span style=3D=
"white-space: pre;">		</span>status =3D "okay";<br /><span style=3D"white-s=
pace: pre;">	</span>};<br /><br /><span style=3D"white-space: pre;">	</span=
>pci_reserved: pci@0x7BC00000{<br /><span style=3D"white-space: pre;">		</s=
pan><font color=3D"#ff0000">reg =3D &lt;0x0 0x7BC00000 0x0 0x00200000&gt;;<=
/font><br /><span style=3D"white-space: pre;">		</span>alignment =3D &lt;0x=
1000&gt;;<br /><span style=3D"white-space: pre;">		</span>no-map;<br /><spa=
n style=3D"white-space: pre;">		</span>status =3D "okay";<br /><span style=
=3D"white-space: pre;">	</span>};<br /><br />};<br /></i><br />Kernel outpu=
t after inserting jailhouse.ko<br /><i>[ =C2=A0264.612191] jailhouse: loadi=
ng out-of-tree module taints kernel.<br />[ =C2=A0264.624958] pci-host-gene=
ric 7bc00000.pci: host bridge /pci@0 ranges:<br />[ =C2=A0264.625007] pci-h=
ost-generic 7bc00000.pci: =C2=A0 =C2=A0 =C2=A0MEM 0x007bd00000..0x007bd01ff=
f -&gt; 0x007bd00000<br />[ =C2=A0264.625028] pci-host-generic 7bc00000.pci=
: <b><font color=3D"#ff0000">resource collision: [mem 0x7bd00000-0x7bd01fff=
] conflicts with reserved [mem 0x70000000-0x7bdfffff]</font></b><br />[ =C2=
=A0264.625051] pci-host-generic: probe of 7bc00000.pci failed with error -1=
2<br />[ =C2=A0264.625475] The Jailhouse is opening.<br />[ =C2=A0264.79242=
9] psci: CPU3 killed (polled 0 ms)<br />[ =C2=A0264.794210] Created Jailhou=
se cell "inmate-demo"<br /></i><br />The operating environment is arm64, li=
nux5.10.160</div><div><br /><b>How should I set the value of pci_mmconfig_b=
ase?</b><br /></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3ffc8cc2-0592-463f-ab65-bd51c2d0ed83n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/3ffc8cc2-0592-463f-ab65-bd51c2d0ed83n%40googlegroups.co=
m</a>.<br />

------=_Part_39161_867594572.1694239483971--

------=_Part_39160_1188549493.1694239483971--

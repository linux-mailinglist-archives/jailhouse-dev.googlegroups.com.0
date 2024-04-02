Return-Path: <jailhouse-dev+bncBDGNPLXR4ICBBPNLWGYAMGQEOO4I4SQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113f.google.com (mail-yw1-x113f.google.com [IPv6:2607:f8b0:4864:20::113f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F169895C1B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Apr 2024 21:00:15 +0200 (CEST)
Received: by mail-yw1-x113f.google.com with SMTP id 00721157ae682-6150e36ca0dsf23932587b3.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Apr 2024 12:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712084414; x=1712689214; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd9VOINDuP6e8OEC4kN0MNgCjg6fX60eJES3CkqgNwM=;
        b=tOCTayIjJ27Nl4FdR0mZxOIliUen9caY/hchp3sQpp9NmRn+1pSPddQab7GN3Tb6FC
         tiCF41H4MCNFjMB6S8IjhMeibc9S4UFVxu3h7SuiV+OdedjCsNTP4Ch2Hz5I9We9RjgE
         DItlsBDfdFDsbr164y5DZFA+8p0PL618Dz8r0IQWjhvqlT4jVSpXZltos9bfzLbU6APL
         clNatd9fywOKipAr2xIul4q6eUdkVROOIDT3np8DLgzMsY7WYxfNpyw+mPHgg9ivHwu0
         IMYEb60HJVoDbP8MM/4RNOHDm7oQs/iqrAftMv4dVyIClYp6XSDdQgwD8G2YAdHmsyPK
         AchA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712084414; x=1712689214; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dd9VOINDuP6e8OEC4kN0MNgCjg6fX60eJES3CkqgNwM=;
        b=TxWGjCn9IpErWAJf31+wZrfyovmoqnDYMY8HkOMJ196AzPRCV9RxgknJPCoPEwk84R
         gfWJtgrxYeNMUmuJt7uVa6dATfghiI6OsVFJuLsXvo6zzXtzqQSw3Aea6iMPPmxe3Wp+
         2jc9vVWKR+yxxYVAKAZwVAOHgPO07P8lFYsQh/AK3GrNnuu06wM5ghTwXDX/5AJI2RBv
         Z29f4bx8ZtpzDn1zlsbfHbhlJoc+TmCVxUD4we4xujOddVvu+brJzaaayVTpttqebkSr
         51HYi/aBa6w5QTaQlYhNCQx+WP1qXa7G+LDFZzl/iwSoxfqlZsotumdr4xf6LJc0Xmza
         gEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712084414; x=1712689214;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd9VOINDuP6e8OEC4kN0MNgCjg6fX60eJES3CkqgNwM=;
        b=enIMCNApO1t3XcdJsoaLSjRHvycLLHyUhY/zV8QwxoA0Y+fQHguFpjZR/nU9gbaDEy
         WMdIW9ALDtoDQCZtZ22eTYWINFiE4DKSYiElOzPCCxU4ag/pc/OLibc4Koh9QHPQmBIj
         6Q7DlSqjHGZMsf66hgbk9wKIYdfSAiRk+35mHLxGe14zlX5S9MCXHHj36g/Rdn1EsKTF
         nNVAJoqb2FiALu1cEAYFp+u2wowM5u17Nk+lT96QeoHpSoJeWVX4nMB74haKALu+z4qV
         VA+10CHbIFZ3lfKM4QAyOPyVSaW28IwJcP4qXQkPR4tnEtlEGuyeNDsHhIuUacvxt8RQ
         H05A==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCV+7VPFlFTWcafgWvd/1wkGY0RCcAAnGS7YDgthpYAJGqvWQ6z9fSqHIx7BoJjdKgGyVEJxHya8XuqwOEb+fdciqTsKOkk3T4YuJBU=
X-Gm-Message-State: AOJu0YzILSR83NI30bMViTV5ZCpvblRzhNLnFw0o4fJ4LQB0ln1p2rLe
	mSxns8edieX+XbeFkYy4facbo8TfeOMOakimK+Ntqbys7MZeq86k
X-Google-Smtp-Source: AGHT+IHk/ChUTwSoyhOluaHtR1Yx47rf824q9avRmV6tZ6oOfD/f9vM9M3YeJruqAJQ+fS5Uy3iadg==
X-Received: by 2002:a5b:889:0:b0:dcd:a28e:e5e0 with SMTP id e9-20020a5b0889000000b00dcda28ee5e0mr431411ybq.25.1712084414117;
        Tue, 02 Apr 2024 12:00:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:ab2c:0:b0:dcc:4b24:c0df with SMTP id u41-20020a25ab2c000000b00dcc4b24c0dfls38231ybi.0.-pod-prod-03-us;
 Tue, 02 Apr 2024 12:00:12 -0700 (PDT)
X-Received: by 2002:a05:690c:dc2:b0:614:ad33:3980 with SMTP id db2-20020a05690c0dc200b00614ad333980mr1739358ywb.7.1712084412255;
        Tue, 02 Apr 2024 12:00:12 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:00:11 -0700 (PDT)
From: xy dallas <dallas.xyf@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0034e1a2-a439-45de-8c25-e090cdf199b5n@googlegroups.com>
Subject: How to allocate QEMU simulated PCI devices to non-root Linux.
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_14342_2032753399.1712084411541"
X-Original-Sender: dallas.xyf@gmail.com
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

------=_Part_14342_2032753399.1712084411541
Content-Type: multipart/alternative; 
	boundary="----=_Part_14343_1102258939.1712084411541"

------=_Part_14343_1102258939.1712084411541
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I'm trying to provide QEMU simulated PCI devices to a non-root Linux 
environment. However, I haven't found any JAILHOUSE_PCI_TYPE_DEVICE type of 
PCI devices to reference in the arm64 config. Instead, I only found virtual 
devices of type JAILHOUSE_PCI_TYPE_IVSHMEM. These devices are mounted on a 
simple bus created by Jailhouse, unlike the devices I added using "-device 
xyfdev-pci,id=t0,addr=0x18" on QEMU, which are in two separate domains. 

I attempted to add the content of JAILHOUSE_PCI_TYPE_DEVICE to the cell 
config:

{
    .type = JAILHOUSE_PCI_TYPE_DEVICE,
    .domain = 0,
    .bdf = 0x18,
    .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
    .shmem_regions_start = 14,
    .shmem_dev_id = 1,
    .shmem_peers = 2,
    .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
}

But I'm unsure how to modify the device tree file to expose this device to 
non-root. If I don't modify the device tree, non-root Linux will report the 
following error during startup:

FATAL: Unhandled HYP exception: synchronous abort from EL2
pc: 0000ffffc020b27c lr: 0000ffffc020bc84 spsr: 800003c9 EL2
sp: 0000ff0000010e30 esr: 25 1 1800005
x0: 0000000000000000 x1: 0000ff0000010eb8 x2: 0000000000018000
x3: 0000ffffc020b260 x4: 0000ffffc020b27c x5: 0000000000000003
x6: 0000000000000018 x7: 0000000000000000 x8: 0000ffffc02b32b0
x9: 0000ff0000010e6c x10: 0000ffffc02b02fc x11: 0000000000000000
x12: 0000000000000000 x13: 0000000000000028 x14: 0000ff0000010eb8
x15: ffff00003482691c x16: 0000ffffc020bbd8 x17: 00000000af5879f2
x18: ffffffffffffffff x19: 0000ff0000010eb8 x20: 0000000000000018
x21: 0000000000000000 x22: 0000000000000002 x23: 0000000000000004
x24: 0000000000000000 x25: 0000000000000018 x26: ffff8000112c0530
x27: 0000000000000000 x28: 0000000000000000 x29: 0000ff0000010e30

I'd like to know how I can allocate QEMU simulated PCI devices to non-root 
Linux. I'm working based on qemu-arm64.c and qemu-arm64-linux-demo.c.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0034e1a2-a439-45de-8c25-e090cdf199b5n%40googlegroups.com.

------=_Part_14343_1102258939.1712084411541
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,<br /><br />I'm trying to provide QEMU simulated PCI devices=
 to a non-root Linux environment. However, I haven't found any JAILHOUSE_PC=
I_TYPE_DEVICE type of PCI devices to reference in the arm64 config. Instead=
, I only found virtual devices of type JAILHOUSE_PCI_TYPE_IVSHMEM. These de=
vices are mounted on a simple bus created by Jailhouse, unlike the devices =
I added using "-device xyfdev-pci,id=3Dt0,addr=3D0x18" on QEMU, which are i=
n two separate domains. <br /><br />I attempted to add the content of JAILH=
OUSE_PCI_TYPE_DEVICE to the cell config:<br /><br />{<br />=C2=A0 =C2=A0 .t=
ype =3D JAILHOUSE_PCI_TYPE_DEVICE,<br />=C2=A0 =C2=A0 .domain =3D 0,<br />=
=C2=A0 =C2=A0 .bdf =3D 0x18,<br />=C2=A0 =C2=A0 .bar_mask =3D JAILHOUSE_IVS=
HMEM_BAR_MASK_INTX,<br />=C2=A0 =C2=A0 .shmem_regions_start =3D 14,<br />=
=C2=A0 =C2=A0 .shmem_dev_id =3D 1,<br />=C2=A0 =C2=A0 .shmem_peers =3D 2,<b=
r />=C2=A0 =C2=A0 .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,<br /=
>}<br /><br />But I'm unsure how to modify the device tree file to expose t=
his device to non-root. If I don't modify the device tree, non-root Linux w=
ill report the following error during startup:<br /><br /><div style=3D"col=
or: rgb(204, 204, 204); background-color: rgb(31, 31, 31); font-family: Men=
lo, Monaco, &quot;Courier New&quot;, monospace; font-size: 12px; line-heigh=
t: 18px; white-space: pre;"><div><span style=3D"color: rgb(220, 220, 170);"=
>FATAL:</span> Unhandled HYP <span style=3D"color: rgb(220, 220, 170);">exc=
eption:</span> synchronous abort from EL2</div><div> <span style=3D"color: =
rgb(220, 220, 170);">pc:</span> 0000ffffc020b27c   <span style=3D"color: rg=
b(220, 220, 170);">lr:</span> 0000ffffc020bc84 <span style=3D"color: rgb(22=
0, 220, 170);">spsr:</span> 800003c9     EL2</div><div> <span style=3D"colo=
r: rgb(86, 156, 214);">sp</span>: 0000ff0000010e30  <span style=3D"color: r=
gb(220, 220, 170);">esr:</span> <span style=3D"color: rgb(181, 206, 168);">=
25</span> <span style=3D"color: rgb(181, 206, 168);">1</span> <span style=
=3D"color: rgb(181, 206, 168);">1800005</span></div><div> <span style=3D"co=
lor: rgb(220, 220, 170);">x0:</span> <span style=3D"color: rgb(181, 206, 16=
8);">0000000000000000</span>   <span style=3D"color: rgb(220, 220, 170);">x=
1:</span> 0000ff0000010eb8   <span style=3D"color: rgb(220, 220, 170);">x2:=
</span> <span style=3D"color: rgb(181, 206, 168);">0000000000018000</span><=
/div><div> <span style=3D"color: rgb(220, 220, 170);">x3:</span> 0000ffffc0=
20b260   <span style=3D"color: rgb(220, 220, 170);">x4:</span> 0000ffffc020=
b27c   <span style=3D"color: rgb(220, 220, 170);">x5:</span> <span style=3D=
"color: rgb(181, 206, 168);">0000000000000003</span></div><div> <span style=
=3D"color: rgb(220, 220, 170);">x6:</span> <span style=3D"color: rgb(181, 2=
06, 168);">0000000000000018</span>   <span style=3D"color: rgb(220, 220, 17=
0);">x7:</span> <span style=3D"color: rgb(181, 206, 168);">0000000000000000=
</span>   <span style=3D"color: rgb(220, 220, 170);">x8:</span> 0000ffffc02=
b32b0</div><div> <span style=3D"color: rgb(220, 220, 170);">x9:</span> 0000=
ff0000010e6c  <span style=3D"color: rgb(220, 220, 170);">x10:</span> 0000ff=
ffc02b02fc  <span style=3D"color: rgb(220, 220, 170);">x11:</span> <span st=
yle=3D"color: rgb(181, 206, 168);">0000000000000000</span></div><div><span =
style=3D"color: rgb(220, 220, 170);">x12:</span> <span style=3D"color: rgb(=
181, 206, 168);">0000000000000000</span>  <span style=3D"color: rgb(220, 22=
0, 170);">x13:</span> <span style=3D"color: rgb(181, 206, 168);">0000000000=
000028</span>  <span style=3D"color: rgb(220, 220, 170);">x14:</span> 0000f=
f0000010eb8</div><div><span style=3D"color: rgb(220, 220, 170);">x15:</span=
> ffff00003482691c  <span style=3D"color: rgb(220, 220, 170);">x16:</span> =
0000ffffc020bbd8  <span style=3D"color: rgb(220, 220, 170);">x17:</span> 00=
000000af5879f2</div><div><span style=3D"color: rgb(220, 220, 170);">x18:</s=
pan> ffffffffffffffff  <span style=3D"color: rgb(220, 220, 170);">x19:</spa=
n> 0000ff0000010eb8  <span style=3D"color: rgb(220, 220, 170);">x20:</span>=
 <span style=3D"color: rgb(181, 206, 168);">0000000000000018</span></div><d=
iv><span style=3D"color: rgb(220, 220, 170);">x21:</span> <span style=3D"co=
lor: rgb(181, 206, 168);">0000000000000000</span>  <span style=3D"color: rg=
b(220, 220, 170);">x22:</span> <span style=3D"color: rgb(181, 206, 168);">0=
000000000000002</span>  <span style=3D"color: rgb(220, 220, 170);">x23:</sp=
an> <span style=3D"color: rgb(181, 206, 168);">0000000000000004</span></div=
><div><span style=3D"color: rgb(220, 220, 170);">x24:</span> <span style=3D=
"color: rgb(181, 206, 168);">0000000000000000</span>  <span style=3D"color:=
 rgb(220, 220, 170);">x25:</span> <span style=3D"color: rgb(181, 206, 168);=
">0000000000000018</span>  <span style=3D"color: rgb(220, 220, 170);">x26:<=
/span> ffff8000112c0530</div><div><span style=3D"color: rgb(220, 220, 170);=
">x27:</span> <span style=3D"color: rgb(181, 206, 168);">0000000000000000</=
span>  <span style=3D"color: rgb(220, 220, 170);">x28:</span> <span style=
=3D"color: rgb(181, 206, 168);">0000000000000000</span>  <span style=3D"col=
or: rgb(220, 220, 170);">x29:</span> 0000ff0000010e30</div></div><br />I'd =
like to know how I can allocate QEMU simulated PCI devices to non-root Linu=
x. I'm working based on qemu-arm64.c and qemu-arm64-linux-demo.c.<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0034e1a2-a439-45de-8c25-e090cdf199b5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0034e1a2-a439-45de-8c25-e090cdf199b5n%40googlegroups.co=
m</a>.<br />

------=_Part_14343_1102258939.1712084411541--

------=_Part_14342_2032753399.1712084411541--

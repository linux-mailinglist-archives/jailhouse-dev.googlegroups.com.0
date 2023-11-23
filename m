Return-Path: <jailhouse-dev+bncBCLNDZG33ILRBAMQ7OVAMGQEAZBCTNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103a.google.com (mail-pj1-x103a.google.com [IPv6:2607:f8b0:4864:20::103a])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C377F570C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Nov 2023 04:33:23 +0100 (CET)
Received: by mail-pj1-x103a.google.com with SMTP id 98e67ed59e1d1-28559bb972csf511866a91.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Nov 2023 19:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700710402; x=1701315202; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:x-original-sender
         :mime-version:subject:references:in-reply-to:message-id:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4ploPlmapno5/pd+6w1TDYNqDaohPHlLxOzZ5EOEt4=;
        b=oQ2Hvoh/Wh8WZvbEUJsM2qG+kW1SUc/2p89vl6ZL5XFzeK1JWMk1vVs9wmCPQR05Vv
         XgRq7xcKERjrYIaxeqaBZWQFwYqNP8X1+kAxTGqHzjUn144RYRktnzq9SmbwuROqERdY
         Mwyc1vjA2mNLn5dNCzVbHKlAyo52S3tsu/phhi3wZpT5JeOEKCbwirUwtcvpuQrLzMmr
         00QTic3Rli0g7oW7t3/xFLgshTmdmA3XAmPMXIHGzUXVXrt2IUM/TFrx7FwbaDrYZej5
         SM4mjZWrTgyFBx3xELJCQsfhH8jkpkIet9+lOvjgoPw0t6PwfafalkQtKkuq83USon6f
         r2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700710402; x=1701315202;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4ploPlmapno5/pd+6w1TDYNqDaohPHlLxOzZ5EOEt4=;
        b=HFg6IKsXMjWv2aJan6zBjKS4thKdEUr28seZLz0aRMpaFSrWY6UCKjcA8FHGIkp5YT
         DeefHzCsf8m+wfDkeqn27f6LX6GJMbXtuaN5hVIk4eqkrXDlxn9g6hFCPLhab+8HfoZy
         Oc0M0Zk3bux0ZdceCab9rkMbsp2s8ikQQ/536SPTMZIpQhkCzHz//X3OgwBlC5crsJ0e
         CCaVRJrkR8J6wDY5XUf9DlL2EKLgz3SfTKzxp8iYDdptL1t+G3WY5AIqZ3tS1dNugEv9
         4Nrbpkfu5GJxN/gGhn9OvUXYPCyLjR+89e9g3XcjGGbi+DzRb/rJBXPOGScyZJpW60Ws
         9qMQ==
X-Gm-Message-State: AOJu0YxQ7VHNSzgDWZagquqFSxUEJ0rm5gFbTyU8f+YGt/n5IEAZcF+u
	/a2Bnt712KlLoyYVAT0a9eU=
X-Google-Smtp-Source: AGHT+IFqYAteUmdDqwq6qfkDD0ltGFGVHx50YDw87ZjeOOiUIbVV1MgP6KwnZTBozjEMznuZLjktnA==
X-Received: by 2002:a17:90a:1d9:b0:27d:24d6:7343 with SMTP id 25-20020a17090a01d900b0027d24d67343mr4250691pjd.19.1700710401652;
        Wed, 22 Nov 2023 19:33:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:7401:b0:27c:eb58:f77e with SMTP id
 a1-20020a17090a740100b0027ceb58f77els268518pjg.2.-pod-prod-03-us; Wed, 22 Nov
 2023 19:33:20 -0800 (PST)
X-Received: by 2002:a17:90a:8c03:b0:280:3ea0:7fcf with SMTP id a3-20020a17090a8c0300b002803ea07fcfmr1056606pjo.3.1700710400164;
        Wed, 22 Nov 2023 19:33:20 -0800 (PST)
Date: Wed, 22 Nov 2023 19:33:18 -0800 (PST)
From: =?UTF-8?B?J+W8oOW5sycgdmlhIEphaWxob3VzZQ==?= <jailhouse-dev@googlegroups.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2be7b167-688f-4b75-971f-57242f8b443fn@googlegroups.com>
In-Reply-To: <184a93de-9ba3-4ad2-9771-f114000eeaf5@oth-regensburg.de>
References: <ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n@googlegroups.com>
 <CAEfxd-9ruixKv7sB=EFhnH6Uw4GsYgDnpKjtCqBrRGtkbtxuSg@mail.gmail.com>
 <f23d0d17-ca3c-4807-a7b6-0e2154ccbe75n@googlegroups.com>
 <184a93de-9ba3-4ad2-9771-f114000eeaf5@oth-regensburg.de>
Subject: =?UTF-8?Q?Re:_arm_cortex_A55_support=EF=BC=9F?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_646_1060129782.1700710398857"
X-Original-Sender: 2022280902@qq.com
X-Original-From: =?UTF-8?B?5byg5bmz?= <2022280902@qq.com>
Reply-To: =?UTF-8?B?5byg5bmz?= <2022280902@qq.com>
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

------=_Part_646_1060129782.1700710398857
Content-Type: multipart/alternative; 
	boundary="----=_Part_647_1933940125.1700710398857"

------=_Part_647_1933940125.1700710398857
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>On 22/11/2023 06:53, '=E5=BC=A0=E5=B9=B3' via Jailhouse wrote:
>> I am trying to transplant jailhouse on the A55 core, but now I have
>> encountered some problems. After I execute the following command, the
>> system will freeze.
>> $ jailhouse enable renesas-r9a07g044l2.cell
>
>No error log? Is the debug console configured correctly?

I think there is no problem with the debug console configuration I set up.
Please refer to:
.debug_console =3D {
     .address =3D 0x1004b800,
     .size =3D 0x400,
     .type =3D JAILHOUSE_CON_TYPE_SCIFA,
     .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
             JAILHOUSE_CON_REGDIST_4,
},

>
>>
>> What are the possible consequences?
>>
>> I made sure I did the following:
>> 1.Linux kernel version 5.10
>> 2.Linux starts in EL2
>> 3. Turn on KVM
>
>Do not use KVM in combination with Jailhouse. Disable KVM in your kernel.
>
I turned off KVM as you said but the problem still exists.
root@smarc-rzg2l:~# dmesg | grep -r kvm
root@smarc-rzg2l:~# insmod jailhouse.ko
[123.760797] jailhouse: loading out-of-tree module taints kernel.
root@smarc-rzg2l:~# jailhouse enable renesas-r9a07g044l2.cell


>Ralf
>
>> 4. Turn off kernel CONFIG_ARM64_VHE

I would also like to add:
I refer to this post and added mov and ret modifications to entry.S to=20
output jailhouse is opening.
However, when using the command jailhouse cell list later, I also=20
encountered the problem of the serial port being stuck.
Reference post:=20
https://groups.google.com/g/jailhouse-dev/c/zwY9bpxq8mg/m/VF44nEC2AwAJ
log:
root@smarc-rzg2l:~# insmod jailhouse.ko
[79.631308] jailhouse: loading out-of-tree module taints kernel.
root@smarc-rzg2l:~# jailhouse enable renesas-r9a07g044l2.cell
[85.716867] pci-host-generic e0000000.pci: host bridge /pci@0 ranges:
[85.723692] pci-host-generic e0000000.pci: MEM 0x00e0100000..0x00e0103fff=
=20
-> 0x00e0100000
[85.733615] pci-host-generic e0000000.pci: ECAM at [mem=20
0xe0000000-0xe00fffff] for [bus 00]
[85.742977] pci-host-generic e0000000.pci: PCI host bridge to bus 0001:00
[85.749828] pci_bus 0001:00: root bus resource [bus 00]
[85.755130] pci_bus 0001:00: root bus resource [mem 0xe0100000-0xe0103fff]
[85.763626] pci 0001:00:1f.0: [0ff0:c000] type 0f class 0xc0000f
[85.769669] pci 0001:00:1f.0: unknown header type 0f, ignoring device
[85.776475] The Jailhouse is opening.
root@smarc-rzg2l:~# jailhouse cell list
ID Name

So is this way of modifying entry.S the correct way?

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2be7b167-688f-4b75-971f-57242f8b443fn%40googlegroups.com.

------=_Part_647_1933940125.1700710398857
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

&gt;On 22/11/2023 06:53, '=E5=BC=A0=E5=B9=B3' via Jailhouse wrote:<br />&gt=
;&gt; I am trying to transplant jailhouse on the A55 core, but now I have<b=
r />&gt;&gt; encountered some problems. After I execute the following comma=
nd, the<br />&gt;&gt; system will freeze.<br />&gt;&gt; $ jailhouse enable =
renesas-r9a07g044l2.cell<br />&gt;<br />&gt;No error log? Is the debug cons=
ole configured correctly?<br /><br />I think there is no problem with the d=
ebug console configuration I set up.<br />Please refer to:<br /><div style=
=3D"color: rgb(204, 204, 204); background-color: rgb(31, 31, 31); font-fami=
ly: Consolas, &quot;Courier New&quot;, monospace; line-height: 19px; white-=
space: pre;"><div>.debug_console =3D {</div><div>=C2=A0 =C2=A0 =C2=A0.addre=
ss =3D 0x1004b800,</div><div>=C2=A0 =C2=A0 =C2=A0.size =3D 0x400,</div><div=
>=C2=A0 =C2=A0 =C2=A0.type =3D JAILHOUSE_CON_TYPE_SCIFA,</div><div>=C2=A0 =
=C2=A0 =C2=A0.flags =3D JAILHOUSE_CON_ACCESS_MMIO |</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JAILHOUSE_CON_REGDIST_4,</div><div>},</d=
iv></div><br />&gt;<br />&gt;&gt;<br />&gt;&gt; What are the possible conse=
quences?<br />&gt;&gt;<br />&gt;&gt; I made sure I did the following:<br />=
&gt;&gt; 1.Linux kernel version 5.10<br />&gt;&gt; 2.Linux starts in EL2<br=
 />&gt;&gt; 3. Turn on KVM<br />&gt;<br />&gt;Do not use KVM in combination=
 with Jailhouse. Disable KVM in your kernel.<br />&gt;<br />I turned off KV=
M as you said but the problem still exists.<br /><div style=3D"color: rgb(2=
04, 204, 204); background-color: rgb(31, 31, 31); font-family: Consolas, &q=
uot;Courier New&quot;, monospace; line-height: 19px; white-space: pre;"><di=
v>root@smarc-rzg2l:~# dmesg | grep -r kvm</div><div>root@smarc-rzg2l:~# ins=
mod jailhouse.ko</div><div>[123.760797] jailhouse: loading out-of-tree modu=
le taints kernel.</div><div>root@smarc-rzg2l:~# jailhouse enable renesas-r9=
a07g044l2.cell</div><br /></div><br />&gt;Ralf<br />&gt;<br />&gt;&gt; 4. T=
urn off kernel CONFIG_ARM64_VHE<br /><br />I would also like to add:<br />I=
 refer to this post and added mov and ret modifications to entry.S to outpu=
t jailhouse is opening.<br />However, when using the command jailhouse cell=
 list later, I also encountered the problem of the serial port being stuck.=
<br />Reference post: https://groups.google.com/g/jailhouse-dev/c/zwY9bpxq8=
mg/m/VF44nEC2AwAJ<br />log:<br /><div style=3D"color: rgb(204, 204, 204); b=
ackground-color: rgb(31, 31, 31); font-family: Consolas, &quot;Courier New&=
quot;, monospace; line-height: 19px; white-space: pre;"><div>root@smarc-rzg=
2l:~# insmod jailhouse.ko</div><div>[79.631308] jailhouse: loading out-of-t=
ree module taints kernel.</div><div>root@smarc-rzg2l:~# jailhouse enable re=
nesas-r9a07g044l2.cell</div><div>[85.716867] pci-host-generic e0000000.pci:=
 host bridge /pci@0 ranges:</div><div>[85.723692] pci-host-generic e0000000=
.pci: MEM 0x00e0100000..0x00e0103fff -&gt; 0x00e0100000</div><div>[85.73361=
5] pci-host-generic e0000000.pci: ECAM at [mem 0xe0000000-0xe00fffff] for [=
bus 00]</div><div>[85.742977] pci-host-generic e0000000.pci: PCI host bridg=
e to bus 0001:00</div><div>[85.749828] pci_bus 0001:00: root bus resource [=
bus 00]</div><div>[85.755130] pci_bus 0001:00: root bus resource [mem 0xe01=
00000-0xe0103fff]</div><div>[85.763626] pci 0001:00:1f.0: [0ff0:c000] type =
0f class 0xc0000f</div><div>[85.769669] pci 0001:00:1f.0: unknown header ty=
pe 0f, ignoring device</div><div>[85.776475] The Jailhouse is opening.</div=
><div>root@smarc-rzg2l:~# jailhouse cell list</div><div>ID Name</div></div>=
<div><br /></div>So is this way of modifying entry.S the correct way?

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2be7b167-688f-4b75-971f-57242f8b443fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2be7b167-688f-4b75-971f-57242f8b443fn%40googlegroups.co=
m</a>.<br />

------=_Part_647_1933940125.1700710398857--

------=_Part_646_1060129782.1700710398857--

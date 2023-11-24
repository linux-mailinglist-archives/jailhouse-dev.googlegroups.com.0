Return-Path: <jailhouse-dev+bncBCLNDZG33ILRBLX576VAMGQEEQOT76Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x440.google.com (mail-pf1-x440.google.com [IPv6:2607:f8b0:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CE47F6A33
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Nov 2023 02:38:56 +0100 (CET)
Received: by mail-pf1-x440.google.com with SMTP id d2e1a72fcca58-6c0362a50bbsf1501702b3a.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Nov 2023 17:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700789935; x=1701394735; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:x-original-sender
         :mime-version:subject:references:in-reply-to:message-id:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EjwMZ5gcu3rQ2ejhibdPz+Wo0GVBnw2aTvozJjU5SVw=;
        b=dv7jS8TleQ9i0jHwrow1sS+DeO9dLBjEz8s74/jVvBDLTuQme2lwuNODNS2YIUhdm6
         sQbn4NRnEaaMbV9Z42pCYJaNhHRr5SHkZ6IZUl4tqTLxpYhwMf62CRwIsO2YhfTKt2Sv
         ZZMs2Fu+6Rc0Hk3nRqMMVYN9z1xAdLzuxNKB6dy86X549i6u/Vk2NFCKcRdrZ0U2FJY9
         0jr6FG8uNbhNlQrSTiB8J60XFBahiCAlBJBnGCtnlkApf/jsJKRxRTprnmUTPG0fdoUK
         RTyzFvReOS/mdlcvWoj2SIllVZ4BjFHyPNBDPi4A/oVhpchHWCW9oTNJipVmu/byEvBk
         D9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700789935; x=1701394735;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjwMZ5gcu3rQ2ejhibdPz+Wo0GVBnw2aTvozJjU5SVw=;
        b=iyIvPcuInGVaanUT+1BIsZxwpbRP3svfYoFk8/eMz2+SplEL7J5iALFgD58nZUbpjJ
         4sk2bONHEzDwwha1PpPNAlH0PsRpV2V5SCdglJ7J4vYf++aSRa5bDs8auyAVjcq2sDxk
         XktYfrjjtcri10eYWxL4pAEuzv74g6mKNpycWHQ2rTqf0uBE9WRa1VDKK4xRSO4yrVGF
         5Dk3fluKnKCej/ghvlxnresgzFHKcDB+pgu7IRlADvx7kT6cB56T2EijvC8VldPWZ0+u
         bgMjc0QbewAgp+2SbxKNp9HkiyCvNImUZdcxuaIM0Wzspt4Mc1tN2nishJcKbHwuzSoA
         dyww==
X-Gm-Message-State: AOJu0YxcR9ti5VJFxbceHWsQLJ52U/MBUQywZ015WY5VnCiLX1C0tzhh
	qdGlfEY+OUBqxOeEv0gAea0=
X-Google-Smtp-Source: AGHT+IFZJlGUIg/7zQ/+wi00RYcDFkEuo+9lT3b6iO9bLN7lHJ5PvgN3zoOSQKb8YlAsz3Z7myzPcg==
X-Received: by 2002:a05:6a20:d904:b0:18b:9149:b69 with SMTP id jd4-20020a056a20d90400b0018b91490b69mr1709722pzb.6.1700789934643;
        Thu, 23 Nov 2023 17:38:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:e88f:b0:1cf:78a6:d66 with SMTP id
 w15-20020a170902e88f00b001cf78a60d66ls795454plg.1.-pod-prod-04-us; Thu, 23
 Nov 2023 17:38:53 -0800 (PST)
X-Received: by 2002:a17:903:2587:b0:1cc:e76:f3f7 with SMTP id jb7-20020a170903258700b001cc0e76f3f7mr269767plb.8.1700789933107;
        Thu, 23 Nov 2023 17:38:53 -0800 (PST)
Date: Thu, 23 Nov 2023 17:38:52 -0800 (PST)
From: =?UTF-8?B?J+W8oOW5sycgdmlhIEphaWxob3VzZQ==?= <jailhouse-dev@googlegroups.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f1786c5e-97ee-4084-8c13-4a364f869ab1n@googlegroups.com>
In-Reply-To: <42e9e931-b628-40a5-8375-cc2a495eff41@oth-regensburg.de>
References: <ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n@googlegroups.com>
 <CAEfxd-9ruixKv7sB=EFhnH6Uw4GsYgDnpKjtCqBrRGtkbtxuSg@mail.gmail.com>
 <f23d0d17-ca3c-4807-a7b6-0e2154ccbe75n@googlegroups.com>
 <184a93de-9ba3-4ad2-9771-f114000eeaf5@oth-regensburg.de>
 <2be7b167-688f-4b75-971f-57242f8b443fn@googlegroups.com>
 <42e9e931-b628-40a5-8375-cc2a495eff41@oth-regensburg.de>
Subject: =?UTF-8?Q?Re:_arm_cortex_A55_support=EF=BC=9F?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_58789_980681107.1700789932118"
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

------=_Part_58789_980681107.1700789932118
Content-Type: multipart/alternative; 
	boundary="----=_Part_58790_1372380597.1700789932118"

------=_Part_58790_1372380597.1700789932118
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your reply.

So how should I debug this problem of stuck debugging terminal? Do you have=
=20
any suggestions?

Best regards
zhang,

=E5=9C=A82023=E5=B9=B411=E6=9C=8823=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC=
+8 19:49:32<Ralf Ramsauer> =E5=86=99=E9=81=93=EF=BC=9A

>
>
> On 23/11/2023 04:33, '=E5=BC=A0=E5=B9=B3' via Jailhouse wrote:
> > >On 22/11/2023 06:53, '=E5=BC=A0=E5=B9=B3' via Jailhouse wrote:
> > >> I am trying to transplant jailhouse on the A55 core, but now I have
> > >> encountered some problems. After I execute the following command, th=
e
> > >> system will freeze.
> > >> $ jailhouse enable renesas-r9a07g044l2.cell
> > >
> > >No error log? Is the debug console configured correctly?
> >=20
> > I think there is no problem with the debug console configuration I set=
=20
> up.
> > Please refer to:
> > .debug_console =3D {
> >      .address =3D 0x1004b800,
> >      .size =3D 0x400,
> >      .type =3D JAILHOUSE_CON_TYPE_SCIFA,
> >      .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
> >              JAILHOUSE_CON_REGDIST_4,
> > },
> >=20
> > >
> > >>
> > >> What are the possible consequences?
> > >>
> > >> I made sure I did the following:
> > >> 1.Linux kernel version 5.10
> > >> 2.Linux starts in EL2
> > >> 3. Turn on KVM
> > >
> > >Do not use KVM in combination with Jailhouse. Disable KVM in your=20
> kernel.
> > >
> > I turned off KVM as you said but the problem still exists.
> > root@smarc-rzg2l:~# dmesg | grep -r kvm
> > root@smarc-rzg2l:~# insmod jailhouse.ko
> > [123.760797] jailhouse: loading out-of-tree module taints kernel.
> > root@smarc-rzg2l:~# jailhouse enable renesas-r9a07g044l2.cell
> >=20
> >=20
> > >Ralf
> > >
> > >> 4. Turn off kernel CONFIG_ARM64_VHE
> >=20
> > I would also like to add:
> > I refer to this post and added mov and ret modifications to entry.S to=
=20
> > output jailhouse is opening.
> > However, when using the command jailhouse cell list later, I also=20
> > encountered the problem of the serial port being stuck.
> > Reference post:=20
> > https://groups.google.com/g/jailhouse-dev/c/zwY9bpxq8mg/m/VF44nEC2AwAJ
> > log:
> > root@smarc-rzg2l:~# insmod jailhouse.ko
> > [79.631308] jailhouse: loading out-of-tree module taints kernel.
> > root@smarc-rzg2l:~# jailhouse enable renesas-r9a07g044l2.cell
> > [85.716867] pci-host-generic e0000000.pci: host bridge /pci@0 ranges:
> > [85.723692] pci-host-generic e0000000.pci: MEM=20
> > 0x00e0100000..0x00e0103fff -> 0x00e0100000
> > [85.733615] pci-host-generic e0000000.pci: ECAM at [mem=20
> > 0xe0000000-0xe00fffff] for [bus 00]
> > [85.742977] pci-host-generic e0000000.pci: PCI host bridge to bus 0001:=
00
> > [85.749828] pci_bus 0001:00: root bus resource [bus 00]
> > [85.755130] pci_bus 0001:00: root bus resource [mem=20
> 0xe0100000-0xe0103fff]
> > [85.763626] pci 0001:00:1f.0: [0ff0:c000] type 0f class 0xc0000f
> > [85.769669] pci 0001:00:1f.0: unknown header type 0f, ignoring device
> > [85.776475] The Jailhouse is opening.
> > root@smarc-rzg2l:~# jailhouse cell list
> > ID Name
> >=20
> > So is this way of modifying entry.S the correct way?
>
> I can not comment on that, I'm not into that issue. If it works for you=
=20
> for the moment to do further evaluation - great! You can of course=20
> contact the original authors of the workaround.
>
> Thanks,
> Ralf
>
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/2be7b167-688f-4b75-971f-5=
7242f8b443fn%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/2be7b167-688f-4b75-971f-5=
7242f8b443fn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f1786c5e-97ee-4084-8c13-4a364f869ab1n%40googlegroups.com.

------=_Part_58790_1372380597.1700789932118
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your reply.<br /><br />So how should I debug this problem of =
stuck debugging terminal? Do you have any suggestions?<div><br /><div><div>=
<span style=3D"color: rgb(0, 0, 0); font-family: =E5=BE=AE=E8=BD=AF=E9=9B=
=85=E9=BB=91, sans-serif; font-size: small;">Best regards</span></div><div>=
<font color=3D"#000000" face=3D"=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91, sans-=
serif" size=3D"2">zhang,</font></div><br /></div></div><div class=3D"gmail_=
quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82023=E5=B9=B411=E6=
=9C=8823=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC+8 19:49:32&lt;Ralf Ramsaue=
r> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" =
style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); pa=
dding-left: 1ex;">
<br>
<br>On 23/11/2023 04:33, &#39;=E5=BC=A0=E5=B9=B3&#39; via Jailhouse wrote:
<br>&gt;  &gt;On 22/11/2023 06:53, &#39;=E5=BC=A0=E5=B9=B3&#39; via Jailhou=
se wrote:
<br>&gt;  &gt;&gt; I am trying to transplant jailhouse on the A55 core, but=
 now I have
<br>&gt;  &gt;&gt; encountered some problems. After I execute the following=
 command, the
<br>&gt;  &gt;&gt; system will freeze.
<br>&gt;  &gt;&gt; $ jailhouse enable renesas-r9a07g044l2.cell
<br>&gt;  &gt;
<br>&gt;  &gt;No error log? Is the debug console configured correctly?
<br>&gt;=20
<br>&gt; I think there is no problem with the debug console configuration I=
 set up.
<br>&gt; Please refer to:
<br>&gt; .debug_console =3D {
<br>&gt;  =C2=A0 =C2=A0 =C2=A0.address =3D 0x1004b800,
<br>&gt;  =C2=A0 =C2=A0 =C2=A0.size =3D 0x400,
<br>&gt;  =C2=A0 =C2=A0 =C2=A0.type =3D JAILHOUSE_CON_TYPE_SCIFA,
<br>&gt;  =C2=A0 =C2=A0 =C2=A0.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
<br>&gt;  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JAILHOUSE_CON_REG=
DIST_4,
<br>&gt; },
<br>&gt;=20
<br>&gt;  &gt;
<br>&gt;  &gt;&gt;
<br>&gt;  &gt;&gt; What are the possible consequences?
<br>&gt;  &gt;&gt;
<br>&gt;  &gt;&gt; I made sure I did the following:
<br>&gt;  &gt;&gt; 1.Linux kernel version 5.10
<br>&gt;  &gt;&gt; 2.Linux starts in EL2
<br>&gt;  &gt;&gt; 3. Turn on KVM
<br>&gt;  &gt;
<br>&gt;  &gt;Do not use KVM in combination with Jailhouse. Disable KVM in =
your kernel.
<br>&gt;  &gt;
<br>&gt; I turned off KVM as you said but the problem still exists.
<br>&gt; root@smarc-rzg2l:~# dmesg | grep -r kvm
<br>&gt; root@smarc-rzg2l:~# insmod jailhouse.ko
<br>&gt; [123.760797] jailhouse: loading out-of-tree module taints kernel.
<br>&gt; root@smarc-rzg2l:~# jailhouse enable renesas-r9a07g044l2.cell
<br>&gt;=20
<br>&gt;=20
<br>&gt;  &gt;Ralf
<br>&gt;  &gt;
<br>&gt;  &gt;&gt; 4. Turn off kernel CONFIG_ARM64_VHE
<br>&gt;=20
<br>&gt; I would also like to add:
<br>&gt; I refer to this post and added mov and ret modifications to entry.=
S to=20
<br>&gt; output jailhouse is opening.
<br>&gt; However, when using the command jailhouse cell list later, I also=
=20
<br>&gt; encountered the problem of the serial port being stuck.
<br>&gt; Reference post:=20
<br>&gt; <a href=3D"https://groups.google.com/g/jailhouse-dev/c/zwY9bpxq8mg=
/m/VF44nEC2AwAJ" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D=
"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.google.com/g/=
jailhouse-dev/c/zwY9bpxq8mg/m/VF44nEC2AwAJ&amp;source=3Dgmail&amp;ust=3D170=
0876136876000&amp;usg=3DAOvVaw3BgO3XhcYgWM4wPHxN1jEp">https://groups.google=
.com/g/jailhouse-dev/c/zwY9bpxq8mg/m/VF44nEC2AwAJ</a>
<br>&gt; log:
<br>&gt; root@smarc-rzg2l:~# insmod jailhouse.ko
<br>&gt; [79.631308] jailhouse: loading out-of-tree module taints kernel.
<br>&gt; root@smarc-rzg2l:~# jailhouse enable renesas-r9a07g044l2.cell
<br>&gt; [85.716867] pci-host-generic e0000000.pci: host bridge /pci@0 rang=
es:
<br>&gt; [85.723692] pci-host-generic e0000000.pci: MEM=20
<br>&gt; 0x00e0100000..0x00e0103fff -&gt; 0x00e0100000
<br>&gt; [85.733615] pci-host-generic e0000000.pci: ECAM at [mem=20
<br>&gt; 0xe0000000-0xe00fffff] for [bus 00]
<br>&gt; [85.742977] pci-host-generic e0000000.pci: PCI host bridge to bus =
0001:00
<br>&gt; [85.749828] pci_bus 0001:00: root bus resource [bus 00]
<br>&gt; [85.755130] pci_bus 0001:00: root bus resource [mem 0xe0100000-0xe=
0103fff]
<br>&gt; [85.763626] pci 0001:00:1f.0: [0ff0:c000] type 0f class 0xc0000f
<br>&gt; [85.769669] pci 0001:00:1f.0: unknown header type 0f, ignoring dev=
ice
<br>&gt; [85.776475] The Jailhouse is opening.
<br>&gt; root@smarc-rzg2l:~# jailhouse cell list
<br>&gt; ID Name
<br>&gt;=20
<br>&gt; So is this way of modifying entry.S the correct way?
<br>
<br>I can not comment on that, I&#39;m not into that issue. If it works for=
 you=20
<br>for the moment to do further evaluation - great! You can of course=20
<br>contact the original authors of the workaround.
<br>
<br>Thanks,
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/2be7b16=
7-688f-4b75-971f-57242f8b443fn%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/2be7b167-688f-4b75-97=
1f-57242f8b443fn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D17008761=
36876000&amp;usg=3DAOvVaw2LoLoFaDjIB7OLA5lLjzPP">https://groups.google.com/=
d/msgid/jailhouse-dev/2be7b167-688f-4b75-971f-57242f8b443fn%40googlegroups.=
com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/2be7=
b167-688f-4b75-971f-57242f8b443fn%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirectu=
rl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.google.c=
om/d/msgid/jailhouse-dev/2be7b167-688f-4b75-971f-57242f8b443fn%2540googlegr=
oups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;us=
t=3D1700876136876000&amp;usg=3DAOvVaw3dGyG8BPqVisoK8pI_aJuF">https://groups=
.google.com/d/msgid/jailhouse-dev/2be7b167-688f-4b75-971f-57242f8b443fn%40g=
ooglegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f1786c5e-97ee-4084-8c13-4a364f869ab1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f1786c5e-97ee-4084-8c13-4a364f869ab1n%40googlegroups.co=
m</a>.<br />

------=_Part_58790_1372380597.1700789932118--

------=_Part_58789_980681107.1700789932118--

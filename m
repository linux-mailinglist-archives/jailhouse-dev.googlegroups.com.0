Return-Path: <jailhouse-dev+bncBCPOLQPRTECBBT6J7KTQMGQEFFN4JBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43d.google.com (mail-pf1-x43d.google.com [IPv6:2607:f8b0:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9C879A2CE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Sep 2023 07:25:37 +0200 (CEST)
Received: by mail-pf1-x43d.google.com with SMTP id d2e1a72fcca58-68fbe41b9d3sf682639b3a.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Sep 2023 22:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1694409936; x=1695014736; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sOmrk9ep5SbnZYOdHUj/td6fKH4yzV+5lEoOhzcdwLY=;
        b=L1M4hp0+dBt7dKRo8Z2eGa1xndCr0QZ1aJXRTIIfnIK2dCrRuLBoTzGYmmYRsdAJ+H
         pk8EodpW9bonPm41q7XEyyRQuLthrJeLniszj0LyM26c+TM1bm0ZIKwnI3bjZsOin/fX
         eiMf+K1PqWQnZqLUQ6m2AlV+5gBCuP7ImDGkgr11umAbRzqV3871bLHrdA9oumLukzPH
         g+K88OIxsfjtzrxZ+yC0RBxa2IjTnuCVyN0ZHmD51QIE9xLECblQiUNVCjYkxzkjgKft
         EU93BUdH6InI316581WZOd1rlKZsEUUBq7wlF23yq0cXYsP6j7sQPTLWu2IR/dOAwv7X
         +a6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694409936; x=1695014736; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOmrk9ep5SbnZYOdHUj/td6fKH4yzV+5lEoOhzcdwLY=;
        b=b33juMFLBetikrONIQedaoRKedMw0DYBYdL2TPZ8DUydwaLXtTk2rg+aTEffHZVekl
         UuAyoRSOQ6fa7zdKoyxsci3M5aGRoczyestB/BEenGJnzQVN/6Uis1MOPqgkO3UOYjW/
         ekX9iDn3mlMPPK/Xj4WuAt8bGqDDJAwgD2gCx8Z5B04xfACnUwCtGkGDS9QY3A3I6Y1Y
         ZJQTa0Utbf3xGu7ZfdMnkiij0AnJuLjS1ya42jms6OptenuVIFZosvdLiBngGEtK/A/W
         JcoiGqUl/Cl2001Z3JtARRWI/DDm7kf8rkSQ/0YEo/Ha38aXCVCudupNb56HOU9RHsRX
         U30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694409936; x=1695014736;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sOmrk9ep5SbnZYOdHUj/td6fKH4yzV+5lEoOhzcdwLY=;
        b=LhDfULB8BrToK5mmlqPqzvO5Gxf64JcFN3Au8CDoY2Cae75lGuuJN9GiCCVL3UzvcW
         Hlu+dbdBdAtX852yU7nmIDnjbUbzqmMEnU+aVuqr2YIY/GDip/g5kWtaVU3NUk1eLZjC
         LltgzKyCWE/nFa+yl9XY2AqJfQtAZ/8dURJ4Bopdb6r1VNZvdNgptz+60rsO/XZo031R
         RQVHrwYU7SG89yy/zxxEG7bBTWqzTgJ0G6eH6pUtB6ZFXLsru2kGjulWwa5/36/BsDWB
         NO+pE+ssn3xkLoPgbyX/0CdPpNpffz1zhJhfvu3NG0DykXqYNwEgX2We7IbPuA3rF0AM
         4UTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Ywm4ehHg3dFQ5+Ny3pJb64pqExd4EZFnFJ9vIC0JznrWfH8jegN
	aKAhcM37J+dYApERaK8iCow=
X-Google-Smtp-Source: AGHT+IG0TzReuVOD4ljv5VuC1+YLlV523VwiOq4J8mHHBmeP7iqApV0giJQVLQZKgRTd/JVggqp8yA==
X-Received: by 2002:a05:6a00:c95:b0:68a:604f:420d with SMTP id a21-20020a056a000c9500b0068a604f420dmr8146983pfv.3.1694409936025;
        Sun, 10 Sep 2023 22:25:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:1c91:b0:68f:cc79:ba82 with SMTP id
 y17-20020a056a001c9100b0068fcc79ba82ls170631pfw.0.-pod-prod-02-us; Sun, 10
 Sep 2023 22:25:34 -0700 (PDT)
X-Received: by 2002:a63:3f07:0:b0:565:f116:fe25 with SMTP id m7-20020a633f07000000b00565f116fe25mr1906566pga.8.1694409934472;
        Sun, 10 Sep 2023 22:25:34 -0700 (PDT)
Date: Sun, 10 Sep 2023 22:25:33 -0700 (PDT)
From: bot crack <unintialized@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c9479468-1514-439a-a775-5eb2d25877f3n@googlegroups.com>
In-Reply-To: <e1577ac3-ab02-4fe4-9641-b56a923d6fb2@oth-regensburg.de>
References: <3ffc8cc2-0592-463f-ab65-bd51c2d0ed83n@googlegroups.com>
 <e1577ac3-ab02-4fe4-9641-b56a923d6fb2@oth-regensburg.de>
Subject: Re: How to set the value of pci_mmconfig_base in rootcell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_63378_556915667.1694409933498"
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

------=_Part_63378_556915667.1694409933498
Content-Type: multipart/alternative; 
	boundary="----=_Part_63379_1562754522.1694409933498"

------=_Part_63379_1562754522.1694409933498
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi,
Now I change my a configuration to:





* .platform_info =3D { .pci_mmconfig_base =3D 0xe0000000, // virt address=
=20
.pci_mmconfig_end_bus =3D 0, .pci_is_virtual =3D 1, .pci_domain =3D 1,*
* .............*

Then I didn=E2=80=99t see the error log









*[   35.130190] pci-host-generic e0000000.pci: host bridge /pci@0 ranges:[=
=20
  35.130241] pci-host-generic e0000000.pci:      MEM=20
0x00e0100000..0x00e0101fff -> 0x00e0100000[   35.130295] pci-host-generic=
=20
e0000000.pci: ECAM at [mem 0xe0000000-0xe00fffff] for [bus 00][  =20
35.130457] pci-host-generic e0000000.pci: PCI host bridge to bus 0001:00[  =
=20
35.130470] pci_bus 0001:00: root bus resource [bus 00][   35.130480]=20
pci_bus 0001:00: root bus resource [mem 0xe0100000-0xe0101fff][  =20
35.130519] pci 0001:00:00.0: [110a:4106] type 00 class 0xff0000[  =20
35.130545] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x00000fff][  =20
35.137255] pci 0001:00:00.0: BAR 0: assigned [mem 0xe0100000-0xe0100fff]*



*[   35.137602] The Jailhouse is opening.[   35.251548] vcc3v3_lcd1_n:=20
disabling[   35.285180] psci: CPU3 killed (polled 0 ms)*


Then I insert uio_ivshmem.ko (build from=20
https://github.com/henning-schild-work/ivshmem-guest-code/tree/jailhouse)



*[   35.287908] Created Jailhouse cell "inmate-demo"[   50.988039]=20
uio_ivshmem 0001:00:00.0: ivshmem_pci_proben[   50.988085] uio_ivshmem=20
0001:00:00.0: enabling device (0000 -> 0002)[   50.988548] uio_ivshmem=20
0001:00:00.0: using jailhouse mode*


Then run /usr/local/sbin/ivshmem-demo and it will show mmap failure.
ID =3D 0
Maximum peers =3D 3
/usr/local/sbin/ivshmem-demo: mmap(state): No such device


Why does mmap fail?
On Saturday, September 9, 2023 at 7:38:59=E2=80=AFPM UTC+8 Ralf Ramsauer wr=
ote:

>
>
> On 09/09/2023 08:04, bot crack wrote:
> > Hi, everybody
> >=20
> > I encountered some problems when using ivshmem-demo. How should I set=
=20
> > the value of pci_mmconfig_base?
>
> Set it to a region where it does physically not collide with any other=20
> IO/Memory.
>
> >=20
> > my rootcell:
> > /.platform_info =3D {
> > .pci_mmconfig_base =3D 0x7BC00000,
> > .pci_mmconfig_end_bus =3D 0,
> > .pci_is_virtual =3D 1,
> > .pci_domain =3D 1,
> > .arm =3D {
> > .gic_version =3D 3,/
> >=20
> > .......
> >=20
> >=20
> > my linux dts:
> > /&reserved_memory {
> >=20
> > jailhouse: jailhouse@0x70000000{
> > reg =3D <0x0 0x70000000 0x0 0xBC00000>;
> > alignment =3D <0x1000>;
> > no-map;
> > status =3D "okay";
> > };
> >=20
> > pci_reserved: pci@0x7BC00000{
> > reg =3D <0x0 0x7BC00000 0x0 0x00200000>;
> > alignment =3D <0x1000>;
> > no-map;
> > status =3D "okay";
> > };
>
> There's no need to reserve it via device tree, because it isn't backed=20
> with anything in any case.
>
> >=20
> > };
> > /
> > Kernel output after inserting jailhouse.ko
> > /[  264.612191] jailhouse: loading out-of-tree module taints kernel.
> > [  264.624958] pci-host-generic 7bc00000.pci: host bridge /pci@0 ranges=
:
> > [  264.625007] pci-host-generic 7bc00000.pci:      MEM=20
> > 0x007bd00000..0x007bd01fff -> 0x007bd00000
> > [  264.625028] pci-host-generic 7bc00000.pci: *resource collision: [mem=
=20
> > 0x7bd00000-0x7bd01fff] conflicts with reserved [mem=20
> 0x70000000-0x7bdfffff]*
>
> This happens due to your device tree reservation. If there's nothing=20
> behind 0x7bc..., then simply go without reservation.
>
> > [  264.625051] pci-host-generic: probe of 7bc00000.pci failed with erro=
r=20
> -12
> > [  264.625475] The Jailhouse is opening.
> > [  264.792429] psci: CPU3 killed (polled 0 ms)
> > [  264.794210] Created Jailhouse cell "inmate-demo"
> > /
> > The operating environment is arm64, linux5.10.160
> >=20
> > *How should I set the value of pci_mmconfig_base?*
>
> See above, a free (ideally aligned) memory region in your physical=20
> address space.
>
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
> https://groups.google.com/d/msgid/jailhouse-dev/3ffc8cc2-0592-463f-ab65-b=
d51c2d0ed83n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/3ffc8cc2-0592-463f-ab65-b=
d51c2d0ed83n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c9479468-1514-439a-a775-5eb2d25877f3n%40googlegroups.com.

------=_Part_63379_1562754522.1694409933498
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi,<div>Now I change my a configuration to:</div><div><i><span style=3D"whi=
te-space: pre;">		</span>.platform_info =3D {<br /><span style=3D"white-spa=
ce: pre;">			</span>.pci_mmconfig_base =3D 0xe0000000, // virt address<br /=
><span style=3D"white-space: pre;">			</span>.pci_mmconfig_end_bus =3D 0,<b=
r /><span style=3D"white-space: pre;">			</span>.pci_is_virtual =3D 1,<br /=
><span style=3D"white-space: pre;">			</span>.pci_domain =3D 1,<br /></i></=
div><div><i><span style=3D"white-space: pre;">	</span>.............</i></di=
v><div><br />Then I didn=E2=80=99t see the error log</div><div><i>[ =C2=A0 =
35.130190] pci-host-generic e0000000.pci: host bridge /pci@0 ranges:<br />[=
 =C2=A0 35.130241] pci-host-generic e0000000.pci: =C2=A0 =C2=A0 =C2=A0MEM 0=
x00e0100000..0x00e0101fff -&gt; 0x00e0100000<br />[ =C2=A0 35.130295] pci-h=
ost-generic e0000000.pci: ECAM at [mem 0xe0000000-0xe00fffff] for [bus 00]<=
br />[ =C2=A0 35.130457] pci-host-generic e0000000.pci: PCI host bridge to =
bus 0001:00<br />[ =C2=A0 35.130470] pci_bus 0001:00: root bus resource [bu=
s 00]<br />[ =C2=A0 35.130480] pci_bus 0001:00: root bus resource [mem 0xe0=
100000-0xe0101fff]<br />[ =C2=A0 35.130519] pci 0001:00:00.0: [110a:4106] t=
ype 00 class 0xff0000<br />[ =C2=A0 35.130545] pci 0001:00:00.0: reg 0x10: =
[mem 0x00000000-0x00000fff]<br />[ =C2=A0 35.137255] pci 0001:00:00.0: BAR =
0: assigned [mem 0xe0100000-0xe0100fff]<br /></i></div><div><i>[ =C2=A0 35.=
137602] The Jailhouse is opening.<br />[ =C2=A0 35.251548] vcc3v3_lcd1_n: d=
isabling<br />[ =C2=A0 35.285180] psci: CPU3 killed (polled 0 ms)<br /></i>=
</div><div><br /></div><div><br /></div><div>Then I insert uio_ivshmem.ko (=
build from https://github.com/henning-schild-work/ivshmem-guest-code/tree/j=
ailhouse)<br /></div><div><i>[ =C2=A0 35.287908] Created Jailhouse cell "in=
mate-demo"<br />[ =C2=A0 50.988039] uio_ivshmem 0001:00:00.0: ivshmem_pci_p=
roben<br />[ =C2=A0 50.988085] uio_ivshmem 0001:00:00.0: enabling device (0=
000 -&gt; 0002)<br />[ =C2=A0 50.988548] uio_ivshmem 0001:00:00.0: using ja=
ilhouse mode</i><br /></div><div><i><br /></i></div><div><i><br /></i></div=
><div>Then run /usr/local/sbin/ivshmem-demo and it will show mmap failure.<=
br /></div><div>ID =3D 0<br />Maximum peers =3D 3<br />/usr/local/sbin/ivsh=
mem-demo: <font color=3D"#ff0000">mmap(state): No such device</font><br /><=
/div><div><br /></div><div><br /></div><div>Why does mmap fail?<br /></div>=
<div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Saturd=
ay, September 9, 2023 at 7:38:59=E2=80=AFPM UTC+8 Ralf Ramsauer wrote:<br/>=
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
<br>On 09/09/2023 08:04, bot crack wrote:
<br>&gt; Hi, everybody
<br>&gt;=20
<br>&gt; I encountered some problems when using ivshmem-demo. How should I =
set=20
<br>&gt; the value of pci_mmconfig_base?
<br>
<br>Set it to a region where it does physically not collide with any other=
=20
<br>IO/Memory.
<br>
<br>&gt;=20
<br>&gt; my rootcell:
<br>&gt; /.platform_info =3D {
<br>&gt; .pci_mmconfig_base =3D 0x7BC00000,
<br>&gt; .pci_mmconfig_end_bus =3D 0,
<br>&gt; .pci_is_virtual =3D 1,
<br>&gt; .pci_domain =3D 1,
<br>&gt; .arm =3D {
<br>&gt; .gic_version =3D 3,/
<br>&gt;=20
<br>&gt; .......
<br>&gt;=20
<br>&gt;=20
<br>&gt; my linux dts:
<br>&gt; /&amp;reserved_memory {
<br>&gt;=20
<br>&gt; jailhouse: jailhouse@0x70000000{
<br>&gt; reg =3D &lt;0x0 0x70000000 0x0 0xBC00000&gt;;
<br>&gt; alignment =3D &lt;0x1000&gt;;
<br>&gt; no-map;
<br>&gt; status =3D &quot;okay&quot;;
<br>&gt; };
<br>&gt;=20
<br>&gt; pci_reserved: pci@0x7BC00000{
<br>&gt; reg =3D &lt;0x0 0x7BC00000 0x0 0x00200000&gt;;
<br>&gt; alignment =3D &lt;0x1000&gt;;
<br>&gt; no-map;
<br>&gt; status =3D &quot;okay&quot;;
<br>&gt; };
<br>
<br>There&#39;s no need to reserve it via device tree, because it isn&#39;t=
 backed=20
<br>with anything in any case.
<br>
<br>&gt;=20
<br>&gt; };
<br>&gt; /
<br>&gt; Kernel output after inserting jailhouse.ko
<br>&gt; /[ =C2=A0264.612191] jailhouse: loading out-of-tree module taints =
kernel.
<br>&gt; [ =C2=A0264.624958] pci-host-generic 7bc00000.pci: host bridge /pc=
i@0 ranges:
<br>&gt; [ =C2=A0264.625007] pci-host-generic 7bc00000.pci: =C2=A0 =C2=A0 =
=C2=A0MEM=20
<br>&gt; 0x007bd00000..0x007bd01fff -&gt; 0x007bd00000
<br>&gt; [ =C2=A0264.625028] pci-host-generic 7bc00000.pci: *resource colli=
sion: [mem=20
<br>&gt; 0x7bd00000-0x7bd01fff] conflicts with reserved [mem 0x70000000-0x7=
bdfffff]*
<br>
<br>This happens due to your device tree reservation. If there&#39;s nothin=
g=20
<br>behind 0x7bc..., then simply go without reservation.
<br>
<br>&gt; [ =C2=A0264.625051] pci-host-generic: probe of 7bc00000.pci failed=
 with error -12
<br>&gt; [ =C2=A0264.625475] The Jailhouse is opening.
<br>&gt; [ =C2=A0264.792429] psci: CPU3 killed (polled 0 ms)
<br>&gt; [ =C2=A0264.794210] Created Jailhouse cell &quot;inmate-demo&quot;
<br>&gt; /
<br>&gt; The operating environment is arm64, linux5.10.160
<br>&gt;=20
<br>&gt; *How should I set the value of pci_mmconfig_base?*
<br>
<br>See above, a free (ideally aligned) memory region in your physical=20
<br>address space.
<br>
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/3ffc8cc=
2-0592-463f-ab65-bd51c2d0ed83n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/3ffc8cc2-0592-463f-ab65-=
bd51c2d0ed83n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16944903267=
24000&amp;usg=3DAOvVaw0rHu6mDowm85ZtrdpH3Hel">https://groups.google.com/d/m=
sgid/jailhouse-dev/3ffc8cc2-0592-463f-ab65-bd51c2d0ed83n%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/3ffc8cc=
2-0592-463f-ab65-bd51c2d0ed83n%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/3ffc8cc2-0592-463f-ab65-bd51c2d0ed83n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
694490326724000&amp;usg=3DAOvVaw1TVUkVWTOZJVNHOJkSgy6S">https://groups.goog=
le.com/d/msgid/jailhouse-dev/3ffc8cc2-0592-463f-ab65-bd51c2d0ed83n%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c9479468-1514-439a-a775-5eb2d25877f3n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c9479468-1514-439a-a775-5eb2d25877f3n%40googlegroups.co=
m</a>.<br />

------=_Part_63379_1562754522.1694409933498--

------=_Part_63378_556915667.1694409933498--

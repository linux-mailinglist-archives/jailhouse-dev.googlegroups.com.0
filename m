Return-Path: <jailhouse-dev+bncBDIJ36FET4JRBXPM6WWAMGQEGBHCJ5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 60132828A21
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jan 2024 17:37:51 +0100 (CET)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-dbee47bacb5sf3370511276.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jan 2024 08:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704818270; x=1705423070; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b/ZztrIENVJAcC15fmcJbH3f0cNDZBFhNCuEcNZSHME=;
        b=PcWLyUOFD5ak2BdTGgqcKga8H4TPHn7KU7dvBGTFqYJiQd4uOlTpy6dq43Ny3MtPT9
         XGzVImccUHzEeZ5UaCIRCbtvdVV9GywrAaXOdesLfvjWHBQaIyPu08coQNC3+Lw0ZmwO
         EosJQPoVYz9PZNCwSuA2QhgXoAoz+sulUr0XDyzQVIGZFrz0clG3/RF0csBhCbTaV3tN
         XPJXZttDtFThtp4ZCt87BlXYOXQpzx13zTfur/ndrTlDNPSdB3ZK2xwEVsOizdetOXe4
         tjCgEmhAuikTzY1s+7ASK667FpivxgBrAcfpLEu2iUqyQOQe5I5dF8Gw/X41AlSSMhzZ
         u99w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704818270; x=1705423070; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/ZztrIENVJAcC15fmcJbH3f0cNDZBFhNCuEcNZSHME=;
        b=jOAkTSirE/7XRVvzoW/zSDYLthO0ApB8nco5Cg560Fnk1lsqTWvct1ARIa9aYhV29C
         MoQu5tnhuYzHwS6Z6XfFKb4PfTvPktLpYOrwjDlFZ5Pyy/XE9jDYrzZkiNUfxrEqlXFj
         orLpSCGpyPM0ZG/S4kurtzxEO/uToy8Do6wa1kEZptodprTVufuYs0NgEmhJHYkp/Zl0
         swnip0JUSOlCI7/XyTMyrpiPG+N9hJDEK2aFEXNyZm2uKRUU/kjKpc+HtiXjHtR0Vbng
         S+0D7dHhccP8WJT8LWrST2Dgl4hXT+/BgSKNaNf+99fIKMQ2yCit5kONxDl3qA8fQnsd
         p8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704818270; x=1705423070;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b/ZztrIENVJAcC15fmcJbH3f0cNDZBFhNCuEcNZSHME=;
        b=qWwcOAusl/TbWxx4kjNmLHqZyX56dJpCL76rWRbQHBUMRPmthk7Wsz1YJdt20zHh9D
         HAFg9xivenGHtJEclYNJceFQIE4y4S9LMILyEKCK+RNsOh4vTvCTHadzfPE1oUaxNzZd
         kWeIB0ZYyeHvsFaRZ/lqdMAV+DkTOT3Nl+Oz8sgGuPY4RPxv/p9o7YbBcJt3ZyyXO8mk
         Rw3V2GL34X1mA0DmofhAmX7iO4GaVgsM+PuCADJWI+Pf1edx8P6MaJbJZ5kQuRATIktF
         msOe7QELsSM1SdjeR2bza+2zR3Izu+IPBWklO0som96myUADhofPdPHaAGeObzHZQqIa
         NDnw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwMaS2WxeR/k+scDzwOZVijp9C2rCJxYuqNrH3nr/2uomcquHxj
	Wow1jZ5wh2ijnFNa2fTr0co=
X-Google-Smtp-Source: AGHT+IFjnPdszrY/o+ApU7/rds3TL2/N6frMbLw9Q1gcI9Jc0r6KSDDWJ6W5l+SW8W7pXO71F1jqXQ==
X-Received: by 2002:a25:684c:0:b0:dbd:bfc7:aec2 with SMTP id d73-20020a25684c000000b00dbdbfc7aec2mr634711ybc.44.1704818270194;
        Tue, 09 Jan 2024 08:37:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d011:0:b0:dbe:ac17:cecf with SMTP id h17-20020a25d011000000b00dbeac17cecfls529768ybg.2.-pod-prod-08-us;
 Tue, 09 Jan 2024 08:37:49 -0800 (PST)
X-Received: by 2002:a25:8512:0:b0:db5:3ce2:7977 with SMTP id w18-20020a258512000000b00db53ce27977mr2092767ybk.7.1704818268747;
        Tue, 09 Jan 2024 08:37:48 -0800 (PST)
Date: Tue, 9 Jan 2024 08:37:48 -0800 (PST)
From: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <219b013e-4970-4bb3-969f-bb0d7bae3ab7n@googlegroups.com>
In-Reply-To: <c9dad4f3-f856-4f25-b6ad-41ec63cf2c64n@googlegroups.com>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
 <d36e18a4-dd64-4f9c-b2cf-89b02b1a0469@oth-regensburg.de>
 <c9dad4f3-f856-4f25-b6ad-41ec63cf2c64n@googlegroups.com>
Subject: Re: Unable to start non root linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_70375_2128841599.1704818268093"
X-Original-Sender: mic.pescape@gmail.com
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

------=_Part_70375_2128841599.1704818268093
Content-Type: multipart/alternative; 
	boundary="----=_Part_70376_1295478263.1704818268093"

------=_Part_70376_1295478263.1704818268093
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I stand corrected, the freeze happens when i do not set=20
JAILHOUSE_CELL_PASSIVE_COMMREG in the inmate

Il giorno marted=C3=AC 9 gennaio 2024 alle 17:26:57 UTC+1 Michele Pescap=C3=
=A8 ha=20
scritto:

> Hi, thank you for replying.
>
> ttyS0 is indeed whitelisted in the inmate and the number of pio_regions i=
s=20
> set accordingly.=20
>
> As for the crash after disable/shutdown, I think it was related to the PC=
I=20
> device, after commenting that and the corresponding regions out I no long=
er=20
> get that freeze. CONFIG_JAILHOUSE_GUEST and=20
> CONFIG_JAILHOUSE_DBCON were already set in the kernel configuration I'm=
=20
> using for the non root linux; still, I recompiled it just in case.
>
> Michele
>
> Il giorno marted=C3=AC 9 gennaio 2024 alle 14:14:33 UTC+1 Ralf Ramsauer h=
a=20
> scritto:
>
> Hi,=20
>
> On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:=20
> > Hi all,=20
> >=20
> > I have an AMD Ryzen 2600 on a b450 motherboard. My goal is to run two=
=20
> > non root linux cells, however, as of right now, I'm not able to start=
=20
> > any non root linux cells.=20
> > First of all I don't receive an output from the cell (I do get output=
=20
> > from the apic-demo though), therefore I don't really know if they're=20
> > even crashing or not; this is the output I get from the hypervisor afte=
r=20
> > enabling the root cell and issuing the following command:=20
> >=20
> > sudo jailhouse cell linux configs/x86/linux_guest1.cell=20
> > ../buildroot-2023.11/output/images/bzImage -i=20
> > ../buildroot-2023.11/output/images/rootfs.cpio=20
>
> for the first few tries, simply don't load a ramdisk. Try to get the=20
> kernel booting. It will crash with "cannot mount rootfs". If we get so=20
> far, then you can continue specifying the ramdisk. But first, we have to=
=20
> get that far.=20
>
> >=20
> > Adding PCI device ff:1f.7 to cell "linux-x86-demo"=20
> > Created cell "linux-x86-demo"=20
> > Page pool usage after cell creation: mem 336/32211, remap 16392/131072=
=20
> > Cell "linux-x86-demo" can be loaded=20
> > CPU 4 received SIPI, vector 100=20
> > CPU 3 received SIPI, vector 100=20
> > Started cell "linux-x86-demo"=20
> >=20
> > After this the cell appears to be running in cell list, however I can't=
=20
> > seem to get any output to confirm that (I even set=20
> > JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing appears on the vrtua=
l=20
> > console accessed via "jailhouse console -f"). I also tried adding -c=20
> > "console=3DttyS0,115200".=20
>
> ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell configuration?=20
> Actually, your cmdline is correct.=20
>
> > At this point if I try to disable/shutdown the cell, the system freezes=
=20
> > requiring a hard reset.=20
>
> Okay, is the guest Linux compiled with Jailhouse guest support? Please=20
> ensure that non-root Linux is compiled with CONFIG_JAILHOUSE_GUEST and=20
> CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x86 Linux guests.=
=20
>
> >=20
> > Also, there seems to be a mismatch between the PCI bdf value in the log=
=20
> > above and the one in the cell's configuration. In both root and non roo=
t=20
> > cells i set .bdf =3D (0x0f << 3) for the IVSHMEM net device and the Roo=
t=20
> > cell correctly reports that ("Adding virtual PCI device 00:0f.0 to cell=
=20
> > "RootCell"").=20
>
> First things first. Let's try to get Linux kicked off before diving into=
=20
> PCI. Comment it out for the moment, let's do that later.=20
>
> Ralf=20
>
> >=20
> > If I understood correctly, once the cell works properly I won't need to=
=20
> > set the console anymore as I can assign an ip (-c "ip x.x.x.x" in the=
=20
> > cell linux command) and ssh to the cell, right?=20
> >=20
> > I attach the root and non root cells' configurations in case they're=20
> > needed. I can provide both the root and non root cell's kernel .conf an=
d=20
> > the buildroot configuration I used if needed.=20
> >=20
> > Thank you for your time,=20
> > Michele=20
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.=20
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.=20
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20
>
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/219b013e-4970-4bb3-969f-bb0d7bae3ab7n%40googlegroups.com.

------=_Part_70376_1295478263.1704818268093
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I stand corrected, the freeze happens when i do not set JAILHOUSE_CELL_PASS=
IVE_COMMREG in the inmate<br /><br /><div class=3D"gmail_quote"><div dir=3D=
"auto" class=3D"gmail_attr">Il giorno marted=C3=AC 9 gennaio 2024 alle 17:2=
6:57 UTC+1 Michele Pescap=C3=A8 ha scritto:<br/></div><blockquote class=3D"=
gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, =
204, 204); padding-left: 1ex;">Hi, thank you for replying.<br><br>ttyS0 is =
indeed whitelisted in the inmate and the number of pio_regions is set accor=
dingly. <br><br>As for the crash after disable/shutdown, I think it was rel=
ated to the PCI device, after commenting that and the corresponding regions=
 out I no longer get that freeze. CONFIG_JAILHOUSE_GUEST and=20
<br>CONFIG_JAILHOUSE_DBCON were already set in the kernel configuration I&#=
39;m using for the non root linux; still, I recompiled it just in case.<br>=
<br>Michele<br><br><div><div dir=3D"auto">Il giorno marted=C3=AC 9 gennaio =
2024 alle 14:14:33 UTC+1 Ralf Ramsauer ha scritto:<br></div><blockquote sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi,
<br>
<br>On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:
<br>&gt; Hi all,
<br>&gt;=20
<br>&gt; I have an AMD Ryzen 2600 on a b450 motherboard. My goal is to run =
two=20
<br>&gt; non root linux cells, however, as of right now, I&#39;m not able t=
o start=20
<br>&gt; any non root linux cells.
<br>&gt; First of all I don&#39;t receive an output from the cell (I do get=
 output=20
<br>&gt; from the apic-demo though), therefore I don&#39;t really know if t=
hey&#39;re=20
<br>&gt; even crashing or not; this is the output I get from the hypervisor=
 after=20
<br>&gt; enabling the root cell and issuing the following command:
<br>&gt;=20
<br>&gt; sudo jailhouse cell linux configs/x86/linux_guest1.cell=20
<br>&gt; ../buildroot-2023.11/output/images/bzImage -i=20
<br>&gt; ../buildroot-2023.11/output/images/rootfs.cpio
<br>
<br>for the first few tries, simply don&#39;t load a ramdisk. Try to get th=
e=20
<br>kernel booting. It will crash with &quot;cannot mount rootfs&quot;. If =
we get so=20
<br>far, then you can continue specifying the ramdisk. But first, we have t=
o=20
<br>get that far.
<br>
<br>&gt;=20
<br>&gt; Adding PCI device ff:1f.7 to cell &quot;linux-x86-demo&quot;
<br>&gt; Created cell &quot;linux-x86-demo&quot;
<br>&gt; Page pool usage after cell creation: mem 336/32211, remap 16392/13=
1072
<br>&gt; Cell &quot;linux-x86-demo&quot; can be loaded
<br>&gt; CPU 4 received SIPI, vector 100
<br>&gt; CPU 3 received SIPI, vector 100
<br>&gt; Started cell &quot;linux-x86-demo&quot;
<br>&gt;=20
<br>&gt; After this the cell appears to be running in cell list, however I =
can&#39;t=20
<br>&gt; seem to get any output to confirm that (I even set=20
<br>&gt; JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing appears on the =
vrtual=20
<br>&gt; console accessed via &quot;jailhouse console -f&quot;). I also tri=
ed adding -c=20
<br>&gt; &quot;console=3DttyS0,115200&quot;.
<br>
<br>ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell configuration?=
=20
<br>Actually, your cmdline is correct.
<br>
<br>&gt; At this point if I try to disable/shutdown the cell, the system fr=
eezes=20
<br>&gt; requiring a hard reset.
<br>
<br>Okay, is the guest Linux compiled with Jailhouse guest support? Please=
=20
<br>ensure that non-root Linux is compiled with CONFIG_JAILHOUSE_GUEST and=
=20
<br>CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x86 Linux guests=
.
<br>
<br>&gt;=20
<br>&gt; Also, there seems to be a mismatch between the PCI bdf value in th=
e log=20
<br>&gt; above and the one in the cell&#39;s configuration. In both root an=
d non root=20
<br>&gt; cells i set .bdf =3D (0x0f &lt;&lt; 3) for the IVSHMEM net device =
and the Root=20
<br>&gt; cell correctly reports that (&quot;Adding virtual PCI device 00:0f=
.0 to cell=20
<br>&gt; &quot;RootCell&quot;&quot;).
<br>
<br>First things first. Let&#39;s try to get Linux kicked off before diving=
 into=20
<br>PCI. Comment it out for the moment, let&#39;s do that later.
<br>
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; If I understood correctly, once the cell works properly I won&#39;=
t need to=20
<br>&gt; set the console anymore as I can assign an ip (-c &quot;ip x.x.x.x=
&quot; in the=20
<br>&gt; cell linux command) and ssh to the cell, right?
<br>&gt;=20
<br>&gt; I attach the root and non root cells&#39; configurations in case t=
hey&#39;re=20
<br>&gt; needed. I can provide both the root and non root cell&#39;s kernel=
 .conf and=20
<br>&gt; the buildroot configuration I used if needed.
<br>&gt;=20
<br>&gt; Thank you for your time,
<br>&gt; Michele
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a rel=3D"nofollow">jailhouse-de...@googlegroups.com</=
a>=20
<br>&gt; &lt;mailto:<a rel=3D"nofollow">jailhouse-de...@googlegroups.com</a=
>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/824bacc=
4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com" rel=3D"nofollow" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;=
q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e=
-7203214b4fc3n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1704904502=
486000&amp;usg=3DAOvVaw0rtbZpzbiBR5WSYfYq2qre">https://groups.google.com/d/=
msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.co=
m</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/824bac=
c4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&amp;u=
tm_source=3Dfooter" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
704904502486000&amp;usg=3DAOvVaw0n-SJbakAiAr0rKdYOKUBT">https://groups.goog=
le.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/219b013e-4970-4bb3-969f-bb0d7bae3ab7n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/219b013e-4970-4bb3-969f-bb0d7bae3ab7n%40googlegroups.co=
m</a>.<br />

------=_Part_70376_1295478263.1704818268093--

------=_Part_70375_2128841599.1704818268093--

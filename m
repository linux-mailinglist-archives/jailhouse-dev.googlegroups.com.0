Return-Path: <jailhouse-dev+bncBCDJXM4674ERBS7VWTYQKGQEOLDVOXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B8214997D
	for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Jan 2020 08:07:56 +0100 (CET)
Received: by mail-ot1-x337.google.com with SMTP id d16sf3918802otq.19
        for <lists+jailhouse-dev@lfdr.de>; Sat, 25 Jan 2020 23:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Lp5ahGV5zhsJC7Ghdn9eZrtvnHq0b9tvo27bvthbWpk=;
        b=elLVEquAArMH1gFSjn9vUGpbmYfda2WVxpAOKGKT4adO1Hm28Mmx8pEEC/dZxqkGTD
         W1kViD0HLI5gl2SCdGx305tlanOm8CKViBoi2qEOBRuNNc/OoEPdolWcv3s/E9vySnMd
         HSefkl8RI7F0r85L726OsAX/WJLmN6J2Gdx0IWxIY83SoeuBLMMQj69+EjeI4MpphyL2
         7P5zrSorzpanVpxiO1RDuEp910nuAx8XtNvggTqbjPcDmMXsP81kKFQdanmJlAKl/Hx3
         GTlo4hGKuUyiFRhnXLx7/I3cS6G8QTEidR7WHD1Sc/B4r4wDLtpAbLI8P+FAoJ3O57Xm
         1+eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Lp5ahGV5zhsJC7Ghdn9eZrtvnHq0b9tvo27bvthbWpk=;
        b=DAKb4SVTzEE1zdrFRaNMHM/mE7pGTd0Gdn8X3t26csLnoE+tkarsyj0Ggnq74wwDFN
         CIyfh5ya71onZc8rASuqwHdW1Q/y3ihOwxH0a7gm1IP/mpEwsvfwsyk3qd/vrVZz2405
         oxIZ9RCkQqr1XmPmJO+kH/jECNM/ng2guLuZ4/GMcwGMpcVvHkN3iQaUYZcKKHf70mvV
         6RdN/l3VEK9ZNKw+AkNhGTAoc45fhKi6cckC+jS4FdnIU+FyD3HuztVmnTEoSHHrhPwh
         mQUQpnQnv6xBMnkOm4doV9JUcV5OiFvLl+w19nFvVoNW2OFY/lKPsK39yQcWVBvm9M6C
         I7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Lp5ahGV5zhsJC7Ghdn9eZrtvnHq0b9tvo27bvthbWpk=;
        b=mHIPx56oFEd7V5QoRY7JJGkhf5H68k9DvyQhHOCd+FrnQxRKS7MSqVlLNRMN5hmaFD
         lq90c4padHLbmLAL1q75J1pWx5hOirmqqWz9xDC2dUqFguvGmCDCcIZtF/FVOUfu1FwL
         dB/gshQVwZij++EFAQBxCdYuH1pZYeMVaa0SaHo5Y7k/U/rnFT42LV3Yo9HaDjRH5ion
         egk6zVQlxF/PLikZzYcsWTDkwbgDj5nLS5rgt26l1vNJuX6kYe1aZ5Ke2Y6A1Y6KlOoC
         doOMm0Z8yfYfDeUJXalCSvvHNdZSzyyHjaJzAhfJrEeCHtdKsQa7UoU0OUVyWUc4Lrdn
         zV3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXutjoDcxEygb2b4ZpvMIy1NA9kLACRkwIBg/RYufBca9p0KLan
	HP+m8BHJhYoEHpiAdDqvTm0=
X-Google-Smtp-Source: APXvYqyffSSLaNZTEFb5ZbSmR5I8rH+CnsVWdlIgVGkrwy/0jI4E/9WU3iey0KWZyHC4WHmxXE1ujA==
X-Received: by 2002:a05:6830:1257:: with SMTP id s23mr8528001otp.241.1580022475415;
        Sat, 25 Jan 2020 23:07:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:d615:: with SMTP id n21ls719824oig.5.gmail; Sat, 25 Jan
 2020 23:07:54 -0800 (PST)
X-Received: by 2002:aca:c782:: with SMTP id x124mr4289434oif.88.1580022474633;
        Sat, 25 Jan 2020 23:07:54 -0800 (PST)
Date: Sat, 25 Jan 2020 23:07:53 -0800 (PST)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5ba8f35f-912a-4749-bf8b-781193f45ebc@googlegroups.com>
In-Reply-To: <20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
 <20200120144629.201f3081@md1za8fc.ad001.siemens.net>
 <b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
 <20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3890_1248430326.1580022473992"
X-Original-Sender: Michael.G.Hinton@gmail.com
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

------=_Part_3890_1248430326.1580022473992
Content-Type: multipart/alternative; 
	boundary="----=_Part_3891_1705939653.1580022473993"

------=_Part_3891_1705939653.1580022473993
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henning,

On Thursday, January 23, 2020 at 5:15:08 AM UTC-7, Henning Schild wrote:
>
> Thanks,=20
>
> that is a lot of information. I would say that is CPU and memory bound=20
> work. It should not cause exits at all, maybe a few for getting the=20
> input in and the output out. reading ivshmem should not trap,

 So IVSHMEM won't trap/cause a vmexit? What are the other potential causes=
=20
for traps, then? My inmate doesn't access any other resources.
=20

> writing=20
> output to a console should be avoided within the measured time.=20
>
Before starting this thread, I found that I accidentally did do this, and=
=20
after removing the console print, I shaved 300 ms off the inmate time. But=
=20
I don't see any more prints that could happen.

This is how I measure the workload in the inmate:=20
https://github.com/hintron/jailhouse/blob/ba0c5f9cc28edf43ab6970cdaddafea77=
dd07b4c/inmates/demos/x86/mgh-demo.c#L1117-L1121
I then print the cycle count and divide it by 3,700,000 manually to get the=
=20
total duration to avoid overflows and truncations.
=20

> If you need to use something that traps, see if you can "batch" things.=
=20
> I.e. do not read/write in byte-chunks. =20

For truly memory bound applications the mapping of the memory matters.=20
> The bigger the pages in the pagetable (and the nested pagetable) the=20
> better. You might be able to read performance counters and look at TLB=20
> misses.=20
>
I'll need to look into that.
 =20

> Not sure what Jailhouse exactly does to mitigate Spectre etc. but these=
=20
> mitigations often have a severe effect on "memory performance".=20
>
> I would for sure have a look at aligning the CFLAGS used for the Linux=20
> application and the inmate.=20
>
Ok, I'll double check CFLAGS as well. I'm now using the exact same object=
=20
files for the workload functions, but the discrepancy got worse :D
=20

> The first things to compare is "native Linux", "root cell Linux under=20
> jailhouse" and "non-root cell Linux under jailhouse". If the third is=20
> better than your inmate, your inmates environment is likely the cause.=20
>
Yes, I've been looking at those three cases, and Linux under Jailhouse is=
=20
only 30 ms slower than Linux not under Jailhouse, while both of those are=
=20
way faster than the inmate. So that tells me that there is something going=
=20
wrong with the inmate.
=20
Thanks for the help,
-Michael

Henning=20
>
> On Wed, 22 Jan 2020 23:57:29 -0800=20
> Michael Hinton <michael...@gmail.com <javascript:>> wrote:=20
>
> > Ralf, Henning,=20
> >=20
> >=20
> > Thanks for the quick response, and sorry for the delay.=20
> >=20
> > Here=E2=80=99s my setup: I=E2=80=99ve got a 6-core Intel x86-64 CPU run=
ning Kubuntu=20
> > 19.10. I have an inmate that is given a single core and runs a=20
> > single-threaded workload. For comparison, I also run the same=20
> > workload in Linux under Jailhouse.=20
> >=20
> > For a SHA3 workload with the same 20 MiB input, the root Linux cell=20
> > (and no inmate running) takes about 2 seconds, while the inmate (and=20
> > an idle root cell) takes about 2.8 seconds. That is a worrisome=20
> > discrepancy, and I need to understand why it=E2=80=99s 0.8 s slower.=20
> >=20
> > This is the SHA3 workload:=20
> >=20
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/inmates/lib/mgh-sha3.c#L185-L208=20
> >=20
> > This is the Linux wrapper for the SHA3 workload:=20
> >=20
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/mgh/workloads/src/sha3-512.c#L166-L168=20
> >=20
> > This is the inmate program calling the SHA3 workload:=20
> >=20
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/inmates/demos/x86/mgh-demo.c#L370-L379=20
> >=20
> > You can see that the inmate and the Linux wrapper both execute the=20
> > same function, sha3_mgh(). It's the same C code.=20
> >=20
> > The other workloads I run are intentionally more memory intensive.=20
> > They see a much worse slowdown. For my CSB workload, the root cell=20
> > takes only 0.05 s for a 20 MiB input, while the inmate takes 1.48 s=20
> > (30x difference). And for my Random Access workload, the root cell=20
> > takes 0.08 s while the inmate takes 3.29 s for a 20 MiB input (40x=20
> > difference).=20
> >=20
> > Here are the root and inmate cell configs, respectively:=20
> >=20
> >=20
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/configs/x86/bazooka-root.c=20
> >=20
> >=20
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/configs/x86/bazooka-inmate.c=20
> >=20
> > I did do some modifications to Jailhouse with VMX and the preemption=20
> > timer, but any slowdown that I may have inadvertently introduced=20
> > should apply equally to the inmate and root cell.=20
> >=20
> > It=E2=80=99s possible that I am measuring the duration of the inmate=20
> > incorrectly. But the number of vmexits I measure for the inmate and=20
> > root seem to roughly correspond with the duration. I also made sure=20
> > to avoid tsc_read_ns() by instead recording the TSC cycles and=20
> > deriving the duration by dividing by 3,700,000,000 (the unchanging=20
> > TSC frequency of my processor). Without this, the time recorded would=
=20
> > overflow after something like 1.2 seconds.=20
> >=20
> >=20
> > I'm wondering if something else is causing unexpected delays: using=20
> > IVSHMEM, memory mapping extra memory pages and using it to hold my=20
> > input, printing to a virtual console in addition to a serial console,=
=20
> > disabling hardware p-states, turbo boost in the root cell, maybe the=20
> > workload code is being compiled to different instructions for the=20
> > inmate vs. Linux, etc.=20
> >=20
> > Sorry for all the detail, but I am grasping at straws at this point.=20
> > Any ideas at what I could look into are appreciated.=20
> >=20
> > Thanks,=20
> > Michael=20
> >=20
> > On Monday, January 20, 2020 at 6:46:32 AM UTC-7, Henning Schild wrote:=
=20
> > >=20
> > > On Sun, 19 Jan 2020 23:45:46 -0800=20
> > > Michael Hinton <michael...@gmail.com <javascript:>> wrote:=20
> > >  =20
> > > > Hello,=20
> > > >=20
> > > > I have found that running code in an inmate is a lot slower than=20
> > > > running that same code in the root cell on my x86 machine. I am=20
> > > > not sure why.  =20
> > >=20
> > > Can you elaborate on "code" and "a lot"? Maybe roughly tell us what=
=20
> > > your testcase does and how severe your slowdown is. Synthetic=20
> > > microbenchmark to measure context switching ?=20
> > >=20
> > > As Ralf already said, anything causing "exits" can be subject to=20
> > > slowdown. But that should be roughly the same for the root cell or=20
> > > any non-root cell, is it truly the "same" code?=20
> > >=20
> > > And of cause anything accessing shared resources can be slowed down=
=20
> > > by the sharing. Caches/buses ... but i would not expect "a lot".=20
> > >=20
> > > regards,=20
> > > Henning=20
> > >  =20
> >=20
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5ba8f35f-912a-4749-bf8b-781193f45ebc%40googlegroups.com.

------=_Part_3891_1705939653.1580022473993
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Henning,<br><br>On Thursday, January 23, 2020 at 5:15:0=
8 AM UTC-7, Henning Schild wrote:<blockquote class=3D"gmail_quote" style=3D=
"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex=
;">Thanks,
<br>
<br>that is a lot of information. I would say that is CPU and memory bound
<br>work. It should not cause exits at all, maybe a few for getting the
<br>input in and the output out. reading ivshmem should not trap,</blockquo=
te><div>=C2=A0So IVSHMEM won&#39;t trap/cause a vmexit? What are the other =
potential causes for traps, then? My inmate doesn&#39;t access any other re=
sources.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;"=
>writing
<br>output to a console should be avoided within the measured time.
<br></blockquote><div>Before starting this thread, I found that I accidenta=
lly did do this, and after removing the console print, I shaved 300 ms off =
the inmate time. But I don&#39;t see any more prints that could happen.</di=
v><div><br></div><div>This is how I measure the workload in the inmate:=C2=
=A0<a href=3D"https://github.com/hintron/jailhouse/blob/ba0c5f9cc28edf43ab6=
970cdaddafea77dd07b4c/inmates/demos/x86/mgh-demo.c#L1117-L1121">https://git=
hub.com/hintron/jailhouse/blob/ba0c5f9cc28edf43ab6970cdaddafea77dd07b4c/inm=
ates/demos/x86/mgh-demo.c#L1117-L1121</a></div><div>I then print the cycle =
count and divide it by 3,700,000 manually to get the total duration to avoi=
d overflows and truncations.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid=
;padding-left: 1ex;">If you need to use something that traps, see if you ca=
n &quot;batch&quot; things.
<br>I.e. do not read/write in byte-chunks.=C2=A0=C2=A0</blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left=
: 1px #ccc solid;padding-left: 1ex;">For truly memory bound applications th=
e mapping of the memory matters.
<br>The bigger the pages in the pagetable (and the nested pagetable) the
<br>better. You might be able to read performance counters and look at TLB
<br>misses.
<br></blockquote><div>I&#39;ll need to look into that.</div><div>=C2=A0=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: =
0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Not sure what Jailhou=
se exactly does to mitigate Spectre etc. but these
<br>mitigations often have a severe effect on &quot;memory performance&quot=
;.
<br>
<br>I would for sure have a look at aligning the CFLAGS used for the Linux
<br>application and the inmate.
<br></blockquote><div>Ok, I&#39;ll double check CFLAGS as well. I&#39;m now=
 using the exact same object files for the workload functions, but the disc=
repancy got worse :D</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding=
-left: 1ex;">The first things to compare is &quot;native Linux&quot;, &quot=
;root cell Linux under
<br>jailhouse&quot; and &quot;non-root cell Linux under jailhouse&quot;. If=
 the third is
<br>better than your inmate, your inmates environment is likely the cause.
<br></blockquote><div>Yes, I&#39;ve been looking at those three cases, and =
Linux under Jailhouse is only 30 ms slower than Linux not under Jailhouse, =
while both of those are way faster than the inmate. So that tells me that t=
here is something going wrong with the inmate.</div><div>=C2=A0</div><div>T=
hanks for the help,</div><div>-Michael</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #c=
cc solid;padding-left: 1ex;">Henning
<br>
<br>On Wed, 22 Jan 2020 23:57:29 -0800
<br>Michael Hinton &lt;<a href=3D"javascript:" target=3D"_blank" gdf-obfusc=
ated-mailto=3D"XYNbxS1CCQAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#=
39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#=
39;;return true;">michael...@gmail.com</a>&gt; wrote:
<br>
<br>&gt; Ralf, Henning,
<br>&gt;=20
<br>&gt;=20
<br>&gt; Thanks for the quick response, and sorry for the delay.
<br>&gt;=20
<br>&gt; Here=E2=80=99s my setup: I=E2=80=99ve got a 6-core Intel x86-64 CP=
U running Kubuntu
<br>&gt; 19.10. I have an inmate that is given a single core and runs a
<br>&gt; single-threaded workload. For comparison, I also run the same
<br>&gt; workload in Linux under Jailhouse.
<br>&gt;=20
<br>&gt; For a SHA3 workload with the same 20 MiB input, the root Linux cel=
l
<br>&gt; (and no inmate running) takes about 2 seconds, while the inmate (a=
nd
<br>&gt; an idle root cell) takes about 2.8 seconds. That is a worrisome
<br>&gt; discrepancy, and I need to understand why it=E2=80=99s 0.8 s slowe=
r.
<br>&gt;=20
<br>&gt; This is the SHA3 workload:=20
<br>&gt; <a href=3D"https://github.com/hintron/jailhouse/blob/76e6d446ca682=
f73679616a0f3df8ac79f4a1cde/inmates/lib/mgh-sha3.c#L185-L208" target=3D"_bl=
ank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://www.google.co=
m/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fhintron%2Fjailhouse%2Fblob%2F76e6d446=
ca682f73679616a0f3df8ac79f4a1cde%2Finmates%2Flib%2Fmgh-sha3.c%23L185-L208\x=
26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGIn-9IHMopzHc9p5fkGb-j73B6FA&#39;;re=
turn true;" onclick=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhtt=
ps%3A%2F%2Fgithub.com%2Fhintron%2Fjailhouse%2Fblob%2F76e6d446ca682f73679616=
a0f3df8ac79f4a1cde%2Finmates%2Flib%2Fmgh-sha3.c%23L185-L208\x26sa\x3dD\x26s=
ntz\x3d1\x26usg\x3dAFQjCNGIn-9IHMopzHc9p5fkGb-j73B6FA&#39;;return true;">ht=
tps://github.com/hintron/<wbr>jailhouse/blob/<wbr>76e6d446ca682f73679616a0f=
3df8a<wbr>c79f4a1cde/inmates/lib/mgh-<wbr>sha3.c#L185-L208</a>
<br>&gt;=20
<br>&gt; This is the Linux wrapper for the SHA3 workload:=20
<br>&gt; <a href=3D"https://github.com/hintron/jailhouse/blob/76e6d446ca682=
f73679616a0f3df8ac79f4a1cde/mgh/workloads/src/sha3-512.c#L166-L168" target=
=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://www.go=
ogle.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fhintron%2Fjailhouse%2Fblob%2F7=
6e6d446ca682f73679616a0f3df8ac79f4a1cde%2Fmgh%2Fworkloads%2Fsrc%2Fsha3-512.=
c%23L166-L168\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNEN8IP_PLFd23lsG2Fo50o=
W9V7GxQ&#39;;return true;" onclick=3D"this.href=3D&#39;https://www.google.c=
om/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fhintron%2Fjailhouse%2Fblob%2F76e6d44=
6ca682f73679616a0f3df8ac79f4a1cde%2Fmgh%2Fworkloads%2Fsrc%2Fsha3-512.c%23L1=
66-L168\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNEN8IP_PLFd23lsG2Fo50oW9V7Gx=
Q&#39;;return true;">https://github.com/hintron/<wbr>jailhouse/blob/<wbr>76=
e6d446ca682f73679616a0f3df8a<wbr>c79f4a1cde/mgh/workloads/src/<wbr>sha3-512=
.c#L166-L168</a>
<br>&gt;=20
<br>&gt; This is the inmate program calling the SHA3 workload:=20
<br>&gt; <a href=3D"https://github.com/hintron/jailhouse/blob/76e6d446ca682=
f73679616a0f3df8ac79f4a1cde/inmates/demos/x86/mgh-demo.c#L370-L379" target=
=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://www.go=
ogle.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fhintron%2Fjailhouse%2Fblob%2F7=
6e6d446ca682f73679616a0f3df8ac79f4a1cde%2Finmates%2Fdemos%2Fx86%2Fmgh-demo.=
c%23L370-L379\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHmtQBNrfZfzgP7p8Yu04F=
mxRyFKg&#39;;return true;" onclick=3D"this.href=3D&#39;https://www.google.c=
om/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fhintron%2Fjailhouse%2Fblob%2F76e6d44=
6ca682f73679616a0f3df8ac79f4a1cde%2Finmates%2Fdemos%2Fx86%2Fmgh-demo.c%23L3=
70-L379\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHmtQBNrfZfzgP7p8Yu04FmxRyFK=
g&#39;;return true;">https://github.com/hintron/<wbr>jailhouse/blob/<wbr>76=
e6d446ca682f73679616a0f3df8a<wbr>c79f4a1cde/inmates/demos/x86/<wbr>mgh-demo=
.c#L370-L379</a>
<br>&gt;=20
<br>&gt; You can see that the inmate and the Linux wrapper both execute the
<br>&gt; same function, sha3_mgh(). It&#39;s the same C code.
<br>&gt;=20
<br>&gt; The other workloads I run are intentionally more memory intensive.
<br>&gt; They see a much worse slowdown. For my CSB workload, the root cell
<br>&gt; takes only 0.05 s for a 20 MiB input, while the inmate takes 1.48 =
s
<br>&gt; (30x difference). And for my Random Access workload, the root cell
<br>&gt; takes 0.08 s while the inmate takes 3.29 s for a 20 MiB input (40x
<br>&gt; difference).
<br>&gt;=20
<br>&gt; Here are the root and inmate cell configs, respectively:
<br>&gt;=20
<br>&gt; <a href=3D"https://github.com/hintron/jailhouse/blob/76e6d446ca682=
f73679616a0f3df8ac79f4a1cde/configs/x86/bazooka-root.c" target=3D"_blank" r=
el=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://www.google.com/url?=
q\x3dhttps%3A%2F%2Fgithub.com%2Fhintron%2Fjailhouse%2Fblob%2F76e6d446ca682f=
73679616a0f3df8ac79f4a1cde%2Fconfigs%2Fx86%2Fbazooka-root.c\x26sa\x3dD\x26s=
ntz\x3d1\x26usg\x3dAFQjCNGN8KwRy17tmrc4-N5kmjz1skVFYg&#39;;return true;" on=
click=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fgit=
hub.com%2Fhintron%2Fjailhouse%2Fblob%2F76e6d446ca682f73679616a0f3df8ac79f4a=
1cde%2Fconfigs%2Fx86%2Fbazooka-root.c\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQ=
jCNGN8KwRy17tmrc4-N5kmjz1skVFYg&#39;;return true;">https://github.com/hintr=
on/<wbr>jailhouse/blob/<wbr>76e6d446ca682f73679616a0f3df8a<wbr>c79f4a1cde/c=
onfigs/x86/<wbr>bazooka-root.c</a>
<br>&gt;=20
<br>&gt; <a href=3D"https://github.com/hintron/jailhouse/blob/76e6d446ca682=
f73679616a0f3df8ac79f4a1cde/configs/x86/bazooka-inmate.c" target=3D"_blank"=
 rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://www.google.com/ur=
l?q\x3dhttps%3A%2F%2Fgithub.com%2Fhintron%2Fjailhouse%2Fblob%2F76e6d446ca68=
2f73679616a0f3df8ac79f4a1cde%2Fconfigs%2Fx86%2Fbazooka-inmate.c\x26sa\x3dD\=
x26sntz\x3d1\x26usg\x3dAFQjCNHhH5hG16S03OXU6Fq_aUXIBWtMog&#39;;return true;=
" onclick=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2=
Fgithub.com%2Fhintron%2Fjailhouse%2Fblob%2F76e6d446ca682f73679616a0f3df8ac7=
9f4a1cde%2Fconfigs%2Fx86%2Fbazooka-inmate.c\x26sa\x3dD\x26sntz\x3d1\x26usg\=
x3dAFQjCNHhH5hG16S03OXU6Fq_aUXIBWtMog&#39;;return true;">https://github.com=
/hintron/<wbr>jailhouse/blob/<wbr>76e6d446ca682f73679616a0f3df8a<wbr>c79f4a=
1cde/configs/x86/<wbr>bazooka-inmate.c</a>
<br>&gt;=20
<br>&gt; I did do some modifications to Jailhouse with VMX and the preempti=
on
<br>&gt; timer, but any slowdown that I may have inadvertently introduced
<br>&gt; should apply equally to the inmate and root cell.
<br>&gt;=20
<br>&gt; It=E2=80=99s possible that I am measuring the duration of the inma=
te
<br>&gt; incorrectly. But the number of vmexits I measure for the inmate an=
d
<br>&gt; root seem to roughly correspond with the duration. I also made sur=
e
<br>&gt; to avoid tsc_read_ns() by instead recording the TSC cycles and
<br>&gt; deriving the duration by dividing by 3,700,000,000 (the unchanging
<br>&gt; TSC frequency of my processor). Without this, the time recorded wo=
uld
<br>&gt; overflow after something like 1.2 seconds.
<br>&gt;=20
<br>&gt;=20
<br>&gt; I&#39;m wondering if something else is causing unexpected delays: =
using=20
<br>&gt; IVSHMEM, memory mapping extra memory pages and using it to hold my
<br>&gt; input, printing to a virtual console in addition to a serial conso=
le,
<br>&gt; disabling hardware p-states, turbo boost in the root cell, maybe t=
he
<br>&gt; workload code is being compiled to different instructions for the
<br>&gt; inmate vs. Linux, etc.
<br>&gt;=20
<br>&gt; Sorry for all the detail, but I am grasping at straws at this poin=
t.
<br>&gt; Any ideas at what I could look into are appreciated.=20
<br>&gt;=20
<br>&gt; Thanks,
<br>&gt; Michael
<br>&gt;=20
<br>&gt; On Monday, January 20, 2020 at 6:46:32 AM UTC-7, Henning Schild wr=
ote:
<br>&gt; &gt;
<br>&gt; &gt; On Sun, 19 Jan 2020 23:45:46 -0800=20
<br>&gt; &gt; Michael Hinton &lt;<a>michael...@gmail.com</a> &lt;javascript=
:&gt;&gt; wrote:=20
<br>&gt; &gt; =C2=A0
<br>&gt; &gt; &gt; Hello,=20
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; I have found that running code in an inmate is a lot slo=
wer than=20
<br>&gt; &gt; &gt; running that same code in the root cell on my x86 machin=
e. I am
<br>&gt; &gt; &gt; not sure why. =C2=A0=20
<br>&gt; &gt;
<br>&gt; &gt; Can you elaborate on &quot;code&quot; and &quot;a lot&quot;? =
Maybe roughly tell us what=20
<br>&gt; &gt; your testcase does and how severe your slowdown is. Synthetic=
=20
<br>&gt; &gt; microbenchmark to measure context switching ?=20
<br>&gt; &gt;
<br>&gt; &gt; As Ralf already said, anything causing &quot;exits&quot; can =
be subject to=20
<br>&gt; &gt; slowdown. But that should be roughly the same for the root ce=
ll or
<br>&gt; &gt; any non-root cell, is it truly the &quot;same&quot; code?=20
<br>&gt; &gt;
<br>&gt; &gt; And of cause anything accessing shared resources can be slowe=
d down
<br>&gt; &gt; by the sharing. Caches/buses ... but i would not expect &quot=
;a lot&quot;.=20
<br>&gt; &gt;
<br>&gt; &gt; regards,=20
<br>&gt; &gt; Henning=20
<br>&gt; &gt; =C2=A0
<br>&gt;=20
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5ba8f35f-912a-4749-bf8b-781193f45ebc%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/5ba8f35f-912a-4749-bf8b-781193f45ebc%40googlegroups.com<=
/a>.<br />

------=_Part_3891_1705939653.1580022473993--

------=_Part_3890_1248430326.1580022473992--

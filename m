Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBYPGWPXAKGQEY5SI4UA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB18FC022
	for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Nov 2019 07:25:39 +0100 (CET)
Received: by mail-ot1-x33b.google.com with SMTP id l17sf2673233otp.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Nov 2019 22:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9r7lcLrm3FyUxjU1mYVov0wrTbksOJIKkzzAgKyPgeQ=;
        b=NHDE3Y4wyComCo4wuLj6Pjoq8cHVNM452lCQZMvTxgscl43XVC9IU6j001pfp21sam
         39DCbNOuMBmaHK/3KLAz9X8LegJutVY1RgoHTaXou4z9fYPkJbFYTjyDesjMBm9ygAEI
         UxDGABd++yLZWUEtOUkJ9XA8s5uJS89JToOKl7rdVOs+Wal8OAezwQ91Ktbq0rh34Cs5
         xCAt6gMueIl4E/p6l/15u46kLO1rxzAf5PVRzidbv38XQpIvRQI31mCxunITxPCuoXTI
         pdn1hsilwaqYgndkNnHo8aJIF8r7ytX13PmtbgO36JH6J91mVn9+SCNmUrP0zOea2fbg
         xv1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9r7lcLrm3FyUxjU1mYVov0wrTbksOJIKkzzAgKyPgeQ=;
        b=Pg8Pk+RgRI6PYqk63P7Hevo4jx1Q4sfhHscsjbVak13M3T+B2MgYjEqSzPSTUnjq2I
         DdkYBIVKoWn8ts+97pLDUFJEgSO4Go83Av9ETLqabxOExuv1B2pfzxQJ8O/XD9qQAXFz
         7POoLvHld3udmk8lD0pBh4D/XStY7HLy8vNqj9iT++6z1s8KRSv+pH2I9seb4HlMsTO6
         iPykR7L+S1GHvmO2q3OoyyUDl9gbuS0cseAPS31bR3zTP7BuCA6Yi73TjSLOvALyC8iE
         DpRIgEdRcYlGcKvclHizje5jxi+3uow2N854fM4XuDsBu3WynfhqGPgeFBViPcF6Jz3p
         7kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=9r7lcLrm3FyUxjU1mYVov0wrTbksOJIKkzzAgKyPgeQ=;
        b=HFOYAXR7u3M1nnPNg1BjPdGLXaPvV9x0OdhweFqA2NsyaI6DLrLB0xG5qpHbWvuPWp
         MMxJKYIvxnerl3GuhFeUeS21wzOi+Rt8wwv3nv+vsyJVGM7MOdBB2bcwQgV93WrUxI2O
         CKhJla2eGaZxKyrQcMhQVuq5vi5KnDkXL7DAbOZFRgNQFhAy6U2pj8LfF0/Vw3l+4vnF
         b4SFB4GYGM9SQkCS+uAthlSILH2WsiN3/f9+quinka0O7OdbWoLkonKLehHLqrQtb68n
         op0zHWy9CbSw81ztBptOI2zbDML8L1Offk1KVkK71QFH+gV6k+tr8VkO6o4zyvjv18C3
         N0hg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW/3UlBtvEt8YKk9qnfq6Heg+eMnU37KYDO7VVqMH3fD97h1iaL
	Ova7Tk7JC2eHM52pcfPV55k=
X-Google-Smtp-Source: APXvYqxDRH8pM/LcDw4GHpCK4G5zwLfcHsfe6w2kQlt0/ipQMoVCsMgWTnck8ACoVwqXf0h9b336Cg==
X-Received: by 2002:a05:6830:55a:: with SMTP id l26mr6634959otb.144.1573712737658;
        Wed, 13 Nov 2019 22:25:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4815:: with SMTP id c21ls1172811otf.0.gmail; Wed, 13 Nov
 2019 22:25:37 -0800 (PST)
X-Received: by 2002:a05:6830:8b:: with SMTP id a11mr6654151oto.244.1573712736513;
        Wed, 13 Nov 2019 22:25:36 -0800 (PST)
Date: Wed, 13 Nov 2019 22:25:35 -0800 (PST)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <780f0dbb-4fcf-4e0e-a247-8e9f2ff0ec76@googlegroups.com>
In-Reply-To: <22847d72-665a-7c0a-00c5-f015912df44e@siemens.com>
References: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
 <6defc2d1-96ac-c470-818d-1c9a8e1d8725@web.de>
 <eed4bd9a-7020-4182-9949-d529bef7b3b2@googlegroups.com>
 <48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43@googlegroups.com>
 <20191025155257.6af12e29@md1za8fc.ad001.siemens.net>
 <76ecfa10-3a69-b5bc-382a-48a59c345637@siemens.com>
 <579d40f1-a8f4-4144-9405-3bba1ea23c14@googlegroups.com>
 <2151b869-9732-4483-8659-90234a971f1b@googlegroups.com>
 <09cf7ef6-0bb0-0d3e-cab3-493c500c6559@siemens.com>
 <6705dfff-635e-4182-a684-86d0b861e94e@googlegroups.com>
 <22847d72-665a-7c0a-00c5-f015912df44e@siemens.com>
Subject: Re: v0.9 vs v1.1 interrupt latency raise
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1191_854683159.1573712735848"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_1191_854683159.1573712735848
Content-Type: multipart/alternative; 
	boundary="----=_Part_1192_1931512925.1573712735848"

------=_Part_1192_1931512925.1573712735848
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



2019=E5=B9=B411=E6=9C=881=E6=97=A5=E9=87=91=E6=9B=9C=E6=97=A5 16=E6=99=8236=
=E5=88=8616=E7=A7=92 UTC+9 Jan Kiszka:
>
> On 31.10.19 06:57, Chung-Fan Yang wrote:=20
> >=20
> >     Interesting findings already, but I'm afraid we will need to dig=20
> >     deeper:=20
> >     Can you describe what all is part of your measured latency path?=20
> >=20
> >=20
> > I measured using an oscillate scope and function generator.=20
> > I am using MMIO GPIOs. The application calls a system call and waits fo=
r=20
> > an interrupt on a certain GPIO.=20
> > When I send a pulse to the GPIO, the IRQ handler release a semaphore,=
=20
> > interm trigger the scheduler and wake-up the application, which send=20
> > another pulse to another GPIO using MMIO.=20
> >=20
> > FG -> Serial -> APIC -> RTOS IRQ Hnd -> Scheduler -> Application ->=20
> > Serial -> OSC=20
> >=20
> > The timing different of these 2 pulses are measured.=20
> >=20
> > Because of the waiting mechanism used, receiving the pulse involved the=
=20
> > system call / semaphore / interrupt handling of the RTOS.=20
> > On the other hand, sending doesn't use any of the RTOS feature.=20
> >=20
> >     Do you just run code in guest mode or do you also trigger VM exits,=
=20
> >     e.g. to=20
> >     issue ivshmem interrupts to a remote side?=20
> >=20
> >=20
> > I tried to instrument the system.=20
> > So far there are no additional interrupts send, nor received during the=
=20
> > whole process.=20
> > VMExit do exist for EOI(systick and serial IRQ) and when I fiddle the=
=20
> > TSC_deadline timer enable/disable bit of APIC MSR.=20
> > The whole process is not related to any ivshmem operations.=20
>
> Use x2APIC in your guest, and you will get rid of those VMexits (due to=
=20
> xAPIC MMIO interception). But that's an unrelated optimization.=20
>
>
Thanks for the hint.
I override the BIOS and enabled it.
There are no VM exits now.
=20

> >=20
> >     Maybe you can sample some latencies along the critical path so that=
=20
> >     we have a better picture about =20
> >=20
> >     where we lose time, overall or rather on specific actions.=20
> >=20
> >=20
> > Basically, it is an overall slowdown.=20
> > But code in the scheduler and application slowdown more than other=20
> places.=20
> >=20
> > BTW, I tested the again with a partially working setup of <kernel=20
> > 4.19/Jailhouse v0.11/old ivshmem2>.=20
> > Currently, I cannot get my application running, due to some mystery, bu=
t=20
> > I am observing some slowdown.=20
> > Pinging the RTOS using ivshmem-net the RTT has about 2x latency:=20
> >  * <kernel 4.19/Jailhouse v0.11/old ivshmem2>: ~0.060ms=20
> >  * <kernel 4.19/Jailhouse v0.11/new ivshmem2>: ~0.130ms=20
> >=20
>
> Sound like as if we have some caching related problem. You could enable=
=20
> access to the perf MSRs (small patch to the MSR bitmap in vmx.c) and=20
> check if you see excessive cache misses in the counters.=20
>
>
I am quite busy lately, so I might let this problem be as is and revisit it=
=20
later.

I will update the thread when I made new discoveries.

Yang.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/780f0dbb-4fcf-4e0e-a247-8e9f2ff0ec76%40googlegroups.com.

------=_Part_1192_1931512925.1573712735848
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>2019=E5=B9=B411=E6=9C=881=E6=97=A5=E9=87=91=E6=9B=
=9C=E6=97=A5 16=E6=99=8236=E5=88=8616=E7=A7=92 UTC+9 Jan Kiszka:<blockquote=
 class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1=
px #ccc solid;padding-left: 1ex;">On 31.10.19 06:57, Chung-Fan Yang wrote:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Interesting findings already, but I&#39;m afraid we =
will need to dig
<br>&gt; =C2=A0 =C2=A0 deeper:
<br>&gt; =C2=A0 =C2=A0 Can you describe what all is part of your measured l=
atency path?=20
<br>&gt;=20
<br>&gt;=20
<br>&gt; I measured using an oscillate scope and function generator.
<br>&gt; I am using MMIO GPIOs. The application calls a system call and wai=
ts for
<br>&gt; an interrupt on a certain GPIO.
<br>&gt; When I send a pulse to the GPIO, the IRQ handler release a semapho=
re,
<br>&gt; interm trigger the scheduler and wake-up the application, which se=
nd
<br>&gt; another pulse to another GPIO using MMIO.
<br>&gt;=20
<br>&gt; FG -&gt; Serial -&gt; APIC -&gt; RTOS IRQ Hnd -&gt; Scheduler -&gt=
; Application -&gt;
<br>&gt; Serial -&gt; OSC
<br>&gt;=20
<br>&gt; The timing different of these 2 pulses are measured.
<br>&gt;=20
<br>&gt; Because of the waiting mechanism used, receiving the pulse involve=
d the
<br>&gt; system call / semaphore / interrupt handling of the RTOS.
<br>&gt; On the other hand, sending doesn&#39;t use any of the RTOS feature=
.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Do you just run code in guest mode or do you also tr=
igger VM exits,
<br>&gt; =C2=A0 =C2=A0 e.g. to
<br>&gt; =C2=A0 =C2=A0 issue ivshmem interrupts to a remote side?=20
<br>&gt;=20
<br>&gt;=20
<br>&gt; I tried to instrument the system.
<br>&gt; So far there are no additional interrupts send, nor received durin=
g the
<br>&gt; whole process.
<br>&gt; VMExit do exist for EOI(systick and serial IRQ) and when I fiddle =
the
<br>&gt; TSC_deadline timer enable/disable bit of APIC MSR.
<br>&gt; The whole process is not related to any ivshmem operations.
<br>
<br>Use x2APIC in your guest, and you will get rid of those VMexits (due to
<br>xAPIC MMIO interception). But that&#39;s an unrelated optimization.
<br>
<br></blockquote><div><br></div><div>Thanks for the hint.</div><div>I overr=
ide the BIOS and enabled it.<br></div><div>There are no VM exits now.<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin: 0;m=
argin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">&gt;=20
<br>&gt; =C2=A0 =C2=A0 Maybe you can sample some latencies along the critic=
al path so that
<br>&gt; =C2=A0 =C2=A0 we have a better picture about=C2=A0
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 where we lose time, overall or rather on specific ac=
tions.
<br>&gt;=20
<br>&gt;=20
<br>&gt; Basically, it is an overall slowdown.
<br>&gt; But code in the scheduler and application slowdown more than other=
 places.
<br>&gt;=20
<br>&gt; BTW, I tested the again with a partially working setup of &lt;kern=
el
<br>&gt; 4.19/Jailhouse v0.11/old ivshmem2&gt;.
<br>&gt; Currently, I cannot get my application running, due to some myster=
y, but
<br>&gt; I am observing some slowdown.
<br>&gt; Pinging the RTOS using ivshmem-net the RTT has about 2x latency:
<br>&gt; =C2=A0* &lt;kernel 4.19/Jailhouse v0.11/old ivshmem2&gt;: ~0.060ms
<br>&gt; =C2=A0* &lt;kernel 4.19/Jailhouse v0.11/new ivshmem2&gt;: ~0.130ms
<br>&gt;=20
<br>
<br>Sound like as if we have some caching related problem. You could enable
<br>access to the perf MSRs (small patch to the MSR bitmap in vmx.c) and
<br>check if you see excessive cache misses in the counters.
<br>
<br></blockquote><div><br></div><div>I am quite busy lately, so I might let=
 this problem be as is and revisit it later.</div><div><br></div><div>I wil=
l update the thread when I made new discoveries.</div><div><br></div><div>Y=
ang.<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/780f0dbb-4fcf-4e0e-a247-8e9f2ff0ec76%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/780f0dbb-4fcf-4e0e-a247-8e9f2ff0ec76%40googlegroups.com<=
/a>.<br />

------=_Part_1192_1931512925.1573712735848--

------=_Part_1191_854683159.1573712735848--

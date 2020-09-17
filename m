Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBHGART5QKGQEXRCRUVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C426D6D0
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 10:36:45 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id i9sf652775ljc.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 01:36:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600331805; cv=pass;
        d=google.com; s=arc-20160816;
        b=Uq0N+vdcKnwaWPtY+maUpnChp1PHem3b/kiZ3iIFZQr2KZg2I5an3+zF4JzKNGMy5E
         vEtbwN3CgsJ6tblkuH0TJ1D+XC/oFjLrbC8H2f1JqayzNXlNf1D6kRFGFKBZKw5sxKpH
         UFdBOyU3rkqTVs95ms0/O91xT9XMVCS69jHNRwz5rLD19GoNWsRFuCBEde2MZdgdaAlS
         bYuvDVYLEUE//BAB8KJcG5DGNJH9KhoS2MjczIA99a4iiQrB/MhYPVLuE4DlwPAv24fh
         IgQ9PygwhldZCrxtNxoPKV3OHP6dJ38998pG7E5uwGzBELjFx3nZQMlPC6SnPQ1+z1fR
         Q8OQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:dkim-signature;
        bh=HZKWvJgWRFim4DYvlGuHWhWai7HTdNUha+kldkxugRw=;
        b=EVWUMv2lUhJwmZJ68Gz72gw3/ir4znL+12dQ2zJNHekIYaEiVi+19PKCBK+NR29ixj
         08q9ePM6/Xv9Q76jP5XGAjWO7jaR/0zPtVq3FI6ADnxhoboFx40U7WpGpn3viEKr8cDG
         XIlDq6HKmJmr2eXA7E/7WqZ2avWirWMGVZOlDSBrCP0rhr6zCxR86b9i6qx3iPMF6+JZ
         a9RLQ8tf5ikcYtEbXHCeCY97GJvIuTWKPQWmMPd4zzBJwj5W/nmZ4on41CI6yW5XX/I4
         2j37c7ppP4edtbL3/5OJOk+EdrEbIE45hcQiy8wCOVVjUl/jb5X83PdDMJD+Cw/YUvt3
         ty1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=kySj2ZsB;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HZKWvJgWRFim4DYvlGuHWhWai7HTdNUha+kldkxugRw=;
        b=Jbkr+ymQ91DIi/KRaFEtmXk1AZK6Rzi97xHIYgHFw0uWkQMwytNP3jCeRzQPPhYln6
         758OVFxGE+n0Bv27XUBUcK7/qkJbvkdVHZpIF2mAQeHkmOpCl4fVtnZT3WJfDgY5hqwg
         Ur4DLLz1y7SwCDdwPsW7fIG9dKMr4OWW+BYESaLw64qtUZUegD68NfBubwVi4Qg2TJYV
         /ksR1bm9iXtBt6oQ0rigB+33BczoE4Y3oBkddVLglqmmQ4oV9dAXYxdvYgTJ9RChn9zT
         O6iODXSiuYDuuS0lHObWkHTUSykWYme4SEdvGG5HBIWvtTojFuOa6yPacOP4GSeIfHoN
         d0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:subject:from:in-reply-to
         :date:cc:content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HZKWvJgWRFim4DYvlGuHWhWai7HTdNUha+kldkxugRw=;
        b=bC91TQBXldmeVe5zaNWYmzN8HI7uPJLEVuLnRpcTfu080EFSRs7XyahNS1j9v3Mo9v
         g+jaMFBCx55q6r3NMhqW/E3L8mdfHLkt6wM+905orSAdcNwvqYc5sq09no6nYhU2yBh3
         qzYeOQTV6KAWYlTG4CHUg6eAwtUVEoJPBDaVBI/hLlHMCwxLMZfqiAMhVzNT/OCe6B44
         9uEeSExJscmBcCEB45JH6y1xQyq5nHqlHL4UCGoDr0gR3os5CJIermCZMB9T7m9m7TDD
         MRIS4PFYgca2Q1PH6yzzkjVkIpvHCvndtdIVlJNeIMCdSgU/eLSZpYjayMpF674Z8gv1
         WvEQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5317xx/5boprSCEXPakJsZyFYfBdPl8YZsG9ZjXMowfgUFTaGzIN
	bsPucsTmsqCmZoD21ldWbYM=
X-Google-Smtp-Source: ABdhPJyrvJtdHAP6BWSSIQtwQXtyILXUCVDiaoQOfy4gDFIBEkwl3V7xqvO1IAUQHs4hfE+edHopzw==
X-Received: by 2002:a2e:8e31:: with SMTP id r17mr10317639ljk.5.1600331805199;
        Thu, 17 Sep 2020 01:36:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5c44:: with SMTP id s4ls457971lfp.3.gmail; Thu, 17 Sep
 2020 01:36:43 -0700 (PDT)
X-Received: by 2002:a19:8089:: with SMTP id b131mr8087845lfd.390.1600331803720;
        Thu, 17 Sep 2020 01:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600331803; cv=none;
        d=google.com; s=arc-20160816;
        b=rc1drs6CqCuLwraspIkMHwyJwP8zeQfj0ZKYGZ4Y0+E3HyRC+t3+ehVHY10pUB9aN1
         caWjtfKeGhn9f+DOeTo//bgfQkEP+GNY1dC+r1b+e7clmjG4uemKfXknrW0Olv3YjrHo
         /rBhes9IXxFzfuupykGw9xpqWu8qCRCLjFmFH3QRe2eiKkzi49+qYaBt9yQGLQh6DaFS
         Dp+sBNzfXGqDjZvz9omxnwzIqRUkII53TYHmFgMM2ZvM6Pu61zVl3N0LiCjOEyiPQity
         LJ0oqxmP2+mw/zvp22C10l+YmNPF1PgECY/KDSVwz2zLfHuh8qax05P02EYWewluMF0F
         3D4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=MXXwjSwMS6cXRfGUltF/sKiDrMSFm98nrhWx5xPVrX8=;
        b=FfOK+Q8JW3Es2Ga8Chr5/Hny32W7K708W2ziB4F5/ZHb0flDKxgEpuImixS08i6KUy
         D6wY0S/fvEKmLLy6sXHw5te2cV5t7B8pcJ6KUpO1fUIjmfA9j+mWLSqKPhR8E1+vXmF4
         Wz5kWP05DGUgCuzbUk0NTvFL1dDUveydu7uikeQLREn7CiyfNArBqD2rvmkT4GUXhZTH
         0G7jzpYP6JGIqnEHVgR/7IFRx68HJaD/+g6fwly4cA0W5x5AR3zistHiOkNn7eJQ/0j9
         Ji24r1rCgD3thebZF6/mVHOgCfjP/OAzdx3sMmPFmxLJKnS1pbgyu09VD4ClZHHghNvy
         vkTg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=kySj2ZsB;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.18])
        by gmr-mx.google.com with ESMTPS id l82si445596lfd.13.2020.09.17.01.36.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 01:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) client-ip=212.227.15.18;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from nethserver.fritz.box ([5.149.23.5]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MY6Cl-1jzv793tqX-00YOb0; Thu, 17
 Sep 2020 10:36:43 +0200
Received: from [192.168.2.64] (unknown [192.168.2.64])
	(Authenticated sender: oliver)
	by nethserver.fritz.box (Postfix) with ESMTPSA id 5EB9D202544E;
	Thu, 17 Sep 2020 10:36:42 +0200 (CEST)
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: arm64-zero-exits trouble
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <64bb13f6-6ae2-09ce-4c61-4c406a360c05@siemens.com>
Date: Thu, 17 Sep 2020 10:36:42 +0200
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F1455873-4D81-412E-AE3F-B584773FBB29@gmx.de>
References: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
 <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
 <0F31A760-66D4-4430-BE71-6126FCF5AD60@gmx.de>
 <64bb13f6-6ae2-09ce-4c61-4c406a360c05@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Provags-ID: V03:K1:g9URd/Xmgu1xGhtiiOhmeDBbFwc3/JGwV5GYYtuxS/2RAm1Y3dM
 tor4sZyUFREb6WbhXwPCNeytt/OlGFEyBTQ18pJoMLZvydmbCUj/mnMga0sOMURWmvb2jSS
 zAUVyBx0x2LMYoWMy8X9L6/fdgmMV6qeJVqPmmk/MOaPYCeic6X6E92HgIoa6pLF/jwaAat
 vOo9V1iMsWbPpwnEQQ4Lw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:duRwV/bBSzQ=:JqEBBei/Tkri66A0x07pfQ
 Qxsm98ryqTpNh585ObQJmv1dMmkEODne1oSwY2Dk9fOSZz/4zP5W3HqeMb5yvzIGUq5Jh48LK
 6OJEag/dS8lLZ7cR+OYp7we7PSY7RIq7Jpo81gVRoDc2I49jGNIlI4tQtALj/2qGLl93wGM1e
 zsE7gJsiyGZTwPFa6wZL2LkXktXbYgrm8JyIQNuahyMjVwPaytHtLtxHLh40lsv/UTcF12+D1
 G+9uxSQowEEoioT3/LAU6ScIhUT6EKOLR0+LMUYxGBjBzBvBTYLVTtQ/10FrNeqwRSfrDN7ic
 MykdE9qI7Sd67GOgCVS7y2AkGCs2o/jtzaQeFjMJ+g0tcfQfJ4My78MgKVQA+UCtNQQcx9VOm
 0+NkVXWNCjmeX4zAhf0U8J0/dDu0gjpfXbadUizkVR/l9oLo5LiomEnd299r/CTpQ9LBixKoa
 oL0kli3MzwdbQQilQQkMQ0gp+DMHQl/awqjeCzw2whOhmGPAHQphrST89+xF73YAqkRNgYUPQ
 +/JuN9zEswKPeO7Vz3wTQd+h03pY97uo8zRts8rOY0QonasngRkDskjEaM4iWiZw2IXTM8rqH
 QJmkTkwnz3/ugOg98FezSKd5IDZ2/GJ+Zjh2jLyv0piG1jMbCmhBD5/z1zaF4KpNgy4PKuDTk
 EKXVaZQbPjZ2B5v4wy214DnLj7TdOvV6Xq+mj9hTkl0feKvfgOnuvJsiyVq4/u3lujOSk2FA2
 /vIZ/A3VtrAEURmo3elKGW4rBgHh9VG5MxLHiVyVpS7VYS2ynxcf9BU93jr9dKaLswPRVE+xj
 3d/bBUp71HxMbcTnYa1ajtI7Y7dBc3gaowzFy5b9lTbIMdJ06dL//zF2ii/lc+RPZDVf/3slS
 GCf+MV+/NptV5pz+p+9QPvk6o8aVKBlaYMTW9vdnPY8i/pBq7jUJK2LXtX2+H4/bLIz2IYkeK
 XTyY4j5zjioQpGonj0WIqfyMu1+QEIqVg4xFfhzphGv7VUihyg3K4CvWY+mhxAa7ceh7Xr3gl
 G5Yp1hv3pmmK90Nm8fhlF+L8FyGkyDFt6+obG2WgYJEJzr9wK6SPg0wZwuz4qYGNeQEQuB1VE
 kSQM2bFcZy1oofgwcRG061Bw2GtjEVxnkJw3BdFCC8AWHKpTg0S3OI2SDxt6UVsL654rUiFxN
 gKvjLlDgnCeCmO7qEFs1QBdsUi/oU9b7yiTiMWgWeJrnhIf/e35LosDLGALpS9B/+++406Keh
 jj8pKgu+vgqC+DY5lYsuV/ZurJDMHYrJ70/R8MA==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=kySj2ZsB;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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



> On 17 Sep 2020, at 09:31, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> On 17.09.20 09:16, Oliver Schwartz wrote:
>>> On 15 Sep 2020, at 11:00, Jan Kiszka <jan.kiszka@siemens.com <mailto:ja=
n.kiszka@siemens.com>> wrote:
>>>=20
>>> On 15.09.20 09:07, Oliver Schwartz wrote:
>>>> I=E2=80=99m currently trying out the arm64-zero-exits branch and got s=
tuck.
>>>> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=E2=80=
=99ve brought ATF up to date and patched it with Jans patch to enable SDEI.=
 If I don=E2=80=99t enable SDEI in ATF everything works as expected (with V=
M exits for interrupts, of course). Jailhouse source is the tip of branch a=
rm64-zero-exits.
>>>> If I enable SDEI in ATF, jailhouse works most of the time, except for =
when it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99 resu=
lts in:
>>>>> Initializing processors:
>>>>>  CPU 1... OK
>>>>>  CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hypervisor/a=
rch/arm64/setup.c:73: returning error -EIO
>>>=20
>>> Weird - that the SDEI event enable call.
>>>=20
>>>>> FAILED
>>>>> JAILHOUSE_ENABLE: Input/output error
>>>> I=E2=80=99ve seen this error only when I enable jailhouse through some=
 init script during the boot process, when the system is also busy otherwis=
e. When starting jailhouse on an idle system I haven=E2=80=99t seen this.
>>>=20
>>> Possibly a regression of my recent refactoring which I didn't manage to=
 test yet. Could you try if
>>>=20
>>> https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5ea11b=
08aa65a456255f
>>>=20
>>> was any better?
>>>=20
>>>> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=99:
>>>>> Initializing processors:
>>>>>  CPU 1... OK
>>>>>  CPU 0... OK
>>>>>  CPU 2... OK
>>>>>  CPU 3... OK
>>>>> Initializing unit: irqchip
>>>>> Using SDEI-based management interrupt
>>>>> Initializing unit: ARM SMMU v3
>>>>> Initializing unit: PVU IOMMU
>>>>> Initializing unit: PCI
>>>>> Adding virtual PCI device 00:00.0 to cell "root"
>>>>> Page pool usage after late setup: mem 67/992, remap 5/131072
>>>>> Activating hypervisor
>>>>> [    5.847540] The Jailhouse is opening.
>>>> Using a JTAG debugger I see that one or more cores are stuck in hyperv=
isor/arch/arm-common/psci.c, line 105.
>>>> It may also succeed in stopping one or more CPUs and then hang (again =
with one or more cores stuck in psci.c, line 105):
>>>>> [    5.810220] The Jailhouse is opening.
>>>>> [    5.860054] CPU1: shutdown
>>>>> [    5.862677] psci: CPU1 killed.
>> Now, with the first problem solved I=E2=80=99ve digged into the second o=
ne. It=E2=80=99s actually a bit worse than in my initial description: If I =
just do =E2=80=98jailhouse enable=E2=80=99 the system will always hang a fe=
w milliseconds after the command completes - the only exception is when =E2=
=80=98jailhouse create=E2=80=99 is executed immediately afterwards (which c=
reates an inmate that uses 3 of 4 CPU cores, leaving just one for Linux), w=
hich succeeds roughly on every second try. I didn=E2=80=99t notice this ini=
tially because I usually start jailhouse with a script that does =E2=80=98e=
nable=E2=80=99 and =E2=80=98create=E2=80=99.
>> The reason for the hangs seems to be the psci emulation in Jailhouse, in=
 particular the CPU_SUSPEND calls. These are issued from my (Xilinx-) kerne=
l frequently if Linux has more than one core available. With SDEI disabled =
the core can be woken up again by some interrupt. With SDEI enabled, the co=
re waits forever on the wfi intstruction. Because a suspended core never wa=
kes up again the whole system hangs at some point.
>> Any ideas why no interrupts are seen anymore in psci? My guess is that i=
t=E2=80=99s because the inmate (Linux) now has full control over the GIC, s=
o it may disable any interrupts before suspending a core, without Jailhouse=
 noticing. If this is the case, it may be necessary to re-enable the IRQs b=
efore executing wfi. But I=E2=80=99m missing the big picture here - what in=
terrupt is the core waiting for in the first place? Any other thoughts?
>=20
> You likely found a bug in the SDEI feature of Jailhouse. The CPU_SUSPEND =
emulation assumes non-SDEI operation, i.e. interception of interrupts by th=
e hypervisor, but that is not true in this mode.
>=20
> We need a way to wait for interrupts without actually receiving them when=
 they arrive, but rather return to EL1 then. Maybe re-enabling interception=
, waiting, and then disabling it again before returning would do the trick.=
 But then I also do not understand yet why https://github.com/bao-project/b=
ao-hypervisor/blob/master/src/arch/armv8/psci.c gets away with wfi. Possibl=
y, they run with interrupts on through the hypervisor, though that would no=
t be straightforward either.

The good news is that there=E2=80=99s an easy workaround, at least on my sy=
stem: disabling suspend calls before starting jailhouse=20
(echo 1 >  /sys/devices//system/cpu/cpu<n>/cpuidle/state1/disable).

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/F1455873-4D81-412E-AE3F-B584773FBB29%40gmx.de.

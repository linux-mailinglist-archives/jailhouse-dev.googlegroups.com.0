Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBSMS77TQKGQEB4KIBYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 627383D0D1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 17:31:21 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id b12sf13915571eds.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 08:31:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560267081; cv=pass;
        d=google.com; s=arc-20160816;
        b=qL/focvyphO/RAeGerdupUVDCiIyhcu2AHs0nfpU09sJUEp2aTPhNAAig+mUSAklAM
         c938zCJ1xeQiU1hCdbX2EMR/NzXXb6nXm0vdT0CR3daW84z4mnYS/vyZBGB2Awo4/Aqt
         e7npVfItVgiqDGcGsL8Pyb8Jz9q4cnMZWJjjVPF9uYJ1i6SK/dSKD/pLdImnrz/npT+d
         OaVGZeR8qvFund8lkJqtadGpVAxwMylGCi/V+gFWs0pkVnJnfNu8fYoflKNldGN98Lze
         HuR6+WzQAGNqIwfZ1UA1Y07++KGlD+QUekdJGTufImGCI46QEKEn5ZZz1N/tC5MjXtXk
         U8Nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=aSZI1a6SbWkBm80nWwpCSb1kX5xH4Jti27VZYCO90HE=;
        b=u6MUsn4GGpzVtWo6IndBED1kv3aWoWh7pLWLjf6hJKRczymGVONrsl9FObdB9P30fU
         p7lkLKtSbgE+K0Ssxb3a6j13eGVihOdPiry5EiHVJxqha511bp0zJS3J0JAh3TAGqmI6
         Y1cCrr1ZFH3681qfQDqAKA2v85/trbf8i68X3yw5NfCTXkPl+p8qFdT3j3yEDNfivQdZ
         HK1h9s81xljSx9HhjW0Jvv5CzzpMoTVTiJDzbGVwaJCbJZ90RqKUcQJVwKbJUtD7EJrw
         jcxvWHDYNKYV74UAfJd9eBTaDrBrbkWbXYzi05pDPAUN+xsqzWgdnjWCSB3enxmePS0i
         Crcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Us+xYcJ2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aSZI1a6SbWkBm80nWwpCSb1kX5xH4Jti27VZYCO90HE=;
        b=LTShXIclb7VuDfEQ4pCmc4swhVicuxIahaUbVFduDcTqwexx0D03CrlDzz1eVMb8x9
         n28iPsLUMu35Bzr3lYTR3lwMtNgZHdw2fHlgBYtr9I9JG9DNM6cldzyYDCNMbgzKkrh3
         KnNHNSh/QK69GIkKFBNysaYMFP6p2ZNWW94pxiLYlComq96IL3/nPYc1VgucIGrQifCn
         NPuMG3EHLmWSUbeWztztBmcJqESv+psDhN7VX5R8+5/DUi8l0mvXTVVe2HIzFwf1IHg0
         zXdFZ9fpbUm1ONkBzIaDeGqY2oD/RB2AuBN99ZTX55x2AQSRWOqxmsOWn6otJEX0608B
         1xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aSZI1a6SbWkBm80nWwpCSb1kX5xH4Jti27VZYCO90HE=;
        b=Z1AyvLEKAZTMBE+K4Hdl5NynzzyNLpZJNBLbnXyayEpUzeFP6xwAwKK4lyyShmxBRx
         rZmZ3GkulJbnF1rL3GO36/5M7yK8G7jfRrUi1hjngOfUyAOQdi4RfnqNjmXZBCw4d4/U
         jYnCp23yKvUgcnvt1OPqfCm+UxQUZG3wffELeBSGhQIx3x5BU3nCiAEIi3GsE1wso7pH
         FQnyrH2ANGqdxzRe1wI70bMwTmk2Vf+rCy+na3xfaKfD2EQowndAJyTvraRjwTAfgZmb
         cKmLC21sLNSON54fkQ/wqIhXPRhsVIgkuiBQTEnPSOqmtGW6i3lkyOZMygO0Ukq/sskD
         dhig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW9y3ya9HwnVsrsMFhl6dMg/uO8o063s8hkLe/qGtUar3T3MHMz
	SbepLdiAILv0/vF7gp0vITk=
X-Google-Smtp-Source: APXvYqwKgOCdazJM6005RICF9K3hhkQ/DdXj8KZRoUJljHnPnBvYC7unm/g0N2FUWJcvy9j/d1Zmig==
X-Received: by 2002:a05:6402:1612:: with SMTP id f18mr19950323edv.231.1560267081135;
        Tue, 11 Jun 2019 08:31:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9728:: with SMTP id c37ls4098741edb.12.gmail; Tue, 11
 Jun 2019 08:31:20 -0700 (PDT)
X-Received: by 2002:a50:a56a:: with SMTP id z39mr3385629edb.107.1560267080334;
        Tue, 11 Jun 2019 08:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560267080; cv=none;
        d=google.com; s=arc-20160816;
        b=zIC9uTXKxlH70p8BFOtUeimXfgp5ycA9ScAzpfArEnHEHOVWlGRE0IaAzCOH6GFw04
         CDr0OUnpatMPz2TqY74fBIcov7u9fLrhff9dp6/Lh74P26ipwpgX79vhgC3v4bTYwQfx
         S2MYCeFkyOZQbITUxISSWwHA6iMa7JjxgssGYSrFlpOvRTs1Ss7QmuGHzcwNFqDdzlkg
         WMly6enETnnB0ilwwgwYMXkTuY9akjb+/PgB6Gbs1M3gS6zWlYNypQItmO4IqY8UCtm5
         cx7jRVUYazGhw2RVkQax1XkrM0TBi1VkPwEKfzes6OnqwoTEIHXHFlDvrO4aTC7DtpAs
         tEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=spnP+WwWrlpZJbEgpZC3z7tN/jZh/GUw9Cf/jRe8I/I=;
        b=PX3n6fRDFsHDRW7Rfy9laPHQYw4P1MtZahWDXzHGPwjzZh7Zn+EHp5FmLG0pyNjQOb
         YEOya5+/0NdRP5TjZP7fkne4tzSm51sujw51ZJ3mpARqJNjrIehsrpCoe0dVUgb8ccZf
         rNpAyEZ7GKA/90E3lwEGwK7a9/GOwXCpqn+FU2XsnSBAORMYoBjMmUY5D80p7TTFHpwI
         7vW9sblV1AttnaenqArFX6rv1mViL1hVe/22WCOa6J5qHHvgWT3AnYObfin4VCHIChzP
         pQh0YnDFuMCXNnFcLEbMurEbowWyRs2hbuyZRmRqdpoLPwQCxmXjC3Xu49kifGXxtQsX
         qAbA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Us+xYcJ2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id z20si632301edc.1.2019.06.11.08.31.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 08:31:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45NYr75hsqzyBj;
	Tue, 11 Jun 2019 17:31:19 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 11 Jun
 2019 17:31:19 +0200
Subject: Re: Linux non-root node question
To: Wayne <racedrive1503@gmail.com>
CC: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de>
 <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
 <166c6ad9-379c-bad6-f30f-8af4f97b8bb1@oth-regensburg.de>
 <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <f0936088-a32d-3da7-a9ba-d552ede5052e@oth-regensburg.de>
Date: Tue, 11 Jun 2019 17:31:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Us+xYcJ2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

On 6/10/19 7:45 PM, Wayne wrote:
> Thank you for your responses Ralf and Jan.
>=20
> Yes, I have successfully gotten both the apic-demo and tiny-demo cells
> to work on my system before attempting to load the non-root linux.=C2=A0 =
I
> can see serial output from them.
>=20
> However, if I try to share the UART between root and inmate for them I
> run into a crash on the hypervisor if the root linux attempts to write
> to the UART (after creating/starting a demo).=C2=A0 Does the root linux l=
ose
> access once an inmate is created/started?=C2=A0 Or am I missing something
> from my System config or tiny-demo config that allows them to share?=C2=
=A0 I
> attached the crash in hypervisor_output.txt.
>=20
> Also, I noticed the tiny-demo output on the UART gets mirrored on the

Yes, according to your config, JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE is
set. This means that the guest will use the virtual console. The virtual
console uses the hypervisor output which depends whatever is set in your
system configuration. In your case the hypervisor uses 3f8.

And additionally, the inmate also a valid .console set. Again, 3f8. This
means, it will use the console *and* the hypervisor debug hypercall. In
your case, both outputs are routed to the same device which explains the
mirroring.

> Jailhouse virtual console.=C2=A0 Does that mean that its writing to the
> serial through the hypervisor and not directly accessing ttyS0 itself?=20

Exactly.

> If so, is there a way to create the cell to write ttyS0 directly as a
> test?=C2=A0 To see if it exhibits same behavior as the non-root linux.

Sure, simply align the .address field of .console, and allow access to
that port via .pio_bitmap.

>=20
> FYI, I create the tiny-demo like this:
>=20
> jailhouse cell create configs/x86/tiny-demo.cell
> jailhouse cell load tiny-demo inmates/demos/x86/tiny-demo.cell =C2=A0
> jailhouse cell start tiny-demo
>=20
> Going back to my original non-root linux question, I don't see any
> output when connected over ttyS0.=C2=A0 Its address is 0x3f8 ("serial 1")=
 in
> the PIO, and that seems to work fine for the other simple demos, minus
> the hypervisor crash issue above when sharing.=C2=A0 I know there is the
> other "serial 2" port but I haven't tried to use that one.

I see that port on our Dell server as well. It's present, but I don't
know where it's connected to.

Let me just summarise your issue:

You only have one serial line available, right? From the root-cell's
POV, it's ttyS0 on 3f8.

I would propose to share ttyS0 between the hypervisor and non-root
Linux. This means:

  - Don't let the root-cell use ttyS0. Remove any console=3DttyS0
    parameters from you commandline. Ensure that noone else accesses
    ttyS0 (e.g., getty@ttyS0 or other friends)

  - Set 3f8 as debug_console in your master.c (seems you already have)

  - Allow 3f8 access in the linux-demo.c (already set in the default
    linux-demo

  - Disallow 2f8 access in linux-demo.c:
-               [ 0x2f8/8 ...  0x2ff/8] =3D 0, /* serial2 */
+               [ 0x2f8/8 ...  0x2ff/8] =3D -1, /* serial2 */

    I don't know how Linux enumerates serial devices, but this ensures
    that Linux won't see the unconnected serial line and map ttyS0 to
    3f8

>=20
> non root linux launched with:
> /tools/jailhouse cell linux configs/x86/linux-x86.cell
> /boot/vmlinux-4.1.16-Guest -c "console=3DttyS0,115200"

Then, this should actually work...

And if not, then console=3Djailhouse0 should work.

>=20
> I can try the 4.19 siemens kernel and "next" branch for jailhouse you
> suggested.=C2=A0 Do you think that combination will resolve the missing
> serial for the non-root linux?=C2=A0 Otherwise, did my kernel config, sys=
tem
> config, and non-root linux cell configs look OK?

I didn't look at it, but we should at least - even if some flags are
still incorrect - see the "Uncompressing kernel..." thing.

Wait -- one thing you could try: Deactivate CONFIG_EFI and especially
CONFIG_EFI_STUBS. I'm not sure, but it could be that EFI_STUBS change
the header format that our bootloader patches.

>=20
> Thanks again for your help.

No problem. But it's not yet working. ;-)

  Ralf

>=20
>=20
> On Fri, Jun 7, 2019 at 5:30 PM Ralf Ramsauer
> <ralf.ramsauer@oth-regensburg.de
> <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
>=20
>     Hi Wayne,
>=20
>     On 6/7/19 10:04 PM, Wayne wrote:
>     > Hi Ralf,
>     >
>     > Thank you for your responses.=C2=A0 I have attached the requested c=
onfig
>     > files.=C2=A0 I am now just trying to use the same bzImage for the r=
oot and
>     > the non-root linux node.
>=20
>     One question that you didn't answer: do apic-demo or tiny-demo work?
>     They need to to have correct .console parameter set, so ensure that
>     parameters are set if you run those demos in your linux-demo cell. Ju=
st
>     compare it to tiny-demo.c or apic-demo.c
>=20
>     >
>     > Yes, I am using vanilla 4.16 because the documentation indicated
>     that it
>     > is the first mainline release to officially support Jailhouse Guest
>     > images.=C2=A0 Do you suggest that I use something else?
>=20
>     As Jan already wrote: Try to use Siemens' 4.19 branch.
>=20
>     >
>     > Right now i'm just trying to get some serial output from the non-ro=
ot
>     > Linux.=C2=A0 Hopefully, I have that configured correctly.=C2=A0 Ide=
ally, I would
>     > like to share the same serial console for the Root node and non-roo=
t
>     > node eventually if possible.=C2=A0 I have been OK with using the vi=
rtual
>     > console (jailhouse console -f) for the Hypervisor output.
>=20
>     In addition to Jan's comment:
>=20
>     Currently you only have access to the jailhouse console via 'jailhous=
e
>     console' from your root cell. Imagine your root cell crashes for some
>     reason. You will never see the fault reason, which makes things hard =
to
>     debug.
>=20
>     I would suggest to configure the hypervisor to use the serial console=
.
>     You can share the device with the non-root Linux, that's no problem.
>=20
>     In this case, the non-root kernel's output will always be printed to =
the
>     serial console. Directly, if you choose console=3DttySx, and indirect=
ly
>     via the hypervisor if you choose console=3Djailhouse.
>=20
>     BTW: According to your config, your system is a PowerEdge, and the
>     non-root cell gets both, 0x2f8 and 0x3f8. Are you sure that ttyS1 is =
the
>     correct console that you are connected to?
>=20
>     Just mentioning this as we have a similar machine here, and, afair, b=
oth
>     platform serial device are 'usable', but one ends in the nirvana whil=
e
>     it is accessible.
>=20
>     Ah, and one last thing: try to switch to the current next branch for
>     jailhouse. Jan just integrated a few patches from me that might also =
be
>     relevant for your machine.
>=20
>     HTH
>     =C2=A0 Ralf
>=20
>     >
>     > Wayne
>     >
>     > On Fri, Jun 7, 2019 at 9:10 AM Ralf Ramsauer
>     > <ralf.ramsauer@oth-regensburg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>
>     > <mailto:ralf.ramsauer@oth-regensburg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>>> wrote:
>     >
>     >=C2=A0 =C2=A0 =C2=A0Hi,
>     >
>     >=C2=A0 =C2=A0 =C2=A0On 6/7/19 2:28 PM, Wayne wrote:
>     >=C2=A0 =C2=A0 =C2=A0> Hello,
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> I am new to Linux development and Jailhouse.=
=C2=A0 I have
>     successfully
>     >=C2=A0 =C2=A0 =C2=A0booted
>     >=C2=A0 =C2=A0 =C2=A0> the Jailhouse Hypervisor and root cell on a ba=
re metal X86 Linux
>     >=C2=A0 =C2=A0 =C2=A0system
>     >=C2=A0 =C2=A0 =C2=A0> (No QEMU).=C2=A0 I am now trying to load a non=
-root Linux cell
>     and I have a
>     >=C2=A0 =C2=A0 =C2=A0> few questions.=C2=A0 Jailhouse accepts and sta=
rts my non-root
>     linux cell
>     >=C2=A0 =C2=A0 =C2=A0> configuration and I see it as "running" throug=
h the
>     "jailhouse cell
>     >=C2=A0 =C2=A0 =C2=A0> list" command.=C2=A0 However, I don't see any =
serial output from the
>     >=C2=A0 =C2=A0 =C2=A0> "non-root linux" cell booting up.=C2=A0 I=E2=
=80=99m not sure what the
>     non-root node
>     >=C2=A0 =C2=A0 =C2=A0> is doing at this point.
>     >
>     >=C2=A0 =C2=A0 =C2=A0Ok, first of all, can you see any output from Ja=
ilhouse's demo
>     inmates
>     >=C2=A0 =C2=A0 =C2=A0(e.g., tiny-demo or apic-demo)?
>     >
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0My root node is a 4.16 kernel configured this
>     way:
>     >=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1. CONFIG_JAILH=
OUSE_GUEST is
>     not set
>     >=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2. CONFIG_SERIO=
=3Dy
>     >=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3.
>     CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0My non-root node is a 4.16 kernel configured
>     this way:
>     >=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1. CONFIG_JAILH=
OUSE_GUEST=3Dy
>     >=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2. CONFIG_SERIO=
=3Dm (can't seem
>     to disable
>     >=C2=A0 =C2=A0 =C2=A0> completely in my config for 4.16)
>     >=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3.
>     CONFIG_SERIAL_8250_RUNTIME_UARTS=3D1
>     >
>     >=C2=A0 =C2=A0 =C2=A0Could you please provide a full .config? What br=
anch are you
>     exactly
>     >=C2=A0 =C2=A0 =C2=A0using? Vanilla 4.16?
>     >
>     >=C2=A0 =C2=A0 =C2=A0Please attach your system config and your non-ro=
ot linux
>     config as well.
>     >
>     >=C2=A0 =C2=A0 =C2=A0You may also want to try https://github.com/siem=
ens/linux . See
>     >=C2=A0 =C2=A0 =C2=A0jailhouse-enabling branches for some releases.
>     >
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> In general, do the kernel config settings have=
 to match between
>     >=C2=A0 =C2=A0 =C2=A0the root
>     >=C2=A0 =C2=A0 =C2=A0> node and non-linux or is the above fine?
>     >
>     >=C2=A0 =C2=A0 =C2=A0No, they do not have to be the same, but they ca=
n. Still, an
>     analysis
>     >=C2=A0 =C2=A0 =C2=A0requires your .config.
>     >
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> The vmlinux-4.1.16-Guest bzImage is approx 7MB=
, and the
>     inmate node is
>     >=C2=A0 =C2=A0 =C2=A0> allocated ~75MB of RAM.
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> I have a single UART, so I have configured the=
 root cell
>     system config
>     >=C2=A0 =C2=A0 =C2=A0> to output to the virtual hypervisor console:
>     >
>     >=C2=A0 =C2=A0 =C2=A0Wait... You configured your root-cell to use the=
 hypervisor debug
>     >=C2=A0 =C2=A0 =C2=A0console? How? It's only available once the hyper=
visor is
>     enabled. How
>     >=C2=A0 =C2=A0 =C2=A0should this work?
>     >
>     >=C2=A0 =C2=A0 =C2=A0But let's have a look at your configuration firs=
t.
>     >
>     >=C2=A0 =C2=A0 =C2=A0So you want to:
>     >=C2=A0 =C2=A0 =C2=A0=C2=A0 - Have the UART (0x3f8) available in the =
non-root cell
>     >=C2=A0 =C2=A0 =C2=A0=C2=A0 - Use 0x3f8 as hypervisor debug console a=
s well
>     >=C2=A0 =C2=A0 =C2=A0=C2=A0 - No console for root-cell
>     >
>     >=C2=A0 =C2=A0 =C2=A0Did I get this right?
>     >
>     >=C2=A0 =C2=A0 =C2=A0=C2=A0 Ralf
>     >
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE=
,
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> .debug_console =3D {
>     >=C2=A0 =C2=A0 =C2=A0> .type =3D JAILHOUSE_CON_TYPE_NONE,
>     >=C2=A0 =C2=A0 =C2=A0> },
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> and I have configured the non-root linux cell =
to output to
>     the UART:
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> (Added serial 0x3f8 to pio bitmap for non-root=
 linux) and
>     started the
>     >=C2=A0 =C2=A0 =C2=A0> node with this:
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> ./tools/jailhouse cell linux configs/x86/linux=
-x86.cell
>     >=C2=A0 =C2=A0 =C2=A0> /boot/vmlinux-4.1.16-Guest -c "console=3DttyS0=
,115200"
>     >=C2=A0 =C2=A0 =C2=A0> (Note I also tried "console=3Djailhouse" in th=
e command above,
>     and that
>     >=C2=A0 =C2=A0 =C2=A0> produces the same result)
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> I then see the following on my hypervisor cons=
ole
>     (./tools/jailhouse
>     >=C2=A0 =C2=A0 =C2=A0> console -f):
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> Created cell "linux-x86-demo"
>     >=C2=A0 =C2=A0 =C2=A0> ...
>     >=C2=A0 =C2=A0 =C2=A0> Cell "linux-x86-demo" can be loaded
>     >=C2=A0 =C2=A0 =C2=A0> Started cell "linux-x86-demo"
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> After a little while I do get a parked CPU err=
or on the root
>     node,
>     >=C2=A0 =C2=A0 =C2=A0looks
>     >=C2=A0 =C2=A0 =C2=A0> like its trying to do something with the UART =
as well:
>     >=C2=A0 =C2=A0 =C2=A0> FATAL: Invalid PIO read, port: 3fe size: 1
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> I would expect something to pop out on the UAR=
T from the
>     non-root
>     >=C2=A0 =C2=A0 =C2=A0linux
>     >=C2=A0 =C2=A0 =C2=A0> node first.=C2=A0 Note that root node has seri=
al 0x3f8 disabled
>     in its pio
>     >=C2=A0 =C2=A0 =C2=A0> bitmap.
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> I verifed that the UART is functioning by allo=
wing the
>     hypervisor to
>     >=C2=A0 =C2=A0 =C2=A0> print to it and also performed an echo test ov=
er ttyS0.
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> I have tried several configurations of kernel.=
....including your
>     >=C2=A0 =C2=A0 =C2=A0current
>     >=C2=A0 =C2=A0 =C2=A0> "queues/jailhouse" branch head kernel for the =
non-root node,
>     along
>     >=C2=A0 =C2=A0 =C2=A0with
>     >=C2=A0 =C2=A0 =C2=A0> the kernel config for 4.7 posted in this threa=
d below (but I
>     get same
>     >=C2=A0 =C2=A0 =C2=A0> result as above when I start it, no kernel out=
put):
>     >=C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0
>     =C2=A0=C2=A0"https://groups.google.com/forum/#!searchin/jailhouse-dev=
/Re$3A$20Failed$20to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO=
89XFIk0/Qi40DDuMBAAJ".
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> Any information you can provide to me will be =
helpful.=C2=A0 I'm
>     not sure
>     >=C2=A0 =C2=A0 =C2=A0> what might be going wrong here.
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> Thanks,
>     >=C2=A0 =C2=A0 =C2=A0> Wayne
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> --
>     >=C2=A0 =C2=A0 =C2=A0> You received this message because you are subs=
cribed to the
>     Google
>     >=C2=A0 =C2=A0 =C2=A0> Groups "Jailhouse" group.
>     >=C2=A0 =C2=A0 =C2=A0> To unsubscribe from this group and stop receiv=
ing emails
>     from it, send
>     >=C2=A0 =C2=A0 =C2=A0> an email to jailhouse-dev+unsubscribe@googlegr=
oups.com
>     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
>     >=C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%2Bunsubscribe@googlegroups=
.com
>     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
>     >=C2=A0 =C2=A0 =C2=A0> <mailto:jailhouse-dev+unsubscribe@googlegroups=
.com
>     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
>     >=C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%2Bunsubscribe@googlegroups=
.com
>     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>>.
>     >=C2=A0 =C2=A0 =C2=A0> To view this discussion on the web visit
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0
>     =C2=A0https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk=
1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0
>     =C2=A0<https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iK=
k1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com?utm_medium=
=3Demail&utm_source=3Dfooter>.
>     >=C2=A0 =C2=A0 =C2=A0> For more options, visit https://groups.google.=
com/d/optout.
>     >
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f0936088-a32d-3da7-a9ba-d552ede5052e%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.

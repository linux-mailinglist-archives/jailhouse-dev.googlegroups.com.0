Return-Path: <jailhouse-dev+bncBCL6VUP7RYARB3MC2LTAKGQE5ICMM6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C95192FC
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 21:37:18 +0200 (CEST)
Received: by mail-oi1-x239.google.com with SMTP id s184sf1395399oig.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 12:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oDFrHIBpru8FEOtPcfKX/DY7SG8yTG8OaDPEgdE9pFI=;
        b=lclCcY9YxSYj8Bm2DRg+I2+bdZluGzGpD0DOR1iQGsLDcvHNgVnq/Fw06krhZkanuK
         NxSmI+uCZqaYzbZn9tmTrYsahhgQESSCEHnP+2zViqZoOpCAvGWM4Sor+bOQK2BdvjX1
         YhKKSU6Y4Oyv+gQqODEMEYh99Tbs0o0/UBO1cVY1IhJMm6PsimJsCoJLPXMpl7AWPVdN
         isEIn1u5RwgEsKeyIR1/cDNTNTiKDh5QVjYxXFUWiPKxvCsY6JG0xezP2sLK8YiPpqq4
         PvGf0lGWICcBVDhmj9XDOURLIGcZ+0zC+JazUkojd8U3bhAgchN6HbbHmy3oU6fDn1AX
         YFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oDFrHIBpru8FEOtPcfKX/DY7SG8yTG8OaDPEgdE9pFI=;
        b=pOdCukUn3a2uYKdw9ynf/VOluF07kmya/sLJZ+BPRsLcXw0xP9t+SLbMSOgWaYt9xs
         6mfaGLbBsbc/OJbgxEsp1GkGaOiMJaf8iC/9qPCdAsd/ELeD7Vv+K31vpkL4JJu6rLiH
         aW5BZ8ob1r7CwEJsezhPPGuBIY50aSch34mj1EUl+xuCrAJp5HIV8TcETC3lfgQ5Ka9q
         +1OKjbGqjFIwFuqQdot3LVqbrSzh545YbXdANVKzMwHuVfkEqeFovnYDRAnumjpsdNEe
         Fc1JK6Hg4cqLCF7hCg6//mMuVIdzYVi8Zy6yaLnXrPCN0M6eD/aT7rLjfkLGxkE8z4m4
         9y1Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXCtNFDxx/cjpnt7kMjALR6FA7UWnYYw+wW9tOKL0X/lXfism+r
	5RZ9vxeSYSc6g4bwJJ/l8fY=
X-Google-Smtp-Source: APXvYqybM+xRDvZdoJ5A8j6ZUgnrW4aMsEjt4IDPx0pEq51XdwFyan/8iAWwQtV5FPN2QgrYq33/Xw==
X-Received: by 2002:a9d:2f08:: with SMTP id h8mr3838749otb.42.1557430637710;
        Thu, 09 May 2019 12:37:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:2205:: with SMTP id o5ls686443ota.14.gmail; Thu, 09 May
 2019 12:37:17 -0700 (PDT)
X-Received: by 2002:a9d:6008:: with SMTP id h8mr180679otj.55.1557430636799;
        Thu, 09 May 2019 12:37:16 -0700 (PDT)
Date: Thu, 9 May 2019 12:37:16 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b68c813d-2949-4516-bfa3-2fb4828cee9e@googlegroups.com>
In-Reply-To: <02568569-7d1b-4bb5-8a1e-a5cbee5a77ee@googlegroups.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
 <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
 <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com>
 <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com>
 <71f64f49-1bcd-4ab0-947a-0bcabc2ac1e6@googlegroups.com>
 <02568569-7d1b-4bb5-8a1e-a5cbee5a77ee@googlegroups.com>
Subject: Re: Unsupported DMAR Device Scope Structure
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_427_2034733788.1557430636166"
X-Original-Sender: hkurumahmut84@hotmail.com
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

------=_Part_427_2034733788.1557430636166
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

9 May=C4=B1s 2019 Per=C5=9Fembe 12:14:15 UTC+3 tarihinde jeanne....@gmail.c=
om yazd=C4=B1:
> > Hello everyone,=20
> >=20
> > Thanks for the help now I pass the hradware check ! Unfortunately the e=
nabling of the rootCell is not working yet. With Halli's configuration ever=
ything is juste freezing without giving any error. When I use my generated =
file (that is similar to Hakki's one) I got this error :
> >=20
> >=20
> > [] Irq 16 : nobody cared (try booting with the "irqpoll" option)=20
> > [] Handlers :
> > [] [<ffffffff81622fa0>] usb_hcd_irq
> > [] [<ffffffffc025c360>] ilo_isr [hpilo]
> > [] Disabling IRQ # 16
> > [] NMI watchdog: BUG: soft lockup - CPU#7 stuck for 22s! [kworkers/...]
> > [] NMI watchdog: BUG: soft lockup - CPU#6 stuck for 22s! [kworkers/...]
> > [] NMI watchdog: BUG: soft lockup - CPU#8 stuck for 22s! [kworkers/...]
> > [] NMI watchdog: BUG: soft lockup - CPU#9 stuck for 22s! [kworkers/...]
> > [] NMI watchdog: BUG: soft lockup - CPU#11 stuck for 22s! [kworkers/...=
]
> > [] NMI watchdog: BUG: soft lockup - CPU#12 stuck for 22s! [kworkers/...=
]
> > [] NMI watchdog: BUG: soft lockup - CPU#13 stuck for 22s! [kworkers/...=
]
> > [] NMI watchdog: BUG: soft lockup - CPU#14 stuck for 22s! [kworkers/...=
]
> > [] NMI watchdog: BUG: soft lockup - CPU#15 stuck for 22s! [kworkers/...=
]
> > [] NMI watchdog: BUG: soft lockup - CPU#17 stuck for 22s! [kworkers/...=
]
> >=20
> > etc...
> >=20
> > I don't know why there is this error. Do you have an idea ?=20
> >=20
> >=20
> >=20
> > @Hakki you can find in attachment the lspci command lines you requested
> >=20
> > again : thanks for your help
>=20
> Hello again,=20
>=20
> Actually my error is a kernel panic that is shutting down all the CPUs wi=
th NMI
>=20
> best regards,



Hi Jeanne,

Your new problem is similar to the subject that below link.

https://groups.google.com/forum/#!topic/jailhouse-dev/xgpOci2wCDs


In such cases, Jailhouse hypervisor console information is more important t=
o see root cause of the problem. If you do not get the console information,=
 you cannot get much help.

Open Hypervisor console on new terminal may be ssh connection more suitable=
 against Linux hang situations.
=20
--sudo jailhouse console -f

If you have uart port, it is pretty. In FAQ.md file,

on real hardware, you'll need a serial cable. Connect it to the COM port on=
 your motherboard. Many modern motherboards come with no COM ports, but the=
y usually have a header you can attach the socket to. Servers often have se=
rial console available through IPMI.

In hypervisor-configuration.md file,=20

#define CONFIG_CRASH_CELL_ON_PANIC 1

it is suitable for hang status. please add it to "cell-config.h". And rebui=
ld and reinstall jailhouse.


For a quick test I would recommend the following.
=20
Sometimes, it helps to set pio_bitmap to all zeros in sysconfig.c to solve =
if there are any issues, but It is not recommended in production. =20

Original fix pio_bitmap table :
=20
	.pio_bitmap =3D {
		[     0/8 ...   0x3f/8] =3D -1,
		[  0x40/8 ...   0x47/8] =3D 0xf0, /* PIT */
		[  0x48/8 ...   0x5f/8] =3D -1,
		[  0x60/8 ...   0x67/8] =3D 0xec, /* HACK: NMI status/control */
		[  0x68/8 ...   0x6f/8] =3D -1,
		[  0x70/8 ...   0x77/8] =3D 0xfc, /* RTC */
		[  0x78/8 ...  0x3af/8] =3D -1,
		[ 0x3b0/8 ...  0x3df/8] =3D 0x00, /* VGA */
		[ 0x3e0/8 ...  0xcff/8] =3D -1,
		[ 0xd00/8 ... 0xffff/8] =3D 0, /* HACK: PCI bus */
	},

Set all value to zero (cell accessible)


	.pio_bitmap =3D {
		[     0/8 ...   0x3f/8] =3D 0,
		[  0x40/8 ...   0x47/8] =3D 0, /* PIT */
		[  0x48/8 ...   0x5f/8] =3D 0,
		[  0x60/8 ...   0x67/8] =3D 0, /* HACK: NMI status/control */
		[  0x68/8 ...   0x6f/8] =3D 0,
		[  0x70/8 ...   0x77/8] =3D 0, /* RTC */
		[  0x78/8 ...  0x3af/8] =3D 0,
		[ 0x3b0/8 ...  0x3df/8] =3D 0, /* VGA */
		[ 0x3e0/8 ...  0xcff/8] =3D 0,
		[ 0xd00/8 ... 0xffff/8] =3D 0, /* HACK: PCI bus */
	},

Search in forum "pio_bitmap", you can see more advices...

Good luck.

HAKKI

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b68c813d-2949-4516-bfa3-2fb4828cee9e%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_427_2034733788.1557430636166--

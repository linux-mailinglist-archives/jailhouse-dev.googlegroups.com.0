Return-Path: <jailhouse-dev+bncBDCN3RNB2MDRBBWS2TTAKGQEIT36FRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 5670119906
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 May 2019 09:32:24 +0200 (CEST)
Received: by mail-oi1-x239.google.com with SMTP id s184sf1951142oig.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 May 2019 00:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KEDh4zXf9N7dCL59wFoeXRXepHh2Zh1ToeOH0PKKduE=;
        b=g9Dfzhw2ByT+Y4mCVfPbcMwDov3x6Oloqnfk2u+GJTwzB6XmAmhNcg++CuNZWglLVn
         S92SgE/1BJ6LF2Kir8WqD4rYFREiVRhsR7kBSg7Tz+OxBtWM04m2AE8prcKwM1AS9kYb
         uJ1lVm/iXLx6tGmIr+Iu06hupe/rGnFl9OTtTZCnPtF/DColEIiEbKETbDVfZqyz3PWZ
         C7XHo7wGVnYlmXLm1mvvxFeOpu71OiRBIiECKLVN/1AB6AhZE/BdQ7BJUCM++yKUkOB+
         oJjI8wsgnzwYIvF/h5/qABdNE1MLdu9cbSa6v3ttVme1FTZdhTHA8fwwu5hqEUMXgTEg
         lZ6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KEDh4zXf9N7dCL59wFoeXRXepHh2Zh1ToeOH0PKKduE=;
        b=CZbwHANu7hHdVMAF0ADnUrS0LIqY/hjN3IRC9ypTTIk+i9cmk2n7S26GLe790vvHjy
         0J++PHIpQ1+6oszDPg3FR+SbLgwOnfumHXjh/CQUrkDLUnsS401M+5XcWgohuOklFfri
         YtqRiSpHGBKRrug/auhr2W0ChElRIno2u+v9ly/ET0CL3YV+7tt7isWq2BceiRpPdsjC
         Ojjb8zNDYSYhgyXtMvH/rkv6pclF+qkZPwDKN58j+UgXrV+En9sq+xdCFb4ndrehEN8I
         PxweT39JBpR8BTZbnzd6Z+AjHIgga1+gKfANVQyHkMY87+68ffc/l492swrVJcVIHnvf
         sL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KEDh4zXf9N7dCL59wFoeXRXepHh2Zh1ToeOH0PKKduE=;
        b=d0XxUgzSoi2FNpMxJfvKarFuZvAPWuTgQnnWcFbvhzshvaO450qbxSLH16ZvinICqL
         16IWm7el/dJLBD6h82vSmyx7r3RAgRbDkMKs8dL7P+jUrpQxW8d5S8nITncgD9myHmim
         vnD1nZOxjNN8hfRwvE6ZrtFYGGlG64d0V5LVhyP166Dffo3W7HkaX1WLh6llZeZx/4kF
         ixhSh6H9/2yAC6EjQjB634Omtv0Mb/xXuz/irxur3FNsYLQJPGCfOlnd4nzkThcZuYXA
         s9wQjNXdKPc34gFKWcN3gcntvHdtYsPs278A81ap5UvzEA4tVt2XQKBIBVLZHqnLCkmu
         IYoQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUOKhKOjRuaJ14+LnR60yJUSJbtWOhRLVQrQXZu7hm71M7VpYjg
	5py4R0WzVEQAgV6K3ql2Vdw=
X-Google-Smtp-Source: APXvYqxRJ0aG0+yVLd0k1ESQ9KMR1Zb2s2Vz0Uk/aGE0RFUAH2+UmJTStxOHtHrmrRUQeSkOtmo5ow==
X-Received: by 2002:a9d:760b:: with SMTP id k11mr5622970otl.135.1557473542826;
        Fri, 10 May 2019 00:32:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:748b:: with SMTP id t11ls994182otk.7.gmail; Fri, 10 May
 2019 00:32:22 -0700 (PDT)
X-Received: by 2002:a9d:6848:: with SMTP id c8mr5657988oto.200.1557473541968;
        Fri, 10 May 2019 00:32:21 -0700 (PDT)
Date: Fri, 10 May 2019 00:32:21 -0700 (PDT)
From: jeanne.romefort@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <63282997-5d5a-4c59-9d60-1d73fcfe49db@googlegroups.com>
In-Reply-To: <b68c813d-2949-4516-bfa3-2fb4828cee9e@googlegroups.com>
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
 <b68c813d-2949-4516-bfa3-2fb4828cee9e@googlegroups.com>
Subject: Re: Unsupported DMAR Device Scope Structure
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_769_1652962931.1557473541332"
X-Original-Sender: jeanne.romefort@gmail.com
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

------=_Part_769_1652962931.1557473541332
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 9 mai 2019 21:37:16 UTC+2, Hakk=C4=B1 Kurumahmut a =C3=A9crit=C2=
=A0:
> 9 May=C4=B1s 2019 Per=C5=9Fembe 12:14:15 UTC+3 tarihinde jeanne....@gmail=
.com yazd=C4=B1:
> > > Hello everyone,=20
> > >=20
> > > Thanks for the help now I pass the hradware check ! Unfortunately the=
 enabling of the rootCell is not working yet. With Halli's configuration ev=
erything is juste freezing without giving any error. When I use my generate=
d file (that is similar to Hakki's one) I got this error :
> > >=20
> > >=20
> > > [] Irq 16 : nobody cared (try booting with the "irqpoll" option)=20
> > > [] Handlers :
> > > [] [<ffffffff81622fa0>] usb_hcd_irq
> > > [] [<ffffffffc025c360>] ilo_isr [hpilo]
> > > [] Disabling IRQ # 16
> > > [] NMI watchdog: BUG: soft lockup - CPU#7 stuck for 22s! [kworkers/..=
.]
> > > [] NMI watchdog: BUG: soft lockup - CPU#6 stuck for 22s! [kworkers/..=
.]
> > > [] NMI watchdog: BUG: soft lockup - CPU#8 stuck for 22s! [kworkers/..=
.]
> > > [] NMI watchdog: BUG: soft lockup - CPU#9 stuck for 22s! [kworkers/..=
.]
> > > [] NMI watchdog: BUG: soft lockup - CPU#11 stuck for 22s! [kworkers/.=
..]
> > > [] NMI watchdog: BUG: soft lockup - CPU#12 stuck for 22s! [kworkers/.=
..]
> > > [] NMI watchdog: BUG: soft lockup - CPU#13 stuck for 22s! [kworkers/.=
..]
> > > [] NMI watchdog: BUG: soft lockup - CPU#14 stuck for 22s! [kworkers/.=
..]
> > > [] NMI watchdog: BUG: soft lockup - CPU#15 stuck for 22s! [kworkers/.=
..]
> > > [] NMI watchdog: BUG: soft lockup - CPU#17 stuck for 22s! [kworkers/.=
..]
> > >=20
> > > etc...
> > >=20
> > > I don't know why there is this error. Do you have an idea ?=20
> > >=20
> > >=20
> > >=20
> > > @Hakki you can find in attachment the lspci command lines you request=
ed
> > >=20
> > > again : thanks for your help
> >=20
> > Hello again,=20
> >=20
> > Actually my error is a kernel panic that is shutting down all the CPUs =
with NMI
> >=20
> > best regards,
>=20
>=20
>=20
> Hi Jeanne,
>=20
> Your new problem is similar to the subject that below link.
>=20
> https://groups.google.com/forum/#!topic/jailhouse-dev/xgpOci2wCDs
>=20
>=20
> In such cases, Jailhouse hypervisor console information is more important=
 to see root cause of the problem. If you do not get the console informatio=
n, you cannot get much help.
>=20
> Open Hypervisor console on new terminal may be ssh connection more suitab=
le against Linux hang situations.
> =20
> --sudo jailhouse console -f
>=20
> If you have uart port, it is pretty. In FAQ.md file,
>=20
> on real hardware, you'll need a serial cable. Connect it to the COM port =
on your motherboard. Many modern motherboards come with no COM ports, but t=
hey usually have a header you can attach the socket to. Servers often have =
serial console available through IPMI.
>=20
> In hypervisor-configuration.md file,=20
>=20
> #define CONFIG_CRASH_CELL_ON_PANIC 1
>=20
> it is suitable for hang status. please add it to "cell-config.h". And reb=
uild and reinstall jailhouse.
>=20
>=20
> For a quick test I would recommend the following.
> =20
> Sometimes, it helps to set pio_bitmap to all zeros in sysconfig.c to solv=
e if there are any issues, but It is not recommended in production. =20
>=20
> Original fix pio_bitmap table :
> =20
> 	.pio_bitmap =3D {
> 		[     0/8 ...   0x3f/8] =3D -1,
> 		[  0x40/8 ...   0x47/8] =3D 0xf0, /* PIT */
> 		[  0x48/8 ...   0x5f/8] =3D -1,
> 		[  0x60/8 ...   0x67/8] =3D 0xec, /* HACK: NMI status/control */
> 		[  0x68/8 ...   0x6f/8] =3D -1,
> 		[  0x70/8 ...   0x77/8] =3D 0xfc, /* RTC */
> 		[  0x78/8 ...  0x3af/8] =3D -1,
> 		[ 0x3b0/8 ...  0x3df/8] =3D 0x00, /* VGA */
> 		[ 0x3e0/8 ...  0xcff/8] =3D -1,
> 		[ 0xd00/8 ... 0xffff/8] =3D 0, /* HACK: PCI bus */
> 	},
>=20
> Set all value to zero (cell accessible)
>=20
>=20
> 	.pio_bitmap =3D {
> 		[     0/8 ...   0x3f/8] =3D 0,
> 		[  0x40/8 ...   0x47/8] =3D 0, /* PIT */
> 		[  0x48/8 ...   0x5f/8] =3D 0,
> 		[  0x60/8 ...   0x67/8] =3D 0, /* HACK: NMI status/control */
> 		[  0x68/8 ...   0x6f/8] =3D 0,
> 		[  0x70/8 ...   0x77/8] =3D 0, /* RTC */
> 		[  0x78/8 ...  0x3af/8] =3D 0,
> 		[ 0x3b0/8 ...  0x3df/8] =3D 0, /* VGA */
> 		[ 0x3e0/8 ...  0xcff/8] =3D 0,
> 		[ 0xd00/8 ... 0xffff/8] =3D 0, /* HACK: PCI bus */
> 	},
>=20
> Search in forum "pio_bitmap", you can see more advices...
>=20
> Good luck.
>=20
> HAKKI

Hello everyone,=20

Thanks a lot for your help !

I am currently connected to my card via a VGA port. I thought that changing=
 the console type to EFIFB would bring me slog jailhouse on my screen but o=
bviously I was wrong... Is there a way to display them on a VGA port or is =
it totally over?

I changed the card because I didn't have two serial ports. However, my goal=
 is to run several linuxes in parallel on my card and, if I don't have acce=
ss to their console, their use is limited... That's why I switched to a car=
d with a VGA port (which I thought I could dedicate to rott-cell) and a ser=
ial port (which I thought I could dedicate to inmate). What would you recom=
mend for such a configuration?

Best regards,

Jeanne

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/63282997-5d5a-4c59-9d60-1d73fcfe49db%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_769_1652962931.1557473541332--

Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBLPHQTUAKGQESRJVEHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id C571B42D49
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 19:17:33 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id v7sf7639513wrt.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 10:17:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560359853; cv=pass;
        d=google.com; s=arc-20160816;
        b=ngr2XZfTB253MWfMgB/afbqcJRhKdojonMWg03K+3cD/yj+NIbx4vd90+dxrJo/y3n
         HXk1FYjPzEMIre9jHb5Tck4seU6cUuryF9weydZBjMShG6jlIynk0HUu57lkqhVSMUMd
         YFbIGFeDUaLGGE0ffr+r7HGjk68aoUFkB17itmoOAhHL1Cm3p0wb/huVIR6SnmbRjSRa
         q71kOaof/dCMH30V7NEniHmQK95zaM2m0OQc363G8hbpe63RdbSl4t2W0iJHolu/4HI4
         rMFoWH9Tck4ZN6CeV6vOzDTynSorILpFLbXHZi13w3Y244723l+L5eEvIHrt0cxHaFmG
         d7JA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=7762YeOihCOwbBn4TUA1/WKtt8lW8v6p0ppvksbLD+U=;
        b=jrz0A3SMoO2Sb31Aw8KbhDrvi/BheMTjctAPi20TbUD60n4/mBJjzEZx2VQL7Ly/8T
         aklxVCLmPi3yAX56KAdGNL/yAwi4W76x39p1cPC0/7k/gmlvhcz7HOIu52U++U9u6LC/
         3fYRqH3JsdjGIeciCtzD98+uiRrFtZnPGmnpjcMoynyR9Id1sqCKba4LCKa/TNPLkCsc
         iI8/DWGwFnSMzhobJ3WOeyWqYAJyNqcpMna0fFVxSB1EzsvaB0rafpirjxnw3WUQNbco
         UxHCLR7M3hsCh5S8ePqj3fHbTvG8aN0nsAskgtax6RQiNTVATJgWTXuxbId0iIMPlRkM
         g6oQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=CmXz1Lxe;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7762YeOihCOwbBn4TUA1/WKtt8lW8v6p0ppvksbLD+U=;
        b=bDnsb6uWYDtzKUTHG/sPqTZC6QHPA7CvVh2tfgWTvTfcCszhVCbcvGRx6GoXCuqH89
         8ggWXFhv2/OZTUz0Xxg0ZGoFMD7fLGC1qOnKXp3aP5GJMT2oPLADvPoDpEDCk56E3QaC
         lADpVIcbLc116N2N4NIwpcFVyyiQN8nbMXpPHUE4H1IPRHNX7juB4DTZ8qzogGfwF5Fc
         6hLTWpF5vywm7aa5jR4vKcNesRUA1y8vNxUi5+fovIkso6gxyh5/AGJT/vsXdODIpDpt
         NMZ27GzyTvZH8XhK/4rWkTbyC6lQCguS1M/EcWW63PIATAZuSmOvKdWqDHn+8zuey499
         RAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7762YeOihCOwbBn4TUA1/WKtt8lW8v6p0ppvksbLD+U=;
        b=PZGF12aEOpMnsRndWv84bV1ebunmQc9gCLnq1samnDvNeqK+Q/Y4zxe3m+NRHgDgf/
         pAjHxYY/CKcga3/p64zqpiG9MuN0LGnbKFk1TUAfGKzENWykf/YWFp4u++xc8lO4WnRZ
         mXW/hBZJCKs4FVslyQhuSHhx3am6ps5DwtUfSjHwrTaDwY1REmabo8ZhjE8qcX6usFnP
         yiarnGfx2/MF8NsyoqcaVdI1X0otgCDKsNfVnVNaiXjZd2Ve1FM1fkzh0HyxIJjcIfSo
         OV4WFf9rI9K1wiSkjjP1W1aybVHfB40c2GMXIjA00AaArXIgar9C9Vo7HLPKMU7VqCRF
         zMhw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUeE1xX8NEhJjbGHgQvjHddnO61nFMCjlgI0DWVXXYHq+FCIcbq
	T6VeUcz1n87qWeMqYrWF+z0=
X-Google-Smtp-Source: APXvYqxlJ6QmhVewOAz902NKlbYvZ+3iNUIQzGpTdOVOh/sRS2fYbfkghS0iYGc0zTh6frrGdouxCw==
X-Received: by 2002:a05:600c:20ca:: with SMTP id y10mr203785wmm.72.1560359853393;
        Wed, 12 Jun 2019 10:17:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ef4e:: with SMTP id c14ls705099wrp.5.gmail; Wed, 12 Jun
 2019 10:17:32 -0700 (PDT)
X-Received: by 2002:adf:e8c8:: with SMTP id k8mr27484059wrn.285.1560359852783;
        Wed, 12 Jun 2019 10:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560359852; cv=none;
        d=google.com; s=arc-20160816;
        b=G6I7jXZ9CQp9ExbZFdxuRtYYzi4F0RWpzkxMXAL4xBVCtj/ytuQ+WgKBf8qHP70Jvb
         gKKvUBZhwpojYDZKJ//+/MxvfwBEp3LjDyKQm0dUEj6U4rsZT4Ii5GnXzZNhGj+PUgvC
         R4scJuLlhKRJ64aXiG5zySY65oCQo6UlQoGa7yaKmhQSLcpZu1rJOqF3V2ZgwvucoJwD
         3OE7cisVxm4UT68NlbF4XunppWzth+GihfvDlAtv//CZDjXh+GRj6muFvi/j+vBTVNTu
         CUhDiY3O2V+JA7WmdoMDNqhp2lomADzUy1Es7WaS3GCFCgOmFu3yPmJZBLUfDMEjyqmd
         cKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:dkim-signature;
        bh=wzxRMnh4+dEI5x90kBlrx1eoJ0rwA7rj5zial7CQo9k=;
        b=hG1YDx7olQd0mn1QIr6tVi76URqOGIaGoUOHcHmqvjN0Hj5iJ7CzBSUbxhkQGt3drB
         RBO6aorHqum6qY7mTBQvihEZ0HO9QicsATVtaHi1OlTlZT1CPWeV12hmz8bztvUZ7aMb
         QNdfFkSvflMIkAEutiBLr5OYUQ3ZlM1FyUMluJDcZaXCEJKpMAn1pSN8L0cPAUZ5MH0E
         cUeoFbHzeRUk1xo3ic4Fo82rL64Xo2IAeZZPBI/xQFk1B8Fdh6KVUREtvbHDP6n/QJVe
         Zcg1wz5BcijbA6ieU6b6NCH2JP987x/GrTchuVeldDffkqk6pBpnVT/EJNfp8SjkKGlz
         bkcA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=CmXz1Lxe;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id x3si131380wmh.4.2019.06.12.10.17.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 10:17:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45PD8D2NL7zyHm;
	Wed, 12 Jun 2019 19:17:32 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 12 Jun
 2019 19:17:31 +0200
Subject: Re: Linux non-root node question
To: Wayne <racedrive1503@gmail.com>
CC: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de>
 <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
 <166c6ad9-379c-bad6-f30f-8af4f97b8bb1@oth-regensburg.de>
 <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
 <f0936088-a32d-3da7-a9ba-d552ede5052e@oth-regensburg.de>
 <CA++Khc0FZSWvVZZyV+4_F0TO7dHPN70Mn3LUCmq_3M2fnGN4ig@mail.gmail.com>
 <CA++Khc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg+x_j6nk=ECa_A@mail.gmail.com>
 <ad13aaa6-41ac-14fd-33fe-fa4f6dfc789e@oth-regensburg.de>
 <CA++Khc36sP7ABEsR5Bp+gpts0DUBENqV6eFDPazfs5kR_QRGaw@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <42ce8fed-792a-ac86-7611-ee9b13dd7815@oth-regensburg.de>
Date: Wed, 12 Jun 2019 19:17:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA++Khc36sP7ABEsR5Bp+gpts0DUBENqV6eFDPazfs5kR_QRGaw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=CmXz1Lxe;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Wayne,

On 6/12/19 3:55 PM, Wayne wrote:
> Ralf/Jan,
>=20
> =C2=A0Are you sure you remove the device from the kernel cmdline? *Yes, t=
here
> is no ttyS* device in my root linux cmdline*
> - Are you sure that there doesn't spawn a tty? Check with systemctl. *No
> tty as far as I can tell, verified with "lsof | grep ttyS".=C2=A0 The lso=
f
> command stops working after the crash though*

please use plain text mails. It's getting hard to read :-)

> - lsof | grep ttyS
> - The root-cell might receive the serial device's interrupt, while its
> =C2=A0 ports are assigned to the non-root cell. Does the crash happen whe=
n
> =C2=A0 you type in a character to the serial line? *This is possible, do =
you
> have an example of how I would accomplish assigning the interrupt (IRQ 4
> for ttyS0) to the non-root?=C2=A0 To rule out the interrupt concern.*

Compare linux-x86-demo.c. The .pin_bitmap field denotes the interrupts
that are routed to the cell. If you use the original linux-x86-demo.c,
then interrupt 4 should already be routed to the cell.

AFAICT, in linux-x86-demo.c, we assign IRQ 3 & 4. In your case, we also
remove the other IRQ from the root cell - IRQ 3 should be commented out.

BTW, a helpful debugging feature:
echo "#define CONFIG_CRASH_CELL_ON_PANIC 1" >> include/hypervisor/config.h

This will let the root cell print a stackdump which gives you a hint
what codepath caused the crash.

>=20
> =C2=A0 In this case, assign the interrupt to the non-root cell. You will =
need
> =C2=A0 it in any case there once you have a initrd and want to type in st=
uff.
>=20
> So there must be some reason why the crash happens. The hard way is to
> add 8250.nr_uarts=3D0 in your kernel cmdline of the root cell. *I can use
> this method for now to continue booting the non-root linux.*
>=20
>>=C2=A0
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if I leave out the pio mapping in the non-roo=
t linux, and
>> alolothat block in the root cell instead then the non-root linux gets a
>> PIO read fault on "0x3F9" while booting.=C2=A0 =C2=A0 =C2=A0 =C2=A0
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0Ralf mentioned that Linux would not try enume=
rate the device if
>> its set to -1 (=C2=A0[0x3f8/8 ... 0x3ff/8] =3D -1)=C2=A0 , but the non-r=
oot seems to
>> attempt to do something with it anyway:
>>=C2=A0
>> "[ =C2=A0 =C2=A00.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharing=
 enabled"
>> "FATAL: Invalid PIO read, port: 3f9: size 1"=C2=A0=C2=A0
>=20
> Hmm. At least that's what I thought. I don't know how enumeration of
> platform devices works exactly, but reconsidering this, the behaviour
> above makes sense: How would it know that a platform device is not
> present, depending of the configuration of the pio_bitmap.=C2=A0 =C2=A0*S=
ince I do
> technically have two serial ports, is there a way (via command line or
> kernel config for ex) to hardcode what the non-root would enumerate for
> the UART when its booting up?=C2=A0 Meaning, force it to "see" the 0x2f8
> serial port as ttyS0 instead of 0x3f8 when booting up=C2=A0
> and**=C2=A0CONFIG_SERIAL_8250_RUNTIME_UARTS =3D 1**.=C2=A0 That way if yo=
u had say
> three serial ports and three cells (1 root, 2 non-root linux) then each
> could have their own separate dedicated ttyS0.*

Have a look at the documentation of the 8250 driver, don't know by heart.

HTH,
  Ralf

> *
> *
> As far as just booting the non-root besides the serial concern, I
> haven't provided an initramfs to my non-root linux yet.=C2=A0 I would lik=
e to
> probably boot it with a simple ramdisk if possible to get a point where
> I can log in.=C2=A0
> *
> *
> Thanks,
> Wayne
>=20
> On Wed, Jun 12, 2019 at 6:43 AM Ralf Ramsauer
> <ralf.ramsauer@oth-regensburg.de
> <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
>=20
>     Hi,
>=20
>     On 6/11/19 11:05 PM, Wayne wrote:
>     > Jan/Ralf,
>     >
>     > I was able to get past issues 1 and 3 above by using Jan's kernel
>     config
>     > from this thread:
>     >
>     >
>     https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Fail=
ed$20to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40D=
DuMBAAJ".=C2=A0
>     >
>     > The DMA issue was resolved by disabling kernel
>     option=C2=A0CONFIG_ISA_DMA_API
>     > as stated in another thread, and reflected in the config file above=
.
>     >
>     > So now I think i've almost got the non-root linux booting.=C2=A0 I'=
m
>     stuck at
>     > the point where its trying to mount a filesystem and since i'm not
>     > providing an initramfs it panics.
>=20
>     Perfect!
>=20
>     >
>     > Similar to the output below:
>     >
>     > [ 1.080178] VFS: Cannot open root device "(null)" or
>     unknown-block(0,0):
>     > error -6
>     > [ 1.087662] Please append a correct "root=3D" boot option; here are=
 the
>     > available partitions:
>     > [ 1.096013] Kernel panic - not syncing: VFS: Unable to mount root
>     fs on
>     > unknown-block(0,0)
>     >
>     > I have just a couple more questions:
>     > 1. In general, is it true that an inmate will takeover control
>     from the
>     > root of any resource in the following arrays, or are there some cas=
es
>     > where they get "shared" between the root and inmate?
>=20
>     Depends.
>=20
>     > =C2=A0 =C2=A0 =C2=A0A. ".mem_regions" -> Shared?
>=20
>     May be shared with the root cell (i.e., if the region has the flag
>     JAILHOUSE_MEM_ROOTSHARED set).
>=20
>     > =C2=A0 =C2=A0 =C2=A0B. ".irqchips" -> Shared?
>=20
>     Shared with whom? Only one guest runs on a CPU. This guest will have
>     full access to the irqchip. Some accesses must be intercepted.
>=20
>     > =C2=A0 =C2=A0 =C2=A0C. ".pio_bitmap" -> Inmate takes control of the=
se if matching
>     > between inmate and root
>=20
>     Exclusive control.
>=20
>     > =C2=A0 =C2=A0 =C2=A0D. ".pci_devices" -> Inmate takes control?
>=20
>     Exclusive control.
>=20
>     > =C2=A0 =C2=A0 =C2=A0E. ".pci_caps" -> Inmate takes control?
>=20
>     Exclusive control.
>=20
>     >
>     > 2. Along the same lines, going back to my ttyS0 issue mentioned abo=
ve
>     > while trying to share it:
>     >
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0If I allocate the following to the linux=
 non root cell (and set
>     > to -1 in the root)
>=20
>     BTW, there's generally no need to set -1 in the root cell -- it will =
be
>     taken away when the non-root cell is created.
>=20
>     > =C2=A0 =C2=A0 =C2=A0.pio_bitmap =3D {
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [0x3f8/8 ... 0x3ff/8] =3D 0x00=
=C2=A0 =C2=A0/* serial 2*/
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     >
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0Then on the root cell I randomly get a P=
IO read fault on
>     "0x3FE"
>     > when the non-root is booting, i'm not sure what process is causing
>     this.
>=20
>     - Are you sure you remove the device from the kernel cmdline?
>     - Are you sure that there doesn't spawn a tty? Check with systemctl.
>     - lsof | grep ttyS
>     - The root-cell might receive the serial device's interrupt, while it=
s
>     =C2=A0 ports are assigned to the non-root cell. Does the crash happen=
 when
>     =C2=A0 you type in a character to the serial line?
>=20
>     =C2=A0 In this case, assign the interrupt to the non-root cell. You w=
ill need
>     =C2=A0 it in any case there once you have a initrd and want to type i=
n stuff.
>=20
>     So there must be some reason why the crash happens. The hard way is t=
o
>     add 8250.nr_uarts=3D0 in your kernel cmdline of the root cell.
>=20
>     >
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0if I leave out the pio mapping in the no=
n-root linux, and
>     > alolothat block in the root cell instead then the non-root linux
>     gets a
>     > PIO read fault on "0x3F9" while booting.=C2=A0 =C2=A0 =C2=A0 =C2=A0
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0Ralf mentioned that Linux would not try =
enumerate the device if
>     > its set to -1 (=C2=A0[0x3f8/8 ... 0x3ff/8] =3D -1)=C2=A0 , but the =
non-root
>     seems to
>     > attempt to do something with it anyway:
>     >
>     > "[ =C2=A0 =C2=A00.956146]Serial: 8250/16550 driver, 1 ports, IRQ sh=
aring
>     enabled"
>     > "FATAL: Invalid PIO read, port: 3f9: size 1"=C2=A0
>=20
>     Hmm. At least that's what I thought. I don't know how enumeration of
>     platform devices works exactly, but reconsidering this, the behaviour
>     above makes sense: How would it know that a platform device is not
>     present, depending of the configuration of the pio_bitmap.
>=20
>     Anyway, 8250 drivers have some cmdline parameters that can be used to
>     control initialisation (e.g., see the nr_uarts parameters above).
>=20
>     >
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0Is it possible to map the same pio block=
 in both the root and
>     > non-root with a different mask?=C2=A0 Or does the non-root just
>     override it?=C2=A0
>     > It seems like the latter is true.=C2=A0=C2=A0=C2=A0
>=20
>     Exactly. That's not a) possible, and b) does not really make sense.
>=20
>     =C2=A0 Ralf
>=20
>     >
>     > Thanks again Jan and Ralf for your help getting to this point.
>     >
>     >
>     > On Tue, Jun 11, 2019 at 2:13 PM Wayne <racedrive1503@gmail.com
>     <mailto:racedrive1503@gmail.com>
>     > <mailto:racedrive1503@gmail.com <mailto:racedrive1503@gmail.com>>>
>     wrote:
>     >
>     >=C2=A0 =C2=A0 =C2=A0Jan & Ralf:
>     >
>     >=C2=A0 =C2=A0 =C2=A0I have a little good news, I have successfully g=
otten the non-root
>     >=C2=A0 =C2=A0 =C2=A0linux to display some startup output based on yo=
ur suggestions.=C2=A0
>     >=C2=A0 =C2=A0 =C2=A0Also, there must have been some small difference=
 between the stock
>     >=C2=A0 =C2=A0 =C2=A0linux-x86-demo cell config and the one I tweaked=
.=C2=A0 I went back to
>     >=C2=A0 =C2=A0 =C2=A0the original and made some minor changes and it =
started displaying
>     >=C2=A0 =C2=A0 =C2=A0the serial output now for the non-root node.
>     >
>     >=C2=A0 =C2=A0 =C2=A0I ended up making the root cell the primary user=
 of the ttyS0
>     >=C2=A0 =C2=A0 =C2=A0device, and just having the non-root linux outpu=
t to the
>     hypervisor
>     >=C2=A0 =C2=A0 =C2=A0virtual console (console=3Djailhouse).=C2=A0 In =
my setup, there
>     appears to
>     >=C2=A0 =C2=A0 =C2=A0be some process still attempting to use the ttyS=
0 randomly on the
>     >=C2=A0 =C2=A0 =C2=A0root linux, and that causes the hypervisor to ha=
lt it if I don't
>     >=C2=A0 =C2=A0 =C2=A0leave it in the PIO array.=C2=A0 Not sure who is=
 doing it.
>     >
>     >
>     >=C2=A0 =C2=A0 =C2=A0This is where i'm at now.=C2=A0 The non-root lin=
ux keeps running into
>     >=C2=A0 =C2=A0 =C2=A0points where it tries to access PIO and gets par=
ked:
>     >
>     >=C2=A0 =C2=A0 =C2=A01. First crash:
>     >
>     >=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A00.424925]kworker/u6:0 (27) used g=
reated stack depth: 14656
>     >=C2=A0 =C2=A0 =C2=A0bytes left
>     >=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A00.425807]futex has table entries:=
 1024 (order: 4, 65536
>     bytes)
>     >=C2=A0 =C2=A0 =C2=A0"FATAL: Invalid PIO write, port: 70: size 1"
>     >=C2=A0 =C2=A0 =C2=A0...
>     >=C2=A0 =C2=A0 =C2=A0Parking CPU 3 (Cell: "linux-x86-demo")
>     >
>     >=C2=A0 =C2=A0 =C2=A0According to /proc/ioports, 70 has to do with th=
e Realtime clock
>     >=C2=A0 =C2=A0 =C2=A0(rtc0).=C2=A0 I was able to temporarily add the =
70 mapping to the
>     >=C2=A0 =C2=A0 =C2=A0non-root linux, but should it be there at all?=
=C2=A0 I tried to disable
>     >=C2=A0 =C2=A0 =C2=A0RTC support in the guest kernel config.
>     >
>     >
>     >=C2=A0 =C2=A0 =C2=A02. On the next attempt, I then got further with =
a crash trying to
>     >=C2=A0 =C2=A0 =C2=A0initialize Ser device ttyS0:
>     >
>     >=C2=A0 =C2=A0 =C2=A0"[ =C2=A0 =C2=A00.956146]Serial: 8250/16550 driv=
er, 1 ports, IRQ sharing
>     enabled"
>     >=C2=A0 =C2=A0 =C2=A0"FATAL: Invalid PIO read, port: 3f9: size 1"
>     >=C2=A0 =C2=A0 =C2=A0...
>     >=C2=A0 =C2=A0 =C2=A0Parking CPU 3 (Cell: "linux-x86-demo")
>     >
>     >=C2=A0 =C2=A0 =C2=A0I can get around that if I allow the non-root ac=
cess in its pio
>     >=C2=A0 =C2=A0 =C2=A0table, but then I have a problem above with the =
root linux
>     randomly
>     >=C2=A0 =C2=A0 =C2=A0trying to use it.
>     >
>     >
>     >=C2=A0 =C2=A0 =C2=A03. Now with the temporary adjustments to the non=
-root pio table
>     >=C2=A0 =C2=A0 =C2=A0above I get here:
>     >
>     >=C2=A0 =C2=A0 =C2=A0"[ =C2=A0 =C2=A00.972399]clocksource:Switched to=
 clocksource tsc"
>     >=C2=A0 =C2=A0 =C2=A0"FATAL: Invalid PIO read, port: 87: size 1"
>     >=C2=A0 =C2=A0 =C2=A0...
>     >=C2=A0 =C2=A0 =C2=A0Parking CPU 3 (Cell: "linux-x86-demo")
>     >
>     >=C2=A0 =C2=A0 =C2=A0According to proc/ioports this one has to do wit=
h "dma page
>     >=C2=A0 =C2=A0 =C2=A0request". It isn't mapped in my root linux PIO o=
r non-root
>     linux array.
>     >
>     >
>     >=C2=A0 =C2=A0 =C2=A0Aside from the serial conflict, it seems like th=
ese should remain
>     >=C2=A0 =C2=A0 =C2=A0controlled by the root linux or hypervisor.=C2=
=A0 =C2=A0Do you use a
>     >=C2=A0 =C2=A0 =C2=A0particular bare minimum x86 kernel config on you=
r machine for the
>     >=C2=A0 =C2=A0 =C2=A0guest to get around these?=C2=A0 I know Jan ment=
ioned the
>     >=C2=A0 =C2=A0 =C2=A0jailhouse-images project might have something, b=
ut I couldn't find
>     >=C2=A0 =C2=A0 =C2=A0it digging around quick.
>     >
>     >=C2=A0 =C2=A0 =C2=A0Thanks to you both for your responses and patien=
ce.=C2=A0 I got the
>     root
>     >=C2=A0 =C2=A0 =C2=A0linux up and going on my own, but the non-root g=
uest is proving to
>     >=C2=A0 =C2=A0 =C2=A0be more difficult.
>     >
>     >=C2=A0 =C2=A0 =C2=A0Wayne
>     >
>     >
>     >
>     >=C2=A0 =C2=A0 =C2=A0On Tue, Jun 11, 2019 at 11:31 AM Ralf Ramsauer
>     >=C2=A0 =C2=A0 =C2=A0<ralf.ramsauer@oth-regensburg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>
>     >=C2=A0 =C2=A0 =C2=A0<mailto:ralf.ramsauer@oth-regensburg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>>> wrote:
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hi,
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 6/10/19 7:45 PM, Wayne wrote:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Thank you for your responses Ral=
f and Jan.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Yes, I have successfully gotten =
both the apic-demo and
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tiny-demo cells
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> to work on my system before atte=
mpting to load the non-root
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux.=C2=A0 I
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> can see serial output from them.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> However, if I try to share the U=
ART between root and inmate
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for them I
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> run into a crash on the hypervis=
or if the root linux
>     attempts
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to write
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> to the UART (after creating/star=
ting a demo).=C2=A0 Does the root
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux lose
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> access once an inmate is created=
/started?=C2=A0 Or am I missing
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0something
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> from my System config or tiny-de=
mo config that allows
>     them to
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0share?=C2=A0 I
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> attached the crash in hypervisor=
_output.txt.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Also, I noticed the tiny-demo ou=
tput on the UART gets
>     mirrored
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on the
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Yes, according to your config,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACT=
IVE is
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set. This means that the guest wil=
l use the virtual
>     console. The
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtual
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0console uses the hypervisor output=
 which depends whatever
>     is set
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in your
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0system configuration. In your case=
 the hypervisor uses 3f8.
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0And additionally, the inmate also =
a valid .console set. Again,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03f8. This
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0means, it will use the console *an=
d* the hypervisor debug
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hypercall. In
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0your case, both outputs are routed=
 to the same device which
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0explains the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mirroring.
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Jailhouse virtual console.=C2=A0=
 Does that mean that its
>     writing to the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> serial through the hypervisor an=
d not directly accessing
>     ttyS0
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0itself?
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Exactly.
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> If so, is there a way to create =
the cell to write ttyS0
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0directly as a
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> test?=C2=A0 To see if it exhibit=
s same behavior as the
>     non-root linux.
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Sure, simply align the .address fi=
eld of .console, and allow
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0access to
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that port via .pio_bitmap.
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> FYI, I create the tiny-demo like=
 this:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> jailhouse cell create configs/x8=
6/tiny-demo.cell
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> jailhouse cell load tiny-demo
>     inmates/demos/x86/tiny-demo.cell =C2=A0
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> jailhouse cell start tiny-demo
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Going back to my original non-ro=
ot linux question, I
>     don't see any
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> output when connected over ttyS0=
.=C2=A0 Its address is 0x3f8
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0("serial 1") in
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> the PIO, and that seems to work =
fine for the other simple
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0demos, minus
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> the hypervisor crash issue above=
 when sharing.=C2=A0 I know there
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> other "serial 2" port but I have=
n't tried to use that one.
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I see that port on our Dell server=
 as well. It's present,
>     but I
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0don't
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0know where it's connected to.
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Let me just summarise your issue:
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0You only have one serial line avai=
lable, right? From the
>     root-cell's
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0POV, it's ttyS0 on 3f8.
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I would propose to share ttyS0 bet=
ween the hypervisor and
>     non-root
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux. This means:
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 - Don't let the root-cell u=
se ttyS0. Remove any
>     console=3DttyS0
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 parameters from you =
commandline. Ensure that noone
>     else accesses
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 ttyS0 (e.g., getty@t=
tyS0 or other friends)
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 - Set 3f8 as debug_console =
in your master.c (seems you
>     already
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have)
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 - Allow 3f8 access in the l=
inux-demo.c (already set in
>     the default
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 linux-demo
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 - Disallow 2f8 access in li=
nux-demo.c:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0[ 0x2f8/8 ...=C2=A0 0x2ff/8] =3D 0, /* serial2 */
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0[ 0x2f8/8 ...=C2=A0 0x2ff/8] =3D -1, /* serial2 */
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 I don't know how Lin=
ux enumerates serial devices, but this
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ensures
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 that Linux won't see=
 the unconnected serial line and map
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ttyS0 to
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 3f8
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> non root linux launched with:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> /tools/jailhouse cell linux conf=
igs/x86/linux-x86.cell
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> /boot/vmlinux-4.1.16-Guest -c "c=
onsole=3DttyS0,115200"
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Then, this should actually work...
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0And if not, then console=3Djailhou=
se0 should work.
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> I can try the 4.19 siemens kerne=
l and "next" branch for
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jailhouse you
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> suggested.=C2=A0 Do you think th=
at combination will resolve
>     the missing
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> serial for the non-root linux?=
=C2=A0 Otherwise, did my kernel
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config, system
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> config, and non-root linux cell =
configs look OK?
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I didn't look at it, but we should=
 at least - even if some
>     flags are
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0still incorrect - see the "Uncompr=
essing kernel..." thing.
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Wait -- one thing you could try: D=
eactivate CONFIG_EFI and
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0especially
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_EFI_STUBS. I'm not sure, bu=
t it could be that EFI_STUBS
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0change
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the header format that our bootloa=
der patches.
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Thanks again for your help.
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0No problem. But it's not yet worki=
ng. ;-)
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 Ralf
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> On Fri, Jun 7, 2019 at 5:30 PM R=
alf Ramsauer
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> <ralf.ramsauer@oth-regensburg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:ralf.ramsauer@oth-regensbu=
rg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> <mailto:ralf.ramsauer@oth-regens=
burg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:ralf.ramsauer@oth-regensbu=
rg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>>>> wrote:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Hi Wayne,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0On 6/7/19 10:=
04 PM, Wayne wrote:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Hi Ralf,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Thank you f=
or your responses.=C2=A0 I have attached the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0requested config
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> files.=C2=
=A0 I am now just trying to use the same
>     bzImage for
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the root and
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> the non-roo=
t linux node.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0One question =
that you didn't answer: do apic-demo or
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tiny-demo work?
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0They need to =
to have correct .console parameter set, so
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ensure that
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0parameters ar=
e set if you run those demos in your
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux-demo cell. Just
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0compare it to=
 tiny-demo.c or apic-demo.c
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Yes, I am u=
sing vanilla 4.16 because the documentation
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indicated
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0that it
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> is the firs=
t mainline release to officially support
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Jailhouse Guest
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> images.=C2=
=A0 Do you suggest that I use something else?
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0As Jan alread=
y wrote: Try to use Siemens' 4.19 branch.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Right now i=
'm just trying to get some serial
>     output from
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the non-root
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Linux.=C2=
=A0 Hopefully, I have that configured correctly.=C2=A0
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ideally, I would
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> like to sha=
re the same serial console for the Root
>     node
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and non-root
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> node eventu=
ally if possible.=C2=A0 I have been OK with
>     using
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the virtual
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> console (ja=
ilhouse console -f) for the Hypervisor
>     output.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0In addition t=
o Jan's comment:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Currently you=
 only have access to the jailhouse console
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0via 'jailhouse
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0console' from=
 your root cell. Imagine your root cell
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crashes for some
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0reason. You w=
ill never see the fault reason, which makes
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0things hard to
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0debug.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0I would sugge=
st to configure the hypervisor to use the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial console.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0You can share=
 the device with the non-root Linux, that's
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no problem.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0In this case,=
 the non-root kernel's output will
>     always be
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printed to the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0serial consol=
e. Directly, if you choose
>     console=3DttySx, and
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indirectly
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0via the hyper=
visor if you choose console=3Djailhouse.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0BTW: Accordin=
g to your config, your system is a
>     PowerEdge,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0non-root cell=
 gets both, 0x2f8 and 0x3f8. Are you sure
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that ttyS1 is the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0correct conso=
le that you are connected to?
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Just mentioni=
ng this as we have a similar machine here,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and, afair, both
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0platform seri=
al device are 'usable', but one ends in the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nirvana while
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0it is accessi=
ble.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Ah, and one l=
ast thing: try to switch to the current
>     next
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0branch for
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0jailhouse. Ja=
n just integrated a few patches from me
>     that
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0might also be
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0relevant for =
your machine.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0HTH
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0=C2=A0 Ralf
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Wayne
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> On Fri, Jun=
 7, 2019 at 9:10 AM Ralf Ramsauer
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> <ralf.ramsa=
uer@oth-regensburg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:ralf.ramsauer@oth-regensbu=
rg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<mailto:ralf.=
ramsauer@oth-regensburg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:ralf.ramsauer@oth-regensbu=
rg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>>>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> <mailto:ral=
f.ramsauer@oth-regensburg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:ralf.ramsauer@oth-regensbu=
rg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<mailto:ralf.=
ramsauer@oth-regensburg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:ralf.ramsauer@oth-regensbu=
rg.de
>     <mailto:ralf.ramsauer@oth-regensburg.de>>>>> wrote:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0Hi,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0On 6/7/19 2:28 PM, Wayne wrote:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> Hello,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> I am new to Linux development and
>     Jailhouse.=C2=A0 I have
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0successfully
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0booted
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> the Jailhouse Hypervisor and root cell on a bare
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0metal X86 Linux
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0system
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> (No QEMU).=C2=A0 I am now trying to load a non-root
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux cell
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0and I have a
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> few questions.=C2=A0 Jailhouse accepts and starts my
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0non-root
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0linux cell
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> configuration and I see it as "running"
>     through the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0"jailhouse ce=
ll
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> list" command.=C2=A0 However, I don't see any serial
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output from the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> "non-root linux" cell booting up.=C2=A0 I=E2=80=99m not sure
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0what the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0non-root node
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> is doing at this point.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0Ok, first of all, can you see any output from
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Jailhouse's demo
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0inmates
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0(e.g., tiny-demo or apic-demo)?
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0My root =
node is a 4.16 kernel
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configured this
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0way:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_JAILHOUSE_GUEST is
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0not set
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2. CONFIG_SERIO=3Dy
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0CONFIG_SERIAL=
_8250_RUNTIME_UARTS=3D4
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0My non-r=
oot node is a 4.16 kernel
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configured
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0this way:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_JAILHOUSE_GUEST=3Dy
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2. CONFIG_SERIO=3Dm
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(can't seem
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0to disable
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> completely in my config for 4.16)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0CONFIG_SERIAL=
_8250_RUNTIME_UARTS=3D1
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0Could you please provide a full .config? What
>     branch
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0are you
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0exactly
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0using? Vanilla 4.16?
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0Please attach your system config and your
>     non-root linux
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0config as wel=
l.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0You may also want to try
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0https://github.com/siemens/linux .=
 See
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0jailhouse-enabling branches for some releases.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> In general, do the kernel config settings
>     have to
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match between
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0the root
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> node and non-linux or is the above fine?
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0No, they do not have to be the same, but they can.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Still, an
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0analysis
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0requires your .config.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> The vmlinux-4.1.16-Guest bzImage is approx 7MB,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0inmate node i=
s
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> allocated ~75MB of RAM.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> I have a single UART, so I have configured the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0root cell
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0system config
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> to output to the virtual hypervisor console:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0Wait... You configured your root-cell to use the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hypervisor debug
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0console? How? It's only available once the
>     hypervisor is
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0enabled. How
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0should this work?
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0But let's have a look at your configuration first.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0So you want to:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0=C2=A0 - Have the UART (0x3f8) available in the
>     non-root cell
>     >=EF=BF=BD=EF=BF=BD =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=
=C2=A0 =C2=A0 =C2=A0=C2=A0 - Use 0x3f8 as hypervisor debug console as well
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0=C2=A0 - No console for root-cell
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0Did I get this right?
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0=C2=A0 Ralf
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> .debug_console =3D {
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> .type =3D JAILHOUSE_CON_TYPE_NONE,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> },
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> and I have configured the non-root linux cell to
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output to
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0the UART:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> (Added serial 0x3f8 to pio bitmap for non-root
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux) and
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0started the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> node with this:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> ./tools/jailhouse cell linux
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configs/x86/linux-x86.cell
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> /boot/vmlinux-4.1.16-Guest -c
>     "console=3DttyS0,115200"
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> (Note I also tried "console=3Djailhouse" in the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command above,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0and that
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> produces the same result)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> I then see the following on my hypervisor
>     console
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0(./tools/jail=
house
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> console -f):
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> Created cell "linux-x86-demo"
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> ...
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> Cell "linux-x86-demo" can be loaded
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> Started cell "linux-x86-demo"
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> After a little while I do get a parked CPU error
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on the root
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0node,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0looks
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> like its trying to do something with the
>     UART as well:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> FATAL: Invalid PIO read, port: 3fe size: 1
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> I would expect something to pop out on the UART
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0non-root
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0linux
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> node first.=C2=A0 Note that root node has serial
>     0x3f8
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0disabled
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0in its pio
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> bitmap.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> I verifed that the UART is functioning by
>     allowing the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0hypervisor to
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> print to it and also performed an echo test over
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ttyS0.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> I have tried several configurations of
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel.....including your
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0current
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> "queues/jailhouse" branch head kernel for the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0non-root node,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0along
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0with
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> the kernel config for 4.7 posted in this thread
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0below (but I
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0get same
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> result as above when I start it, no kernel
>     output):
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0
>     =C2=A0=C2=A0=C2=A0=C2=A0"https://groups.google.com/forum/#!searchin/j=
ailhouse-dev/Re$3A$20Failed$20to$20boot$20jailhouse%7Csort:relevance/jailho=
use-dev/M7UO89XFIk0/Qi40DDuMBAAJ".
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> Any information you can provide to me will be
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0helpful.=C2=A0 I'm
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0not sure
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> what might be going wrong here.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> Thanks,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> Wayne
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> --
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> You received this message because you are
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subscribed to the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Google
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> Groups "Jailhouse" group.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> To unsubscribe from this group and stop
>     receiving
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emails
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0from it, send
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> an email to
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jailhouse-dev+unsubscribe@googlegr=
oups.com
>     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%2Bunsubscrib=
e@googlegroups.com
>     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<mailto:jailh=
ouse-dev%2Bunsubscribe@googlegroups.com
>     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%252Bunsubscr=
ibe@googlegroups.com
>     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0
>     =C2=A0<mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
>     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%252Bunsubscr=
ibe@googlegroups.com
>     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0
>     =C2=A0<mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
>     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%25252Bunsubs=
cribe@googlegroups.com
>     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>>>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     <mailto:jailhouse-dev+unsubscribe@googlegroups.com
>     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%2Bunsubscrib=
e@googlegroups.com
>     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<mailto:jailh=
ouse-dev%2Bunsubscribe@googlegroups.com
>     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%252Bunsubscr=
ibe@googlegroups.com
>     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0
>     =C2=A0<mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
>     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%252Bunsubscr=
ibe@googlegroups.com
>     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0
>     =C2=A0<mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
>     <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:jailhouse-dev%25252Bunsubs=
cribe@googlegroups.com
>     <mailto:jailhouse-dev%2525252Bunsubscribe@googlegroups.com>>>>>.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> To view this discussion on the web visit
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0
>     =C2=A0=C2=A0=C2=A0https://groups.google.com/d/msgid/jailhouse-dev/CA%=
2B%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0
>     =C2=A0=C2=A0=C2=A0<https://groups.google.com/d/msgid/jailhouse-dev/CA=
%2B%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com?=
utm_medium=3Demail&utm_source=3Dfooter>.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=
=A0 =C2=A0> For more options, visit
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0https://groups.google.com/d/optout=
.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>     >
>     > --
>     > You received this message because you are subscribed to the Google
>     > Groups "Jailhouse" group.
>     > To unsubscribe from this group and stop receiving emails from it, s=
end
>     > an email to jailhouse-dev+unsubscribe@googlegroups.com
>     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
>     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
>     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>>.
>     > To view this discussion on the web visit
>     >
>     https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY=
3MaeRW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com
>     >
>     <https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLL=
Y3MaeRW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com?utm_medium=3Demail=
&utm_source=3Dfooter>.
>     > For more options, visit https://groups.google.com/d/optout.
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc36sP7ABEsR5Bp%=
2Bgpts0DUBENqV6eFDPazfs5kR_QRGaw%40mail.gmail.com
> <https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc36sP7ABEsR5Bp=
%2Bgpts0DUBENqV6eFDPazfs5kR_QRGaw%40mail.gmail.com?utm_medium=3Demail&utm_s=
ource=3Dfooter>.
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/42ce8fed-792a-ac86-7611-ee9b13dd7815%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.

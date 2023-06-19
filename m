Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBD6YYGSAMGQEKC4ODGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEAD735A17
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Jun 2023 16:54:09 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 38308e7fff4ca-2b465ab1cc0sf15508511fa.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Jun 2023 07:54:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1687186448; cv=pass;
        d=google.com; s=arc-20160816;
        b=DeL4whDPKIKW+7+/fFUVtOJ6Qq+AK0l7tHINA8bm9vY0VRiXA2uAiP4rwKsX0YbO9U
         IXz306GciPHCsh1U4urQd90q6aKATlOpVdV8im5lAHjeC6WKfhxD2pOEsvW5SvasCReW
         miA/rBCfTeexrdn4UePkl1WF6fWFBiavIpvdQRuuhYkQypnkwC4+ebqfX/w5DbQVgOyT
         yoXpJ8q2mXJmHGEp1yE4BnXoAvDZ19/F7olWAp8wh1ItcsuXi2oACD2RKxAdaWhz3Wov
         L9aMcXC2Ybxl5jYMLjeB4F2oPiMus+JUGwvelUsehee2PbJ6PpV55fh1SmDkv53PQKWN
         /e1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=K0niduqyP41LCJH0ueHyqVqxh/jpnE3oGaaXxPO/xAA=;
        b=jmkl+oTtrP2YhYAQRJV0xA51FH3o1x7LcPetpGhdWo1uUQfxQjbiWipH/WzkI5Jpct
         trVcKYB6O+s9jU+JIclWUmwKowqL1U6cWvqAOg/P3XbIs+GoQQIF7oHoys7kkjluSLyW
         9HhsGqtk9empySRcL7YjRUrch3zYopAcBDKoQ/t5hDRoOdHBzaGneTr3ToQeNv/osSjj
         jBGMw8pMU/6LFpIJQ+f9SP41/zxqtygpv7k16jGgrfsDWnWoIn4FFR3GQZs0dxY2mwln
         qhHGezmdw2OM9tK1JdATENrBneXqGF3wJCEDzmpA4pOccPtmSDPvKwBVcw0j4v02Dmem
         Ve3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=SobmIwMx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1687186448; x=1689778448;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=K0niduqyP41LCJH0ueHyqVqxh/jpnE3oGaaXxPO/xAA=;
        b=ZpCLwpKn9+FhwHvv+zuJypinrsEvl7isdi2e4ji8phBkuCyRWNRP7EBmFDSLdRbC2y
         ieMe8XzhXmvvf/tGfjG6I6TWKeKNrNqAH5ZDMg81nvECxv75J2rVR6Z4g4HtLlcLm4zX
         GXju8c5l9OgA01/cAZGAeRrFFJ0FBHvcgTOjl1rWcSLO2OBp60nSZYDGpHEoy6LCrn4e
         /Xmevrs0dIGp7YsuUNL1kEGiaurKcPWl3RCiap4oebsCK9bHf1QBXlAcByLncb4ronzE
         mEopgOo+7S6bFxvoUKEqofrNabwVySrlgqVRenhDkeL0XxqmWN3nIvV4m//HJ6Bc/E3t
         Bx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687186448; x=1689778448;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0niduqyP41LCJH0ueHyqVqxh/jpnE3oGaaXxPO/xAA=;
        b=Bl4hFH+MwVJ8h/HvcaatMJs2rzs/WWl6R2xCuYA0u4vCKPSUAkEYoUhJ+WDN5nS3pj
         jBDqypSirsso48ws/iY5DtVCEIInWnQw+PahW1VrwKGspps2W/thB0wnzXj35GZUU10X
         9U5rRyvklnB13d92MgIzLL7vGOtIn/1brToWGLk7aDHPgemkPgMRBF3F4Zv9cin+LnjT
         JBIqfz2I3Sf6ki9CWdI/vplwrbm1foxOSLmstbFeFJH6Ob47eoaeko9ssJrFF9fIb8AA
         Z7ym4DsZG5cFW0LsA1aRvBAiZOzWIWvvWczwvucp8+5opm5vHLnvJAiGzzkOBjjfYJhz
         OwtA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwZ63H/wkm2S5i2s9B3V9WJJDyVghADue239IwB0n6nDzjuv5oX
	DKVjxXH0xIunOJnH8Uoa9hM=
X-Google-Smtp-Source: ACHHUZ7+7Le8ylPilrLo3fn9DfbZXQJK9y/48HtDAfSVTwj3GQWPvbHWHZQnvHirlZ5FNP/Ygi+7Cw==
X-Received: by 2002:a2e:7819:0:b0:2b4:7fc5:21ab with SMTP id t25-20020a2e7819000000b002b47fc521abmr1330511ljc.51.1687186447700;
        Mon, 19 Jun 2023 07:54:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:690:b0:518:794f:22ed with SMTP id
 f16-20020a056402069000b00518794f22edls392140edy.1.-pod-prod-08-eu; Mon, 19
 Jun 2023 07:54:05 -0700 (PDT)
X-Received: by 2002:a17:907:7e8b:b0:988:fafd:d93a with SMTP id qb11-20020a1709077e8b00b00988fafdd93amr520501ejc.70.1687186445726;
        Mon, 19 Jun 2023 07:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687186445; cv=none;
        d=google.com; s=arc-20160816;
        b=PCuBL8+kU5y9XIoNgGfwga7fZBimk5K/w0Ab2jWNXEJPzkwCBAqtUSqO4iY1wYC93m
         0SH7ivxbfR+rfvkiNqTiVGRRpT7DfpXSbYmAu9X3pZT/JV/mTdJE5PcoQvRSbXpXo5UT
         fgf/RADOfGkOioaxPw+MK98smltESmp9LqpF7DyXfWdWJX5ZDQx/F4yEGn9DMvbzZcSh
         xe9pt9CFiZPEOLIcdg8a+Qyfue32DHRZfgsrftO0EVdhVhtONeDkvImnEPDlCFWk0X3U
         ychGa0MWEy4KDjwOc6cyc5EUkOeGHhxJNfUpzBvBCTvEhCU1s1uVqvn7L2nveACmYPQL
         9uwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RzQhdQviE7dsBVlMYHQdNW3NUAnFshDlG8HRlAkag9g=;
        b=iH7B1dKE+DPxQeOhcUwEiJEjAH/bmv3Huv+elXexymKfj0zK8AzBreBLW/QcgQUBeh
         jBuWmRWuECnbcp793S8vj0R+d4HLlj67ntd4Geg1Yk4bXzLBI6dx+vJK/sofeR64k/TI
         SGIMUCHBB4xty4W+RgzqQgzuMGVTKvwXpEZxRJeLpBAB439bHNgvq5APYU/n+gPjKoNa
         CVOLH/LyfP4+YKY2o1zeSUOnyH9ACRbgmuspL9kUztIuANoglPFvGnUVQvfZXCcEVUe0
         c+dgJwvG+CQVzwb+fnZuMCdIScaZoPtVRHIBMSxf2F3xYyyacl8pjO2+ddziDwNI2TM2
         w+sQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=SobmIwMx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id v5-20020a17090651c500b0098825a86b9asi495879ejk.0.2023.06.19.07.54.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:54:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4QlCT91hJWzxpF;
	Mon, 19 Jun 2023 16:54:05 +0200 (CEST)
Received: from [IPV6:2001:638:a01:8068:e089:ee05:7189:d907]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 19 Jun
 2023 16:54:04 +0200
Message-ID: <c439d69b-d40e-48aa-dd34-5b72f0ec9549@oth-regensburg.de>
Date: Mon, 19 Jun 2023 16:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: FATAL: Unhandled HYP exception in Raspberry Pi 4 for jailhouse
 hypervisor
Content-Language: en-US
To: sai krishna Allu <saikrishna.allu@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <3e6d4f38-5938-4da0-9666-9093a0b76300n@googlegroups.com>
 <c7f684bd-ffcd-4ab2-076e-03dac205339e@oth-regensburg.de>
 <bdaa1499-4532-423f-a59d-812557f8162an@googlegroups.com>
 <0f73d59b-4574-17c9-e2da-68c52222be44@oth-regensburg.de>
 <60a06afd-9ddd-4304-aee5-d61d8ebeb141n@googlegroups.com>
 <c7787605-7a3f-b392-f7e8-9fd10170ab57@oth-regensburg.de>
 <ff5f75fd-7b70-424a-ab0e-537d4242afffn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <ff5f75fd-7b70-424a-ab0e-537d4242afffn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=SobmIwMx;
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



On 19/06/2023 16:49, sai krishna Allu wrote:
> Hi Ralf,
>=20
> Sorry, I forgot to load the module, I have loaded now.
>=20
> ubuntu@ubuntu:~/jailhouse$ sudo insmod driver/jailhouse.ko
> ubuntu@ubuntu:~/jailhouse$ ls -l /dev/jailhouse
> crw------- 1 root root 10, 59 Jun 19 14:45 /dev/jailhouse
> ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable configs/arm64/rpi4.cell
> *[ 4966.214157] jailhouse: request_mem_region failed for hypervisor memor=
y.

Okay. Interesting. I wonder why you didn't hit that error before.=20
Jailhouse requires reserved memory where it, as well as inmates, reside.=20
Linux must never claim those memory areas, hence you need to reserve=20
that memory areas at boot time.

See the comment in arch/arm64/rpi4.c:
  * Reservation via device tree: reg =3D <0x0 0x20000000 0x10000000>;

Did you reserve memory in your device tree?

I would recommend building a working image with jailhouse-images. There,=20
are required patches and config tweaks are included out of the box.


   Ralf

> JAILHOUSE_ENABLE: Invalid argument*
> ubuntu@ubuntu:~/jailhouse$
>=20
>=20
> I am getting the above error.
>=20
> Regards,
> Sai Krishna
> On Monday, June 19, 2023 at 8:09:37=E2=80=AFPM UTC+5:30 Ralf Ramsauer wro=
te:
>=20
>=20
>=20
>     On 19/06/2023 16:23, sai krishna Allu wrote:
>      > Hi Ralf,
>      >
>      > I have downloaded the master branch and given make and I have got
>     the
>      > following error, I fixed the error with one of the reference
>     link, but
>      > didn't find the /dev/jailhouse post installation
>      >
>      > ubuntu@ubuntu:~/jailhouse$ git branch
>      > * master
>      > ubuntu@ubuntu:~/jailhouse$make
>      > ...
>      > ...
>      > ...
>      > =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/ubuntu/jailhouse/configs/arm64=
/zynqmp-zcu102.o
>      > =C2=A0 OBJCOPY /home/ubuntu/jailhouse/configs/arm64/zynqmp-zcu102.=
cell
>      > =C2=A0 DTC   =20
>     /home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb
>      >
>     */home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17:5=
4:
>      > error: no include path in which to search for
>      > dt-bindings/interrupt-controller/arm-gic.h
>      > =C2=A0 =C2=A017 | #include <dt-bindings/interrupt-controller/arm-g=
ic.h>*
>      > =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^
>      > make[3]: *** [scripts/Makefile.lib:286:
>      > /home/ubuntu/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb]
>     Error 1
>      > make[2]: *** [scripts/Makefile.build:519:
>      > /home/ubuntu/jailhouse/configs] Error 2
>      > make[1]: *** [Makefile:1765: /home/ubuntu/jailhouse] Error 2
>      > make: *** [Makefile:40: modules] Error 2
>      > ubuntu@ubuntu:~/jailhouse$
>      >
>      > To fix the above I have followed the link
>      > https://bbs.csdn.net/topics/615205697
>     <https://bbs.csdn.net/topics/615205697> and changed as per instructio=
n,
>      > even I followed the earlier build from this link only. but I was n=
ot
>      > able to build jailhouse-image.
>=20
>     Ok, perfect.
>=20
>      >
>      >
>      > DTC_INCLUDE =C2=A0 =C2=A0+=3D /usr/src/linux-headers-5.4.0-1069-ra=
spi/include
>     added
>      > in the file
>     -->/usr/src/linux-headers-5.4.0-1011-raspi/scripts/Makefile.lib
>      >
>      > After that I am able to install,
>      >
>      > ubuntu@ubuntu:~/jailhouse$ sudo make install
>      > =C2=A0 Building modules, stage 2.
>      > =C2=A0 MODPOST 1 modules
>      > =C2=A0 INSTALL /home/ubuntu/jailhouse/driver/jailhouse.ko
>      > At main.c:160:
>      > - SSL error:02001002:system library:fopen:No such file or director=
y:
>      > ../crypto/bio/bss_file.c:69
>      > - SSL error:2006D080:BIO routines:BIO_new_file:no such file:
>      > ../crypto/bio/bss_file.c:76
>      > sign-file: certs/signing_key.pem: No such file or directory
>      > =C2=A0 DEPMOD =C2=A05.4.0-1069-raspi
>      > Warning: modules_install: missing 'System.map' file. Skipping
>     depmod.
>      > install -m 644 hypervisor/jailhouse*.bin /lib/firmware
>      > install -d -m 755 /usr/local/libexec/jailhouse
>      > install -m 644 inmates/tools/arm64/*.bin
>     /usr/local/libexec/jailhouse
>      > install jailhouse demos/ivshmem-demo /usr/local/sbin
>      > install jailhouse-config-collect jailhouse-cell-linux
>      > jailhouse-cell-stats jailhouse-config-create jailhouse-config-chec=
k
>      > jailhouse-hardware-check /usr/local/libexec/jailhouse
>      > install -d -m 755 /usr/local/share/jailhouse
>      > install -m 644 jailhouse-config-collect.tmpl root-cell-config.c.tm=
pl
>      > /usr/local/share/jailhouse
>      > install -m 644 jailhouse-completion.bash
>      > /usr/share/bash-completion/completions/jailhouse
>      > install -d -m 755 /usr/local/share/man/man8
>      > install -m 644 jailhouse.8 jailhouse-cell.8 jailhouse-enable.8
>      > /usr/local/share/man/man8
>      > python3 -m pip install --upgrade --force-reinstall =C2=A0.
>      > Processing /home/ubuntu/jailhouse
>      > Building wheels for collected packages: pyjailhouse
>      > =C2=A0 Building wheel for pyjailhouse (setup.py) ... done
>      > =C2=A0 Created wheel for pyjailhouse:
>      > filename=3Dpyjailhouse-0.12-py3-none-any.whl size=3D22795
>      >
>     sha256=3Dfd9fbf5b1cf127acf8f96d31e8a5b36351a39278db948c6be3bf55021a38=
53bb
>      > =C2=A0 Stored in directory:
>      >
>     /tmp/pip-ephem-wheel-cache-bv5mietb/wheels/c9/70/5f/41e4b42a3693d675b=
8bd9bcdcb021956f8d467789b3be58740
>      > Successfully built pyjailhouse
>      > Installing collected packages: pyjailhouse
>      > Successfully installed pyjailhouse-0.12
>      > ubuntu@ubuntu:~/jailhouse$
>      >
>      > *but not able to get jailhouse in dev file.*
>=20
>     Yeah, you need to load the jailhouse module first:
>=20
>     insmod drivers/jailhouse.ko
>     or
>     modprobe jailhouse
>=20
>     Thanks
>     Ralf
>=20
>      >
>      > ubuntu@ubuntu:~/jailhouse$*ls -l /dev/jailhouse*
>      > *ls: cannot access '/dev/jailhouse': No such file or directory*
>      > ubuntu@ubuntu:~/jailhouse$
>      >
>      > Please suggest the correct way to install or anything else I need =
to
>      > change or need to follow different steps to fix this issue to get
>     the
>      > installation success.
>      >
>      > Regards,
>      > Sai Krishna
>      >
>      > On Monday, June 19, 2023 at 4:25:09=E2=80=AFPM UTC+5:30 Ralf Ramsa=
uer wrote:
>      >
>      >
>      >
>      > On 19/06/2023 12:23, sai krishna Allu wrote:
>      > > Hi Ralf,
>      > >
>      > > I have attached the hypervisor.o and I have taken the dump of
>      > that which
>      > > is also attached too.
>      > > I have below command to extract, let me know is it ok or not.
>      > >
>      > > ubuntu@ubuntu:~$ aarch64-linux-gnu-objdump -d
>      > > jailhouse/hypervisor/hypervisor.o|tee hypervisor_dump.txt
>      > >
>      > > ubuntu@ubuntu:~$ cat hypervisor_dump.txt -n |grep "ffffc0203820"
>      > > *3338 =C2=A0 =C2=A0ffffc0203820: =C2=A0 =C2=A0 =C2=A0 f9400282 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]*
>      > > ubuntu@ubuntu:~$ vi hypervisor_dump.txt +3338
>      > > =C2=A0 =C2=A0 =C2=A0 patch+0x218>
>      > > =C2=A03334 =C2=A0 =C2=A0 ffffc0203810: =C2=A0 =C2=A0 =C2=A0 f940=
0282 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]
>      > > =C2=A03335 =C2=A0 =C2=A0 ffffc0203814: =C2=A0 =C2=A0 =C2=A0 f940=
0842 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x2,
>     #16]
>      > > =C2=A03336 =C2=A0 =C2=A0 ffffc0203818: =C2=A0 =C2=A0 =C2=A0 8a13=
0042 =C2=A0 =C2=A0 =C2=A0 =C2=A0and =C2=A0 =C2=A0 x2, x2, x19
>      > > =C2=A03337 =C2=A0 =C2=A0 ffffc020381c: =C2=A0 =C2=A0 =C2=A0 f90a=
4002 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =C2=A0 =C2=A0 x2, [x0,
>      > #5248]
>      > > *=C2=A03338 =C2=A0 =C2=A0 ffffc0203820: =C2=A0 =C2=A0 =C2=A0 f94=
00282 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x20]*
>      > > =C2=A03339 =C2=A0 =C2=A0 ffffc0203824: =C2=A0 =C2=A0 =C2=A0 f940=
0c42 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 x2, [x2,
>     #24]
>      > > =C2=A03340 =C2=A0 =C2=A0 ffffc0203828: =C2=A0 =C2=A0 =C2=A0 8a13=
0053 =C2=A0 =C2=A0 =C2=A0 =C2=A0and =C2=A0 =C2=A0 x19, x2, x19
>      > > =C2=A03341 =C2=A0 =C2=A0 ffffc020382c: =C2=A0 =C2=A0 =C2=A0 5280=
0022 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 w2, #0x1
>      > >
>      > > The instruction at=C2=A0ffffc0203820=C2=A0means it Load x2 from =
contents of
>      > x20
>      > > register.
>      > > Please suggest how to fix this.
>      >
>      > Keep calm, I'm still trying to figure out where the problem
>     exactly is.
>      >
>      > Now I know the line of code, where the exception exactly happens.
>     It's
>      > in hypervisor/arch/arm-common/psci.c:39
>      >
>      > ldr x2, [x20] <- Here we likely load ctx->regs[2], and the only
>     variant
>      > how this could fail is that ctx points to somewhere. Here we're
>     inside
>      > the routine psci_emulate_cpu_on, which shouldn't even be called wh=
en
>      > enabling the hypervisor. I don't know yet what could be the issue.
>      >
>      > Before we keep on debugging: I saw that you use Jailhouse v0.12.
>      >
>      > Could you please switch to the master and/or next branch of
>     jailhouse,
>      > and see if the error still occurs there?
>      >
>      > Thanks,
>      > Ralf
>      >
>      > >
>      > > Regards,
>      > > Sai Krishna
>      > >
>      > > On Saturday, June 17, 2023 at 8:59:56=E2=80=AFPM UTC+5:30 Ralf R=
amsauer
>      > wrote:
>      > >
>      > > Hi,
>      > >
>      > > On 15/06/2023 10:11, sai krishna Allu wrote:
>      > > > Hi Team,
>      > > >
>      > > > I have=C2=A0Raspberry Pi 4, which is installed with Ubuntu 20.=
04.5
>     LTS
>      > > 64 bit.
>      > > > after loading the jailhouse.ko file, when I gave following
>      > > command I am
>      > > > getting the exception.
>      > > >
>      > > > ubuntu@ubuntu:~/jailhouse$ sudo jailhouse enable
>      > > configs/arm64/rpi4.cell
>      > > >
>      > > > Initializing Jailhouse hypervisor v0.12 (0-g92db71f2) on CPU 0
>      > > > Code location: 0x0000ffffc0200800
>      > > > Page pool usage after early setup: mem 39/994, remap 0/131072
>      > > > Initializing processors:
>      > > > =C2=A0CPU 0...
>      > > > FATAL: Unhandled HYP exception: synchronous abort from EL2
>      > >
>      > > Synchronous abort from EL2 means that we have a fatal error insi=
de
>      > > Jailhouse (e.g., segfault).
>      > >
>      > > > =C2=A0pc: 0000ffffc0203820 =C2=A0 lr: 0000ffffc020380c spsr: 8=
00003c9
>      > EL2
>      > >
>      > > Could you please disassemble your hypervisor binary, and see
>      > where the
>      > > exception exactly occurs? Do this with:
>      > >
>      > > aarch64-objdump -d hypervisor/hypervisor.o
>      > >
>      > > And see what code executes behind 0x0000ffffc0203820.
>     Alternatively,
>      > > you
>      > > can also attach the hypervisor.o.
>      > >
>      > > Thanks,
>      > > Ralf
>      > >
>      > > > =C2=A0sp: 0000ffffc021ee40 =C2=A0esr: 00 1 0000000
>      > > > =C2=A0x0: 0000000084000000 =C2=A0 x1: 0000000000000008 =C2=A0 =
x2:
>      > 0000000080003580
>      > > > =C2=A0x3: 0000ffffc020e170 =C2=A0 x4: 0000000000000014 =C2=A0 =
x5:
>      > 000003ffffffffff
>      > > > =C2=A0x6: 0000000000000029 =C2=A0 x7: 0000ffffc0219d30 =C2=A0 =
x8:
>      > 000000000000002a
>      > > > =C2=A0x9: 0000000000000000 =C2=A0x10: 0000000000000000 =C2=A0x=
11:
>      > 0000000000000001
>      > > > x12: 0000000000000015 =C2=A0x13: 0000000000000001 =C2=A0x14:
>      > 0000ffffc0219000
>      > > > x15: 0000ffffc0015040 =C2=A0x16: 0000ffffc020d1fc =C2=A0x17:
>      > ffffbcae22826688
>      > > > x18: 0000000000000001 =C2=A0x19: 0000ffffc021e000 =C2=A0x20:
>      > 0000ffffc0219000
>      > > > x21: 0000ffffc0200000 =C2=A0x22: 0000ffffc0219000 =C2=A0x23:
>      > 0000000000000000
>      > > > x24: 0000000000000001 =C2=A0x25: 0000ffffc021e000 =C2=A0x26:
>      > 0000ffffc021f000
>      > > > x27: 0000ffffc020f000 =C2=A0x28: 0000ffffc0218000 =C2=A0x29:
>      > 0000ffffc021ee40
>      > > >
>      > > > Hypervisor stack before exception Stopping CPU 0 (Cell:
>      > > "Raspberry-Pi4")
>      > > >
>      > > >
>      > > > Please suggest how to fix this problem.
>      > > >
>      > > > Regards,
>      > > > Sai Krishna
>      > > >
>      > > > --
>      > > > You received this message because you are subscribed to the
>     Google
>      > > > Groups "Jailhouse" group.
>      > > > To unsubscribe from this group and stop receiving emails from
>     it,
>      > > send
>      > > > an email to jailhouse-de...@googlegroups.com
>      > > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > > To view this discussion on the web visit
>      > > >
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-96=
66-9093a0b76300n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76=
300n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/3e=
6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40goog=
legroups.com <https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938=
-4da0-9666-9093a0b76300n%40googlegroups.com> <https://groups.google.com/d/m=
sgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com=
 <https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9666-9=
093a0b76300n%40googlegroups.com>>> <https://groups.google.com/d/msgid/jailh=
ouse-dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com?utm_mediu=
m=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-=
dev/3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3De=
mail&utm_source=3Dfooter> <https://groups.google.com/d/msgid/jailhouse-dev/=
3e6d4f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Demail=
&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/3e6d4=
f38-5938-4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Demail&utm_=
source=3Dfooter>> <https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38=
-5938-4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Demail&utm_sou=
rce=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938=
-4da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Demail&utm_source=
=3Dfooter> <https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4=
da0-9666-9093a0b76300n%40googlegroups.com?utm_medium=3Demail&utm_source=3Df=
ooter <https://groups.google.com/d/msgid/jailhouse-dev/3e6d4f38-5938-4da0-9=
666-9093a0b76300n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=
>>>>.
>      > >
>      > > --
>      > > You received this message because you are subscribed to the Goog=
le
>      > > Groups "Jailhouse" group.
>      > > To unsubscribe from this group and stop receiving emails from it=
,
>      > send
>      > > an email to jailhouse-de...@googlegroups.com
>      > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > To view this discussion on the web visit
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a5=
9d-812557f8162an%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f81=
62an%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/bd=
aa1499-4532-423f-a59d-812557f8162an%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40goog=
legroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.=
com/d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegro=
ups.com?utm_medium=3Demail&utm_source=3Dfooter> <https://groups.google.com/=
d/msgid/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups.=
com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msg=
id/jailhouse-dev/bdaa1499-4532-423f-a59d-812557f8162an%40googlegroups.com?u=
tm_medium=3Demail&utm_source=3Dfooter>>>.
>      >
>      > --
>      > You received this message because you are subscribed to the Google
>      > Groups "Jailhouse" group.
>      > To unsubscribe from this group and stop receiving emails from it,
>     send
>      > an email to jailhouse-de...@googlegroups.com
>      > <mailto:jailhouse-de...@googlegroups.com>.
>      > To view this discussion on the web visit
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-ae=
e5-d61d8ebeb141n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb=
141n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/60a06afd-9ddd-4304-aee5-d61d8ebeb141n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/ff5f75fd-7b70-424a-ab0e-5=
37d4242afffn%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/ff5f75fd-7b70-424a-ab0e-537d4242afffn%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c439d69b-d40e-48aa-dd34-5b72f0ec9549%40oth-regensburg.de.

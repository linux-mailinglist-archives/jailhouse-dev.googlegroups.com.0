Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCNPUHVAKGQEXIFTQBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F30D82191
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 18:21:29 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id a5sf51924901edx.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Aug 2019 09:21:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565022089; cv=pass;
        d=google.com; s=arc-20160816;
        b=HLJlxcUsJDVEpmAY+2WaDijjO1YoajlBq4p8fZ+P6VmBVgfwTMES8ZXAh35rPqE4Qr
         gdJxtjJ2yBCdsgqdoLKNGoHEMq6A+dQnXcTS840WkxXkxOghJm7swe9VNzqn4PT4wF07
         N8pYj+or+9n2H5IU39/M8QeAEPByOrwr3CITMdFnbYGuXJEGOCTq9oznmzsCPEx/2Jb7
         UGQ8rLILupzOvqYL0Ov/WbrLDD+eq0j5GQt2Xl+74f9+MFo5aVe0VGQznMWCoZ1tVRx3
         wWTo+V9mQF/8Se4YBfFNx5p1mq5OxBPf8zmtFPe9hf8dMTn9ZR8osYOrVR4sbMpy7iS9
         KjOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=aBx7TfF/Z7+1/VKVYfxaexVbHcr9kOqHjGUrGSOqZoo=;
        b=Jx9In0yzCd5g1fjkSnjhooh2HZGecPVGg0A8gyLPbDbDSjbkkZGxWzoXEdiFVRxskA
         4yBKUb5YpTUKadDNtbyWsa9p5+3LGrbR/kJ7QcGlGJkV1W2yQPXnAEPMIDDQdlQ7XtKE
         Ag99n9grAfMjClitVijg2OJ+vjXGB/x+HJKN9O6BmoCv7kXxhHB87M306Bhc1FR3d5gW
         wcbIWMN8tb6GtaEH6VFPd3UURI3rv6WXcSENNsevziITogFu5e4FhP89moBjF5cvmmw5
         HT6LcnrhHEwQP0pgMkSt33aPFPSglr+CaL5kuWFY08QhLy6JVBZ1MR+PpqtSfzK7bZeV
         KM4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aBx7TfF/Z7+1/VKVYfxaexVbHcr9kOqHjGUrGSOqZoo=;
        b=K7jnVnPINBa+pvDQVKtiBWWL9mrHbabGklVvx6hPDawIPKnXuZPQpnWLkzyZWbUyem
         kEFb4bKaBREVPCsAWkwqbG44RJsHwG9RmHOTmbWX6GOrnc2qLsqrddQte9DuvbFpMp/b
         k9eea5ZYK6bHBNZq7LzMICpCIqmIV4Gf2kL6KYA3PAatYOqBD4aSG3f3Q08rZtSBUkNh
         dCBX9q0eSQelYUyS1Q3ANNBELK4FcWdPnr/qzB8480m2xlFM5MLXL969HboLnJ2aIj3l
         Rj3fbM2YUnOILGVyXJBukM/zaykZA/RVIx5sUrLxPNthP09yaXVpLBj8ueI1MBMe8ZkB
         Jnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aBx7TfF/Z7+1/VKVYfxaexVbHcr9kOqHjGUrGSOqZoo=;
        b=flPeynrtYvFcShXDIXMgckOx4SgcyNd/ItLluraYF1ZSQ2SvH3GbmEy3ck9SywCEL4
         20+h5JW3Ca3tNfyX4pOErVatRr/dYvZJ2Nw70JFaUa2e45hFzCJbwHBlbCXOUNhun1Xz
         gJOugO47wMxOLZFWBKGKkmkEYsKtNx4F9A6J8qz/7EL2WLSfbuGLTbRb9wXlaG5FlL4H
         IhI8ZQsUf56HoNZx/dh/tiVZnv+UTqpETgZkfGBIZQ53hXfoJ0PJ0DKuKpcvAe44EFPK
         zhavGI6obfvves9SzUZnWX9GQxA+R2A1Uo/6ibnuicYE+vPhX8g05KofpjQvKlcBFihR
         RJzQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWVCYbNWQ97O6d5c3gJe+hmzldanI70EeXTfssy6vAHhmi9lGJd
	xS7j5J+XcbTzwNz9BMCrRGQ=
X-Google-Smtp-Source: APXvYqyjiIWWtmIFo2tjfBWT0AB5bYSryr47r90ZFk+qnAwoLOBVQV3eagzCdLR9BbKE05EvkqiplA==
X-Received: by 2002:a17:906:7e4b:: with SMTP id z11mr120980321ejr.214.1565022089351;
        Mon, 05 Aug 2019 09:21:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:8052:: with SMTP id x18ls19312007ejw.10.gmail; Mon,
 05 Aug 2019 09:21:28 -0700 (PDT)
X-Received: by 2002:a17:906:85d7:: with SMTP id i23mr118211863ejy.119.1565022088608;
        Mon, 05 Aug 2019 09:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565022088; cv=none;
        d=google.com; s=arc-20160816;
        b=NRmvRqfvEU742LaO+r75CD0fpz8e8gatoBPEuyT+fodXIJf4f11efTsIvNrhtHAwNd
         JzJ4ft/pMIOpwnCA4RNebIFjWAZEYtuKvAxvBv3lOTRyZDTT4g6PqP5909cPISaTL/TI
         70JiNRsf/8okVJBMWNqnyUeSt0otCc3VIn4YDWEko36I29CZAsY7A0xq4VsXudzRHRJ4
         TspNasGU2AF/th/+qj5KK7+Gr2ioRB4CYXD0AxlzMkKupCfSDCW9YfduG+Ngr6hI7XTm
         +urE1evFv3p+Xqxo/ehmp9V8YcQ4kHC8i2D7nVcu/bMvRTqMgVgKfGJItjGrEomO6gxb
         k0bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=tdpgr6Q7S8e/qSWis2vIOe5tdAvP5tWlnJYoC1h72+c=;
        b=CgzBSmkojK5J2lfG2co9Ruv9yZ9SktXXaCH5GUiJZ/bV3LQz7/LHNihLz3iDMU7hhm
         w0LXNoN+ulB74ucLkbEVB00sGU8kn+NyzgwsknOL2aj062MWPUG3hba+ZIMMJRSkCFu7
         DAKPEhq1uLyFkcYdbSNvKMDml94oTsGw/gBqbxegqCHEUybbyiNUKFoldrog2Hp5c5pR
         Odppd85g/zp5mb6wxRFOXHY06J4suSGpVJ/p1QCAMCPRb+7QcFfkMKjYALUADOnUU8Vo
         dOevDXX4vN9btiEqEPFVH/pP5RK61EZ+8/0JhTQmMEx/boxaTpcPPNang7K9KEgKoa1m
         xESQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id jz14si3926170ejb.0.2019.08.05.09.21.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 09:21:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x75GLRC7004775
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Aug 2019 18:21:27 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x75GLQl8012440;
	Mon, 5 Aug 2019 18:21:27 +0200
Subject: Re: Problem with IVSHMEM on Bananapi
To: dianaramos007@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <15e809ef-6d04-4df6-a706-7fa43e7deee3@googlegroups.com>
 <f6e7c240-8686-aeff-1167-a8350e0cb03f@siemens.com>
 <0d5266f5-700e-4002-bd8d-4f3f6f65677e@googlegroups.com>
 <64ec235d-fe28-e181-7c7b-c00956fea706@siemens.com>
 <389dded1-c061-4966-83ac-6e1176dfc152@googlegroups.com>
 <22c9aeae-ac3c-b07e-da80-82bc6f153dcc@siemens.com>
 <729af1ca-261c-4f43-86a5-4582753cd864@googlegroups.com>
 <7e6377fc-e8af-c947-8218-a435a065a597@siemens.com>
 <0a03b7bf-fcce-4de2-9a06-bb495cf47bb7@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a96c2d69-3449-b4e7-db1b-bf7a68708137@siemens.com>
Date: Mon, 5 Aug 2019 18:21:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0a03b7bf-fcce-4de2-9a06-bb495cf47bb7@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 05.08.19 17:43, dianaramos007@gmail.com wrote:
> =C2=A0
>=20
>     Basically, you have to replicate that CCU block above a few times, ad=
just size
>     and start addresses, e.g.
>=20
>     {
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phys_start =3D 0x01c=
200c0,
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.virt_start =3D 0x01c=
200c0,
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.size =3D 0x10,
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.flags =3D JAILHOUSE_=
MEM_READ | JAILHOUSE_MEM_WRITE |
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>     },
>=20
>     in order to define a region from 0x01c200c0..0x01c200cf, permitting 3=
2-bit
>     accesses. Such a region could then be assigned to a non-root cell as =
a whole
>     (breaking up sub-page regions on assignment is not possible, in contr=
ast to
>     page-aligned regions).
>=20
>=20
> Thank you for your response. That seemed to solve the unhandled traps tha=
t I was
> having. Now I'm having the following when I load the bananapi-gic-demo ce=
ll:
>=20
> Cell "bananapi-gic-demo" can be loaded
> Unhandled data write at 0x7bfe0000(1)
> FATAL: unhandled trap (exception class 0x24)
> pc=3D0xc06c770c cpsr=3D0x20000013 hsr=3D0x9000004f
> r0=3D0xe0184000 r1=3D0x00023080 r2=3D0x00002134 r3=3D0xea00000d
> r4=3D0xea000005 r5=3D0xea000005 r6=3D0xea000005 r7=3D0xea000005
> r8=3D0xea000005 r9=3D0xe0184000 r10=3D0x00023038 r11=3D0x00000001
> r12=3D0xea00001a r13=3D0xddf0be4c r14=3D0xea000005
> Parking CPU 0 (Cell: "Banana-Pi")
>=20
> This unhandled trap seems to be related to RAM.
>=20
> The configuration on bananapi's file is the following:
>=20
> /* RAM */ {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D =
0x40000000,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D =
0x40000000,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x3bf0=
0000,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILH=
OUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_EXECUTE,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>=20
> And for bananapi-gic-demo:
>=20
> /* RAM */ {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D =
0x7bfe0000,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D =
0,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x0001=
0000,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILH=
OUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,

Loadable does not imply that the root cell will get access to that region
automatically. You also need a memory region in the root cell that covers t=
his
area. Access to the overlap will be controlled by the hypervisor safely, i.=
e. it
will be taken from the root cell once the non-root cell starts to run.

You can see this pattern also in the existing configs in the Jailhouse repo=
.

Jan

> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>=20
> By checking the /proc/iomem file, I can see that there's a region for the=
 System
> RAM from 40000000 to 7a3fffff, as well for kernel 4.13.0 that I was
> experimenting before. I have two questions:
>=20
>  1. The configuration defined for the RAM on bananapi's file exceeds the =
range
>     defined in the iomem file. Although the gic-demo worked with kernel 4=
.13.0
>     (with the same region on /proc/iomem), can this be the reason why I'm=
 having
>     these traps?
>  2. I've tried to replicate the block and adjust the sizes and start addr=
esses,
>     like you suggested above,but I kept having unhandled traps related to=
 the
>     gic-demo's phys_start address. How can I solve this?
>=20
>=20
> =C2=A0
>=20
> --=20
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email
> to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/0a03b7bf-fcce-4de2-9a06-b=
b495cf47bb7%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/0a03b7bf-fcce-4de2-9a06-=
bb495cf47bb7%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.


--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a96c2d69-3449-b4e7-db1b-bf7a68708137%40siemens.com.

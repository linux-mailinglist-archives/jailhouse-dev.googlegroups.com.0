Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBVXQYXWQKGQEBD4JLRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA07E2E2F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 12:09:27 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id 7sf12660254wrl.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 03:09:27 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1571911767; cv=pass;
        d=google.com; s=arc-20160816;
        b=pmTuE9u4zRlw6fDLdxYzwDOdXIdWiu35YSSxHNi/bNg8RR9GwfH/JHcliqp2YY7vWr
         36NJlEk2tdBMV0czBhuFpimcTpK1vrGTEcqQ6YyqnoVSJbsQ7gOGkd/bnk/mhEImTQr8
         +U//QRiWUS0FlIaKkqq9TuPl+9Y6sjb8F94E07myiDYzMv2cOP0Tql3yrWn4cdEYsx8s
         xoI4t0UofXG04ykiTm3zqqIOHAZUKILUN+cnfC5SY8nx34inA0f8zkNk+8qzYY44t1h8
         a1wSXaQkrd4s7VipUBWm8tdnXdnxqdOznXC5/fg1s+be7eko61JLgZPwwUyWpFT+68Mr
         aS4w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=AP1/hI64I9g4ke66RJhiNtSUJhOpJezz/a4DkRPsa5Y=;
        b=IdAttzjWsvLN0w57EcYS5joOLXV/+7eyd38KOXJ68FAiSkEQNuw823yE3LAxipvXn4
         WHhwSNr9I7XGHwhGdpeTMUF1fvdYJmIoOlYhkGCeIMzZ9AmOIm4739ITwu4R2sgSNzwQ
         1LFMZeRGZranZe5trVwbPw+NxzxbxbScjXpUkrR4SieiqbHFRFA8ioxiWKY5ngEJUYA6
         ED7SpPevWqTs2WbJq+LarB+mvJ1l05nXNYAnk1YrHIq6glb29ldXKFXVJ1dc5Gd1+QeG
         pnf9lLA+620XysazE0IKMeAoKHsKTNS0nWdKZLxE5VyKc/Egeyl1xe2rR4rwEegMTZGN
         x6AA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WOLOVT+k;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.78 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AP1/hI64I9g4ke66RJhiNtSUJhOpJezz/a4DkRPsa5Y=;
        b=SuVMiUiY/JZvev17AnbAqZX08pW6z3W1R+Kff8fT8qkb9AiUx762HU80bsHXRod/Xa
         nzAES3QYv7+9vsRqKax7lJbW/taqnPkCLIhH00zgB3Ig3zG/VHiw7/tMwkLWeIPEUfH9
         ggd+ssZlG0Q4zZhynN3H6+uVd6jKZLL8aSuWckuUWeUZPDF3iVOIBpFuzO+hY1/cOn3N
         ymU11mtWHIG+eHd3yAMfeKVC6c40anW3bHZAgLGT0bNmzIgVMB6/F43HOweusKJZ1Hii
         aA8dgQ+9qNMwZYkG+amilGEKWVu3Dnp3H7iqEts9tFL/ubmGn4lkhNwqvydtfuPiie0M
         3KQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AP1/hI64I9g4ke66RJhiNtSUJhOpJezz/a4DkRPsa5Y=;
        b=DX6f8J9muF1EYiwNmI+LVgJ92Xb9NGjOyJYwXLMS5G1AfPh9Dxvm4H78vvHgmABcU7
         WJn9c7C8nBcQSIL4Mu8qWJQpX5JkT5sn4UnlqXzINV5edatvZpJcjp9IMX3Gr1TUw1OZ
         U52Gn9MnzxHGdltByasfp6gy3BuZxm+KidwebixUTswB+HKeHZru0WIo/n+N1vQfiS46
         yHW971HkKVQpbuFpxLX3o+6drnlN5lh5J+FdHLCzXKdFI0yLaKpAhKrcImz0ZzhZhw6B
         U/z0dHldQ5uO9gIkNcNL6HBaXOZb4p9LtTqT2jRlXntFhYRtmHkIUNZAEMGrR6UflVCf
         GuXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUJVJU3SADhdvyG97UDbY86Dm2PtzkbJvY1TDHzcT3Fc1YAF62V
	O8FuRbuNHnR8Zsb0196AMJo=
X-Google-Smtp-Source: APXvYqwPVXNoN+BTkpO2TVwvabrU7Q+DZav56D1kQ7ofT9dGW2ImC1HuBuJSk1bZE2IwEfPzny4/0w==
X-Received: by 2002:a05:6000:11d2:: with SMTP id i18mr3198844wrx.109.1571911767080;
        Thu, 24 Oct 2019 03:09:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c151:: with SMTP id z17ls4041477wmi.2.gmail; Thu, 24 Oct
 2019 03:09:26 -0700 (PDT)
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr4339748wmj.88.1571911766488;
        Thu, 24 Oct 2019 03:09:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571911766; cv=pass;
        d=google.com; s=arc-20160816;
        b=cxZSZrwNiOHHQiFRs3kEpBnolaAmFz0fGUcobAohdrLf1jTy/9QYY6lqIEZ04HD4UC
         kDm05CvWs0TCipv6PZ9+zBpCQ5G4u3u54FNH9kAOroJjXXIdWqD5v1PNNa6WBMkcLIFR
         zNUvOBbppvgccnONsgojmEcpr5FqLZNByL4JN2iABoie4rXhQg6ser5xXay6fX7Mqhu5
         rw91GHLOifaFGUSOmwHl09jZpIxcxargpubxSWRy7p9eY62RuKR/FAN+MWgJMCrSf3UN
         ifjHeh8wnWiZPC82LOv+wSeL18wvsmGS6DRy9RChlH02XPAzvxk8zBCVMG9+xbXLUuGz
         O/rA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=Adg2NL37ulQXuj4SLFhLTZ0WFYlS9zbMDRQCOjR1m50=;
        b=WG+kyxtZnvTUIKvIzDaemMR+hTejxtRDrzHWdjkHu6vFJ+UT8LoYl0U8oKMbFrRW1c
         /tdFaa0bompvXv43dIK0JtGtmhP6zmNquceM29+GLKZ+GPrz6D0kfn9mvljfID8B6oec
         nm/DuDoyBel5+elsaDRP6FaxS9Xfc+VuOlRhNpFyBQfPiz4yDIu+Pvl6MTKBmlddEIln
         LJCJ4Y9AESVo5fdt7Q8DvTqxUsMDdy+7bJDN7da4L842msE++lzhWOAIsLuXqGUxlRjQ
         f8NqSWI6BBCVcmGkbkhT3HMJEYgpWEJlW7IaPf+hg4VZgclzqaGwOv4fNTyw0BpqeHwd
         uLRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WOLOVT+k;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.78 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130078.outbound.protection.outlook.com. [40.107.13.78])
        by gmr-mx.google.com with ESMTPS id v2si100783wma.3.2019.10.24.03.09.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 03:09:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.78 as permitted sender) client-ip=40.107.13.78;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDMPpfiR5Hf4Hp1qGzw0zDjPAPye1JdDvI/bv3b3+KyIlnsQUCywFpdCPi0rmhO+YYY1cPDd6HXfZjWfkHGdc3+KoogF0XSQPDStrXDOk3cK+1ssYc6gRGWoYZmoktubnmZqq6t0pXakf/qXgSpeUSBqOinrOG80GpYzEurY6rddl3h1ot5A/nlqwuUrBNH8YYk3brx4PQYimznvA0gEoPDMLZFimYFnBe37N/diquFlk/LecDgIf6+C7i/oOcm0JDtkwb7taIWbS3lBTJKQZDpHNCN/x2UVQ+Fjj6GJL09KyrUg99jgzDHFSzQo6L/zPVE81HfC/4xfYN9mKCpY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Adg2NL37ulQXuj4SLFhLTZ0WFYlS9zbMDRQCOjR1m50=;
 b=Yj3HtDNzw7d6IVGMx0s7eZ83geLDrgrm7KTaMrOAR9UVY9eRx5dI1jyulduMzJMynQkrPVSX0ztdiXDsXRwRY2TZPHTwudntYKQbq7heqJr4cpKoYsZgLzM4bRGMEecYx08lZBx8dsC5gYkT9CtmSBCMCm9X5tkVhF1YpsUHsmqY7B1UB6B5eiKq/oKpldCuyBwqwR/3lenyISESCOszHxGp01d1keq6maorXCQL51HSqq9/dAehCs6WOrJfjXNX78ypm0eLMo5772YZjhH8l0s23ba++JqiPPZT+hsuYdH7mKC1vUd/ppjlRYNt7XT16fgnBbALHwc8dusGhN6eow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4059.eurprd04.prod.outlook.com (52.134.107.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Thu, 24 Oct 2019 10:09:24 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11%7]) with mapi id 15.20.2387.023; Thu, 24 Oct 2019
 10:09:24 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@web.de>, Lokesh Vutla <lokeshvutla@ti.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: RE: kernel build failure
Thread-Topic: kernel build failure
Thread-Index: AdWJivdyV76vPMKCSSqxB97kzzidxgApmByAAAhBuwAAAA4tgA==
Date: Thu, 24 Oct 2019 10:09:23 +0000
Message-ID: <DB7PR04MB4490DA1071D41C031DA58A75886A0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <AM0PR04MB4481A5E90644042A0E72DBB8886B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <5cbb3132-fc13-d4ae-9e44-bf83b6d4f70b@ti.com>
 <f7366e52-3978-30e5-7e19-68571f011b27@web.de>
In-Reply-To: <f7366e52-3978-30e5-7e19-68571f011b27@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 35760255-534b-46dd-cc7b-08d7586a3ee4
x-ms-traffictypediagnostic: DB7PR04MB4059:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DB7PR04MB4059874F2A5CC54C9F3DF843886A0@DB7PR04MB4059.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(189003)(199004)(81166006)(316002)(86362001)(81156014)(8676002)(25786009)(33656002)(966005)(256004)(305945005)(14444005)(55016002)(44832011)(6306002)(9686003)(7736002)(6246003)(110136005)(45080400002)(4326008)(478600001)(66066001)(229853002)(76176011)(7696005)(6436002)(8936002)(52536014)(2906002)(6116002)(3846002)(14454004)(186003)(7116003)(71190400001)(76116006)(71200400001)(5660300002)(74316002)(66446008)(53546011)(99286004)(6506007)(3480700005)(446003)(11346002)(26005)(102836004)(486006)(66946007)(476003)(66556008)(64756008)(66476007);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4059;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NB5wHfXiNSFxofqzxClaBacpx8liL5aL+vb3EGjVpG8if+WVLP2vpqp/q69YowvY6PWG8dFuAjIieRMmcZlHuhdLA5nfrzG49T5rU9uhMeFUqpKRNxW4j4mUdkm55Y7QSlcqM0Y4rLkgesczcLxtXLvNB43vWi4A0XgqtpkWKmBkJrRkRk10ri6lHmpN0OgQMlOByb56KGgSMQ4/lE/hE1rjwdwZDyKN1RTj0vY7bc8YKZoatFEu26jND6Y7A4ECMzr122TY2v6l8KnWlkSLkM5oTKCMkn4KsR+7TTp1Xirhi7mrj9XcFKw3KHhYzBuLT5PRqNG2BKSrwV7EVg/e4DR6wV8GrSx5DzPnkmnIXkRs5TaSYN06spuHp1cxuMHCSFGLUWomeJtq1q6O9My4zIm1oCsOWDEBD51uJLuqJzUfcCac1CcIbwat4bEIcvtHS8G40f3qKHhJ3rNuIcUUvTHvKsZ/wmpG+GVHu6VtD/U=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35760255-534b-46dd-cc7b-08d7586a3ee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 10:09:24.0254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9NM/oWUmLTYSSPjHnkQtp5QvvBRGrwRHlsUK9lFFCWO2MA7d/sS3r0f4p0fLR6zvl0Hh0gM3PYrFrzZmD63LLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4059
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=WOLOVT+k;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.13.78 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

> Subject: Re: kernel build failure
> 
> On 24.10.19 08:07, 'Lokesh Vutla' via Jailhouse wrote:
> >
> >
> > On 23/10/19 3:47 PM, Peng Fan wrote:
> >> Hi Jan,
> >>
> >> When MODVERSIONS and ASM_MODVERSIONS defined, your
> queue/jailhouse tree will have build failure for ARM64.
> >>
> >> MODPOST vmlinux.o
> >> WARNING: EXPORT symbol "__hyp_stub_vectors" [vmlinux] version
> generation failed, symbol will not be versioned.
> >>   MODINFO modules.builtin.modinfo
> >>   LD      .tmp_vmlinux1
> >> aarch64-poky-linux-ld: arch/arm64/kernel/hyp-stub.o: relocation
> >> R_AARCH64_ABS32 against `__crc___hyp_stub_vectors' can not be used
> >> when making a shared object
> >
> > allmodconfig fails as well without this hack. We are also carrying
> > something
> > similar:
> >
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fgit.t
> > i.com%2Fcgit%2Fcgit.cgi%2Fti-linux-kernel%2Fti-linux-kernel.git%2Fcomm
> >
> it%2F%3Fh%3Dti-linux-4.19.y%26id%3D6c809904ef4483971166142a12302c
> 8a052
> >
> 2e23f&amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Ca21a8c0c9486411f
> eff908d7
> >
> 5869857b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6370750
> 825381915
> >
> 48&amp;sdata=9QXjDYuOkKHrAyoEbIF29oI9a%2BSkulsFtNFK3%2BLOy6M%3
> D&amp;re
> > served=0
> >
> 
> Cannot reproduce quickly with gcc-7 and current queues/jailhouse. Do I
> need >=8?

I am using gcc-8.2

Regards,
Peng.

> 
> Also, this looks a bi like it's a limitation of upstream /wrt where you can place
> your EXPORT_SYMBOL, no?
> 
> Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB7PR04MB4490DA1071D41C031DA58A75886A0%40DB7PR04MB4490.eurprd04.prod.outlook.com.

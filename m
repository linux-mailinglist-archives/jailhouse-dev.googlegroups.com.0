Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBAPGQPZQKGQEJMFFDDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A2517A565
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Mar 2020 13:39:30 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id v30sf1912436lfq.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Mar 2020 04:39:30 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1583411970; cv=pass;
        d=google.com; s=arc-20160816;
        b=jG22PqcnxqlGi0BTGpPANx/NdDN+L/Ew6bKHkHAgOUMKrzkxnBrEojWFXRJSTew3dK
         4ioc6CBlXy/2XTXijrarFjGEJzJpXlCYku2JqWaYtOH8XU3XfEtpPsdwfs5MIGJ3p1qd
         SGYgAX470dFWnzGP+H3rvmbfmWh860wl1eubZWgY/B3f62KcTLGWP4OOyYN2KeSf7cec
         8PAGG/Lsai/8b7yssieAIaGKJcK9aQg2D2hCSdfctgdDXMAGjup6MQHIh6QA4ZdYYwwf
         t0/0aRbJCR8X0OB7CflXU4Jhdo40PNN5PVM1j49BE4fmXMKLknQ31RoRbq54Qbb6noi0
         ws9A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=bcJal8rrI2UKMrq3ltdvEN+I8DsHprG3HWgpCgzm0ss=;
        b=xdpvZTKCog+6EBTnrTphZ5vp52xNEjqJ+iUCKztNyVPvWFTl+dZvFV/lyzvN5/c0Iq
         vj3Mb8daMtQQDmdrmheFGc2DujGury8aeuF38RCul1euYouvbaeSuK6oenYmILrQnyLO
         nUvse1vkTXiKxvu3bxaENtn0kDDGf1TENfHeFaPIojUn9vbVeZ+h18Bk6cA1RChiv8/F
         hxB1iWNQjY0XkO7Ta3PxQw6vrTCnBBFdK0eSOTb5TxBacnphn8hWEKsTR6M7MquU0/wI
         mcg7/WJe29rTX02maARG58ef+q7mx0g7FXeu91LvQfJwISbRDjf7LSlejsZLajPd/wBm
         L4Pw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=M7dTlCqN;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.54 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bcJal8rrI2UKMrq3ltdvEN+I8DsHprG3HWgpCgzm0ss=;
        b=cNMr2+PmGviezMOQUdHglTF2fKmKAVS9LdtndV7AiR5AL2mr83ERW/7PQl+lWU8J49
         e9QtOFiX18o64G2i5KYiku1MSxqRP2T7EVbyXtyPMFvbuhNLoRVSPLurAyiECldZTMAJ
         UJ+lRJ309pdYIwj//vKOajEeKhw/S3uJBt/FYndOgMv/M1f99XPdzN6b0vB0IRupvXCJ
         ju8+OpqMQYK3qV0xhxQEDPKkxHB+gRT2l7z5JpTrVYV5kaG7mGMVty4UHnSpbqx7MD08
         9MSU9wHPwd0aNsD31YcvTZ4twz7bKROmI2xTWpRSSpEnu7xHbiHNX7PrKD58umWh2Kp9
         jl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bcJal8rrI2UKMrq3ltdvEN+I8DsHprG3HWgpCgzm0ss=;
        b=rmY55VZwV+9Kr11hRFuDlkHAThHfYg9IdM7xlYH4C1qLFjXg2Y6j9sp6czzk2qRqhg
         i0+3Y4BJ13jMYfRWtWGuBtlhPjZCkejEP8NrwFfstU6c7YeO7hYwmZWj553h5Q04bbgE
         O5W6YpIf45stqEzjLmyr6aOPb5JiPEitmy4zuBS/LdVSULIOXIX2uXHhLNLaDoXfcSdj
         H3HUIVdb60J1IdXBDt/2Ly/KX+KT57y3FKUpJnD+8EwxeIa366aIWvIv9SIBgZEWTQC8
         VtoJTGQzP6sygjH0En2LpnI2tLFPFV4hBMe4DnVv8OgdGmGupld9AD52pkFtQGOv35mR
         VlXw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ39v2Tzdsx3t06jaeDE40FV+pBPGdg79RrThA05EF9t5pLwB11Z
	k50PkKveDFND3PedI23wxe0=
X-Google-Smtp-Source: ADFU+vvkOwaFvXJ0jXqIjgqOLHYpTOhBHPWhpB3NakVJJgOI1Iv8vh5a0qOYt55xCvy4EkXIqEZuRg==
X-Received: by 2002:a05:6512:50f:: with SMTP id o15mr5199670lfb.216.1583411970023;
        Thu, 05 Mar 2020 04:39:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5476:: with SMTP id e22ls46536lfn.7.gmail; Thu, 05 Mar
 2020 04:39:28 -0800 (PST)
X-Received: by 2002:ac2:5198:: with SMTP id u24mr5516459lfi.137.1583411968690;
        Thu, 05 Mar 2020 04:39:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583411968; cv=pass;
        d=google.com; s=arc-20160816;
        b=CfCSEmyaL+MDtXQe3ehdkbZMgEz7K81NzafcNH1Qde/dVhEN2qh3jE2AXgJsLnFaR2
         7AXbdSDSBui9uyE6lKp/e4D35GlPFmGiLJG5Jzzf3DjaOmEv4ABO9rfG9BrSPftOYa53
         eKAmzXdmWB7WYO9e2RpOy4mgSUKwwyDk0MjgQRVToMYXDWFUD6AIWA1+HV9qm51jG3JG
         ggbpElQXaK0Ds9J2GVk8rSwc7ASD+NoxN8zdNsUPmKlostT6I/vxkVvIngT4O+aWsxzO
         NhvQPQ3wZj10FRnzXGR69N14ui1a3hjzjlvqBdKhUUB/0mVDt+j6UdllSmaNvhJd69D0
         tpjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=jzV8yf/VqSywXfgM5Bxt52ebk2hTLmkuKdCZjthFz2s=;
        b=WMTk3jwsOBdxcYRJxtqZKbKA1wh9aoBbtMaQAUx64juS5ldNMlfVq2NyykL8GXb6aL
         om8+g0trLhy1CaXWZ5bU8IFy8uv3jMUVCQC28wxJaxgECJy+zHMxce/PiZxZUVTUiX0F
         +FjMENpokxgI1UfiGbJS9HDDieXuJN0njfcAXCpzti7Wk3OFWENrSW3+wb3/RCyL7Xu0
         1b2qKxe5uzhUT54YcN6Pj1XlSp+QB2Vdi8g7Hj+Tw2aW5IcxadRDeaHbNCRPW23Qlhbl
         OwpKBl2PP6PKWQ5TiHdx3W61tLCZukFZZvWl3dT1X+TN0xC4dNDqi7D2vgGQJdTIIZ4D
         5iNw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=M7dTlCqN;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.54 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80054.outbound.protection.outlook.com. [40.107.8.54])
        by gmr-mx.google.com with ESMTPS id r20si160921ljp.5.2020.03.05.04.39.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 04:39:28 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.54 as permitted sender) client-ip=40.107.8.54;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNguIN9Mjygz5FwokCAMaqXVN11qidsZQ4i1shYhtcVBYEIrQRuEtkw9etRsEYM+Ukdcn8SuzSVttpeERCvH5xM/F7x1vP4ATCUQaFu9tyZ5MJophdmx9gY6m0RCcMvG5UTz0MNsJCcdfKxxjMSfXgRaztXwWgUPuIWw2um+DVIq5YO+qUvCgVPdAB8sDW0AXzGxOQurgyK8rdYBFKDvrF6WpHgqVPorbUt3gqMxfb6/5YmtQay/8KmjnSv+hHWvJyQ1AUr6y4iAlceuSiMZDxwl+oSlKOLjWGkGKP0TvA2IVCIUuhONXIAf2ahzOV7VMnpVtE/2lp0iiS8fUw4MyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzV8yf/VqSywXfgM5Bxt52ebk2hTLmkuKdCZjthFz2s=;
 b=inwBUAOUynfps0oOnHxAMf5+nICqUlqSWLW4DiiBE6tLTIKBqi91ezjgKLV7xeAzLq8cC/FnzzJPWmqrfPp+UNu+s4/hM5E2VG4nx6vEuETs42PQTWiJmRwVLlfJVUWEk+G7x9l25nBIPpOsUeu43lx4+Jb5Ac0V33Sr99xTvbzh5DVilS2o/A4CVZxTXeO604aWOdWN9Co1kvZBZ+xaOYT1MwS88JL7gGvzM53Jpjb4ov6yN+aXn7O/WbshfIesc8nsftD4UGfZnrPn56CPBj75npOpCbhK/hELW2R5a20VpJg9VppVvy7NePwqzq5XZvA/y0lUYBVBW7qXYza/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4851.eurprd04.prod.outlook.com (20.176.215.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Thu, 5 Mar 2020 12:39:26 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422%3]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 12:39:26 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Lokesh Vutla <lokeshvutla@ti.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Alice Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 0/2] boot jailhouse before root cell linux
Thread-Topic: [PATCH 0/2] boot jailhouse before root cell linux
Thread-Index: AQHV8s8MeyXPCXd2906ktytcvBLKIag51jIAgAASlkA=
Date: Thu, 5 Mar 2020 12:39:26 +0000
Message-ID: <AM0PR04MB448105AD6E53770A3BED0E5B88E20@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20200305093950.848-1-peng.fan@nxp.com>
 <be1e8e77-522b-0238-0031-3254eea4678d@ti.com>
In-Reply-To: <be1e8e77-522b-0238-0031-3254eea4678d@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1a7010b4-094a-4058-be05-08d7c1023dec
x-ms-traffictypediagnostic: AM0PR04MB4851:|AM0PR04MB4851:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB4851A35DDA6A0B916D07C00C88E20@AM0PR04MB4851.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(199004)(189003)(86362001)(66946007)(8676002)(52536014)(81166006)(66446008)(4326008)(2906002)(55016002)(81156014)(66556008)(76116006)(110136005)(6506007)(5660300002)(9686003)(64756008)(478600001)(7696005)(53546011)(66476007)(8936002)(316002)(71200400001)(44832011)(33656002)(186003)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4851;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a9F/e6qgke31c0I/aFnNVOZbbQ27dyt0Gjo5fgxQBB4FLQ+rLJhRl6lBxYOfS99YHR10o0p1MBIlqNHz8LInQuBKahUiZZHrw1V6kHFMeHzrGwErTOojGLhgidCgQY2ythtvX/HGwyr61rJ0GsaCR9844UrfdbghT+dTP3JvLG08pkPIIjwhtIK2DSsPYASEJJi4RaMDZ8HSDCk2FMxnvEYrvhbU4SZVVYaYz7h2foADJA2Y+PIsq+yiZRVu/39K3HUsKbaqjd9LFAZtG6QxS3UsB/Zpg6MVoEA0yoxcply5vaCagdkYWXDSwiuwEZy37Eg4SQrSDorJWPJmOR2I0Z+1zBaycIe/54rU/+YGXdYBiNVYsgBs6zLMSGlk38PCvXP33qj2qY9eXJbXqdLcLKDaOW1eVC2DjO2YSGkHLCgiROJjUIG+xbIufZhFhViO
x-ms-exchange-antispam-messagedata: YX3CnHMFXybe/tuq1AF0wQ0lqd6UNKT/XkjVJqnAkbTyKD0OZiOMc8wr5MBDKKcqVWi21irLFs6HaYfGGjPPs9jyMqldR1udClM9FQoBLniMVNp2F8TBwgK1Qs+wCoDIDUAMbxZ1S4sgMg399mZMHQ==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7010b4-094a-4058-be05-08d7c1023dec
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2020 12:39:26.7576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ivw6e3uNaaWVQpzVGPKNFkC/tJv7wWilk6ZUtqEwH+JbnOcbXwufBDr/DwRBI2TRGNK2RQscENDpkv8/DTUmow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4851
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=M7dTlCqN;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.8.54 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

ailhouse-dev@googlegroups.com
> Cc: Alice Guo <alice.guo@nxp.com>
> Subject: Re: [PATCH 0/2] boot jailhouse before root cell linux
> 
> 
> 
> On 05/03/20 3:09 PM, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > This patchset tested on i.MX8MN arm64 with quad A53 cores
> >
> > Patch 1 is to align jailhouse_system. Since the loader not have MMU
> > enabled, unaligned access will cause abort.
> >
> > Patch 2 is not that well orgnized. It does GICv3 initialization, SMP
> > boot up. Then kick inmate cell and root cell.
> > Some code are hardcoding for now.
> >
> > The boot log as below, you could see root linux and gic demo both running:
> > root cell not able to manage inmate cell for now. But I think it could
> > be supported. intercell communication not aded currently.
> >
> > From test log, linux root cell boot will cause large latency for
> > gic-demo jitter.
> >
> > It maybe good to use cache color on ARMv8, but still have issues for
> > root cell DMA without SMMU.
> >
> 
> [..snip..]
> 
> Nice to see this being supported...!!!
> 
> > Timer fired, jitter:    749 ns, min:    749 ns, max:   7999 ns
> > [    0.127643] Detected VIPT I-cache on CPU1
> > [    0.127671] GICv3: CPU1: found redistributor 1 region
> 0:0x00000000388a0000
> > [    0.127700] CPU1: Booted secondary processor 0x0000000001
> [0x410fd034]
> > [    0.159684] Detected VIPT I-cache on CPU2
> > [    0.159700] GICv3: CPU2: found redistributor 2 region
> 0:0x00000000388c0000
> > [    0.159717] CPU2: Booted secondary processor 0x0000000002
> [0x410fd034]
> > [    0.191721] psci: failed to boot CPU3 (-1)
> > [    0.227974] CPU3: failed to boot: -1
> > [    0.231609] smp: Brought up 1 node, 3 CPUs
> 
> Did not look closer but couple of questions:
> - I guess the above CPU is given to inmate cell. 

Yes.

We should be able to handle
> this error gracefully rather than failure. Wondering how other hypervisors
> handle this.

It is because dts file has 4 cpus, so it will surely fail.

To XEN, xen will take over dtb, and runtime create a new dtb for dom0.

> - What level of features supported when compared with type 2?

Just a few in mind
Fast inmate boot.
Easy to support aarch32 root cell with aarch64 jailhouse
Decouple Linux as root cell, so not a must to take Linux as root cell.
Cache color would be possible for root cell

Regards,
Peng.



> 
> Thanks and regards,
> Lokesh

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM0PR04MB448105AD6E53770A3BED0E5B88E20%40AM0PR04MB4481.eurprd04.prod.outlook.com.

Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB2XCW7ZAKGQEVTIVIAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 85690165528
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 03:39:39 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id x23sf734050lfc.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Feb 2020 18:39:39 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1582166379; cv=pass;
        d=google.com; s=arc-20160816;
        b=wN41rLHTOkrt9orKyDt9aw6Q8iM5m5WyQlI3q1e/m3zmPqJv+8mzwVdh4a/+c6vxU6
         lbWK0URBja6HVn3C1TH0jtfUcih1JNq1TXMjCtcAB5gvnAm+klzuqSChO0nlq1wRKcOa
         0B4kmW1IjTvzeJRvU8HGL/fSmxMgCfRWM42zsjWVWyyt9yKgvtsnKF6P8hBMPwsmfYat
         gbbvLeQHuoY+zo1bH7icWrP/FvCvnO2s2qd0luHMi6JW5xH0fBgxeKxKkBy9qf+KQ8vj
         ANlJBwaaHBVm5npeh9aOTHa66qGGYdNM5ySZnble159GZcTS94IZeeK/ji4/Ti1xdfUG
         hqQQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=omyf8u1GAt76XFfIc1G5gL5qDItYFsd4sZDwrvlXYvM=;
        b=SgeHRz0ARvmpOaUcNtxNCCD+Qu4zsbZyKrTTXj3WjNiiXDJ+087UKF2/ZlMGmxuhlp
         Isqng4EjwLgU5hQUYMwQ5k0tbjGnQIQeF2sQJ/EM8JO7neNR2UMKA/4IEVahggMPmHTp
         fFKUDSBR5lB/Khd2FxmnKEEfm9tM6M5XPgjN+X/v/FieeobBW/ts4soTpQxUjXqBdbsB
         9NdGeYbgbHgWFdUVnHbMvv3SuZIZoAcaeqX0owwdPEXH44362HGn8HzZrM15dnBAPaD3
         aV62vtz31oa6fR9jnT/iT4WytURvL3l6/j7BV8Mci6oZCEnXkCMbtVuPfywi+THp4ffB
         5soQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="rSLPU/Ya";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.82 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=omyf8u1GAt76XFfIc1G5gL5qDItYFsd4sZDwrvlXYvM=;
        b=Et/mYj5aIFfPxh34V3SArGLHeykPMxudldrtcYv1IgTbjUvALsdjiB3988Q6bNjx8C
         vYeWzSR0RsAx7RTSRdERmA9pjpn5nzrQA5zYWRuCWlz8SkFh/Go2SQ5/dHhbrK1ba38i
         /HIQlU5828SWUjpqVkZdUa7QroIWQn9cI93E93ea/TJoxU6dVXOUWP6MXBRKrn4U/OfE
         zzSnJpxZWSXLBMLS6hmH3rNDfXBejoCs675w81w8l7rUBNLwebKwDbyD2lAYDQZaoHhK
         cKBB5utMp39rHPXu8kasPVmNY4/DIZ3DHmDR+lLak0L/Ym5puozx3dCdCGag1uaXGZ4p
         8tSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=omyf8u1GAt76XFfIc1G5gL5qDItYFsd4sZDwrvlXYvM=;
        b=iCQQ2o9722onHQnCASbBLJVxR7wRylnIz0b0Xk1sQtB/YDHCjLyn/Opq6ZcifMS9xT
         MbBUfS4wOphWlE9JUcbAEv/xU4s3tPQhiFCaW+87/E1nAp0WsUbPBQXf/NRv1AIZDdxo
         aiRkazjwkMobNSAvmp8ccXSnnNUq9FcDZ0AzxSjSRseh4D8U5XrCx5TSb5yhQfSRKADc
         vu/gpHzyrUmulQzCNxHruic+enK46nhktNnTynq8B6z0qWfCR/T/U2hgiw3ann1h4QQ7
         n9kpT7PLsbrvlCS6XlAbVxEO03qGQMfy/UmxrUbQ6uyHiGudBjH+3OqHc90mGslMNtKi
         033Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVw9jh+my3gMDgLyufQnt18NIbUj1lyRNMxSa2RNE4a3sGMy9QI
	KGROflkDVe9PPhXX2RWxiJ8=
X-Google-Smtp-Source: APXvYqynvO2pBKGNn69b97xU/XBw0ibNQaRSpfg+zYnzaHdHPmA5e2cq9Q6dfd7ujGK4HQ4sKM3tPA==
X-Received: by 2002:ac2:4145:: with SMTP id c5mr15133262lfi.71.1582166378997;
        Wed, 19 Feb 2020 18:39:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3b2:: with SMTP id v18ls2668353lfp.8.gmail; Wed, 19
 Feb 2020 18:39:38 -0800 (PST)
X-Received: by 2002:ac2:5582:: with SMTP id v2mr796091lfg.109.1582166378020;
        Wed, 19 Feb 2020 18:39:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582166378; cv=pass;
        d=google.com; s=arc-20160816;
        b=RT+rX8i5vcAYGem92NQTgh5p0oJH/bM+sMrSWoB7Y7byw8JBMZNwYARD8ao4uwGp74
         mmTI9bg0ft28KuC83gKRL5fibE99WNJpJyGm//LPJDZWOnVoyUkAtXV7EfaKqymcRXwJ
         cSVt5TqAeeX94IQbFyGZ5qy+2kTBj+BXAz10r8itBkmkH3AncgP4RZoye/+xfALMI7WG
         DZqufeSTtZoiOtz+KCJZFtU0ULg4ccfAicBK4Rykj1Jc2f3JgdPPChjTXgEOYMYQHkAi
         fwxi+OxDesIrA36up9qSad7POf7/Cs5CO0G8VKXa++TEptaqORIYoGP/bhebed5VSqV/
         RkwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=1KTOr1iP/kIAlqGvhl4DH/spxvphVieU6DFladBJEOs=;
        b=wITgP2fHWZ5Y9XRhKsON+tZtEzDoVXeHduoWU3WgqwaCztrzGtY3N629PSsBFDSCOW
         5eCgjVs+Oj70U8L5Q1Bg1voJ9lApcRnEiQ43BlpPLupmWjO94flq2SBLd87wXxhSdZim
         wKvMuX38bcCP1RU5JXEQZeSETfb1T3PKRN3PfGF6ihVX+ZTk3CVhqrHbKqqdh5lchdnz
         0EpS1YVrpKro6o1LumSWuPMyQNZfQm1chvdxKahD2sGQDrSjRj5VxYRGlswcFVCwMdkM
         KAizj54qi57FQtVRhBb9ftSDKbhQHqM2QJ+YyRlPhANQ8tzshbC7lKkbOMfBQPxp8h2y
         3giQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="rSLPU/Ya";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.82 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2082.outbound.protection.outlook.com. [40.107.22.82])
        by gmr-mx.google.com with ESMTPS id e3si89357ljg.2.2020.02.19.18.39.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Feb 2020 18:39:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.82 as permitted sender) client-ip=40.107.22.82;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzJd6IPHihFyM2hgNmdJG0qIlIp0e1rGX6FlrYlKd2j76J1gAxyuX78xNWNvXJbmKpQhwpWHP4hvkLKlunSdm/WnEezRaNjxS3yhh7NsD6RS0wbQE+5EXoLrd8Dwt/N2utcENC7T/B3ZATkNRxFQMWzrQKPLKlkOyxt8ojwofiqfJGp/65q9DCFG44JsO5xb315qW9Qt8ys/TAO1d2mJYX0EoGD2CPiJwiaLM4wAz1Rcc9yybdQHzqbFGXb063bErR7NGVrDs4ZnkXBWlIwrgTFMEiUAF7b6BZtzbb/gkM2fE24ntPhywvXiSdFtzn1fFG8vquWUSJ9ANLzgY2Oahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KTOr1iP/kIAlqGvhl4DH/spxvphVieU6DFladBJEOs=;
 b=jUawHdFPbAdkxwIbQez9CXOc/m9rs6Fui1/UY2FsGrj6fhXKf/a6bEoWAUsSW1CblnmAFaGOzXyJjtrS5BMKW91Hy72zYpab8K/fKL5ppNdp1Y0anXFUyVOQCJODdLfIowXZ3K8ORmbK8hnzr/8Mte3y/AMTUep+ghnCK60Tho8Xgercl6gdr4lXr14h91GRHpdWZ1QP3mkUV1LF5KvgIint+TaacXTdtuY3J073MIzQUy+1PzuPduf60Mg+NZAfQyy3wJn4GYbqBBnfht+S8DuAfI1QsHhHcPb67I1+4YXs41lGXp6YqNRXAmCHPYj9XsvaewGjDlLyJJg+ut4PAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB6625.eurprd04.prod.outlook.com (20.179.252.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Thu, 20 Feb 2020 02:39:36 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422%3]) with mapi id 15.20.2729.032; Thu, 20 Feb 2020
 02:39:36 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alice Guo
	<alice.guo@nxp.com>
Subject: RE: [ANNOUNCE] Jailhouse 0.12 released
Thread-Topic: [ANNOUNCE] Jailhouse 0.12 released
Thread-Index: AQHV22pP2CHHrSvkq0qL00iuCebA26gjdgjQ
Date: Thu, 20 Feb 2020 02:39:35 +0000
Message-ID: <AM0PR04MB4481C65800CCE42E448B7D2788130@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <dd4344b9-ca04-0ef2-0810-6b98e30f68b4@siemens.com>
In-Reply-To: <dd4344b9-ca04-0ef2-0810-6b98e30f68b4@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fee407a1-2541-4f6e-7f89-08d7b5ae1fe9
x-ms-traffictypediagnostic: AM0PR04MB6625:|AM0PR04MB6625:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB6625F471E4236A17E220B7B488130@AM0PR04MB6625.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;SFS:(10001)(10009020)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(199004)(189003)(316002)(66476007)(86362001)(76116006)(66556008)(64756008)(66446008)(8676002)(33656002)(8936002)(81166006)(81156014)(66946007)(54906003)(7696005)(110136005)(44832011)(6506007)(4326008)(478600001)(52536014)(55016002)(9686003)(26005)(71200400001)(45080400002)(186003)(5660300002)(966005)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6625;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SAUsS6SRqlim/yCaGnL8zkjxqqeiCCEPXLBj8jMVO3s5DzCPemqLIZ6gOJ5CN19kZCzqn4mNxT2pwUf1+gXi0Bsc8SrSaPRhOSkgn9UvEtWU9wBJoWwEZB621vUu0Nq9pAFEnUEXsSrflzI2zBWfrHbq5Yr/IW/YzNd54ASXu+LQSPCl+yG7YjwhwdWZWDBuOtX3PNImlJGQViZC+iKa5YLcq55dVKyEP+M9rJzzYin7e6Sa0mEUW1Os0rTzJuEozm/kO0r+rN9iQ9oBOpP42u0zCstNAbe6btYqGfbMN6cKB6TVoGQrQbDa+P5izumR2p9JuV4i0WuFGOeYcURXVKiWJ4YFHE6vTucVp8keySPgXIxtTpNbAWubz7uF+IkOWoC3GjphYcY7FoaISDToq1/r/g1fyprXv5cZVO0t7X67WN+E05mUur6860K1uBbTp6GZTNlJ4xdnNdObvvGHjwAcm7+qWPbsfSL6KG2hA4GMvqN2vsQe80mWsVF0X6SR6SZWiy47TNQZ3B/ElE3z3XeUMYjzTVi7SJnu3KvuiA7WB4jTNBD1ukjpnqaBfHHb3Tha5iFVKIw0wP8rZUF39fk7KvcAbtmjVr2gxzOxW1M98T4ORHKJuV4EyXKRTiax
x-ms-exchange-antispam-messagedata: JVFfFwNckn/FZhu6Q1IfJcyR4yhRWKv7soyR93oaZtDPgg5qRbj2Dn+plB4vLr3/sAYO4fzBi/e3OI3BnMlLyiTjFQMRGcm6z3GXhe2IqUFQVAVxiVEtYWn0cSirDKgphYz+UUjw8K9c1n3wV1ZcKw==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee407a1-2541-4f6e-7f89-08d7b5ae1fe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 02:39:35.9468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8uNd+ttA2F1Wj0S/8v2U1rWphTnOdcVwASQNzJTE3a0cP+Gc4astfCW1LnTo8PAThLW7uZE2pplpn7QVF7n/1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6625
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="rSLPU/Ya";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.82 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: [ANNOUNCE] Jailhouse 0.12 released
> 
> This release is an important milestone for Jailhouse because it comes with a
> reworked inter-cell communication device with better driver support and
> even an experimental virtio transport model for this.

Great to know this.

> 
> While this shared memory device model is still in discussion with virtio and
> QEMU communities, thus may undergo some further smaller changes, it was
> important to move forward with it because there is an increasing demand for
> it on the Jailhouse side. We now support multi-peer connection, have a secure
> (unprivileged) and efficient UIO driver and can even start working on virtio
> integration - without having to touch the hypervisor any further. More
> information also in [1].

Do we need to use qemu for virtio backend?

> 
> The release has another important new, and that is SMMUv3 for ARM64
> target, as well as the TI-specific MPU-like Peripheral Virtualization Unit (PVU).
> SMMUv2 support is unfortunately still waiting in some NXP downstream
> branch for being pushed upstream.

Alice in Cc is doing this effort together with i.MX8QM upstreaming.

> 
> Note that there are several changes to the configuration format that require
> adjustments of own configs. Please study related changes in our reference
> configurations or, on x86, re-generate the system configuration.
> 
> Due to all these significant changes, statistics for this release look about more
> heavyweight than usual:
> 195 files changed, 7185 insertions(+), 2612 deletions(-)

Yeah!! Besides this, any people still interested in booting jailhouse before Linux?
I have achieved this on i.MX8MM with Linux + gic-demo cell, with a baremetal
program and using U-Boot FIT to load all images.

Regards,
Peng.

> 
> - New targets:
>     - Texas Instruments J721E-EVM
>     - Raspberry Pi 4 Model B
> - Cross-arch changes:
>     - rework of ivshmem inter-cell communication device
>     - fix hugepage splitting in paging_destroy
>     - allow to disable hugepage creation
>       (to statically mitigate CVE-2018-12207)
> - ARM / ARM64:
>     - SMMUv3 support
>     - TI PVU support
>     - fix race several conditions in IRQ injection
>     - add support for PCI in bare-metal inmates
> - x86:
>     - model PIO access via whitelist regions, rather than bitmaps
>     - vtd: Protect against invalid IQT register values
>     - fix 1024x768 mode of EFI framebuffer
>     - permit root cell to enable CR4.UMIP
> 
> You can download the new release from
> 
> 
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.
> com%2Fsiemens%2Fjailhouse%2Farchive%2Fv0.12.tar.gz&amp;data=02%7C0
> 1%7Cpeng.fan%40nxp.com%7Cebb3042a71144b074ec108d7a98171c6%7C6
> 86ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637164245729737210&
> amp;sdata=maPE%2FCI8qJmIYhKCzFdnzn9rnpNgHmXjksAHRd6sEA0%3D&am
> p;reserved=0
> 
> then follow the README.md for first steps on recommended evaluation
> platforms and check the tutorial session from ELC-E 2016 [2][3]. To try out
> Jailhouse in a virtual environment or on a few reference boards, there is an
> image generator available [4]. It will soon be updated to the new release as
> well. Drop us a note on the mailing list if you run into trouble.
> 
> A quick forecast of what is being worked on: One of the next major changes
> will be a rework of the CPU selection in configs (selection by stable physical
> IDs), along with support for L2 CAT on Intel processors.
> There is also ongoing discussion to extend sub-page memory regions with
> access bitmaps, on byte or even register bit-level. That will make access
> control more scalable, e.g. to pass pinmux registers to different cells.
> 
> Last but not least: We are starting a port of Jailhouse to RISC-V, first against
> QEMU, then against an FPGA model that will be developed within the
> EU-funded SELENE project. Stay tuned, there will be more behind it!
> 
> Thanks to all the contributors and supporters!
> 
> Jan
> 
> [1]
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fstatic.
> sched.com%2Fhosted_files%2Fkvmforum2019%2F4b%2FKVM-Forum19_ivsh
> mem2.pdf&amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Cebb3042a7114
> 4b074ec108d7a98171c6%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7
> C1%7C637164245729737210&amp;sdata=2u04ZeAIHTKI0KiPAGUHKWUKKV8
> IRFyULilkB%2B0Ycxg%3D&amp;reserved=0
> [2]
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fevents
> .static.linuxfound.org%2Fsites%2Fevents%2Ffiles%2Fslides%2FELCE2016-Jailh
> ouse-Tutorial.pdf&amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Cebb304
> 2a71144b074ec108d7a98171c6%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> 7C0%7C1%7C637164245729737210&amp;sdata=4kexuNYjdhEV2w1RearsgdZ
> jzlgocno%2FKc9CjBEtf7s%3D&amp;reserved=0
> [3]
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fyoutu.
> be%2F7fiJbwmhnRw%3Flist%3DPLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51q&
> amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Cebb3042a71144b074ec108
> d7a98171c6%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C63716
> 4245729737210&amp;sdata=kALnVcxFlaAo%2Fva8wYeab34onOZs8v7HFZVrt
> AQzDGE%3D&amp;reserved=0
> [4]
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.
> com%2Fsiemens%2Fjailhouse-images&amp;data=02%7C01%7Cpeng.fan%40
> nxp.com%7Cebb3042a71144b074ec108d7a98171c6%7C686ea1d3bc2b4c6fa
> 92cd99c5c301635%7C0%7C1%7C637164245729737210&amp;sdata=SFzfugp
> o%2FjrtpIsIIdOyuvMwXJCX2Tp%2BPlTZ9%2Fc7h20%3D&amp;reserved=0
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux
> 
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2Fdd4344b9-ca04-0ef2-0810-6
> b98e30f68b4%2540siemens.com&amp;data=02%7C01%7Cpeng.fan%40nxp.c
> om%7Cebb3042a71144b074ec108d7a98171c6%7C686ea1d3bc2b4c6fa92cd
> 99c5c301635%7C0%7C1%7C637164245729737210&amp;sdata=sAJu0I4USC
> T%2FiWN%2B0UhH3ddunIN6%2BtkF9r350x%2Fuaxs%3D&amp;reserved=0.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM0PR04MB4481C65800CCE42E448B7D2788130%40AM0PR04MB4481.eurprd04.prod.outlook.com.

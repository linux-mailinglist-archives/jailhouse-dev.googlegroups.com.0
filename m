Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBHPGU3YAKGQEJFQYW6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id C989912CD8D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 09:19:41 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id f17sf3299707wrt.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 00:19:41 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1577693981; cv=pass;
        d=google.com; s=arc-20160816;
        b=oReBUOiupoi5ATCELMJrrxuGsOvq/TCf/q60UsudC4SbvV49WY0dEvSlm/jswypGdN
         E5TPTMu/qU0sZTNQ2yNcsNAzpwXkOCB6jY9O8d+npRKfhLmOhfRInaxz22MIJj23niUY
         aKb7Ddk0YN3UwwFHKajtTw6TF9a0DLmE7FlSop2p9jKbJdrYUxumqmo9gJ+w9Ek/GQoE
         Wx92HWJ+1GVp1XOeSzk5VQ5zoJ73N48EKM5rznHRDimCjyoxnuLkzYIxklNEQPXy6IgR
         rj+qiLYkeAKY7AnEeTAiGxV64n/e2Y152v4HfWAHzei9n8lGQ6Tiq+/eSh5wAnD/hWlQ
         9tgA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=Cl5lUgey5sY2CLNZocyxvAh0iNZdIXdj1JPiWspjxb8=;
        b=Lli34dKYJJf+kSp4ZBKJtdWd3+GQ+JrOVS/gp/mwhCnYVRso3oii50oyfecpj9pMVA
         OqTH3YArWf80EYD/KYpRsIpof5WvvrCOmnhuj1ZoCYQhNS2ye0wxCIoWk5dPDyyEB4Uc
         p9p5dwNvEUsPMa36rcez4kGW0kC0OlDkD7qzT61GLt+7pj6nVKDO8vEAPpIKBX6W7fMx
         YAS6p22NV1WnYCu3Xg+YScyY/6z4kmN0MZZEccWQskD2E15R8p8OVvW72U6EBYk3zcS6
         K8UVbKSnK860DO8/6eXjbJ/Bd8wDWJLpgqKBe2oAjLDotdcBddOzbAJXQDrgqzQvV/fv
         hepA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=dbZhc7qC;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.14.70 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Cl5lUgey5sY2CLNZocyxvAh0iNZdIXdj1JPiWspjxb8=;
        b=gEmohgqqk5/lPRE/nXZXfuuYtcDLfX0bqVTYNYSsGhS+kZpI06tfqg+MDf2NkEmk3a
         iikqTvuuuKSS4UAACm8PQiIrljISykH6+65XyCZq5Py/YY4OBaNxFfQ6uJdvBBDQq1HE
         IJDJmQzDQ6fDIEYMit5sGkFljq2AjUbY9c8TF7JFbqIpNq3CnWqJACApiu74Nocsf/RT
         O8sF3fZCd7uc6d9aQfvcqeKBZDZ4ajcoQeYrKznB3/cIbgV5k+yzHXL6VZxacQyuuxTb
         wQwIF5Dy+2a4zXzSrcIchnl1Z3d78TMGd++uscp9E11c+fYAj4m9NYKlYNi51eMqTvyb
         5E/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Cl5lUgey5sY2CLNZocyxvAh0iNZdIXdj1JPiWspjxb8=;
        b=Yz1IcPPTNtuBlIc3az1iiwDo4opEG36BE6Fq3J4mlqowA0DYSOfimfB0lcaJt8znDi
         aWOzfwCJ7Rd4tHDmwHgJBp4qgJrGP3twDxRn5Yw0UhNE2u3E7wH73XglSmQizUmz/IsG
         HlWWvha135GYMaZ9BdMdiquyqf8wVNAqnCDv0ft1q4rOxqdGe9jzsD/jm+c6sJYpXzo3
         W+nlXtft6GHq3aG+96CaI7ov+u+Ond1kXmlPgB38i9KYlpdQRTm6qGPN1rmsb+94vufW
         iqguJzQw5v18yRK8uG6UA+uBCw8RmHNP2/RBH/r8SUKy4sIKz2gfFsgmOxVf8nt6rW8u
         W3hw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUiGi69ch3/WvSIdyE1PsuwiTXjdQgiRw8Ev4Y/mO/HtYZKnMBb
	wjzWR/DT8R7Myt5Rj6/VPxE=
X-Google-Smtp-Source: APXvYqwARtfrYYZlsrXwwFQ9vfCScX5I6x/fLbxv5NTIjW2llxrtwGorSdrPjeBnzUuK98/dM7xung==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr32789973wmi.37.1577693981388;
        Mon, 30 Dec 2019 00:19:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb4c:: with SMTP id u12ls8258738wrn.6.gmail; Mon, 30 Dec
 2019 00:19:40 -0800 (PST)
X-Received: by 2002:adf:f789:: with SMTP id q9mr67232032wrp.103.1577693980749;
        Mon, 30 Dec 2019 00:19:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577693980; cv=pass;
        d=google.com; s=arc-20160816;
        b=tv44yKmyyzNp2XLdHAtQ6uNRoV9voAEggK1pUdY/bcf0KcRT9J8ZB3G4jrO44/k5eY
         ACfLVEqH/uJPuX94Ke8qvuYB89gzkNjLOLiScEhWSuqOZkTCpxzdxbv+tJF2eWGEB25o
         sLfy0ZpumG5w7FUk0AObE9gJzAk+ZpGDBfpHZJpY69gnH+RDDWygSkGnUMPaMNeDz4s3
         WC33DriFQl9qjjrim43xFTB+9v5TJG749E0dzFw4m7PUFoZH7x8KB/1LKvkE4rCMKhGS
         3tWdJLqwj6QZNXkpr4V6+Q/71Hj/+SyaCWTHgkOfL/E4NI6dpBsnGEStYPqQGs4W1rOj
         0xEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=pGCuDfhtGySpOUGtprnm6odIpJQ23BxslL2ryGLpD34=;
        b=Z1Q5D903XNb/4mqWvSGGee6wtiBSBO/JSbvQt1jjLcvhDKJjRoFQQnmGp8+9YASHYM
         K/oCxyuW//g1OiIdWTpwEAIAcaqpXgVyrB3O9tLSdOLL/qH7Pl5nVPPEjW7GPj2WZFyN
         dWjJB2lJm/sF/XxWtLtbDfPBTd84ID0IhXA/Lx2our6IKh9KIIy02LqBvUHP8uZ5/Ksu
         UDpToRNOx+yj2BZ8kIwNwT0qjd4eQlsB1hOZyPzyMoQcKWfS7JmggacLMdxgQhN878VO
         owkt22fojTDRX3UlD/P6wafGNyeAdH9mECaDp4zRhDnfEsJoXSjjvQ7PPjRUSHwI8Yao
         hvGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=dbZhc7qC;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.14.70 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140070.outbound.protection.outlook.com. [40.107.14.70])
        by gmr-mx.google.com with ESMTPS id s139si709055wme.2.2019.12.30.00.19.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Dec 2019 00:19:40 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.14.70 as permitted sender) client-ip=40.107.14.70;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1Deky0HJiKEXahcJob9dgc2I6ga/R6HlDL4Y3Vk1HY5oZ+m3Los7eK6jHd9hssglyFPs1H80DY4h5RQ5GIT+AaSO5Ptq7Gj7abHLpaU14XvN1UMKevB1pjfoyDiBen+W66Au7GSoub70ZkMLg4W8eS+ny/DbY/TakycPMwTvoLUW3K8wfPOUBJrPIYMwi94mKb4/VJ57kknzbb8IBDAN9EXGWNcjKAj9D3YmsokFVW0sPevTGPdW45p7VTsnPHiH92oD6zqg5KekKETsFjJlEmGl32izdz5L4x5csz0u28XFIYx0SxngOjA/y+3kewW5t/pBys1dpnUo3HHLKnMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGCuDfhtGySpOUGtprnm6odIpJQ23BxslL2ryGLpD34=;
 b=gA7SHcR6vkKj7w5Y96IPKd11t/MgJq5eXHIR0LwsrW78JA+N1Dc/POH7+cMvMYeWBdWHj9zrrcChUZ9PGzoGzqClVWEuDW8E+0ecov74/1v7kfl22b/BG/1XGx1UpUytiQ08O2UtKWcCEPDYhnwv1DxtFnP3vqF0idC94eyPuePuZiE2RQiLcaAW1G2kX4L09I3tcgOJIlNFWC49gS5HAjGBgLNso5Rf/S1sjGoGfS2vADG1t0CzXnZoYIscqmczVIfkX86lUDt0lIq2EGjoNDUQxm0hfal2sxB3AG+LkP2YOG/Wbe3PP+6EM1LQJfP5LlhpzWjbFahr/nMV3ubIeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5747.eurprd04.prod.outlook.com (20.178.119.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.12; Mon, 30 Dec 2019 08:19:37 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::c58c:e631:a110:ba58]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::c58c:e631:a110:ba58%6]) with mapi id 15.20.2581.007; Mon, 30 Dec 2019
 08:19:37 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@web.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>
Subject: RE: [PATCH 0/6] arm/arm64 barrier fixes and some cleanups
Thread-Topic: [PATCH 0/6] arm/arm64 barrier fixes and some cleanups
Thread-Index: AQHVub8GDgJzR1dkMU6PTMLEaaEObafSYB6g
Date: Mon, 30 Dec 2019 08:19:37 +0000
Message-ID: <AM0PR04MB4481602D84A5206F2078D7FC88270@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <cover.1577125789.git.jan.kiszka@web.de>
In-Reply-To: <cover.1577125789.git.jan.kiszka@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 239f15c0-690b-481f-e95c-08d78d0102a2
x-ms-traffictypediagnostic: AM0PR04MB5747:
x-microsoft-antispam-prvs: <AM0PR04MB5747FD53647B7D74CC15D44E88270@AM0PR04MB5747.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0267E514F9
x-forefront-antispam-report: SFV:NSPM;SFS:(10001)(10009020)(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(189003)(199004)(5660300002)(2906002)(44832011)(45080400002)(54906003)(110136005)(76116006)(81156014)(52536014)(66946007)(81166006)(316002)(8936002)(478600001)(186003)(4326008)(966005)(64756008)(9686003)(26005)(71200400001)(66446008)(33656002)(66556008)(66476007)(8676002)(55016002)(7696005)(86362001)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5747;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8dBmw8j6he0FnMQtwufnEJ0cedzeEzHkdQv0yYiyOmgp37uiXas5CgxmV/jojNcf6xkHDlBBcbmIGpOyc4WuzI/6bplB+1azFCfn5q3HWJ3QlXcXwH+FmSbQ2rSo2mwlP0fKc3Otf1XxHoMXr8RZG2kFs0PJmalZnDxZfvzdBifXYufCokzVCDs/gAb7sdBRWdJezEiEFg8dtl4MUWFKEUqss8kIQb9IIs84zoM3K/E39AjMJh/en0Ine/M0yLMSoznMIpc67V0sq1CXLu2X08InpvvzTutwij9i150vkDfudnVFeo5WnXKXFXoiSIMN3KQxx8pX9gKYAodNhEnJWzOWCeIWqd74XBglZLbZ83Z4dfYiICg+ZirxaBXeRU5HlAsLh0PHwoNzjO7C6GCZDfWkCJQ7OjBN/V53Ghq6MJV1uK4ExxwuAgJ5Iw9M1360Tqoe6+unsR+aw1n6VjCU+CT7Jki6bgWImOjqZu2KZTdky09H115bSpa2yyWN5xDKcArNtT3Tt/dUvF9SsQsggF9WQREdZe+diu2K6r5fHSiVDFfSr+38JtymztNcYPNLCzWd/CbQ8w8RrjGkrT8LHQVpr8ZPb9NvzDG0mGGVDi4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239f15c0-690b-481f-e95c-08d78d0102a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2019 08:19:37.4299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XreT9yYQ5ilceA03w8mduFca18M2//C/JZ9MkNZzedyDX3Jd+OzVqIHBr4y+a5kbSgJrGawW1gUJhPqdKYMcuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5747
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=dbZhc7qC;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.14.70 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: [PATCH 0/6] arm/arm64 barrier fixes and some cleanups
> 
> Primarily contains the fixes for the barrier issues Peng first found.
> While at it, I found more.
> 
> And I cleaned up some ARM headers, thought that should have no functional
> impact.
> 
> Jan
> 
> 
> CC: Jan Kiszka <jan.kiszka@siemens.com>
> CC: Peng Fan <peng.fan@nxp.com>
> CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
> Jan Kiszka (6):
>   arm64: Document why spin_lock/unlock have memory barrier semantics
>   arm-common: Fix barrier usage in irqchip_set_pending /
>     irqchip_inject_pending
>   arm/arm64: Populate memory_load_barrier
>   arm/arm64: Refactor traps.h inclusion
>   arm-common: Fix some stand-alone inclusion issues
>   scripts: Let header_check cover arm-common includes as well

For the patchset,

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> 
>  hypervisor/arch/arm-common/include/asm/gic.h         |  2 +-
>  hypervisor/arch/arm-common/include/asm/iommu.h       |  2 +-
>  hypervisor/arch/arm-common/include/asm/traps.h       |  8 --------
>  hypervisor/arch/arm-common/irqchip.c                 | 20
> +++++++++++++++++---
>  hypervisor/arch/arm/include/asm/processor.h          |  1 +
>  hypervisor/arch/arm/include/{arch => }/asm/traps.h   | 10 ++++++++++
>  hypervisor/arch/arm64/include/asm/processor.h        |  1 +
>  hypervisor/arch/arm64/include/asm/spinlock.h         | 10 ++++++++++
>  hypervisor/arch/arm64/include/{arch => }/asm/traps.h | 10 ++++++++++
>  scripts/header_check                                 | 12
> ++++++++++++
>  10 files changed, 63 insertions(+), 13 deletions(-)  rename
> hypervisor/arch/arm/include/{arch => }/asm/traps.h (69%)  rename
> hypervisor/arch/arm64/include/{arch => }/asm/traps.h (69%)
> 
> --
> 2.16.4
> 
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2Fcover.1577125789.git.jan.kis
> zka%2540web.de&amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Cb407c9
> be68d74c5ae89d08d787d628f4%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> 7C0%7C0%7C637127226182782149&amp;sdata=qdmM5YiySG%2BI%2Bmz4
> 7r%2Bp4dFs5pL3DvfelJTZ%2Bmin%2BAo%3D&amp;reserved=0.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM0PR04MB4481602D84A5206F2078D7FC88270%40AM0PR04MB4481.eurprd04.prod.outlook.com.

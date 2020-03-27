Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBCX267ZQKGQEDSC2HXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x940.google.com (mail-ua1-x940.google.com [IPv6:2607:f8b0:4864:20::940])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC761957CE
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Mar 2020 14:18:05 +0100 (CET)
Received: by mail-ua1-x940.google.com with SMTP id 30sf3794351uaz.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Mar 2020 06:18:04 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1585315084; cv=pass;
        d=google.com; s=arc-20160816;
        b=lJi98zGFHub/TH+tYX6XcXorriwkE4ackwou+AuzhjgaZc0ofQ9JOlCxte159ZS7KZ
         N30R9esfKmZA1sYg/x9RQOms0SPdzXHx51k2SNSbIiRf4ODef8t5wlufDRZawz5XdE/Y
         Aoj8CNjcFOutqLxbf28UxqepFqXS1+p+0a7BtLcKtk+zTa3ve+RRyv7JeMhTIScHbEN6
         NXgjeUxbW4M0i/0EU68qlbc3fGpOpLKTbyxHAGFxW2VUlzh8+9k9mCqj6eRtsuOV7aKj
         S2VBdmmlqmb6fbAGOsxPqOlnRJkohQLukPOJpN0nudV3uCJwGHrBh/SUtpdeA/+KLKuU
         z6Zw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=+c0vK/cjBYQ45pSf6emAIj4IBL1t4WzvdGt2AhM1OE4=;
        b=Ya0Ph4CFFnmUooUnqlKmd74hOv/dS7yd5Qj9qP+wBuRB6FRSg7K2P6oI/IiDyOT9F8
         7I+FDOd/cEs9ixxuHHCbczu8/3ISpwodB0KuSsImxg2DVzV2LuRE+7jAuXWO39HXHYQI
         OT8uPbAuEx0uXq9N2igRJa4RrGkuwH1EsvptwLuIvkIEYkCCM1d9nZ5wdI2o4kgD9zTc
         bcUrhBHKeL7nvxUC2xnDaqX8i38JgnqXESHVUD+HDOiegNNqAXb5qivgVczT1HdoXLsh
         XjsGidt/01ofl621Q0gk6u++MbRW0gJ97c5l1hBS38msuRmKcoXV5j8ogA/j/rtGpeQd
         QxjA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=PWFxETTW;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.21.82 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+c0vK/cjBYQ45pSf6emAIj4IBL1t4WzvdGt2AhM1OE4=;
        b=SNVJ8ig96LFQ1tRIQ5q3RwQdFV1B1HovorJGMM2pwGnwDKGp9keRF8HyzlUaw7DFC8
         68Ppq5KfiAKUcgmvZwW9XFUuCsRcWfYnSPeiL+1UtLtpZ5wd7UzJgNC3TP9PYA8N85/r
         j5UqfqSV2Ndmyb4E6WLI8rbtyJuBYU+WOe8svdwCmDM4Q/679xCu/sX0XD/cMEINPjC4
         y1v2u5/0qgna1tK3fFWUAFrdWag67QmF7F0giG83BGp1LJdpWM4plLDv6+XHKIbeDDjR
         n0cqXljHWfNewNDzlbE6X7jCzgqicKFt1P9xiUSFtghOnvwX0cSHUdpUT6HxfuL/35a9
         jd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+c0vK/cjBYQ45pSf6emAIj4IBL1t4WzvdGt2AhM1OE4=;
        b=QO+CkPo+92hSIEY1oc4BaC9ar1c6bkNqEsQrLniWiNAEWAAavy2sD2jOd/9NE3oqan
         HdE2ig2jB8t1jFZPI3XxI1RC0Ii6Ri+AfpP13/x/ROkAuTmBhiww39NJxDlaxB1v2TRC
         TgWNkOc/tkOXJpW1V82VKk8AXnprc0ne/so6JqwPm6s/y3O65VTiaxCu+kLSU3v/kUAl
         NQD2A2fP7LRBknXNmtC2ilY1jazM6QVuXylU+F7Yh/CY9y7Cmg0XqUfN8N1Qz5B4Cp3Y
         9gDq0J/mdd9hZCMPcxqK/VKJOkpDW557c4llgiYC3uzfMM+vaJycGEGOLdEzNOR/6l2S
         M83g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3/HAQ5Rf6ZHgU8Q5qe0GQuvxmsgdZCoWtWXCBViG8eYvqMb5iV
	nzIQYbFG//laopkKiLct9gY=
X-Google-Smtp-Source: ADFU+vv9NBkB1RsjV7sYwac2Ln4YOiCvxSARYVbztPuCcHLuo2Xu/UtQsCBfLVFoDpFjz9BbFZCl7g==
X-Received: by 2002:a05:6102:21a7:: with SMTP id i7mr12033962vsb.239.1585315083846;
        Fri, 27 Mar 2020 06:18:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:4c5:: with SMTP id 63ls733193uaw.3.gmail; Fri, 27 Mar
 2020 06:18:02 -0700 (PDT)
X-Received: by 2002:ab0:7203:: with SMTP id u3mr10615830uao.65.1585315082200;
        Fri, 27 Mar 2020 06:18:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585315082; cv=pass;
        d=google.com; s=arc-20160816;
        b=iXeUjhOR4YHmQijhT9AmylAOlXsA/rU01mcYy0H/cmO5LTgvbSVOVTal+BnUEBXMWe
         MSp+AWKjL6lTnjIp2X+pY0azHwfeojB/KsS+8pHw4XjFaS5/ciTqwd0Fmp/j7B10h5zr
         YRBretTzQct5J/8xQ1Vucv1Z0yv1P+DOfWsszpQtHCan1+kkpFkbcJ17ORCYHp9ABlr+
         QRggozhdVJ13gHxzgQ37x1azlwcsPCacjBqIj0j7om7foiF0KlfaFV1Kym4KV8UlLb8m
         cckdHBIhF5C2MHazoZH2piyYSzSgKZTOjr85LuqItv4skh8G7DlGHqyeis2/J1yznlxd
         mSJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=UMf/M3GxWx+EQyois7ryFdoRG7TxRW8ZZFzwTpWOcVI=;
        b=0EYoN/DHiWYwUfxNLjJevJh7k/K+Oh0eKN9YQIFE8NCSNJoX35OK6KrfjAtBa6ioC9
         o9W5IWNWl/hyHphin1TcjqLzp6MOB5uvSsaq7TLTROKEqSD3LZqUDSpJnj6ypSJ5a8NT
         UrAV9GnHaLKPRM5LLA3KC9YLuYPU5P4v1SmEZIh0K6UZ4e92wZUKvmJBuvQ8z7vk37I6
         4buLSJ9ScLR9wyajgtAfYIv0xv5jCZzWH4DtcQsP7m0RbtFSFcKL6H2yHLyQAja91EK8
         dJX1TQFgR24WoIdzSL0uAdXgHTNqM49fcmPgAKX6g3nCPbPR86AiMhhprlT1YiBXIIHd
         cl9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=PWFxETTW;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.21.82 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2082.outbound.protection.outlook.com. [40.107.21.82])
        by gmr-mx.google.com with ESMTPS id d20si403716vsf.2.2020.03.27.06.18.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Mar 2020 06:18:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.21.82 as permitted sender) client-ip=40.107.21.82;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQjEa0s1lYV0jD4/5xZjluDCXVNCPPpE2lTg+aDqIiqPQPGijjiZKrLbL+/tWRK5ABuaOytZvTeV8m79r6We4vQnZGI+V+ar+40OmtR/r8rlqau8PlryKZqxXHYV1BR4rzPSg3KwntPj8keb5F4qqi7Es8vrPnoEz4VAbhHQqdUzocMaFVkCkTBUyS1edAoHQTYmzuMONjy2YrYE/iJa0wA6/wC098K1uWKMM/Z6PZGrT728pwOIG2WZK2V7e9w2MDYeEHA7K9LBy8XY6ZU1D8uSCDfUpnqCvh65RPYEAuPdMHvsY7YKhCAytwGzH8IjTzU4dCGUY8Ipmn7u/sJt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMf/M3GxWx+EQyois7ryFdoRG7TxRW8ZZFzwTpWOcVI=;
 b=RmrnmmsV/437xGFB7jUuLDL/EaBKit7fP/YlDmR3YW1s9Dndnm/JUFZHH5CvGSPONB4mHPLr5ngD99ONyzw8zIGVM7ikc95Jvz20P/MFG49wn4F5gRYxa0gB3/lHr+jumHXMH1zvMiwLX96Yr7lm2zcWSxO4do+6m/t2BF52m2MzKZvIH81ZjxDo637GYdXoMKSSguSGW9JuOq+08vwbArSohaR0w50k6qlxXD7JjgLSQDhGoNcPSjyJ+ZDFoFmVDp5MlaLK7yzBIVQpKDxDXxlIAyDfXPpl0lh7Q3mGq6VOfTsF0dqgCYwimWFPC/HX2Wy466SzNraXea/hhf/SPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB6497.eurprd04.prod.outlook.com (20.179.252.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 13:17:59 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc%7]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 13:17:59 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@web.de>, Alice Guo <alice.guo@nxp.com>
CC: Henning Schild <henning.schild@siemens.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH V2 1/2] Cell configs for imx8mq EVK board.
Thread-Topic: [PATCH V2 1/2] Cell configs for imx8mq EVK board.
Thread-Index: AQHWAm1/EOgatsUBz06COVSDS5fdGqhcS/IAgAAXzgCAAAsrcA==
Date: Fri, 27 Mar 2020 13:17:59 +0000
Message-ID: <AM0PR04MB4481D6A853ED4DD241EF70D288CC0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20200326132025.5116-1-alice.guo@nxp.com>
 <20200327121102.12ffdf7d@md1za8fc.ad001.siemens.net>
 <785a4aeb-3ddf-db6c-42ec-f0c606795bff@web.de>
In-Reply-To: <785a4aeb-3ddf-db6c-42ec-f0c606795bff@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.107.26.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0f5ad023-f7f9-4a13-b25f-08d7d2514530
x-ms-traffictypediagnostic: AM0PR04MB6497:|AM0PR04MB6497:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB6497487D7E93E5735CDC424D88CC0@AM0PR04MB6497.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4481.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(6506007)(33656002)(71200400001)(316002)(66946007)(66556008)(7696005)(64756008)(66446008)(76116006)(86362001)(478600001)(110136005)(52536014)(54906003)(66476007)(5660300002)(2906002)(53546011)(9686003)(4326008)(26005)(186003)(44832011)(55016002)(81166006)(81156014)(8936002)(6636002)(8676002)(32563001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zKjmtXFJINMwsc0hpuK1v/r/Gt/h/xsctMxBmlB3d7G2upci5tZ6Ws14Q53HB2qh3t48EHinc3ypgUgD/H6dxDX3h7ZLC6897ppG+yjkNgUTm8Caq2NU7V9vnM4czETst8QAUO3UCZlb3UYWCIxmlsLBszqN4GUJ/Ry4IjjH7yTeXLyIjVgLGlOeLHXfDyaz1U8s/ArrVNnPxyV4nVHviSkh2vfWbiaHosxxQjzumNfDz2LkGI0PeOKA8PgdPJjIxNVFQC6enWa+SQdLZ285NHrypRFjjK9Y8w7bIzCKb4WOoSbyTGRsGpxCGeoa7s4UEFdVV+1hp7baLOtWgS3SHWe/5eZ84Oa5HjT7mOlrLaYnw/pZYRNbRlme+PAZyqNwmt1EC0htvBvOKcgIdoPYTJ6qF2/ohRhzDtF/GHsOd7n9tvWf36FMEQKpJ3sJa/3UrF74SzUlKHLGOK1HgxDC0uqoFqEgwj5FSCEcUj9Rb38=
x-ms-exchange-antispam-messagedata: 5jvTbuh97bojAjX+J6fEFBSvortbl0zSUi+VjqIt6WXu+pYQ3B53UW/KcZ70NklmQ7DwRfgjUb9edWA9CsmJZ3KZ4jdpVVPEUtigVc39DJiqBPoJpcZFHpMq5gbvd1eX/Kes+1pwHmnUGnCzTPvvRw==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5ad023-f7f9-4a13-b25f-08d7d2514530
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 13:17:59.0358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9bJoINIIK0nTNLv4zYznAg0APthHUaoQXsUdhjmOWU8GM8j9wGXlwnHJUDkJ+VVHNfeFRlYMKjfV7E7BZqJmSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6497
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=PWFxETTW;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.21.82 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH V2 1/2] Cell configs for imx8mq EVK board.
> 
> On 27.03.20 12:11, Henning Schild wrote:
> > On Thu, 26 Mar 2020 21:20:24 +0800
> > Alice Guo <alice.guo@nxp.com> wrote:
> >
> >> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> >> ---
> >>   configs/arm64/imx8mq-inmate-demo.c |  70 +++++++++++--
> >>   configs/arm64/imx8mq-linux-demo.c  | 158
> >> +++++++++++++++++++++++++++++ configs/arm64/imx8mq.c
> |
> >> 93 +++++++++++++++-- 3 files changed, 307 insertions(+), 14
> >> deletions(-) create mode 100644 configs/arm64/imx8mq-linux-demo.c
> >>
> >> diff --git a/configs/arm64/imx8mq-inmate-demo.c
> >> b/configs/arm64/imx8mq-inmate-demo.c index 8c1ad624..d3c89aec
> 100644
> >> --- a/configs/arm64/imx8mq-inmate-demo.c
> >> +++ b/configs/arm64/imx8mq-inmate-demo.c
> >> @@ -1,7 +1,7 @@
> >>   /*
> >>    * iMX8MQ target - inmate demo
> >>    *
> >> - * Copyright NXP 2018
> >> + * Copyright 2018-2019 NXP
> >
> > Maybe even 2020? And that is the only update to the several files you
> > touch, maybe do them all.
> 
> I can fix this up on merge, just let me know.

That should be 2020. Please help fix when merge, then we no need a v3
if no other major comments.

Thanks,
Peng.
> 
> Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM0PR04MB4481D6A853ED4DD241EF70D288CC0%40AM0PR04MB4481.eurprd04.prod.outlook.com.

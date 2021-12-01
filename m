Return-Path: <jailhouse-dev+bncBAABBD6AT2GQMGQEUWRLLLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B8D4652A3
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Dec 2021 17:17:20 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id u20-20020a056512129400b0040373ffc60bsf9717666lfs.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Dec 2021 08:17:20 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1638375439; cv=pass;
        d=google.com; s=arc-20160816;
        b=nP0BF6MTi+9dJ6b1miOamoP86xB5IU/OSqmnVUMQrwUMegMmJiYNBFxzhII+HBKNLp
         7gMshjD+xDzswesAP5+y5xe72SV47c83Yn1K6IGfCfj8mnk9XRcpFJxkqf6yCx2uoM+Q
         +fKz7ZWxB4wG6yalV+oFmCDK3RMBc3CUTsBIcj5WtOZsFlz5DEI4dqzAtPA83lbo7LFf
         M9VGcjsoYfw44PNc/aa9UKzIPdOC8vFfMa5lSx2fb0F0L2IBB3Yr2fiMusRzHKtyVlj/
         Wic6B47yE7w82bw9V0PBDcgbHzUSFrJ+dlr633cFIb4hGWbsjfAwRk8bvT4S/vCsHdDq
         zWiA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :suggested_attachment_session_id:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=OVKZ34Kj0zoVx2Td5Oy8lg45mMLgnvfN9GsmgglxkXQ=;
        b=WJSM5FyZHfhAbmeoLca8+TYPxNDpl0wKm5ddD4S6q/z4AdRzQR6PNBAO42qPBDv+aM
         P6gkQbWt63UHCMXKtUcwaLfHJctXI6xyQ5lReiuvBuAnwZSukgmNkqc1eMH+BC2oZdEE
         BgkID3qcL8b1GBXT6YprnOZnjA2Dyyma4cBqlCDVNrTbNDsITmOYJOBhD8C7N1LpR7W6
         gq7SjBixb245Rl5dfWyJ5wQA9USARIbUUkxZe5xzOWsnfT1u86xFXyAPugxo8Zvbugpu
         6ltPOm3Bbid171mXrvIvMy7ac9a36/s3hBjUK945bQdIQ4PFcMYvdwGTDNeo8OSBiZHR
         RZjg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=WPyrS5oH;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:fe07::604 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :suggested_attachment_session_id:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OVKZ34Kj0zoVx2Td5Oy8lg45mMLgnvfN9GsmgglxkXQ=;
        b=a9slj/T2+m63sjN3c8ZMwEsa43XonljJzKzC7Lf3AYwRpGFekR+77B4uP98BfvGv7F
         9aWsBIjNNd5xzQjeLSgy+5OeqT5G+aKtZNDiPsTxVErPEdId2bwWqMp4HzDWP1Yp1+Sh
         v8hf3OPxLYkc3ybgUcOqi673femPGsSOLgtyjQJvCUnJHqvvLrHYSOh82uE3fRK8dHxu
         JQF8Ifk1pPHS1nZkQ7YU7cJQPofWVt20XydCbaS3QCB4uBd1v0rY+zvNfuAK4miS7RAI
         hXlRzCKcPs/latOp2/L3FZHIIRsDftMbi57CBbBY1a3EIAecXHBqkB3v9pH0wLet6CtV
         g71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:suggested_attachment_session_id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OVKZ34Kj0zoVx2Td5Oy8lg45mMLgnvfN9GsmgglxkXQ=;
        b=XA/nnmmlymURRp/RTVNRP6Be6IlLUextpoW+laPHX8DCtlDTMY6qHrhIuKNF+vRQnG
         j/9qHitIEj8bQLXvsFR92MU7e58ozwZ4r93MPmi/Aif+OigFbMpnNPmpoh5YRY75LOqP
         9e1VJYHf2w0jNjyMnoZVSiH70jG4S44iPEc88bXd9u66GTJHrx6ehigmvyRyvz1C463A
         fflx70BS9zftGFFEiGccMkJZ5cn7mCSJC18R4H+NOCDcjYwf0M1gbc2+B5xTtKR+GoLl
         G8GyHWWX6ruzgM48S9QxhTBibRQFLBtS6e+SJentUqTbSK2H4QG8UZz/EMdiRRfWybeB
         TyMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531C0BUYMF6mBKl+wLsCDGdlbp9rENWNezRcUrXMyZzEbocYK0gU
	tYdrs3nMg4s2CiTG9wcDw6c=
X-Google-Smtp-Source: ABdhPJx+d7+HvW6hL52fEfI2thfdavPJf1MFUO7Deknlrr+lOdxnZEJD6ufWD9c14ZJxibTyuOzUqA==
X-Received: by 2002:a05:6512:118e:: with SMTP id g14mr6898751lfr.561.1638375439709;
        Wed, 01 Dec 2021 08:17:19 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3e10:: with SMTP id i16ls1145465lfv.3.gmail; Wed,
 01 Dec 2021 08:17:19 -0800 (PST)
X-Received: by 2002:a05:6512:3192:: with SMTP id i18mr6720364lfe.205.1638375438940;
        Wed, 01 Dec 2021 08:17:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638375438; cv=pass;
        d=google.com; s=arc-20160816;
        b=H3QWFwag4MpwS8IO5592/wyj1NvbqTHi6BA6ohDx3h3eRvrn0o3pr7mC36fuf8LGLF
         tu1g8qTyny53FVqNU+5fxPgETCjys7jMtkz4FCR2TieZ9BCyqui6ouF7VX2oFBAOGXQ4
         WBjpITsd+BqfvcEQ2IWRlV/RL2+gjOg92/xgiP+qTCIH9Rrs6D+llTy5y0lW4pabF3N6
         3MCWcLlsTix07gM8TQKMYBt9TBeMUEtwTF2Win9Iv/r1To01AtPy3y5/7qZ2OFDdnh4n
         y8PWbvr2wWioIcx3EKKvGutUOF/G+UIgUXWqQQRCZ8JCKNRYgC+hqOCvb+dAZYOOSiRR
         Tidg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding
         :suggested_attachment_session_id:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=6CAc+36OHHQyptjQCIMfG261tG9tgzy9rn4d2qHap4w=;
        b=n4OC2y2FoQbUGVoyTTBQoVLOKe1aKcMehPUdK9sF2XsI55vPKmtAqEKwVB8az0KRHR
         oMq0iE8ohJu5z1DG/n/Fed5swav4VsAjZpqeD1ObVHjUNr4bDalRRdW8qqJW6g8EoEmC
         u5/7/4H+w8aa5QdfGJMTRBi4EWJxmo1k5BcvOQWHhJIDM+o+/4mhRXtYU9Hu7j/JSGc3
         GdxBbxI3+fBfpvbatIzgn5queqOlzRyuKP5D7gyhhY5p3vtsgNdRwYS9XPhFnSpZcaPn
         rrrVpfPWc+tg7/+2+n19kN8R0AE0CzYfLmdN4Lf26VwX9+OOOdBwaU8da7qlZXftbvGj
         ubVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=WPyrS5oH;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:fe07::604 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-am5eur02on0604.outbound.protection.outlook.com. [2a01:111:f400:fe07::604])
        by gmr-mx.google.com with ESMTPS id g21si24959lfv.11.2021.12.01.08.17.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Dec 2021 08:17:18 -0800 (PST)
Received-SPF: pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:fe07::604 as permitted sender) client-ip=2a01:111:f400:fe07::604;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oY7hAME1wyPwLIuqW8oHrREaDCFqSfivRFNJ3iDvyn80A6xteKz0Pbf+kGTTtiUqFlqAsKyDVb8Ezsbht6mMQRH6K3dEiJwqVdOVKraOQIBOC6NBh9t2mNMyNqH2mQoSYNEwxGOo3fuVh3YrUJpLkJYE6oumrwy94Vv3SiUUmu76rQEsosCyx9O0v6yuxy7WXPbeu0/4IEE9s/PfQKoSrHfN6whOrC96MwZvoMUjBAUGAYuR99AFCMxtK3ZOcNrdw8evN+p0BhLYaSD2Iw0bI/PDG5MK99d0NRBw4okgs/CVu+b/z8mvTuqWe71xfJ3prbbv6kYPnMl8rxlzW+sdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CAc+36OHHQyptjQCIMfG261tG9tgzy9rn4d2qHap4w=;
 b=lU1EDhNysB8L/W8ihnUZmr0axvXFBZ0LoMoHoRs/HHth0RQmmNtmaSsSomwDFb6kFhoJNFr3uVMFM7WruMZR2LfAMemDcG5MWy1MyunrfA0KK9mn3tma+ICM3QY6XqQpN6J3Le98WH5dKraHYl2pX9dybR7fWbI9ZwlE0hCrPollK73CTu9LGsg1IEZGeyfniu82PoltLbjKRRd97tTHwKZ8bruvOgZi1gEV3qqVTDw2cluTtgYHt3eTGW7YBa+eOcwV0iUmq6CGh+XSockxHeoRN8DRDpfHPaDd6D/C2CfpdiGowX64y7oEO0jCkWqNevu00EbN9ngA31vi1RRf/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from PAXPR04MB8863.eurprd04.prod.outlook.com (2603:10a6:102:20e::19)
 by PA4PR04MB9247.eurprd04.prod.outlook.com (2603:10a6:102:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 1 Dec
 2021 16:17:17 +0000
Received: from PAXPR04MB8863.eurprd04.prod.outlook.com
 ([fe80::81f8:3fd:3f3c:df36]) by PAXPR04MB8863.eurprd04.prod.outlook.com
 ([fe80::81f8:3fd:3f3c:df36%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 16:17:17 +0000
From: "Stephane Viau (OSS)" <stephane.viau@oss.nxp.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"jan.kiszka@siemens.com" <jan.kiszka@siemens.com>
CC: Stephane Viau <stephane.viau@nxp.com>
Subject: Re: [EXT] [PATCH v2 1/2] [RFC] configs: Introduce helper files to
 create inmate cell config
Thread-Topic: [EXT] [PATCH v2 1/2] [RFC] configs: Introduce helper files to
 create inmate cell config
Thread-Index: AQHX5kEFPbhM5d4nhUWfk/gUc1QLnKwdxuCAgAAJ3uc=
Date: Wed, 1 Dec 2021 16:17:17 +0000
Message-ID: <PAXPR04MB88639A2375741D3A2AD88E90A7689@PAXPR04MB8863.eurprd04.prod.outlook.com>
References: <20211130232013.395-1-stephane.viau@oss.nxp.com>
 <20211130232013.395-2-stephane.viau@oss.nxp.com>
 <d53d89b2-1896-8bff-02ae-3d4c3ba312ca@oth-regensburg.de>
In-Reply-To: <d53d89b2-1896-8bff-02ae-3d4c3ba312ca@oth-regensburg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 15f9f22d-41f1-331a-7a3a-2dffeed69acf
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49a8823e-a4b7-48dd-e4c9-08d9b4e60b4e
x-ms-traffictypediagnostic: PA4PR04MB9247:
x-microsoft-antispam-prvs: <PA4PR04MB9247CFF7343F876EC8D2DF72A7689@PA4PR04MB9247.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7mSkKq9G8x43LVZlJcR05V6DTMnHQ6+ngisKSUHLlEq/MrahqR+atEuQH9ZsgPObd6VGfQb6YUgGbbLPWF0ZoSzu3931yWO4llm7dhqJfq2z44p1oUFI2R7NP0Gy3heiuCzaQe4HaTSpLgN6c5Jhxt/pt2RzpQLtgRVFYESlMuEvPl+RIBJZJ+DufV4J361CuTLAaYV6YBqpx8Gy2MdMg/BfwHm0OzYWbyr3zMUnz8Nn5JA4v/kzZY1oMT/a/NgkFgSSJfozabvV9VFpT82xNXPxw46GKTLNJiqHvbdeHi8XLWcqqK8fLsPS3IHiLDvf+g36ocTK4DIj5qP8iXlpWePx+lGTjg2VvAP+pu/KEM6YrpVd/SVg3kdzB4NV9XrKucnqeT7uD2hoWOtgp7hr4swqbJkDYVWcTcUhRwoOXwd7cZy/maA6tUA/ZRXC//mAJxNrnlQEqO8he72LSUsPzgZzag6xDwbwUXM6ja4b77Jgu6QCVLEuKsahLOeoEvhBTDVaCOpz0UwBjMXjfkly1WWN06Kl5BbPhWog7MwgFl8hOjdso/5PrEFk6s0EnDQ1+YwN3w1w0e80N1U7stqc7/+Jzhf7xTCmwNRCi3BhVdHJZ3/XePPFO8LZxWcf3VYOqRLaNd29aKvCx1zsSwhkSLknO70H03BWLO3ra/3nh9GaBVZusaMr8J2s9Ce92r2oUpfVh48BctzflR4fPeOcPQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8863.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(66946007)(76116006)(38070700005)(38100700002)(66476007)(8676002)(86362001)(6506007)(52536014)(64756008)(66556008)(66446008)(186003)(110136005)(55016003)(5660300002)(4326008)(71200400001)(316002)(8936002)(9686003)(26005)(508600001)(7696005)(122000001)(33656002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?mbYesgSx7bLyhW/RxcUWfZXUIf023KAve6thalXkuXTdxjbX7olj4ZTYWm?=
 =?iso-8859-1?Q?N8W9GMSUvIWXB/wl7CaBjDbLoH3n8pTGG3wzhvKMxGB82OybPGo5nLXX9B?=
 =?iso-8859-1?Q?MRfXBhRwX9S0xFgUHS5jB20rKvf4nT6c83VSFyr+npe7E4JoSu6Q+hfxnM?=
 =?iso-8859-1?Q?aT+COJMnlDTHxd5B+xxESvExs9xd9t2AzNjw0xLcLdcRTPVGSh4MfndpjH?=
 =?iso-8859-1?Q?jAsndLZa60q/e8IBOKMIiCnGcqP0R/RR0KotPzJY0HrGNX7HqGeGwzX0bm?=
 =?iso-8859-1?Q?WJ26phlfZQfUucdI0i1avzNToj5LaVDo0ZANAagaVA4CekSpTxG7BZihWy?=
 =?iso-8859-1?Q?v0feCAEYs0MNTSXjwA6ydlms72CHG2pgo55dSiu4BaEvyyb2DXaE11Uo0F?=
 =?iso-8859-1?Q?gn6tGTJqqhi6gIFnBEGiEE1eZ6zVzXcrcbw3E7O5gbXTIwd1uJypJHPyd1?=
 =?iso-8859-1?Q?9KP3XICjnKTpjs+dvtWHitOZ7GZEKNN84PzUc2mLbg8qC1qkbpKF7y7Nq9?=
 =?iso-8859-1?Q?gWpUa3Gh+U87wLcNMq8srrNG7FLS5mfVX9t41BSF6HEecpHxtP4fmlVuu/?=
 =?iso-8859-1?Q?indvIW0kydPgelkJRg0MnAAaJDMQdo6y+XBi1OsWite+nptJy1tTm/cDIJ?=
 =?iso-8859-1?Q?ztRKEMWKoR4Rlz/ByR9pyfo4fMkfXHPdx0ghcIzNSWzGSile/2jPh6dx4P?=
 =?iso-8859-1?Q?YH3omBW4kKyJ5KBDp0AUJ0N5Ff2QNFA7Vlf34cj/TclbStp9gSLF4ieo5R?=
 =?iso-8859-1?Q?EpxgfkOqoQ8TKyEoEImTeX2t2aifzmBMSdp3iC17CDft24uiQuEmxr1Wgw?=
 =?iso-8859-1?Q?mq8cOpp1wQd7M/WfldoG4OQkrPdQqZCsAAn3MfLcUW7/XhRUEW9Pq+Zn23?=
 =?iso-8859-1?Q?NSfX6iLDWNeqLMXgMTm86Fssr2cDduQJEPJm0cnnuSJo+ZDLXXmE4P8ZmI?=
 =?iso-8859-1?Q?tgwfzlap3rdwmdI0dUZhb/6rdLA6HHMMWsa8bxDzYW/MqnS0bDyPmHiJoL?=
 =?iso-8859-1?Q?4uwu/xsEu1L1tkrkgiwgYTNjRbjUi6unNKdmPP4jWh1RXwmDXRX4MtUGaC?=
 =?iso-8859-1?Q?ipeG6P+prQKAHC+2u1X9YIC0iPJ33k0QkR3lSzgaiC6FggP1ZHaXfE46t8?=
 =?iso-8859-1?Q?qwnUF8dGnoxWplfpJLlLppCxzlxdUUNpR9SHq8+U0CCRw6ugYllehYWVmH?=
 =?iso-8859-1?Q?kzfhSw4KX47Yz22BfCuMk6fY/D1MGvcADZbUpKwAU/wyvnUeXTo/7od6dh?=
 =?iso-8859-1?Q?sd3zGVivCMq33WLw10ykpyJDI3RuNh3ONAfqgsGqT75zsp41vlXGkcfePX?=
 =?iso-8859-1?Q?7a6NJd1va2lSM+56HnYCwvPbfWGid/RfgJMukfb2z123HpL/M5sbNGBPWf?=
 =?iso-8859-1?Q?iC9Ou9gFzRMUFMkOf8XR4o6h9sDYVMTMn1uW92OuAcyRRUnMVYTgYCoyNR?=
 =?iso-8859-1?Q?UAjt9tktj/oHPSzTkztMmvu8829hUimpcyhRhUBSxnsytPUJJMKxhkxxXR?=
 =?iso-8859-1?Q?qvzw/wSnvXa2imMtaxQsN8zyYwrF6YD+QFy6hNoqvw1eY5ReBLPQ6qbbtV?=
 =?iso-8859-1?Q?qNQ65l9fbvMaxl7OqHwqSUvYqdoIH7a7xteofIz/58nJk1F2ZpYHJeT8PT?=
 =?iso-8859-1?Q?NELuxLjse8CUnE5gTTTcUXWx8p9t/EXjdK2q/KgLU5VYcdzkxkPYRntUTv?=
 =?iso-8859-1?Q?61fTBt1QjIEfqDbo+REg0t8t958nVZCfNOCRWjd75pBwOCCyuFbj48G2DT?=
 =?iso-8859-1?Q?cpWsLBF8s1ATSQvRJvnSi5fTnZ3bOVddc+Y/vrHOsUjlYe?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8863.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a8823e-a4b7-48dd-e4c9-08d9b4e60b4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 16:17:17.3578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fcs030gs3kMXcT7if3r9VN9+zE7qS5yVZMwWDIkDnOo2C4iTdNnYVutMIlt+uTo+URz/fvxy30Q+HKgNOVw52s+QPkbGdzuIKZUlMEp3aa19ZbHiRbFSuiX/PdTEX/ZR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9247
X-Original-Sender: stephane.viau@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=WPyrS5oH;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates
 2a01:111:f400:fe07::604 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
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


>Hi Stephane,

Hi Ralf,

>
>On 01/12/2021 00:20, Stephane Viau wrote:
>> +/* Memory & peripherals */
>> +#define CONFIG_INMATE_REGIONS_NUM    (1)
>> +#define CONFIG_INMATE_REGIONS                \
>> +     MEM_REGION_RWXL(0xc0000000, CONFIG_INMATE_BASE, MB(16)),   /* RAM */    \
>
>just picking out this aspect here. I found a way how we can even get rid
>of CONFIG_INMATE_REGIONS_NUM.
>
>The problem is, we need to know the storage size in advance, in order to
>declare the array. This is why you have CONFIG_INMATE_REGIONS_NUM
>definition.
>
>But with your new macros, we have the definition inside
>CONFIG_INMATE_REGIONS, and we can easily reuse it: We can first use it
>for calculating the storage size, and later we can use it inside the
>definition. Have a look at the following snippet. The compiler eats it.
>I guess you should get the basic idea:
>
>----8<----
>
>#include <stdio.h>
>
>struct foo {
>         int a;
>         int b;
>};
>
>#define MEMBER(A, B)    \
>         {       .a = A, \
>                 .b = B, \
>         }
>
>#define MEMBERS \
>         MEMBER(1, 2),   \
>         MEMBER(3, 4),   \
>         MEMBER(5, 6),
>
>#define MEMBERS_NUM \
>         (sizeof((struct foo[]){MEMBERS}) / sizeof(struct foo))
>
>struct foo asd[MEMBERS_NUM] = {
>         MEMBERS
>};
>
>int main(void)
>{
>         printf("%u\n", MEMBERS_NUM);
>}
>
>
>----8<----
>
>This way, we could get rid of all the *_NUM-macros, and have the values
>calculated automatically (and correctly). What do you think?

Kinda cool!.. I'll update and repost soon.

BR, 
Stephane.

>
>Thanks
>   Ralf
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/PAXPR04MB88639A2375741D3A2AD88E90A7689%40PAXPR04MB8863.eurprd04.prod.outlook.com.

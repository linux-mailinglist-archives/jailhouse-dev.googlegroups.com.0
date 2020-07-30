Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBDN2RL4QKGQEOKAPSQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 016BE233016
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jul 2020 12:12:29 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id z74sf1312664wmc.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jul 2020 03:12:29 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1596103949; cv=pass;
        d=google.com; s=arc-20160816;
        b=hPXr9XlaBxg12RCRxOrNTZBYlU+PDABvjKwSH98bDPI48Db429uk9n8WuizP227Zgq
         YW08GDrsXkppv9BFVtri2f40KvL9y8n16zyQbd5+MIeXc8+8RK8kO6sKl/AbmZEcMkzU
         /svi82P7l3zB4QsB75bEzD5nMOToNqWoHO7GOlM+KGcZIahFHTFP1DuDXuBdIqSthkfy
         LHynxO8w4m8jZ8A4+xd3rfwK1R1YxikXptANPvWalxBNIzds0yxx+jjSOheKLh7nHmqy
         7j/D64Ue4jVcdWkhFb/DwQWAHNqR55fXhVGJlnhiR4XFA/zVy+XINTLSS8yG1vFM0Xcl
         06lg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=cN9NfSFTXjsRGEufxSst6wNFUrzzAr3cCAJuoeh4Xp8=;
        b=S9zMA5m7bDf6ZZpHmvFNyEIQ88lXMqQdLpPtlxJ2vYjtOzjalSWeN9H29tKKfWxKg5
         Z4K4xv/U13g5YciRrd2UwTOVM+xn9DkPYT1ps4BWE+OhFI+DC5qdmJGgPsi8xZR1rarP
         WmTT2IA/tonpW96gsfqn2SKWVzZsB1Xumj1AcX/xNz6h//KRg8ZT5NEPibVRIgXuLhi7
         XDl2lZqGNg6jY3r2Qcymcj4smFu/lWWqTYjxG3Ps3Px53pmPuIp4m9BwW4J+PVFmLZSq
         i8l0CqI1QptK7VwTA+Gi1LmVvkSnSkagc8tzw5eE6n+fjm0Cre7FneIqVlMzM0//ujkk
         vM1g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=GCzIt4uB;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.5.78 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cN9NfSFTXjsRGEufxSst6wNFUrzzAr3cCAJuoeh4Xp8=;
        b=oColi2u/3IPHKnOY6cCvCXDG6Uhw8x70NFWQRMijdHj7NthLhmOlTmAs58uimlI6H0
         tqtFscj3+yiRQnDffseeF+moO2iggwAAzlXwg7wza2m/AamoR25RK83PoFF7ePJnq4rC
         0r/lgExpaJd3ryvwf2y1jq8C1Yr3Hi++o0eTpCh3jcm/dv23KBvz3RSzdVtghRi2f+Es
         mHsGIt8B4TNhX5XB8yqgkHnZn4woQd3iI0gFOGbQdTNVp8ZwHDUxTQW8nIfUwDdDN+TE
         TfJHNUg3RmDNTeBpvumECbanTRHXpvAzEO5gSagIfBDlWNwRs90+28363hAzzq4I9eIf
         ipZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cN9NfSFTXjsRGEufxSst6wNFUrzzAr3cCAJuoeh4Xp8=;
        b=ueNIHp/OfxnyNXq3YFjG2pCLwThDyQAGkfyYUFLn3e1hAEBuCOw4b2IWALT6Aqth+q
         Lif6msYNKMROiGHuG6Jm2jqr32rRnv0fO9BY6M1+f9Z6pbhDWoZBu0ojqMn8wtIDT1+X
         UmA2AvRC4cx6XHmizQ6TL/gs0WZydeABV46DIYQkyiYShdHoApR1AeGmrQtjNMIdQCHe
         cH8kHrmjPL+vBfeTyVCxAZTTvIjblxngc1HDAeLODnoxtUhMHYAte//DxgcbB6hQ4fxQ
         ItKI++z+hLDzANQHVaiaD7ReU1LIT/vdOz72WyuMJt72dR3ccNFK8Tw7/j5vBiskWScS
         i+/Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531m6l9O7Np7NQT4dRHywCFiyTjmcF78VDtqJS6bTZzETy7Depbc
	3WQQSM/60/H8wUmR5e/CTNM=
X-Google-Smtp-Source: ABdhPJxKUbO3qeRHrXJoaSlKDCPEPx0dUkRHQF26AxBLmx/IbWTfB0L9opcgB6R2oUzgzPbD3SM9/g==
X-Received: by 2002:adf:f341:: with SMTP id e1mr35831000wrp.207.1596103949636;
        Thu, 30 Jul 2020 03:12:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b787:: with SMTP id h129ls2423499wmf.3.canary-gmail;
 Thu, 30 Jul 2020 03:12:29 -0700 (PDT)
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr11081416wmh.79.1596103949039;
        Thu, 30 Jul 2020 03:12:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596103949; cv=pass;
        d=google.com; s=arc-20160816;
        b=gS8TOpoCV1gSeJk/QPFd8VhjUfmSKa9KDCTnqN3E08uCz1YvoloyPfrwSbloWsNfWX
         zQwhvMo00+Q2qTDdMHp5/hRgu3cECXSFAOjkASnpAu9XfhFCirR45Ej68wq9NdfRsnV1
         pKvJ12KdCluhlkXudLSirJbfp6e8TKE0fKcrSqy+k2rRm/Frp69Ygw6lXtYRyVkPK3so
         ui52Gae25jBLEXEGMPUDZbLMTnViypdlxDqfeBLl040y+yth2t3D0Dhf6Y40Fv+XAVNh
         PjGEdr9K8htpbClbQAlcvg9GxeXLoXEWzfFgQwcHY6MaGS71puJA7/t1wqVGlMslrhkX
         RMvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=AH/Euv/vWBWdgRAxchA40iafCgBkba2NQMqhqCGXQRU=;
        b=pz/t/Ag66MwK5WWg0EnC7GRXrr0P+g6rleces3/azKzJnx4QN19NhpKiSbkE7m+ls+
         YVW9vP7wLShulWbKYqh9gL1EYbzIp/0f+92ECHuzfYNo0/oeJAEt6efEfMK5Of96/V+i
         NNuzgBU6TljehNT3ewW8fOvf39LdLmY/82ogQKeag4EqAsOWuPH2UkVbwwtzBFE8AmZ/
         JbL+QAYemgFawXx7VtxLyzHbkwR8dqdA5j2dNXD04/W+YNDCllhNCZzIeuYeHK+pOFJd
         ezcAvwbTXAh6JrwJ3NSNCIxLjeBVQ20zBJVLEJP12EN6qoaPVsjQUpLudZJ0VUShveqw
         Ht5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=GCzIt4uB;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.5.78 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50078.outbound.protection.outlook.com. [40.107.5.78])
        by gmr-mx.google.com with ESMTPS id j83si683405wmj.0.2020.07.30.03.12.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jul 2020 03:12:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.5.78 as permitted sender) client-ip=40.107.5.78;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gT6xT19NSC5QEt1VaRX/rANELoBdvli2ZiDaLorRHKRKS3NRVkJVAViDa9+0F+KcEVhVASkGo6EAVn77FYNSDc9nnq/Jr4wnrrcvWRoWw6AFvXegHgUIGzRVLfcWXXVHdc09eHNHX/ctxxr406dvMLlhp4P1J7/qCj+E3ZBh9uCzLssfMr6E68oMjleHnN0RL8M4pZ5KWRuu9yg07Bq91FtY5Xv7G3u1pn8zvhWqUlumcMKHD3X7jDf8KcV89E4XRibXZCCBj7PnnClnIz4mqQutdx2ldoCh6U5lVkEiYxyBy9DpZPOtbTS61wAANV4UK5816CZQB6G01ZxZ3ezxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AH/Euv/vWBWdgRAxchA40iafCgBkba2NQMqhqCGXQRU=;
 b=gZFQueXJ5o9SQldfTiL5VA27pViOSR3unGmwb1UehFwWiqChE0xkO6Pj6WX5evc941NYkRFnFTkIBG+y/YGKLfuyqSQRTnBl2kKtkuuvtEu0USiK8sOETnkrC/N+ApTNBDvychNnrIqneI0SzygrvsG9M3Su3JaOdftrEQy24nVDi8jKcHNbBINBv7uYHL5ReJb+i/V9euTUcF4UPhkr1pScLqtsGGelJ7i9/avXp2JHOLLYh2TUuMXEUIcKLs9Ueo1PkdiTBUHEKrbnSQqMLDB9ZWXrUGklDQh4jImZ4OpsSxSETd5SNnceeCiWl58hSd7U6565wZugjzZ8KKRcpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2373.eurprd04.prod.outlook.com (2603:10a6:4:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 30 Jul
 2020 10:12:28 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3216.033; Thu, 30 Jul 2020
 10:12:28 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: sharing inmate lib with loader
Thread-Topic: sharing inmate lib with loader
Thread-Index: AdZmWaw8Iy88/9bNQSuFAgZopq+6Bw==
Date: Thu, 30 Jul 2020 10:12:27 +0000
Message-ID: <DB6PR0402MB27607A45F06E6F8FD23037DA88710@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 291fc1da-6ffd-44be-789b-08d83471102c
x-ms-traffictypediagnostic: DB6PR0401MB2373:
x-microsoft-antispam-prvs: <DB6PR0401MB23739121C83FE4B51771969C88710@DB6PR0401MB2373.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JDTj2ti1mbl9KCxUXGTmr6nVEH3+KPhHNxD7ZUl1o2NIgc1Br0im5HWhJz9X6hgTKyu+hBsS1DbSp5FSBpmywWku34OYluMQ4I2vjPVzVLOuk9qP2Uk+PoMDS4F+VYkEObHOLm5Y4QSfl/mmkPfwIimP475YuA2O7faWYlUit53ArWaac2zSlSL4+pT+kGZ0Kcmz6iuRTLF9nNjbo8NXsFDsJZc40oRVxszYtiWEukUrGNGCmxZrA+XcZUzRmz3JvPCvknk0aMLRVUnfspMQHVftYZYFor746IcsUpHo3IzZ2C9qKvUIGVINyTPK7+k6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(76116006)(186003)(478600001)(44832011)(5660300002)(33656002)(7696005)(6506007)(4326008)(26005)(71200400001)(52536014)(8676002)(9686003)(55016002)(86362001)(64756008)(66446008)(66556008)(66946007)(8936002)(66476007)(316002)(2906002)(558084003)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Iu5ir0vRgzJ0TEnh7ss0vPGnpmLFii2vT15aeVZBwHHM4gA9gJKpnXrDZWRANyCQaEf7AVPWwxgWIsITA+TdOx3B8eHCq3nrx6chp7REBWkJzMIGTjKNIZIQ6H/+W0Q+lByAKerOTtyrF//RAsQe/fZ7Jgnic8LDqbAT2WTRMESpG1H+wsOOOnMd8Vhmt1ccU3xAdGhErcoGNg04ReDeL4Xm+Q7HR1rfQmhaiCkZlNP8SWh9oDlr6OzJy3+P/efMuLEG00LWxuOxRaEuU+XoVT5ZbhC3pJYJ+mKKica9FOTLi1K+8hH1fHRUSQDQqi+Rc8oxlZ9m5N11Zqyzm5CijqP9w/9V7kfCzH4JAicJQzQSTUpA7KDd80J8r4uU/O79TWN0l72HChOda7Km+YAgdhwgCHJGX1I0NOc8hASxyFFORGAKLcrWqk8U5TUbBRYCiAP9d7s/slqmSViSuH2szEm8NuOr9XOPifF81F3uCKz9X8giIIsfJZrIGJ0npuQl
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291fc1da-6ffd-44be-789b-08d83471102c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 10:12:27.8314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XYlKdAyNBsVfSXG9NeR8IDlkgR6REUNcFHWE/3ut1BjDDz+ta8agjqvua3PwJrI9LdvMpVe8p34Gco4rkfsLRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2373
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=GCzIt4uB;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.5.78 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Hi Jan, Ralf

I am restructuring the loader code to make it share inmate lib, but not come out a good idea.

I am thinking such directory tree.
    Jailhouse
       |->components
               |->inmates
               |->lib(moved out from inmates to make it share to loader)
               |->loader

How do you think?

Thanks,
Peng.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB27607A45F06E6F8FD23037DA88710%40DB6PR0402MB2760.eurprd04.prod.outlook.com.

Return-Path: <jailhouse-dev+bncBDGILGE54ELBBKHMRCDAMGQE2JLRC7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D353A2FEB
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 17:56:25 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id m27-20020a056000025bb0290114d19822edsf1149875wrz.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 08:56:25 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623340585; cv=pass;
        d=google.com; s=arc-20160816;
        b=NJTqbRO1vjvVta5iyZchq+qi6rjVlzAIarVfYwNTkhdp+irxvGB7TdsEWh8KiHdb/s
         0NitGNeF6a6DQ/PoO/v7vW6YIyRR4EisjUzHOpnH5JFMFCk6psyifgDjxsj9ckCAD7pN
         PS+7gvWtKnf49EbFhTYcTuwp9jeEUJ/8wC8cXdcLWzdQg1QBpRS0a17StGiFfDdrn63Y
         Skj1MvVTyQqHk/o+/ghCcmn4fF5TyMEYybcH9qe5t9Ep9UR9+rzscAj7/jKqP0sNLddx
         2TYpKY+jA9Qdxr0SOSex5+hqp3/RLuFla4TXQj67LVcQQr58BBkpoUKJll0CynU1MzhE
         rjDw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=5t5A18KQib7ho0Cr03+JNGmeqbgB8mQ+V/hCc7viFNs=;
        b=d3qDjvZkXTLBCKNAaOXNhwGisfRjnDG3zOQAaDKlbYwyCLzQiLe9dawzzlswf9/o2L
         OeSOP7OtbDRwpX3sI3L1LPS7P6E0kGr6f7wo3FDsQialUdeITi/2cSVbW8BzTtPgjosV
         c1O77iLCI6KlcnvI+/MAbHf2A4oj//Yv/10rix/Wf3Epdat7klijCeWFgsue9j/U/ktw
         G8k7Z8VDV0LoK6US20YssDapUiq9I1hIlCp9s2wgycgCW/0uoTlEVzJllt4+lP9drvpn
         9S9ea1wsb3kA9xSlmV0mB5oMyNihwX6A4we6PRxgLpCWxidjl7Ys1OYgFhO3IkLcumo9
         KHBg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=aZyKAI2Z;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.7.119 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5t5A18KQib7ho0Cr03+JNGmeqbgB8mQ+V/hCc7viFNs=;
        b=UJxM0nRqdjpv1b2Bs6W25IeXMwIkS7tSJpXIDSqpXUBaxtY+A4K7U+7Hg90tLC6CKv
         Ac5Zj6jaCD2jNTulkkOuwqM8a6Jpgn0LMteIj75QD3Jqg8sFYILyoR2wc/OIP/+46F1S
         vTsUQFDdu4oXgj9Tmuwqiuga4ry9wYGxsLk2j5cV/bAHau/kzebCbzejlRYxGb8p1EdS
         rxjCCSYsO1mgNKB4rVlijVnBJZ9rIx61EcclZ9M3w1oI0WTR2A3HvklX4/rJ8bc9N+Im
         90cYFjIHfd+Pq4N4wYZvMo9t2QUq4z8ZSPDlWoPbLYwNGACD2nRCrxlwqUL88l3TCJFe
         vgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5t5A18KQib7ho0Cr03+JNGmeqbgB8mQ+V/hCc7viFNs=;
        b=kJ/kJ+R+SrjOlK/ZUg4b7NM4V1R2o8q+aLbLnOUdfQhXqihPcPCKy8ZGXxT2ZTcp5v
         zVOH0+bX9gt9E9ASaIaYqYsbJCtieXwk1OzT31Vi/J6CMe18Qf3rUBK14EswU2TSrQIg
         POovj5ULC1pELW3MOZE56+9qL6+q7rvE71vwjjudEqC4nbPRPJD5eYF4WAyHui/rBaH7
         TMYgrN9QVAo9/cvqof2Vcin+ecVjMuaedIcgJO/2aQSbGyj987l+dWGBBbF8PmQNEyAd
         IG3OSV0eMBEoxxC3Wsv08oSBG8UJ0VQ2kZOlIk8FcCtYGo4TzULmURh3FG2r+ZdkAZG6
         hR4Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ujiCx5CCaSVnaLQZvsDiQJkQyyHlHxjDZnNO9925yaKXFK66A
	Gy1MVhvy/zpzIRw2gHKRrKA=
X-Google-Smtp-Source: ABdhPJwok9Rw6ik196WrpB9aUNSZJZTZLu1FbU3DveZvuKh44jDm4vteopDXyJuHTLxChGMRc7gaYA==
X-Received: by 2002:a7b:c25a:: with SMTP id b26mr5995744wmj.31.1623340584851;
        Thu, 10 Jun 2021 08:56:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:19d3:: with SMTP id u19ls1610617wmq.3.canary-gmail;
 Thu, 10 Jun 2021 08:56:24 -0700 (PDT)
X-Received: by 2002:a1c:b783:: with SMTP id h125mr16016738wmf.182.1623340584012;
        Thu, 10 Jun 2021 08:56:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623340584; cv=pass;
        d=google.com; s=arc-20160816;
        b=eb5qo6PEQvkhVvAqhQqYcs3HwP5roJtvjL68k7PrgQ9ryYmwOtVeWFcriQ6CGncUH4
         sYD77JFnY0EFhphLqycB9pWMnrfqivFMxXazRrj510KvkbuxBgYjIH296Sm7+y/Rol04
         hSnI4a5sLwIrpbMG0i1oAodrzDdmrLphdgIOUbRVXZqLtiNECRMSarVjOns5sWQWnATw
         Nn3tA4ziS4DlKphAKZAkzTlmPcAwxmuoif8tsnJb+mQjZx1qkV3RKRSilJD1ENuJpD2E
         TUNJ97kHUjfGMC3747TnpSsAyXx0Kn60Zrk76Cy7QSibg3raS5JAsYnXHFH5CvxgmNA0
         rz0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=Jnm08APBbRABCgNowGbxaVKzlj039EiMH/oMaz4CkGU=;
        b=XQsd/P0C/6cP4bIwiAVktwc0ozhpD+9u4zlGrtc+tt4R6acCo5l/ERhOF7PanqznGv
         2IWdhjZ10/IUlxqsn20NQ7FQjhqOIFl0ais+MOphFT/VZvoCZ9Xg5aolR+SDme/dEgx6
         nhMSitMIrMLWps3u6tyx7d77uZziVYNAS1q/Nrosq6mG13pD9rCPWlhEpw7kE/WptjRP
         A5LBwtXVRlhluZJuljv9DJcR/GfcbnDQgU0594H7Iehuu6RX9wkxqnnO8hSLtOgjaDIa
         69fM533kDs7VAvPj74yemRJESDaU1BGv+GhAPId7fHIpoUCvDKirSlavIcLEp/ZYtcre
         1L9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=aZyKAI2Z;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.7.119 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70119.outbound.protection.outlook.com. [40.107.7.119])
        by gmr-mx.google.com with ESMTPS id c26si208351wmr.1.2021.06.10.08.56.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jun 2021 08:56:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.7.119 as permitted sender) client-ip=40.107.7.119;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pm7f57o8jzr/YvKkzkun50AFlcKT4zm0Fh4yaim7qt70g5eyAy+mNOLxWoq8T4J1uiw/qJ8lUuXpf10rPSfuSKbcRXYPcSIXyvO54VdAP5NOCKP4OGDuwQ/5EQ8whS7sFiApX5dkGN1q+u+bFwkY7xE4jJCSdRLtnzZW5S+yYvECVzsSt2XBxL3AN1brQ/64e/8hm5gBHATl3Doi39WoqRJcoZJC6zMA8pnu4XNZs3FSduCoLsr7awjleLfZ93tFfYhIG6OcR8JwEbMzZjbzmBVjoERA07cO7E2LtQvF+TaJ5eqBgcWIXHuUY88XsdLgmiPYR0dqCEdmXVoMkEn1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jnm08APBbRABCgNowGbxaVKzlj039EiMH/oMaz4CkGU=;
 b=OXMYAN+wn+L67sLny+/TP7rR6tC1oBGPHliW6FQBM8sG4U6+eWR+OlIaCbpxvzraDbaPPYtnna7wlASJtizGapC+/pNbdiMB6upNruNd5T2BQHv35j7KS5Wj4yMXvcuSzaXS7igK33BmeVNj/BhlMv0PUjaxPjyskOuHKD01fHcbBwd4wWfyz+Eu/NU8aXv8Gi8Dg0eMNEOUyWcS01WFGZQPcfHrw+BTO0OukIiCxUK4ftubKb5/+NLF09J3Xwk6nBR1eDTbo7ipfxliqCIj0HjQYRv0kvTHL3YTVnwDnVe6L330H/+BSKt2xh4VwhlJ1PT+eHPTU8mcwJPNBZ9xIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM6PR02MB3975.eurprd02.prod.outlook.com (2603:10a6:20b:49::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Thu, 10 Jun
 2021 15:56:23 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f197:f089:10bf:b446]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f197:f089:10bf:b446%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 15:56:23 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: [PATCH 1/1] inmates/lib: Set cell-state to shutdown in stop()
Thread-Topic: [PATCH 1/1] inmates/lib: Set cell-state to shutdown in stop()
Thread-Index: AddeD63ehohA24KrRpu3L3HRhVf/CA==
Date: Thu, 10 Jun 2021 15:56:22 +0000
Message-ID: <AS8PR02MB666395F0E1F80DF99676D9B7B6359@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.65.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1c22527-6e69-452d-fb30-08d92c284bc4
x-ms-traffictypediagnostic: AM6PR02MB3975:
x-microsoft-antispam-prvs: <AM6PR02MB3975E6EE9531C595EED41A23B6359@AM6PR02MB3975.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:212;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iuawxo4NYCPTUS4k1bg1bHlq+/NLi4WPDfR5EFz6HlE/FkeWK1d9lYl2pwOI0S1yX4AJOGNAT1LUVMBveJ9ihs3GXyAlD8kzahlwC71vMYvw0eou49bAlH9o/FMFbwz6YRqJCOHl22MkpJgnsHj5XCwDtybO5Hfcm/ml9FaW43dUcQsqjkQWUEumZCbtXu3k0rwwr8Az98BELGGx2+5Vu/Ok+Kz/B/LpMERS2eL4zQqBUgl8kwz520mEv0qxM2fO3RgwA/j5TjsLV3w71hoalgJaGgcd8NMmpXNand059uXckRAKJxlqzJC93cCHKEDVK9BQTAufDBe6/AYPn2X44r9bFPwPqeeViuYANh8dKryD5M6MEQ7xuExMz3NwoyohL1d7zJFi9KDDvoxRnsvthWnmMiChQL9f2ZBczc1uU5BJ5NerLGQxc3QG+VLHRlsfMOZ9bt5zKI7OIVeddTnLqEWRtQyC49XD08XKo+jLO/xAyogwimn7foEr3BblOj4piVjRx44Mn0hVAsOIGKFBx37OOLXEL2lzufUGUuXn9ayzHeUo7XMM8nKx93lZj7pDKIX+ISkRQK1KAxAc+p3RNNX/kDALAuDqzAQmWGfWO/s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39840400004)(52536014)(186003)(2906002)(44832011)(55016002)(7696005)(33656002)(5660300002)(6916009)(8676002)(66556008)(64756008)(26005)(71200400001)(9686003)(66476007)(66946007)(38100700002)(122000001)(83380400001)(66446008)(478600001)(86362001)(316002)(6506007)(8936002)(76116006)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+3nyU4SaFCKBGQvs08dpFwIpP3Jv1cIuPoDglFQhFRtT1KXLSESfnSTSB3ID?=
 =?us-ascii?Q?ir86/aKXLgEGqvy9bhH6MdVo1S+uva3WamfGlxzJfkGjo9kjvx6Raz2EtHoW?=
 =?us-ascii?Q?F5cMrJXFNff1ptQBgR9OTW5VbWdjBqLdcHxYV7B5Yyj0uXuqu2LjqxPwNbaa?=
 =?us-ascii?Q?bbW8Kk0C4cHIhewDDl8x2dc5X5iZQau+bHdyMukxWe961OqGrYx6MvLPGu6N?=
 =?us-ascii?Q?r3EWHpR7+HhnaK61shO385Q8chAN1GV/V55cYJfUdoeEHvlZmJhb+HZ4GnGw?=
 =?us-ascii?Q?H1A+FcnLzECH9rTHcymIQpm6Xizoty/b8mVJik74lUy1hlsD3NUnD0joeQ0Q?=
 =?us-ascii?Q?+D0bLJpzRfkt7xtxv4Khz8IhsNvEmBQtsvIXM5vDeGI1jWWtaPnItoW7z4fF?=
 =?us-ascii?Q?J1Oq/2h4WQrR8UinMbAVfiKOJXwJIyj01JuwP8JdtgTiGpnr7SRAvgxU7Tmx?=
 =?us-ascii?Q?PwK2fkFe77+FNrjF9CMHCmtbUlw8ev50CkAMU9dhepKBxSeyvryotQ3UlYUT?=
 =?us-ascii?Q?RTXgKgxrhK3nC7ZdMOjQJb9DN32JAGG6CTVh+U4ZLyRs1v1axPC7K0dm6Tb+?=
 =?us-ascii?Q?kE8b7+ms6vnb/FJsa8pCdJoPmenQw92CcIFgS/gW0ho+TFsI6Ni7n4kzizk1?=
 =?us-ascii?Q?Vih3uFI9ilIAfd7aIU9MDFPIak6ztSlir+5TlD2WNLAB9NPFDeGjpeDGGgbY?=
 =?us-ascii?Q?33FuQC2M4JurI2g16Nr0H40NARfgciHEA7Oy698XwkAiTasCwu4qDxfBJbgI?=
 =?us-ascii?Q?y2I3eTSMrE/6vbMXA8A0hLAefdp895HDa/Xv4qrsCiZzrTEQYON1bYZyLG9A?=
 =?us-ascii?Q?X9j4KxPlEoJbfSbZOfEHaOP+WWfcS9Np5GjN7Evyq0EyVpAf5FkHZAG4oeTP?=
 =?us-ascii?Q?17yj2g9fS0n2W7W0vxxDX6aeJt+mXoLEqB8OVNb3XuEJ8X69zGezIwpQ2UGS?=
 =?us-ascii?Q?4aAqGwToR8pVN5jsmlDWPgLeGqIE1cnHrGd9IGMK/G2RLTs7Y7uotfBhRZTM?=
 =?us-ascii?Q?AFZxav7+jsQPkDdttraxw4lKaIgeXTBpWRdzusxXJr1LUSR/MVlMY+ib3Xn8?=
 =?us-ascii?Q?6gQadr9Bl84mR9kjND030nleF5KZk5vkV0Pf+/CXzp3tPYXAFF6yXg6erRdQ?=
 =?us-ascii?Q?uN9DhVKr/kzAVgUocz6NqKpoP3jVSd7SkSP258wFGCGqVMRZonhjKIhMtHx/?=
 =?us-ascii?Q?6xY0V/goRWRZumz8r0mS2iDNFkx2k6qSweVe8jxMqqLEAEGr4/ge6Ad/H9x7?=
 =?us-ascii?Q?RbOziFkTR5cevJ6KSttUz0y27zK3/bKplY987hJ+ThJnMcmAl3zVTbJSn2SU?=
 =?us-ascii?Q?rh2pGIk7aibwEJMPRwEpB4TU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c22527-6e69-452d-fb30-08d92c284bc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 15:56:22.9905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WnEiJ1U+hAsOjMtoQYXtdbEh9sZRT9Tyl9B3bjklRjZrbDdR4cqVA0sAfObP8A+rY7WriQDwXHu2gXimOxm+tA5upszazF4KeKiSr04v7EpCDnHQEaIP4Bjf6+lWNQoqojwA7dEDaHChWqYCTGqH6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB3975
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=aZyKAI2Z;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.7.119 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
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

From 6d0539fdcc4734cd0ae54df4b89df5a2664ac83f Mon Sep 17 00:00:00 2001
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
Date: Thu, 10 Jun 2021 17:27:57 +0200
Subject: [PATCH 1/1] inmates/lib: Set cell-state to shutdown in stop()

Ensures that calls to stop(), defined in the inmate library, set the
cell-state to shutdown.

This prevents the cell to be locked but unable to respond due to being
stuck in the halt() loop. It also ensures that returning in inmate_main()
shuts down the cell.

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
---
 inmates/lib/include/inmate_common.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
index 1c20a0af..250531ea 100644
--- a/inmates/lib/include/inmate_common.h
+++ b/inmates/lib/include/inmate_common.h
@@ -92,6 +92,9 @@ typedef enum { true = 1, false = 0 } bool;
 
 static inline void __attribute__((noreturn)) stop(void)
 {
+	if(comm_region){
+		comm_region->cell_state = JAILHOUSE_CELL_SHUT_DOWN;
+	}
 	disable_irqs();
 	halt();
 }
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB666395F0E1F80DF99676D9B7B6359%40AS8PR02MB6663.eurprd02.prod.outlook.com.

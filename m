Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBRNFZH4QKGQEBUDLTBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id F151B241802
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 10:11:49 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id o10sf656307wrs.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 01:11:49 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597133509; cv=pass;
        d=google.com; s=arc-20160816;
        b=afZ3yD552WZCAKrDa/kr62JUCZHiWCZZ/V60W/QXO+Ed83O+hhyYmPf2iARPPXSTZf
         xIWGppEO4TOMAWsWB49x36TROR6kFWwrdQncBDKUbaz3qcwIvcph5woSWCF3xmx+MCas
         uhuJ8DOYrcX0CUX4WTg6QaaC1um1LXYYx91Il0SSotVXNLTcx3lus/ukQBZaaktm1yi0
         M0weEsJ5woPM0M1i/7F5U65zpsddMRQNc0nEEhNNmjzIiIeqkVNEhhT0tsdBR/wyRvjo
         JJdbGhWFKsELdrH2oyUi1C3Cd1iQYN8ZRS2A956x9R+eJlWeWmQFw4Q6v9hrkCpy3j/e
         fiLQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=a2fNLYzh6ktBVd1i3lgRTwQVqyRmIHQHx7oG+Eq5EaU=;
        b=e+p94vfGWog/2MPZ80qHgBhcFfaU2xujO7qFyDzvlJdHMs7oJZZ3mJ+hXZdsda3+cy
         VPM5YClFy1fKhvx2EmVKgymBcRr3Mbm9emfwSse2V+p9fM2v/Fv8kFeu8IVlbmz54o0X
         2vA540aSbvbWOaRZZfV92KXJCotvOVx74qNE+zTcDNomGnMLuDjRCd2ceETKnFrAhdHM
         a/SUx/9dsSPDskM0nUQ70J84sJ1RsZNIk4R3dSGyTmqY7H+HS1ZAyelnL3WhFy53WbgB
         +S8b93rNVkoKvd3tSjJFAPxqUC2bRP+2MeXInXs9ZFUwWhVofVDkeDEO5lyPtETH9mPp
         DfQQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WLB4t1EV;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.57 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a2fNLYzh6ktBVd1i3lgRTwQVqyRmIHQHx7oG+Eq5EaU=;
        b=Ed0Qvx7k0fCAaRDZiQXzuKTHJ/B9+cnEhJziLvQNGnR81bmbLMexxdnpfNHqFEVdUN
         JZ/+Tsf9eRZuiCCzLdNPJPXrh5uP6Rb19sotWxo7Ss7xV0/eoZU5UhX6T39v6TdEiSdR
         1k8mtR2sD5Co6WW0iDUNu1eTKrl2XNkuV106n4NVHxoTUrcmnEvOqZnopUmThUfGFMYs
         nuARChPhFR1YF9HMCtxg7u+WmYt6GVZWwO99EqXKq3On8heTrQYFYTZftOuxKcLUUpWi
         0VBss2GsN9+sXIkmIZyG/16dwCAo737LBxdeGXiwhtz3WnMhlvy849okKhTpBCqVGJid
         WnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a2fNLYzh6ktBVd1i3lgRTwQVqyRmIHQHx7oG+Eq5EaU=;
        b=tog4/VGF31ppUP/SrFNBokmHRvG8xMk+yRO0kYyyCwxgcHmhIXjQGECgEQkBuoiWky
         Bh5lXOItvb8us/dJe+fT1GBCwpnEqTquBqR7+DSkTFDBPaHd0NKmtGKZ7HbxGABt6k48
         MbeFcfYUfn8Homs4fEIeYphD/G8nBa4EHTMT3JVjWZ7KT/C6UzsQnuUOOvajG65LsxDA
         pognZVTIEM10B0wmrc8YUtIzpvFBFYt5odScYJxVEjuuTkvZGk6byXY718c95UGiuFN+
         bHT0Y40Z6nTMs+UQdh7DfPPfNNlk7ncgxTgkhvVMHSXp8iC3r4JHhNWBOL92W6e4841H
         j3Pw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5314+iRWrDr39tb4A4YuL8SSSI0AAbzjB6IWmaVSUe/dymL7J7A0
	0CTTXsQuhcSEj/42v4WmkWo=
X-Google-Smtp-Source: ABdhPJy6uQDs5Z+r49U5yHWlFLylqFCMBllj+Mef1H9kzU0pxjkHE5dZ6wBwEBnSjifkFNJbdE33OA==
X-Received: by 2002:a7b:c20a:: with SMTP id x10mr3079908wmi.177.1597133509705;
        Tue, 11 Aug 2020 01:11:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:3802:: with SMTP id f2ls579977wma.0.canary-gmail; Tue,
 11 Aug 2020 01:11:49 -0700 (PDT)
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr2974314wmk.145.1597133509126;
        Tue, 11 Aug 2020 01:11:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597133509; cv=pass;
        d=google.com; s=arc-20160816;
        b=UeDear3OtJ4d2v+BZk3P/lYsPcuhobYG9dkvDPGK+HEd7luYyVfekeS1fO9F4xCND2
         6VDHS5V8U9jsPRGSs8DO2s60Klczk2c8t9VGxhoWYb1zuy98uZkPgx3p6sDveiwOGG/i
         RBm1Ed1UrdBDcHtE1wLgC4F+fpsXs8kSg7pWsVpJgvpgHtP8BMkQA2kKWKGM1XgjoYF5
         WUCm3i1W7/vrydT5b7k17N8VtOgoxjK+NAZIHu1QbroaJMPxWhfYCIqZRLVu26VzwfM3
         Wk5A/lcyi/jAfwRrjHpb5XmYxAQARyUaHv/kx4FSupANkDxoPGSSiw7d0BI5BUvBxuHB
         wHzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=gEWLgg10x+O+WX/fnKFJbvNg742DEMpPRsBRT59ld5Y=;
        b=nmPrFTsrE5JchNptPWQy36vfII73B/daO/U4qjzu8FUY7HA8/tiJovAlV9Ik7hFLLV
         WCUFuxsM2REjciaOtROBa1O8DW7PLfpdvvyskNRA6MZ2riMXUy4gkDx0bOtfwG3TemsB
         Fqk5snIYGRcktlp2F+9bIEguI5IFOIKHKuiHy2roXS3Sm6c66EeR2MMZKC7wHje9nD8e
         /faIt2yEKPxCtMgzf0zw/23xmkqhNYmtxQH5N7UV0X7o58SzTlaAT7BLBjtD3sdyPydF
         AXRkleA82tgabTXCyChxZb8wru5iKwj4GOkI22qzYYVwXiZGUZlc3m/w3mXDIMjUS9Kg
         5ZQg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WLB4t1EV;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.57 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70057.outbound.protection.outlook.com. [40.107.7.57])
        by gmr-mx.google.com with ESMTPS id j83si170625wmj.0.2020.08.11.01.11.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2020 01:11:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.57 as permitted sender) client-ip=40.107.7.57;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KECCyr1Mvr4cz7wrGT+/Gdfk62Y18Aq5I6XqivfIp+XF0AfQpe+HWKey5bvm5ihK1FL1Xfni7Jibp6gvR9cccBeyOSTtfKZrWrbepT2ENzgkqXQGcI8hzEHpL/d6uKpbbL40z1jueWYMzvpiB/fCm82Hd3O9t11qr1rvAn78ZFg5DKQy+QplfwVW8Q7cB3S00gv2vIEr1Iuo7yIVtFWTnTBzeFF0un05DJQCAU3LK7eT0elhPGbzxfjDOO2fNbzMNktugHhNW6oIXqLXi9+MVTaVDQLrQvm8UdP2V2+jf3DwLYxOCPuC6DWucfo2zJlhm9bEyp0bwUFRybM2NTujHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEWLgg10x+O+WX/fnKFJbvNg742DEMpPRsBRT59ld5Y=;
 b=T2HbYUxZbyLwqj2zDnvs+iuC5TmSnYCCtzcqUWumO/WRMEnPuqysrIzHY5yc+aFZOU0hNHvevrIsBwudGIZgfYYfFdwcDoh20mFMgcrBkr6QiHyMMYcDjUVsUDfmaSB0FrIWVn7PPkrfucBumsKHxJdt/reV0/S1j95wLg7B2Q0LZAJLNwnb+2SjTMHbOevdZ7ohepcDFmV7LGMW/5UyM0KoYvT/VE4j9IhFYbwcv8djC1aGWSsLL3dgvnNlKzcI9nRl2Cf/TX9H9xGHIZWy/od2QSVfi3KcGIKE4ZNBBgfzbvESi7i1GV6RYe3J8Q5qFnBbUrLpZvrjFJL5OOrAwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB6261.eurprd04.prod.outlook.com
 (2603:10a6:20b:bb::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Tue, 11 Aug
 2020 08:11:48 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3261.025; Tue, 11 Aug 2020
 08:11:47 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
Thread-Topic: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
Thread-Index: AQHWbGRFNsJMjlZQR0OFT0cwrAb6rqkyizKAgAADD4CAAAKcAIAAAn7AgAABQwCAAACLIA==
Date: Tue, 11 Aug 2020 08:11:47 +0000
Message-ID: <AM5PR0402MB2756D6D83FC2F6DD253C968C88450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-9-peng.fan@nxp.com>
 <4821d0a0-f8f3-582b-1182-9c5424f68ec3@siemens.com>
 <AM5PR0402MB275665257ADDAFEAE4B42B8688450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
 <b62f684f-82e3-51b1-e983-e191d719284e@siemens.com>
 <AM5PR0402MB2756172E76077618D002D48088450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
 <91ede2a2-f658-7588-7add-fd93554e66d3@siemens.com>
In-Reply-To: <91ede2a2-f658-7588-7add-fd93554e66d3@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0e9fd34c-0d77-44ad-30b4-08d83dce31bd
x-ms-traffictypediagnostic: AM6PR04MB6261:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB6261D42CCE68A967DCDF552E88450@AM6PR04MB6261.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vul+YoCPGCIrd/WVlbc13Ucgo6Y7spA1bpD0o6fz5emb8VjMU4q8BMiNHh5+GC/bKAuB/f35azrLzWTy9M+E+ndGR/CSigADj1qMrO9E9J90HN4093NcAjSV6nO6SVzmtXPIUX3dY7jmkSK+RmKKqbBE1O9Bc9eOrlyv7Bw3v6UZ2Y9hWwb0KK2B4L5y8u47xbyfVJ1KBj3OtWWZSVKm08vbC3WDfljWO6AELnZ+d3goRvcp/MGhGm2yizcVrK1B2s6gv5CU+Z/JRFyo45L1dNrkAvmc49EgK9ysUrAo4/AYfTEXoKSkUWerOLSo6SMVMhdZ5ViGF4M1rcDngV5SeRgggvbxv7u9k+hmFzrqNzU627093jBehFQIySqwTzmbGG0fhnh4fd5BRNdMLuy4uA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(7696005)(966005)(83080400001)(478600001)(9686003)(4326008)(71200400001)(55016002)(2906002)(186003)(86362001)(6916009)(316002)(45080400002)(6506007)(53546011)(52536014)(8936002)(33656002)(54906003)(76116006)(66446008)(66946007)(66556008)(64756008)(5660300002)(8676002)(44832011)(26005)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: n5OWQHA0e4fObq0+ut7OvhH87vSQKg0AEzzFjoJNUk6Gwh+434a/KxBHSXOywa8FhS+XEkhUw7V5AjHA61F1381LPb+scs6khDVj+cBeRVk4Inz7WHjCdSfUOoQZkCAP2gUE+h/jjz0+bCMMncOGHnu6icLkrxQRzXte3V9Zx0LmwphJxYWpKUFTZYsCD9YV+yBiMx0ggbiGRTkcFTRriQhefc7W/qjP2PT6hU/X+jnqTdiptmGUi22Jzh95J0Jri7WzOjD1OHSAPmlkly/EGQo0ay4Ka9jtTLdfbIDOMvIc/qxVDgZdSWBw015dwyYdG20PrN0G43c13YUQkppKVV1qDevhAUI2/Nv3nngbpz+JfBb9CwMPRqdq0HpmzvtD4CgclOupON3GuvDBt1j0bMgVb6Llo/btl5P2eqsSG9Rb6aotQFuB044bi13ru/d8Rif1dRBxJZznOyDu+A0hnK4PPIfd6OtMDO7SpyEODnXdbINYMkme04Tmgx96z01BPTiVqSeC3drDzzBNRGlIASObUqZ9hQa1Clqb93Kn9oegbF7EsUiDrs7feCJn8RmTQpR+uy8UzxEiNF++YOcuuIHjpc/2xl3ZaaA+eMMsJVq0TUYhkmmlgXW1PEMvFH6H8SjVff35hK8rRPraJFFSWg==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9fd34c-0d77-44ad-30b4-08d83dce31bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2020 08:11:47.8235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mUAxS4NcRh6jOtdDT/wMx8Qqdybinwm4H4/uVjPSG3gNiawtSzM++Dq2V5ec0gf1GPBFtjfjgqniIkhw9aKF7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6261
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=WLB4t1EV;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.7.57 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
> 
> On 11.08.20 10:07, Peng Fan wrote:
> >> Subject: Re: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
> >>
> >> On 11.08.20 09:49, Peng Fan wrote:
> >>>> Subject: Re: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
> >>>>
> >>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
> >>>>> From: Peng Fan <peng.fan@nxp.com>
> >>>>>
> >>>>> bit23 is SPAN, not reserved bit.
> >>>>>
> >>>>
> >>>> This is not correct, see D7.2.81 in the ARMv8 manual.
> >>>>
> >>>> Where did you get this from? What is it trying to fix?
> >>>
> >>> DDI0487D_a_armv8_arm,
> >>> " D12.2.100 SCTLR_EL1, System Control Register (EL1)"
> >>>
> >>> This is just to align with Linux Kernel, since the head.S in the
> >>> bootloader needs this.
> >>
> >> OK, this is ARMv8.1+, I was looking at 8.0. Are you sure the reset
> >> value changed from 8.0 to 8.1? We definitely need to remain compatible to
> 8.0.
> >
> > See
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Felix
> >
> ir.bootlin.com%2Flinux%2Flatest%2Fsource%2Farch%2Farm64%2Finclude%2F
> as
> >
> m%2Fsysreg.h%23L577&amp;data=02%7C01%7Cpeng.fan%40nxp.com%7C0
> ef784761c
> >
> d1429e247808d83dcdd7bd%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0
> %7C0%7C63
> >
> 7327301580538181&amp;sdata=3GaVwiR0l7hzblbxYpcxJ5IUun%2BcnYb%2F
> P0RNlE7
> > zz0Y%3D&amp;reserved=0
> >
> > It not have bit23 reserved.
> >
> 
> ...but set. That is broken with your patch.

Overlooked that. Then drop this change.

Regards,
Peng.

> 
> Jan
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM5PR0402MB2756D6D83FC2F6DD253C968C88450%40AM5PR0402MB2756.eurprd04.prod.outlook.com.

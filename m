Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBDEFSPXQKGQEVS73S5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 044AF10E67E
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Dec 2019 08:51:41 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id s25sf825857ljm.9
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Dec 2019 23:51:40 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1575273100; cv=pass;
        d=google.com; s=arc-20160816;
        b=bIiJCx/pha8ZnRyf4N0xMngbUxK/q9E8FKtFKzPUAyJRUbq6LUW+hFDJJUmrlVhcfj
         dP6vd22akCqmXACHjWXZ3B4u83VyRVSEsr0fOFgdWJvf/GDubZksBld2jwcLEUUVQiKu
         nSgHK3TeciQpJRiXVX1O5X7pTCBkezHjs0sfq1kcF5v4S9adJ/A8NjIkseIhiuZpf9am
         DRDayY0xs+vkAtV3M+cDpqaTGW7p2EUNaHdD0iOWbuOxD0C9Cth1h+3FW1iaTHp42iXm
         K7Sisp4t0LFc1N66bVXiPKas6dAi+9DLZXZNfPEHa+RIE0rDCVrXLzYZniKHXzwXoDlY
         yXIg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=IRItGxtlLaV4RIykwLrXwBSkZGMNFJzwvU1FlFN9ArA=;
        b=Z0ScwSAtp3N2hugMOs6H/g1SLvyLgHaWl0um8+0EitAl1lZSZ3pHYy/QtRP8DnoeX1
         KWEXoOL8esMg0F4VoxX0cdaEF/Wn94Y04KMDryCaIFFamy/qEg1NTGIGOzmqNJU2agRG
         g4svALNmQGWYgbz2gDX9sMeJLrNqWax/gDxJ+jOCuaKRnPbQ3cxQ5vDC5LF/SSKVWcuj
         j/px97z+7d4l7uEcNvec+Jwv1tl103YB0juL923P+cq+DG9zx+VpY486g+KXiBIxcuc+
         oqzXe7Zk7z1vVkpMobC6/wfKo6/Dwfbx+bO+Z5x0+RmPdpnamuRVWOTAvWb2anXcCeNK
         bBTA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=sygQgUkS;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.42 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IRItGxtlLaV4RIykwLrXwBSkZGMNFJzwvU1FlFN9ArA=;
        b=KuA5JwrWmfjWxWwOKTQDrVLQk/Bf6NkszjMvSwchS//UcHEXhrisbpMDOYJ9SSur6u
         umMVlebqJMhJFrZMfixsys6HIQmg5OuG7pXeGv0AYbE34k7ddtyf3Qqm2O752+asfyT7
         33WsOlOa90LqMh55Il1N2x1bdb4b08acKlYABz1QcB/L7h6xDcKbcyYS1SudsdK29h/Z
         rSAp7hEyEGaGBDRUPik8WmUFYJru6hP9FDcVPcDQ8NCpgJ1/iF1RKjyimjpCI4y3Wapr
         Xh/kFMbvEIC0grzS62bXMWuFiHRG9EulLLqDffthsfeoE5xzyinbiXN433GuPTbjgyMa
         QVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=IRItGxtlLaV4RIykwLrXwBSkZGMNFJzwvU1FlFN9ArA=;
        b=I/DjLBoLoVaFv1/pcp9QMX3uQboLnmWzAlppeMt1J9Cg1fc/6vRmt7PxLIJWTrxzfw
         SgDUoOU4ER5Z6jyhKesJOgoB9V/nSl8GAthVI8HXDF1rL3/+Kj7lvB9X2/RMW7ee/3Sq
         rq+StxG7R/xTI33cETO710891+o+GJd93+U6g6GZ8yJRFFVj0MaXUMxDLnsvxKPWyd6i
         cSefOt5YI62XZcWNw4X79UScR3/QUs+ttzeAnbs79Wq0InUDQ8hYx+dCycomAZ25dciM
         wHXxCbDL7uEC4LwuJxP8Eqak24JzqeChIBaM7mK+g6ERzIpn2QvvgIlk9s3EIdidiozZ
         a2zg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW3r4bYxPyRR4pwDyAXSDtuv0PahuWuPQhA6yMU0o2qoq9wwFuw
	zZYgOZrfQI4gz/Nvwlu1//o=
X-Google-Smtp-Source: APXvYqy20PKYAY/log3ok61LR2ICkj7eEadaTRnRbgccpXlNFA0RvQxCyLJW0xAqLYhHAUY+1Scy8Q==
X-Received: by 2002:ac2:5ec3:: with SMTP id d3mr14871506lfq.176.1575273100561;
        Sun, 01 Dec 2019 23:51:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4ad8:: with SMTP id x207ls957429lfa.4.gmail; Sun, 01 Dec
 2019 23:51:39 -0800 (PST)
X-Received: by 2002:ac2:4436:: with SMTP id w22mr30342806lfl.185.1575273099694;
        Sun, 01 Dec 2019 23:51:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575273099; cv=pass;
        d=google.com; s=arc-20160816;
        b=b0oDUIKCD68+HHpcqzjtxTVwmaGBL+sFm7DRDA2bXkI5DA/F4GgZ1zKVO00My6q+ho
         Jy1F+yiZrNP05B/cheGfY4XIqdqlG7Mij/fErKZdzHEjvurrrQLKvi0l4kccZsm0Eawm
         7tBTcpoDn1TK1BQysmuYS11OHTyXxMREugHwphtmZXDmUP+lK2hXtmLpy7dQew9UpdZ3
         zpICs71Wa/tL2oYwpuDr0gPKz5cbV4zscgWuUJwkV7gZk+g4fw9rHFTDyd+8lnzVi5NJ
         eTj2Q1sH99EGgzwkru215wt1HS7MgIgfPjUlp7+hopDMxy4O6a0w69p+/1NOpgOzCGev
         1jJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=84xGf2WdvGMo28nFUtq7l/TjlTjF4oF7EoxjqDeGCRU=;
        b=un1gxIM3mQhvSsSPDTXA5pqbuQe5+i3r3JHzSY5aFH0Nnckc7poM4nled36sgjfi0Q
         fCQAYQQ1AFSuf4FBrIzcjD79M/F7jhx07oR9r8Cp185AI/RHk9WmX1r/fsZqOXt7H8+G
         sYIUN4HauHPeOEOT7WnZiAW0VpiAjOc8lG/r2eZhwy6SRVBAYvhGalX/6kM+AhMo017t
         UdRCZ8fTtTdmyu3rH0OpdY88CZG7U3M30sc622q0B2FVHpsILwC0QLuoBP6JIEr1/RFO
         vPovfHQ/bIsQPB6ilcNHRM/kHRQJvkGA0RCpSbY/X9EPyQ0CaZrwOGGDPLFmOWtI8LWt
         76qw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=sygQgUkS;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.42 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80042.outbound.protection.outlook.com. [40.107.8.42])
        by gmr-mx.google.com with ESMTPS id b5si1421010ljo.0.2019.12.01.23.51.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Dec 2019 23:51:39 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.42 as permitted sender) client-ip=40.107.8.42;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nE0536xdCkOv/hVc1xxlgS6DTj8FV2taIuFi4j7HGrjxFv1xE9PaG/MsTrAMVD7/0U4W+40MZXUpGl5whDf1Y8VFql9cZNbE1Ozv5PvkCx6R6vZZg9lnlSQEPHAVeZbF8VzmhC/YIzZGPjaYSqj2N6hMlSnhKc7QZAZgT3mZEk7eXmHFrJhfRDdkZbu9HG7iFCuGvhho7/37UHuOzBOuF31Hje/DnUOxfqE7TNUwbcDZZ1RyCS55WLEDM3HvxRNRMsqZ8hCUy/DkyFgvLtOlEYtXDuKDlno1d/WkEbkPvHb63LFKrHs8yJW6iGQH1c6/Tl/utmrrjmI/NEOQNdDh0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84xGf2WdvGMo28nFUtq7l/TjlTjF4oF7EoxjqDeGCRU=;
 b=KC6pBi/qafTgAVdIx7llCTqklvE/yOHc1UXOtW94CQbXaUuUlok0mP9qhyOkFfsJZoSyVwm9ZCr4ZZIR73sbX37t+kBEWKdFNfGqWmuhY0AUdotRSWFV9mnWGp1EPO4rTE0kn22hD9OHbo2TFdp4NRv6EB/nKu1PWAn84lQAIDqG4A5KLJo+DhuAJOVLjhsIYlvfih89xrubNvejxJYol+FJe2nq/34cy9vEHEWTj3aWewnnUqTXbVyHUeBh9QsLZSBx4yRFOqy7q3gxV0JyTictgdJwSGuVU6MIkKe/P6iw4OiIVhm9f9/z51nNDAzMhDNLo2JbUGk/YdMPAVCfmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5874.eurprd04.prod.outlook.com (20.178.202.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.21; Mon, 2 Dec 2019 07:51:38 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 07:51:37 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Marco Solieri <ms@xt3.it>, Jailhouse
	<jailhouse-dev@googlegroups.com>, "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
	Lokesh Vutla <lokeshvutla@ti.com>
CC: "marko.bertogna@unimore.it" <marko.bertogna@unimore.it>,
	"tomasz.kloda@unimore.it" <tomasz.kloda@unimore.it>, "giulioc@xilinx.com"
	<giulioc@xilinx.com>, "'claudio@evidence.eu.com'" <claudio@evidence.eu.com>,
	"fabio.federici@utrc.utc.com" <fabio.federici@utrc.utc.com>
Subject: RE: [PATCH 0/8] Add cache coloring support for Arm
Thread-Topic: [PATCH 0/8] Add cache coloring support for Arm
Thread-Index: AQHU5KMdy5hOXdbZ/EGjll5JmT7z0aenrFWQgAABNECAADw/gIAAC4BwgAAHAwCAAAI+oA==
Date: Mon, 2 Dec 2019 07:51:37 +0000
Message-ID: <AM0PR04MB4481BA4AB4865E1E376CDB5F88430@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <AM0PR04MB4481B3186519C11BBFEE8DBA88430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <AM0PR04MB44818E5F2BA11C16A6B9E70088430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <14abb592-d8c4-6c89-1e98-d774e0dd21ad@siemens.com>
 <AM0PR04MB4481E19D836B1CA3925FC88388430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <dbfe8d28-c4e9-e7d4-1400-0868c61f89b2@siemens.com>
In-Reply-To: <dbfe8d28-c4e9-e7d4-1400-0868c61f89b2@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [114.220.170.63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2249b7b4-05c7-4cf0-1a80-08d776fc75fc
x-ms-traffictypediagnostic: AM0PR04MB5874:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM0PR04MB58748B8B410B6174897F108A88430@AM0PR04MB5874.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(13464003)(199004)(189003)(8676002)(44832011)(7736002)(25786009)(76116006)(6246003)(53546011)(5660300002)(6116002)(52536014)(55016002)(66446008)(64756008)(66556008)(66476007)(66946007)(9686003)(81166006)(8936002)(110136005)(6506007)(186003)(74316002)(54906003)(446003)(11346002)(229853002)(2906002)(3846002)(6436002)(478600001)(4326008)(14454004)(102836004)(7416002)(81156014)(305945005)(33656002)(71190400001)(71200400001)(256004)(76176011)(26005)(14444005)(99286004)(86362001)(7696005)(316002)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5874;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jfSO5ueCCY9dYvogRxz8P5FO0gXqaYzh+Y2hkJWct+gRKoXvmPvfyQZJYw5vv/zxiB+cs7YStG1FCxz60W79Bxuf47Kli0mZXykYMjitKAK95fwmQ0D0kO8Gtzf5L/i4tf40vf9d2g6Chy6D3nDk+oMRqelEWqCrv3GB/lYa2khrN9wWzELIQBUm3olFa0V0LVi3scYk0bSwe76n0ijZ6Hp5DWThXMsSRGHoIdjG6U0DEcBQX1wI3YVTBhhHA+ClOY63UFgiyV2MZmhlmGGoArgwwH8Aa6pv2COyDIkFSffBt4m6S16jEBiiK+DnZGlwzZr1pHe04pTyh6AKAX74I/yqDNPZdisfhrywKeeTfXXkGJB5gR+UdscYkZIi2F7Nbfsabv5RGGxI6Pp+ecqLf6nEBGS+5739VhwNuvupZyeqhVCErjhF+5imiOxDZ1/R
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2249b7b4-05c7-4cf0-1a80-08d776fc75fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 07:51:37.8747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4k5JBHmK4FdeYetDo3hUhM0//QkT8auDIvMhzm0a2+wegDu8vcpffh523LHhDEA6RyJdlJoqUyPBQrs6KAY18g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5874
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=sygQgUkS;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.8.42 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
>=20
> On 02.12.19 08:24, Peng Fan wrote:
> > Hi Jan,
> >
> >> -----Original Message-----
> >> From: jailhouse-dev@googlegroups.com
> <jailhouse-dev@googlegroups.com>
> >> On Behalf Of Jan Kiszka
> >> Sent: 2019=E5=B9=B412=E6=9C=882=E6=97=A5 14:27
> >> To: Peng Fan <peng.fan@nxp.com>; Marco Solieri <ms@xt3.it>; Jailhouse
> >> <jailhouse-dev@googlegroups.com>
> >> Cc: marko.bertogna@unimore.it; tomasz.kloda@unimore.it;
> >> giulioc@xilinx.com; 'claudio@evidence.eu.com'
> >> <claudio@evidence.eu.com>; fabio.federici@utrc.utc.com
> >> Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
> >>
> >> On 02.12.19 03:52, Peng Fan wrote:
> >>> + jailhouse mailist.
> >>>
> >>>> -----Original Message-----
> >>>> From: Peng Fan
> >>>> Sent: 2019=E5=B9=B412=E6=9C=882=E6=97=A5 10:51
> >>>> To: Marco Solieri <ms@xt3.it>
> >>>> Cc: marko.bertogna@unimore.it; tomasz.kloda@unimore.it;
> >>>> giulioc@xilinx.com; claudio@evidence.eu.com;
> >>>> fabio.federici@utrc.utc.com
> >>>> Subject: RE: [PATCH 0/8] Add cache coloring support for Arm
> >>>>
> >>>>> Subject: [PATCH 0/8] Add cache coloring support for Arm
> >>>>>
> >>>>
> >>>> I am reading the patchset, but this patchset could not resolve the
> >>>> cache contention between root cell Linux and inmate cell, right? It
> >>>> only address the cache contention inside the inmate cell, if I
> >>>> understand
> >> correctly.
> >>>>
> >>>> Is there any v2 plan to address the upper issue?
> >>>>
> >>>> To address root cell color issue, 1:1 mapping in root cell might
> >>>> not work, because IPA/PA needs a remap, but this will waste PA
> >>>> space, if inmate only need a small area PA space. Seems root/inmate
> >>>> cache contention is hard to avoid.
> >>
> >> Coloring the root cell is indeed a tricky issue as I remarked back
> >> then as well. I suspect the best way will be trying the approach that =
TI has
> a prototype for:
> >> start Jailhouse via a loader (could be a UEFI
> >> executable) and boot the root cell Linux already colored after that
> >> -> no DMA in-flight problems.
> >
> > To SoCs that not have SMMU, coloring the root cell will incur DMA
> > issue, such as CMA will not work. If root cell could not be colored,
> > does it make sense to color inmate cell?
>=20
> CMA is generally a problem, not only for the root cell without SMMU...

Yes.

>=20
> If you cannot color the root cell, you can only suspend it and move all w=
ork
> over to non-root cells. Granted, this will waste even more resources.

We are thinking to enable cache color feature in our release to make
inmate baremetal have minimum latency. Suspend root cell still not resolve
the inmate cell cma issue, since we use Linux.

Ah, a challenge. To remap IPA-PA could make cache color happy, but dma not
happy. And we have a reserved memory region for TEE...

Thanks,
Peng.

>=20
> >
> > Does TI has public code for their work? I not find that in list. I
> > recalled that TI mostly want to start inmate cell as soon as possible n=
ot for
> cache coloring.
>=20
> Lokesh, Nikhil?
>=20
> >
> >>
> >> What you cannot solve is the memory usage. That is inherent to colorin=
g.
> >> So, what we actually want is vendors like your employer finally
> >> implementing cache partitioning in hardware. ;)
> >
> > That needs to purchase ARM's new hardware IP, such as ARMv8.3.
>=20
> Yes...
>=20
> Jan
>=20
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR04MB4481BA4AB4865E1E376CDB5F88430%40AM0PR04MB4481.eurprd=
04.prod.outlook.com.

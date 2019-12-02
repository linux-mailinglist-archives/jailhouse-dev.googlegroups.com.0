Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBQHYSLXQKGQEVYU7FZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id F242A10E653
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Dec 2019 08:24:48 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id c24sf1171541ljk.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Dec 2019 23:24:48 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1575271488; cv=pass;
        d=google.com; s=arc-20160816;
        b=pukfVtR+Sj2DBoj2tYI29gGv5/UO9Sw9szO54yR+YjU443mWscJqHAHJKW6HRmqX0U
         GEaXwDX0RkUNODVMp8kH/1sQpfVItfgo5rd/E0fW/OSGAVimSvp9Fbm0cAwytJ+LB+B9
         XujVo8G/eigeeJABiU9y7wXLoongCAwbl1MmWRWGYN0rPzHRSWIFRa261ftk42QiNKuX
         he5DhsweKMSMH057krMpcUUVoC3LZLBWzdjAcqaXtys4+evepvJplLeqVVEOZAIJSpsv
         CoDKyWlDLqV7wWpOyKD5HcEhpvF+CLL6kY7tTUNGvomd+AkT+UuelqqaGtixUgK9RlDN
         gvig==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=GoRLhVlKSpWLn4DvBYkpyqE+jibBPL/8ZW3vErUhMGM=;
        b=uQXKRlaVk0Tluqg2NMrnikwe5YF3MjLGNenxGMwlHz4JEI9/JDUyRNh9d8XoWd0hcZ
         U7GRvG2OmFY8qeR1MMHihrt+EP+mKgRl+RW2kwcjdmH4ouwHqJ/da/MULCfk+NNgraop
         XUHQIlqYLjFNQIpCrCTnB7kAsmC5lONZ2zqnzXeM13mvxq2su+l8EngdD9cBRUGzxAbY
         9QKiJMtxHRlObqNAIKa+JXfpTYgTlwpAjmrFBQPDjRXk0dIC6IQUxv7Hj8h/rSCwhQrv
         vvv+A/EI8BlWOk/mvQta7eBbZREeimUu964/Jsyk4xYxEWgu0cpZy9KHZVkaLuiQ1la6
         gKqg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=geKA0c43;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GoRLhVlKSpWLn4DvBYkpyqE+jibBPL/8ZW3vErUhMGM=;
        b=sWQgwg4RmrtvlL8hqizNnllFDgszKxongtIONfza7JJbuw4USNUKWw3aauEO2zs9nF
         EtIXP9SAUMMSVoEKqlXwte+vUfnvwtw9VkPErYgIdzomsi7Z/8JpWvmqo7yYdTo+yqUA
         c6HwcoTGld/x4uqTRGxrc+80g+D1hyK3yA3LeebLaFWV/JNRRp4ylIp3Az2go76j6nfQ
         aZTI59ekzUxZTUmJffM9/mIn4PachPK/dLP7HgilVMOZJR/McOpah61/59m1Fy4Q6yz1
         UinYMgAXmK9zXojBdP0DhNDyBjEK3gzrdbg/Nh05QY1m17vwjVXApkEdi2Z8lVifh1La
         ibbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GoRLhVlKSpWLn4DvBYkpyqE+jibBPL/8ZW3vErUhMGM=;
        b=RQ5Yk6EUvsw7tq4tgXbMg+BRUNY+0tToGD5t2NO4vaUNr2J02TnaL0QZwqIBMo9BRx
         6XfDbTO0sNg1YeykZ9cw+AKxfHbTMg2kReZtu/cC4mUhYv5PEYuTNucdyHSRqW5op2TR
         IKrKEiox1WxWwkbpl2yzhv+Ywvk90+0fppeKLvHhQ1iI1DWMHthCM3fD3+/KJgHGnnyn
         VoIx+YiP3okINyxfrXWPFQ6sFEuLA8HGXGYd9MSWk4Z21JXBC9//i2lPAoFAK/oXV+YH
         0n1OAth320pRKHSEdXBOEm9cYErGEjwtQcaqCc9FZHDJH1KXQerdjzKoHgcZJWzXKXe1
         lXAg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV11WQw4U+Pv3AuocxywY07ZLqnH4Zlozki3xdHNeCcfkopw73a
	hnSSr9Uq1Guh7cyxx75QjOo=
X-Google-Smtp-Source: APXvYqxUoNbGxAuohzAF9jRU0b3dwmx20IKqHcquU82cmCMrJ+hDpWZgm9UT4nEoGHiEy03bWyPGsw==
X-Received: by 2002:ac2:4849:: with SMTP id 9mr41406960lfy.11.1575271488452;
        Sun, 01 Dec 2019 23:24:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4c01:: with SMTP id t1ls2463088lfq.3.gmail; Sun, 01 Dec
 2019 23:24:47 -0800 (PST)
X-Received: by 2002:ac2:50da:: with SMTP id h26mr7478968lfm.80.1575271487503;
        Sun, 01 Dec 2019 23:24:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575271487; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q7b6q0Ql96lPFPu2ZDrBsERLgVurHH6Zld2l7Fh8M0X/bXbJPhqNAbBTa/4rcmrNzS
         pWiKgoFo0p7hPFXR46vEra25wljIo5/hUrGbIl9EOv2kDoCiIm9j3qVO3wJPrTxgYWa1
         iSrlTRXQqkL5Os0XfESyRomjpFvg6cJz75NoIBdkkkhxWBJYXvguu4WOUyOajY8uDq47
         cnE/t8oFS3BUpDqqWrW+zx8NPxCMlHyC48VygDMpIEvv9bA8gEDreoEaOECwencvnNPQ
         v4WZXfr0PGX3Ekt3MhToj3fJnjeOnkKj6GQ2/WxgU6qTsmADEl5Xc8ryd42q8NdY2rvp
         dpxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=+XDRXtD2VoA3bQS5M1gYxOcz0WJ3DbLPjzp04PHU0r4=;
        b=u/pc94liXAJxKKEWGZjzk6ck3yaemWP0wZKfmc20JehMcbqMZVJKMRVTUkLO5fyQWH
         btepJ96oSbdYBf0LZAKBHJ90nUa57Z7mFPqrzXQd8TymRaajtGwzmyC2n+n0d0GJqhCZ
         ACCsiuxVMvrxfvQBbVv832h7yF0Ehi0vhvmbSeGIGPsa8qEPMWS1ir23Myiy6UGs4Wox
         eMLQZNSdc3ZvpqIozrFKhKlYVcwaf3H4CKZ4Wu7XRD6RwP6cBWLpJ8uKCkpuWPK1DPOy
         zEnow9wOGCyCzcfQx/ecPhRfMzzNWONbmIgzEe0C+2pKYH5i5QpFhkIjrpHWkmMkLfZr
         Bl0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=geKA0c43;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60081.outbound.protection.outlook.com. [40.107.6.81])
        by gmr-mx.google.com with ESMTPS id o24si642572lji.4.2019.12.01.23.24.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Dec 2019 23:24:46 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.81 as permitted sender) client-ip=40.107.6.81;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoofDKCxvZAw6Vf+n0i2mBZFkcgoWz6x4jngKfvX9fM9Wb9Bfyb0GhIzb1SauQVf5uwJBUsvE4L4qGeQ5aFWSSoUlPEAw9z3Er8pX5+bznbWQVTWeKTTIrbTAyFjFmPhr1IQ4IgBrEQ9geXxfqw2R4NoRHNQLG+nrWN3wOwRxPNu1LcklEBDfFK3dsnWOQJyKOQnFAuGNkePK3B7w/5ZmaB7y8A1kgsItgu4rIysVry2kz7w46K3RoQSo2cP2ycYEwj8BUSn+rqpkL4R/yG9BvjC2N9+7EyuYzXIu+tPKMNsTViqGI6XbPzAvZGntBiZ9a+qqz2l0GIjPKMT6F59Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XDRXtD2VoA3bQS5M1gYxOcz0WJ3DbLPjzp04PHU0r4=;
 b=gVljozy+C+WwB82Iph544JzzAxcySvZEtc8hVHJX8r1OQxPPYA1BYKbAHeO9GcpSNMwzg+EabgfbV6WOUOqEQJaoGu0+8wW9cfo4phWeACNHE8fqVLtUHXDJYaFRY+t6hgz90hllrAEWUe0i5J8RCeIDYSZqU2RbTyQaxkYM6k2XJc8moThM6LBGezH46KDNd0yyAANxiBo+G/Pd2RLuZwghAtlIv5WRdivxa4ImlCw082cQZffT2Cv23TnoQYgsiquG81tUcMbmBC8hTbLmAeU6WblxanHvlF+8E06D1ProdMGDgOp/KCNrz5caiNxD9xHEiM2w0PPjoNdLinGPnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4052.eurprd04.prod.outlook.com (52.134.91.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Mon, 2 Dec 2019 07:24:45 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 07:24:45 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Marco Solieri <ms@xt3.it>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: "marko.bertogna@unimore.it" <marko.bertogna@unimore.it>,
	"tomasz.kloda@unimore.it" <tomasz.kloda@unimore.it>, "giulioc@xilinx.com"
	<giulioc@xilinx.com>, "'claudio@evidence.eu.com'" <claudio@evidence.eu.com>,
	"fabio.federici@utrc.utc.com" <fabio.federici@utrc.utc.com>
Subject: RE: [PATCH 0/8] Add cache coloring support for Arm
Thread-Topic: [PATCH 0/8] Add cache coloring support for Arm
Thread-Index: AQHU5KMdy5hOXdbZ/EGjll5JmT7z0aenrFWQgAABNECAADw/gIAAC4Bw
Date: Mon, 2 Dec 2019 07:24:45 +0000
Message-ID: <AM0PR04MB4481E19D836B1CA3925FC88388430@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <AM0PR04MB4481B3186519C11BBFEE8DBA88430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <AM0PR04MB44818E5F2BA11C16A6B9E70088430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <14abb592-d8c4-6c89-1e98-d774e0dd21ad@siemens.com>
In-Reply-To: <14abb592-d8c4-6c89-1e98-d774e0dd21ad@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [114.220.170.63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 10dc1da5-9d55-4c3b-9ea6-08d776f8b4bf
x-ms-traffictypediagnostic: AM0PR04MB4052:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM0PR04MB4052B5EE3650CE8898CDB97088430@AM0PR04MB4052.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(189003)(199004)(13464003)(2906002)(44832011)(5660300002)(11346002)(6246003)(26005)(76176011)(52536014)(71200400001)(66446008)(64756008)(66946007)(71190400001)(66556008)(66476007)(186003)(14444005)(256004)(7696005)(6506007)(102836004)(53546011)(86362001)(99286004)(33656002)(25786009)(66066001)(6436002)(55016002)(229853002)(45080400002)(54906003)(110136005)(14454004)(305945005)(316002)(7736002)(76116006)(74316002)(966005)(446003)(478600001)(6116002)(8936002)(4326008)(81166006)(8676002)(3846002)(81156014)(6306002)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4052;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hfKIzRS8xRYsNfQjt44nK954xx0wcZbRCo01OUPL8vGat8fsfkiU91kJPLGuVxf17BRUBZ87q4J0YcyUMrIEKIaUpufMjFrGkJXG6QySGosZp4v591GjwGsPWpOdRkMvJF3xZOeX94NjSyrRsYg5+TXjwmwPI3usBcczWGC8pCnoNCPEA1fVfkmwzws+wtPqg/ORtTvQ5joDYn2qMzZS57/o7VpeGAwpJkv690Z2SnWAJ5sbbvMsVsKzXRTb0CLZh8CT5h1pSMKG26NnDU0dlaT850aIXdesgJl4ePL600Z9nidKICCtRA/jxK+0xT1yIz3VqcJQWeEBnMdNdBNkmb9maoVyZGH8pLfwliXnfix3a5b74nwevYFRNaObVjEETx+dlSRyZ6CYPFw6caGcVGRIYx0t6qA2YII8BpfAchlho1upyTsRdsv0YOIUNG4N
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10dc1da5-9d55-4c3b-9ea6-08d776f8b4bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 07:24:45.1059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KWLzbntf8LyuhjqG25NCj7C3qXMK5I6mC+R6F1J8hpDS48/s1dKcYqjKMmP6y0fYT9/jVEAjMKHt2nF6AvI5Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4052
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=geKA0c43;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.6.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Hi Jan,

> -----Original Message-----
> From: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
> On Behalf Of Jan Kiszka
> Sent: 2019=E5=B9=B412=E6=9C=882=E6=97=A5 14:27
> To: Peng Fan <peng.fan@nxp.com>; Marco Solieri <ms@xt3.it>; Jailhouse
> <jailhouse-dev@googlegroups.com>
> Cc: marko.bertogna@unimore.it; tomasz.kloda@unimore.it;
> giulioc@xilinx.com; 'claudio@evidence.eu.com' <claudio@evidence.eu.com>;
> fabio.federici@utrc.utc.com
> Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
>=20
> On 02.12.19 03:52, Peng Fan wrote:
> > + jailhouse mailist.
> >
> >> -----Original Message-----
> >> From: Peng Fan
> >> Sent: 2019=E5=B9=B412=E6=9C=882=E6=97=A5 10:51
> >> To: Marco Solieri <ms@xt3.it>
> >> Cc: marko.bertogna@unimore.it; tomasz.kloda@unimore.it;
> >> giulioc@xilinx.com; claudio@evidence.eu.com;
> >> fabio.federici@utrc.utc.com
> >> Subject: RE: [PATCH 0/8] Add cache coloring support for Arm
> >>
> >>> Subject: [PATCH 0/8] Add cache coloring support for Arm
> >>>
> >>
> >> I am reading the patchset, but this patchset could not resolve the
> >> cache contention between root cell Linux and inmate cell, right? It
> >> only address the cache contention inside the inmate cell, if I underst=
and
> correctly.
> >>
> >> Is there any v2 plan to address the upper issue?
> >>
> >> To address root cell color issue, 1:1 mapping in root cell might not
> >> work, because IPA/PA needs a remap, but this will waste PA space, if
> >> inmate only need a small area PA space. Seems root/inmate cache
> >> contention is hard to avoid.
>=20
> Coloring the root cell is indeed a tricky issue as I remarked back then a=
s well. I
> suspect the best way will be trying the approach that TI has a prototype =
for:
> start Jailhouse via a loader (could be a UEFI
> executable) and boot the root cell Linux already colored after that -> no=
 DMA
> in-flight problems.

To SoCs that not have SMMU, coloring the root cell will incur DMA issue, su=
ch as
CMA will not work. If root cell could not be colored, does it make sense to=
 color
inmate cell?

Does TI has public code for their work? I not find that in list. I recalled
that TI mostly want to start inmate cell as soon as possible not for cache =
coloring.

>=20
> What you cannot solve is the memory usage. That is inherent to coloring.
> So, what we actually want is vendors like your employer finally implement=
ing
> cache partitioning in hardware. ;)

That needs to purchase ARM's new hardware IP, such as ARMv8.3.

Thanks,
Peng.=20

>=20
> Jan
>=20
> >>
> >> Thanks,
> >> Peng.
> >>
> >>> Predictability of memory access latency is severely menaced by the
> >>> multi-core architectures where the last level of cache (LLC) is
> >>> shared, jeopardizing applicability of many Arm platform in real-time
> >>> critical and mixed-criticality scenarios. Support for cache coloring
> >>> is introduced, a transparent software technique allowing
> >>> partitioning the LLC to avoid mutual interference between inmates.
> >>>
> >>> By creating a cache stress environment with a memcpy bare-metal
> >>> application or with the Linux "stress" tool, it is easy to measure
> >>> performance degradations caused by inter-cell interference, e.g.
> >>> running the LMBench micro-benchmarks, or just with the GIC demo
> >>> within a L1 Instruction stress scenario. Once coloring is enabled,
> >>> instead, predictable performances are restored. Reports of extensive
> >>> benchmarks and evaluations on real application are referred in the
> documentation.
> >>>
> >>> We thanks Tomasz Kloda and Marko Bertogna for the prototype logic
> >>> and Renato Mancuso for suggesting low-level design improvements. The
> >>> EU Horizon 2020 IA project HERCULES (grant no. 688860) supported the
> >>> initial implementation and evaluation on NVIDIA Tegra X1 and X2; Xili=
nx
> Inc.
> >>> supported the implementation and evaluation on ZCU102; UTRC
> >>> supported the testing on ZCU104.
> >>>
> >>> A bird-eye view of the implementation and of the commit structure is
> given.
> >>> Some coloring-logic fundamentals are situated in the 'common' part
> >>> between the driver and the hypervisor [1], but only the latter
> >>> implements the whole coloring support [2]. The hypervisor also
> >>> exposes a convenient interface to ease the load operation by the
> >>> driver [3], who implements a simplified memory allocation support
> >>> (only colors have to be chosen) [4] and extends the configuration fil=
e
> support [5].
> >>> Examples root cell and demo configurations are provided for Xilinx
> >>> ZCU102 [6] and NVIDIA TX2 [7]. An extensive documentation details
> >>> the technique and gently explains how to use it [8].
> >>>
> >>> Luca Miccio (8):
> >>>    Common: introduce cache coloring primitives
> >>>    Hypervisor: implement cache-colored paging for Arm
> >>>    Hypervisor: add hypercall to ease loading of cache-colored images
> >>>    Driver: add support for cache-colored memory configurations
> >>>    Support cache-colored memory configurations when loading Linux
> inmate
> >>>    Configs: zynqmp-zcu102: add cache-coloring examples
> >>>    Configs: jetson-tx2: add cache-coloring examples
> >>>    Documentation: add description and usage of cache coloring
> >>> support
> >>>
> >>>   Documentation/cache-coloring.md              | 330
> ++++++++++++
> >>>   configs/arm64/jetson-tx2-col.c               | 529
> >>> +++++++++++++++++++
> >>>   configs/arm64/jetson-tx2-demo-col.c          |  76 +++
> >>>   configs/arm64/zynqmp-zcu102-col.c            | 153 ++++++
> >>>   configs/arm64/zynqmp-zcu102-demo-col.c       |  79 +++
> >>>   configs/arm64/zynqmp-zcu102-linux-demo-col.c | 137 +++++
> >>>   driver/Makefile                              |   1 +
> >>>   driver/cell.c                                |  56 +-
> >>>   driver/coloring.c                            | 239 +++++++++
> >>>   driver/coloring.h                            |  52 ++
> >>>   driver/main.c                                |   3 +
> >>>   hypervisor/arch/arm-common/mmu_cell.c        |  27 +-
> >>>   hypervisor/control.c                         |  77 +++
> >>>   hypervisor/include/jailhouse/paging.h        |  11 +
> >>>   hypervisor/paging.c                          | 168 ++++++
> >>>   include/jailhouse/cell-config.h              |   9 +
> >>>   include/jailhouse/coloring.h                 | 151 ++++++
> >>>   include/jailhouse/hypercall.h                |   1 +
> >>>   tools/jailhouse-cell-linux                   |   5 +-
> >>>   19 files changed, 2096 insertions(+), 8 deletions(-)  create mode
> >>> 100644 Documentation/cache-coloring.md  create mode 100644
> >>> configs/arm64/jetson-tx2-col.c  create mode 100644
> >>> configs/arm64/jetson-tx2-demo-col.c
> >>>   create mode 100644 configs/arm64/zynqmp-zcu102-col.c  create
> mode
> >>> 100644 configs/arm64/zynqmp-zcu102-demo-col.c
> >>>   create mode 100644 configs/arm64/zynqmp-zcu102-linux-demo-col.c
> >>>   create mode 100644 driver/coloring.c
> >>>   create mode 100644 driver/coloring.h
> >>>   create mode 100644 include/jailhouse/coloring.h
> >>>
> >>> --
> >>> 2.20.1
> >>>
> >>> --
> >>> You received this message because you are subscribed to the Google
> >>> Groups "Jailhouse" group.
> >>> To unsubscribe from this group and stop receiving emails from it,
> >>> send an email to jailhouse-dev+unsubscribe@googlegroups.com.
> >>> For more options, visit
> >>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
r
> >>> ou
> >>>
> >>
> ps .google.com%2Fd%2Foptout&amp;data=3D02%7C01%7Cpeng.fan%40nxp.co
> >> m%
> >>>
> >>
> 7C9a8ae20626fa48d42da808d6b2ba3eb2%7C686ea1d3bc2b4c6fa92cd99c5c
> >>>
> >>
> 301635%7C0%7C0%7C636892910321416684&amp;sdata=3D4VNztT05f9leIPUh
> >>> a1TUx97q8sEzTgtk%2FfIzkwV3%2FJw%3D&amp;reserved=3D0.
>=20
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroup=
s
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2F14abb592-d8c4-6c89-1e98-
> d774e0dd21ad%2540siemens.com&amp;data=3D02%7C01%7Cpeng.fan%40nxp
> .com%7Cf15379e30e324492545308d776f0aca6%7C686ea1d3bc2b4c6fa92cd
> 99c5c301635%7C0%7C0%7C637108648362215449&amp;sdata=3DoMs2KFi8p
> wIkkVBMX6F0AQ93x8%2Bnu%2FJuhcChJbMffwk%3D&amp;reserved=3D0.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR04MB4481E19D836B1CA3925FC88388430%40AM0PR04MB4481.eurprd=
04.prod.outlook.com.

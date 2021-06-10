Return-Path: <jailhouse-dev+bncBDGILGE54ELBBKHMRCDAMGQE2JLRC7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9583A2FEA
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 17:56:24 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id g81-20020a1c9d540000b02901a3d4d3f7fcsf4098405wme.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 08:56:24 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623340584; cv=pass;
        d=google.com; s=arc-20160816;
        b=i57EPc8rsGmUf+ASeL3XvOLkGAZ5zQofwapz2AVV77M0PZ5WKNerF5die/5AXAc9LL
         rFeg6zPm0+L7bdof0PlrN/29rgkJ0oqyE18XlmKRDrSuAAhFtR87RLtTUV+hGmyG/ZTF
         mrj0fJqC73h2r1TLKAbD/GMwTGrztCjDyVdoegbVe0lprk4tf6F6MrgAS/aSM2KLok4W
         rxo/hqrJdu9SuApIpHdTH1SoUwDZQdfq6F1K0HWwxfiOdy3SC+99z5hNcMDSywqF83DM
         +7APeDjPOZwBz3e8MEhjD8kCjyrzVghjlioWdRz6m6X6xdIqmjZMfEHuRcVT/5X0gVmP
         QOiQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=MPbvJJYzST+QRlEKxcaioE2T+w0CiVtCapKIfo7jyXY=;
        b=pwfZjCiD7UCIrqFQBSn51R0h8YAU5w1XfudhBtgM7A6f6505nyY0+E5AJC6s+WfloZ
         kRp2UdP1XsPsuyzJQ55sUo44LRUSktFxS3iIg4odS38Fn4V4ErKIydNRM+o9O64QZM4c
         07ITL2GpDaBbgvEPOKa8UcLjKrI3D5jKQS5zay8TQy9m8tRYuguBTS0e1JOGAVYtVUHt
         Pb0I7uIzkclVYnt59WPYD6O3uvetcUXpP8M5TmWrirAnwlFOKJvbcEDnBO7ocMzT8eCR
         tAf24/etrT5/Up032tX+dcNkYoQe8g4MhZNNBhlTgccpjMIDm0ZBPkYx6O25s4vrtkY0
         mMMA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=dfjs7Big;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.7.119 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MPbvJJYzST+QRlEKxcaioE2T+w0CiVtCapKIfo7jyXY=;
        b=RzfqVS+iXfbLcaKf38ex29TQY79NHg/LxJok+7eoKkl6rCkGnMnCNXsnb3RanRE3P2
         7Xe4uFAGqkxa1CIeDUtr8yzqan/YwEd6O3ivZI4UgNwJPR/bIk0Io+nTMEG+/DQ6Ov4L
         GSDGUlxxdxZBHV4p7+FCqf2R6w4G9A9H9mwrCH46LHbUA0NPHrPls66Jm/TvUxhwISfi
         1DRf70QtPm0lbL8JhANfabOwZIfaUgp+rQNBk8+oNRQWzYlLuj7bYxO5P7UxsDiNyjRk
         4xKYvyZyVD1d1prS1j4GHqHw57wFm+5WsGLZ2wsLa51462NX2KTF2AvduwovQOiqDxNq
         PpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MPbvJJYzST+QRlEKxcaioE2T+w0CiVtCapKIfo7jyXY=;
        b=InXqw/ErFzcS/3xt52jP4lvEDUXD8hxNju2UElEwgCvYlmvdvez47MIJeHWXmOn6ZL
         I8fTHlioJvCMgKW1HLhLO3Ku1sx95JZ8SRdFg3NkmbPWJTulRLUryTlm+7yctrEgbAqS
         6/eVhq4R13GfnHTuE7aqav/cWkak7aDqjLG5SMgl29gyOUQgSgKmQQZm650P0qH3rz/w
         CCIGu8AGfcrg3mmBP2PaHxTSilgb0KE/tOcsB/634Ozhp/3/QA8qLRBxIJv8TYrUT9Io
         x0mqd2ytGHnbXnmHnQm8qHxGaKpHpBuBxEdVfhxAxvknIeWAfyhRCHYq7OcWGFbxQfK8
         1jXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533D/kF/8X7mDqJt/PoTA/ZSpaEiPJSo/S9ss+Pm2NSqLQES4W1v
	lTJu2ReT1TsWbI6OmGGfnb4=
X-Google-Smtp-Source: ABdhPJwvI0RPyKB0KYy8RgFFhvwM39NvRaNOgm7j2DBMdTfZPlp5he7YfqfkuGnxf4nwttAS0JA3DA==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr15951351wmh.100.1623340584624;
        Thu, 10 Jun 2021 08:56:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a141:: with SMTP id r1ls1826517wrr.3.gmail; Thu, 10 Jun
 2021 08:56:23 -0700 (PDT)
X-Received: by 2002:a5d:5104:: with SMTP id s4mr6237732wrt.306.1623340583781;
        Thu, 10 Jun 2021 08:56:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623340583; cv=pass;
        d=google.com; s=arc-20160816;
        b=JE2MxQr9p1ReCsJQ+8a4swkJ51wiEhtIdfJrdIExfZREK0safzEfVOj7VYp5zwQyH4
         WD9wZMHeqAVrzGf8j1t9MzHVOQ+9XjOqn73HvTX/tyVpdK9JcIFC0hTTpKPHvUEgLu81
         Ni+CnBhza08+vUz1KNEZu+65zAsbw1XCDxfea9iW/cvDFMJG/aQNykPvmoDsCFjXKLhw
         xM/NAWEysM4kOIpS+RRZSS1pizZm1ay94pYdlEK4/rqLDdBl82tRZDAHgrdp42DEKdmo
         jObfbZqYi7YRJ4p2meaR+Xc6rgUbaYLg260giz11RIPqAgJbwcjnTQdRXOi4NdqyZK+i
         pU+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=BCOrTeAE+4YVJH43iSSMkjv6MOFk5e/Ka5eDNydLuoA=;
        b=pSrPCRX3AInpl8OrrvHE2k3TfzeK9toMhuJFURiVzEk7Qk/5Z33PIE4Vgk5NFQMXha
         rYMj3l/IESWdAdWHdfJWCAaA2B/FRoKFhEwfjbBuXSi77raMzoEhw+Wy9h5JMO+FkRLU
         yi6S1XaDsZYPCibbzoFVtiMpIw1UaXeLXUXjXL/ak8NUl6RNcgNtPbumfhJUJRPOSBLP
         EVrUDv0HF5Oht1Y7LTJUHjSwXzYdI+LUXcPLpQ7UpY4Fzk4NELQ4RMbkmWzWkfZ8IIWX
         1AdXvjc8CBOMUKMTYGGi6QP93BLwmAZVGKCUDVxO6dlitIOPWRjY+gPhm0pDKxTuFIrs
         PC2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=dfjs7Big;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.7.119 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70119.outbound.protection.outlook.com. [40.107.7.119])
        by gmr-mx.google.com with ESMTPS id c26si208351wmr.1.2021.06.10.08.56.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jun 2021 08:56:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.7.119 as permitted sender) client-ip=40.107.7.119;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qyztneuvyd4/qpErHBbUJHxOgSp4CbS8w7uxOqriNVrP+BfJRl/emvzsB/hEQCXH6/txW+TQNT+Dy9K2I7ZK8ei/lyKQlaA8a+ua3T0c3sWII4U3WXx+JwIIxVOLfqyiKWsREqYn0KYkcF3b2Okh7dr0LvS3DoILC6ulTaWkYQk6INzvo6W4I9xH3E8zg2X3FBODBVAphoz/r0DB4KHGqfqLyieKiwKdE6y4V/LOwH6ekvPEJONrYDY/uLSHGCd95q6fd4aJSsb9+1B/09sLlabR3MykjowS200G9PKORChj36Vap1J63P82ASMOLBaiJgESazjfwADLuY4826kKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCOrTeAE+4YVJH43iSSMkjv6MOFk5e/Ka5eDNydLuoA=;
 b=l/ngnZPjrTGW8DeAOb8tHOJNMUocA7QP+ONJOBUEntJhyJqCIE5bz7/iJb4+25nIe9pQaCBVSgWVdCLIieYuA7/9O61y6Inu/oN6KR8e62eADeyHN7IIs3i+Ko82/IIDFAYkPvdfhGcI3VvJPj/xUh9bi+LdkMBV/HpBBITQZoZh0/oORaW8gLu8Umwk9KpOQ+PYj8wiek3Z+QHiutzEmq/tQeJE87qvYNjGS2lE0TFi4KL3KA/n4rT42h+FxwNWonW9ksqdy+ZC2gkoM5Ntp9tKFr0Dc8eUzA5jZQWWIB7xcLOK7IfwJfXOmHmqVQwp/9CfAik1/jTtUTXf0mZHTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM6PR02MB3975.eurprd02.prod.outlook.com (2603:10a6:20b:49::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Thu, 10 Jun
 2021 15:56:22 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f197:f089:10bf:b446]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f197:f089:10bf:b446%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 15:56:21 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: [PATCH 0/1] Cell shutdown signaling
Thread-Topic: [PATCH 0/1] Cell shutdown signaling
Thread-Index: AddeDozNLTqPRLs7R7OhwC7wBoiwgw==
Date: Thu, 10 Jun 2021 15:56:21 +0000
Message-ID: <AS8PR02MB6663DBD37035EA38179F9361B6359@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.65.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3c191ee-7d17-4954-7ce3-08d92c284b17
x-ms-traffictypediagnostic: AM6PR02MB3975:
x-microsoft-antispam-prvs: <AM6PR02MB39759123E04167231E670D76B6359@AM6PR02MB3975.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X/9yFpsn1ekiPag7sxKsWtVofdJWxerhT6VuQfNzRapUNfLK827h+EQdlP9I/Yo/Ye57jY2Pv1sVpCb0WDOOjdAq6HBSpNjtqWMBIC3Qku7ipHsclCFeuBTIpZ4hWCQAuJXSb1Qcuwmss4gTX0eB8NpCu+wQVwZjYIk3LFUBwB0oxPG1/XebtjEE3B1NjUYYZ66P2UoT1hySsCNBmHarBIuje2wPWzGOfI5mhvVEll5m1JqGE/dvMY3v/F700/sIQ5fist6VYUQJnEJjn85qPqF9lN4mbk1xLAvK9fTpdRMjLZJu71tC/hIEwBYhJlRK3IBKXTDjADMK6XVlnB3a1welIuDlIwmKtQhFtcMJ2rqwnZXnry38XdwgMAg7Jxrkc+OdOC6qEBV4+gEPJhckKgWCCPcHfyHcfhy6Qze4GSJ/JrYHr7vERmB4sLVv3j9R8cZlhRyzOr3v8ZYMXldILltfm1TIuDFpPIwZRWR/lRZFcEfGq8GsiH3cJQhXR3pz49VHoJmq+0Dr6Ho1j2nS2pRASbUBvyrQvB2y8UAn0vXhvpMXRgHqfYZb3dEoUEBJTZH+qRxbcpukxJhY8Af3r6lqBlJD2T4y35hSPCIJBQk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39840400004)(52536014)(186003)(2906002)(44832011)(55016002)(7696005)(33656002)(5660300002)(6916009)(8676002)(66556008)(64756008)(26005)(71200400001)(9686003)(66476007)(66946007)(38100700002)(122000001)(83380400001)(66446008)(478600001)(86362001)(316002)(6506007)(8936002)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wK77CpTb+qM06P0g7sV/qDOYQREzLVkLWCfAJmFiKR3Iu3BSHg/+f5+acPZC?=
 =?us-ascii?Q?GvPhqphqEU0WUDnkFWRuNjZfAA5jxCxEKWJFzhyHbOwyxAqSypd1AP8cmOlQ?=
 =?us-ascii?Q?+4h9gpiSszfoi5eAuIh06K1g8SPsDfzwyG+mSu8tLZHe6F7qz/BbmVA+LRQf?=
 =?us-ascii?Q?EBjJ4juvQI1DoGxKy/Sz/zysmYD8szqTN7fViwpOU6JYEXFZ/+UpQ4/XRKwh?=
 =?us-ascii?Q?f1DhWpSbH1zLtQNdd+i2zL94AnZkjUTsy3OgmVr7oWPb9DgGaXUfVYesed1U?=
 =?us-ascii?Q?6KZ5hxZUE0o9Hx8+JkAv3iqOSh1tix2RSWsO1mBzibCr14tKbHMniO4zKpVd?=
 =?us-ascii?Q?GCWwNULb5jgIi3c8tNpM6obAgCUxGgyTRB90mdtO9/t/nD9DDjMrLZHpEks0?=
 =?us-ascii?Q?5Hd+J7YRMx27pKkMQ/lnm7TYQqNeDqAKxjmV8M/yFujUdekgKFQKpnne0Il8?=
 =?us-ascii?Q?T3WlY0Ej+ZNq7zzIjolBxQa6i2izxyzhp9DzGq1hSFMxmxMQirXmpp5uyJ2K?=
 =?us-ascii?Q?CLuVCQwmIbxWzfi1hGt6l4yE3qW38tFGMm31mfqtZer/8cED6WtnXI7AS1Gj?=
 =?us-ascii?Q?GdmmEohjIlqL59d4EGExBpezEMAEuIwkhUUkAcqDLsbJ2j0MNoflHxQ4A6lY?=
 =?us-ascii?Q?ZJHQuzitiasnKMR1MqIJ4Tsr0I7MPb27fu3peLKWH317wic4lhSq2Uz7P7+u?=
 =?us-ascii?Q?8YbrXyZudjokvXyOoFuODn+OeAkOZCiUXySxZMPLdMFN4NDFUoUyGGMGv9dO?=
 =?us-ascii?Q?nch7cH7f8OH+9DQfwKNBZnbuhPDBvTLEErF8d+ms9WZyW9HAjY9X0E+MRHuU?=
 =?us-ascii?Q?k3kvN+30mcumeSSpULJjvXwq9LkXNDP9M4qlBW6Q/42vGodALDCkUTQ/sGuG?=
 =?us-ascii?Q?GrvglJPkiiYMdCCla8Z3DI0QWjaCWxU9xij7SMPKiIkMTftwB58NEOMqztPs?=
 =?us-ascii?Q?EnAWx7Yx4hilS/6JMsBDsBcUbQ+AI9iwe9nP7ZyKf0DkyDc2EWN7dZQZTd9y?=
 =?us-ascii?Q?/G/wIQzgaECUiOG7JVQ0aVgwCo0NWHW9ut0sy74Nbfhj230OndGxzOHBCRue?=
 =?us-ascii?Q?p8rZKQrAscfbyX4RMHR+f/fJwqNvW0zkYRNtjEeP4/fnADivwQ3p8Gj/XHM8?=
 =?us-ascii?Q?YfZ9kgutTJo6sstgCmyqln1HxO+avpyvpdY+3/0VkGnUbImLV0NbuuzUvlc2?=
 =?us-ascii?Q?kTFLyzFuN4u4AiQlucVeU0fzeOnx1GUEC38di5Jhbct4azjIpqcKDaLI/vIM?=
 =?us-ascii?Q?+qg/rs3RZEk556qdGKA5LP8DiOBSANwI0oKzIfR8ZxUEAfKXOi42Xmt106VR?=
 =?us-ascii?Q?/o8WNgfjEN+VU/C03alviuuf?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c191ee-7d17-4954-7ce3-08d92c284b17
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 15:56:21.8486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VfMhROn22Rvu1Lxjd1Vm6aXdAiDE03f0qCYiLxij7jVceNtUonwi2Zy/S1khndKkXPtnEaUpi4HgDXl1fCTgf4bR1oAIz7811NnpZrz9sR+hvZ3tl+A0OyueoE6WJRP2h3quST21r0VpOXqUjeN+HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB3975
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=dfjs7Big;
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

Dear all, 

Currently, whenever inmate_main() terminates, the cell_state is left 'running'. 
I was wondering whether there is a specific reason to do so, and what that 
reason would be. Especially when the cell is set to 'locked' this behavior is 
unexpected, as the cell cannot respond anymore. 

Attached is a very minimal patch which sets the cell state to 'shutdown' upon 
calling stop(). I understand that this changes the behavior of the inmate 
library, which can be considered a public API in this project, so I would 
understand if this change is undesirable.

I had one consideration remaining for the implementation of this patch. Is each
cell guaranteed to have a comm_region? Currently, setup.c seems to assume so. 
The function stop() now checks whether there is one, as I expect it to be
impossible to place the comm_region at address 0. If this is guaranteed, we 
should remove the check.

Looking forward to hearing your thoughts, 

Best regards, Bram Hooimeijer

------

Bram Hooimeijer (1):
  inmates/lib: Set cell-state to shutdown in stop()

 inmates/lib/include/inmate_common.h | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB6663DBD37035EA38179F9361B6359%40AS8PR02MB6663.eurprd02.prod.outlook.com.

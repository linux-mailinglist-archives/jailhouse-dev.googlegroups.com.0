Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBAEXXX7AKGQEX3FGK2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 917282D2807
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Dec 2020 10:46:41 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id r24sf5864611lji.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Dec 2020 01:46:41 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607420801; cv=pass;
        d=google.com; s=arc-20160816;
        b=rqveMExZe0X3wkSgTtMM0wJtfhRn/SYO4L2XxNGoWIdav7NQA5sq5fek7wZengBwoR
         c0raUuF6QZu/UDTxSoodEL3kpOSsSPYNxTdG+1Xhzjyu/IgCHBbu74J69Fjzb0SBXDVw
         DO7RQoMSMWO7of5UMBeGlOJs9BHtigwICQ/MYxOhm3OUWygJL2dVLxiB1YzZxyOZTNBH
         PrSNIJRyaO1tZs3nRhEwYO9eXNr6g89h0XQDn3mfAdLLVxrfJRGi1yJZx/eYZOgqEpuW
         fEMUCB2ycntUIkuXKGsnvw5jXWDWX2vavan/TggAQRlsFNAAG02ZvB3cDxOrKEA9DTtw
         Zu8g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=Y3TQKRGbUrEOCV5yoKMxJ+ELyNetFYbCJFL8FZGqdzQ=;
        b=BWV8rWxTN7lUd5+fkXqbeSeOiPXxliEhr0jEZ4I+cswx8UokhuoAybtqYv6criPzZT
         3FP3Vho+2v7o4p007nQ/Wv+QzFtfuJDnPXeU1xvTwK8Rn2x5PBFpR1z7jpur++bn6UZr
         D6CaY9isFdkEwwJ+lc8/aOGzORD2Rh2UK+auesdts2Uqgqp7JAkqT/XWS2UJfE9pmHUk
         8V4Qf+T9yMpaE8mfMbZMo+gPZFAbMJgXfbhTw5tcDir4wQwc8MTZSVryJS+TzciCotQ1
         oa0kTssAO3IGKyG4FMM36/az0So6Ew4mk5KYOoTMzKQC1kl99j7MAdgppvW3VMyKhI/m
         g0lw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Po5dzvEV;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.1.82 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Y3TQKRGbUrEOCV5yoKMxJ+ELyNetFYbCJFL8FZGqdzQ=;
        b=ckE0hSXoq59XTS5uhw3Gwz8GtAOjqkQ3wM/gR58ksVqTI0K/oova21YO9/HQSJC/Ju
         dSYxWiAscKsZ9LXXyn57kRy4V30Js1Eulv6Fg3sPB3FjYlUNLGc42m+KXT5hS5+6Kl1s
         dMN8YZsSZvKRfjEJ3RICILihot9Z+2S2A4KhoZXQlfoFfU8PlVnbMkzDtktI5Coa9jp6
         YQHVvJtbMLQrYPHYjOdxWtbjKT1z5Aw5Wms6vk9wee9X/zj9Rt7kQqmuCbipC9fyIB0C
         kDdd2XahDsNkMb0PFjyPgwzAEfV22Cywf5n3L6vEahnmYaC3e18GuxtXyzaPn6UFWkoP
         Lwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Y3TQKRGbUrEOCV5yoKMxJ+ELyNetFYbCJFL8FZGqdzQ=;
        b=MUpP04Es2aetjqAQ50h1cVQRlaR+/iYYPeGvCKf7lsLVZVB+huc+hMEOfaI+RchMq0
         VT4NLxtZI6OPsiVtDqzt1Sel86ssEFE9I0u5YloP6AD/4a3FCJdmjQvvNXTm//tt30TG
         KOslGFiHQ7tzlB3VA/6e7jhQ/MJfZyGgWZqpACT7wIWlpxn7eo12vD/eEaoAs+p41JdI
         EHTqmlc72KXyBVurGJqGCb/X/fDgayioAETOMz/i1RzKlMjNSbtSVZPABti53r+FeK+i
         rrU5KMg6WHRA2RAcVT37dCOfXM+kFD/d8s+IB+HvdiPmt/LAn6xjRcLSihXaQOh382w3
         FiUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5339ChGvLBLPoU6jdRtAriF6ymg1t0W1/JCtzMqtNt4nPKBkIJ2D
	MkqwlJsVhMoB1bbwrxdprk0=
X-Google-Smtp-Source: ABdhPJx622/JVL7nMKgAYmPz85pE2ykKcGBsO47/Nikxm2m0mYEkEYjXKwmFu/xu5j69atg8LWZbZg==
X-Received: by 2002:a19:655b:: with SMTP id c27mr1921830lfj.168.1607420801134;
        Tue, 08 Dec 2020 01:46:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c886:: with SMTP id y128ls923898lff.0.gmail; Tue, 08 Dec
 2020 01:46:39 -0800 (PST)
X-Received: by 2002:a19:795:: with SMTP id 143mr715605lfh.415.1607420799760;
        Tue, 08 Dec 2020 01:46:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607420799; cv=pass;
        d=google.com; s=arc-20160816;
        b=YqCfSWtXaZGhpSTk9k8IUk0P+rdSgvro4D33zlx3PRF5XztIC7MBK9oC992xGhaa6h
         O3BoIvWjhOLr7WTYSN6DDzQR71dOcXP/iDdqX/JcDKC71XZycUuGDsY5Yt9So2mqtPxm
         OmPQK+KEI/usbAbYkw4hqzU3NsX7fuWMsdqOd+VvoSGnG7sMTE0uE1uz3j0cQATHb9ZY
         JvD7FNO2IIntURwQ+9ypFc7Yz8jcgkJjVI5cGsksbemrUcbOO+hYlMBjYGGhD2IDGPL/
         QHujcK3Ro65tBf4fTP9g8p+5abjj6TCBsr2WTLfys49RxBF3zw5rFfTXuAhwe9Oy9LN5
         uWoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=PlpcFzRJRyg0ssZDHlYpEMHRY6x4pixy4QUSDCVxoPo=;
        b=dGXiyjSFzMiYhk7AuuzSuETKX/m27M4xvfCatWNmhZ6ll5xPe32F3zXJIBL9VCIsnz
         6iXoz6o+Jlha1flUcIfDoTG839vraKgtobgcreefBT7QwItYVPmFc1WS5SCjJ5HywbWS
         hwoPD3XRlYk2h4Hx+Cyd1VDYk1esCOyBagrILrb6NUvBLRQ6CzmJEXb92TdnyBUozYFg
         wPluz+zDBEZBL5A4gEqxCnAbNGJR+K6Xd034XMPh5DqjNvbFT5NIbFXHVOF7SLNSxSEX
         n6vG2yvHyYpi8AgitMzMBvz84d4tPux3E9dihwEZzEPft8xRujRiT57j0YGWlFrhcBPh
         01eA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Po5dzvEV;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.1.82 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10082.outbound.protection.outlook.com. [40.107.1.82])
        by gmr-mx.google.com with ESMTPS id 26si589562lfr.13.2020.12.08.01.46.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Dec 2020 01:46:39 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.1.82 as permitted sender) client-ip=40.107.1.82;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBr6D9EeE41wP7kZOTakdEGv3yReHsmGUWXoBQXkNe9YL3jbqE6QfUC4ESXQaNvV2AF4/DQFuL7pr80eyVRzhu2t9hTwnQBsUOQYFUyQ5UJMgAnyaAIJLPtxKTrrn2Yehk/iGET8DIdISLdycSD945HSQ4kZTpdC2e0rzvZ8x2qhQvxq6jyKDHhheDUvGfC7juhA/ax7IXepQ6LdZt+TuuQ3zpAn2ckD7IuupzZyXCoUJDIrD9p7T6QSQY2m4DyiPdkE3DMjrdKfuOCaIN3GRVd2nKQbY8w6M5lzQ72CRrwUTHtxViw2zprK2XuWw1OOPlhSvU5yyEb4s2u9lQrSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlpcFzRJRyg0ssZDHlYpEMHRY6x4pixy4QUSDCVxoPo=;
 b=JTi1Yg5pzEzt25T+FZzoiUFIbpevXy/cGh1pLovuz0yS5b2dN/my5zGrkGJY5te0nzn0vkZOtM+WnypL5nMOEZKQ2lSxulifFkqxwDGnJYGatScAXQzrVo9/grL7zCK2rjo9qutHHbfuJsEOEvoViF485wENWc8ZvVbQ4r30DswiRmloU9Zo+qv+uEf65y3K7Nw18lDJYzOMrtBx/23k06BFOIuATW7VjvpziDa//SEa6Ok3G54UNN5kVrEC6nmDg3X5wKQQG5mHxV/kIWmFuKkvnFNXo6deO+Lv/+p62LBWZwssmhorxx9+weEd8EI+/Lg6RC0dIhzQZP2snUhrug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Tue, 8 Dec
 2020 09:46:38 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.024; Tue, 8 Dec 2020
 09:46:38 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: ARM64 MSIX enabling error
Thread-Topic: ARM64 MSIX enabling error
Thread-Index: AdbMbLjE+IGjwJH3TguDfS43O45UGQADqiQAACSJ9gAABUGw0AAEHfCAAAEwDFAAApGHAAAAH6zw
Date: Tue, 8 Dec 2020 09:46:38 +0000
Message-ID: <DB6PR0402MB2760F7FE11280F9619178C5888CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760E09A5E40B4818663E07D88CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <3bbd059e-632b-da36-1f79-de1731e1352e@siemens.com>
 <DB6PR0402MB2760AF37C2A42481C80249E788CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760C14BDE7BECED2A60906488CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <543a61e2-e521-5c89-0d96-9f06946f0aae@siemens.com>
 <DB6PR0402MB27605393AB95974CE4D8944E88CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <35de9824-dc88-dd3a-175f-6db6c086d2a6@siemens.com>
In-Reply-To: <35de9824-dc88-dd3a-175f-6db6c086d2a6@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d9f25538-7460-4458-8be4-08d89b5e288f
x-ms-traffictypediagnostic: DBBPR04MB7948:
x-microsoft-antispam-prvs: <DBBPR04MB794882E33FC72903E8F0DC3F88CD0@DBBPR04MB7948.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vYZJ0oViNHRB20sUBXdLxsxaAQKOXvQQ9Ffz6R5ovjWFfsdwLNHw+nXIjgL7Aou9eSusBkMyOZQJL00D+8g4xHTFxn8IYbPu4ar5zTdUXf3HYuPKJ0W0UA7kla/qz2Syltgkfp5508NDWRDneZmSVJxNgw7cueAXC3824tpGUBRX3IOuWETqcWoOV04uzO31Z1X1lmmElORogPb98bDhDkMzk4UQtuvq5dRrE230Ar1c/OKS3XM6i2eg7K4oBKtEea2HII5fu/YfD3tEK3s3WPRHoAacgRDixTCJtLIP9yh1XZWX20hto6FDAU357jp7553AkFKJNuhXduT3flkNvw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(86362001)(8936002)(66946007)(110136005)(508600001)(2906002)(6506007)(8676002)(66476007)(52536014)(53546011)(55016002)(71200400001)(66556008)(76116006)(9686003)(66446008)(64756008)(186003)(26005)(33656002)(5660300002)(7696005)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dEpxeEIxUFpoQ3FwRnZjUVRxdGF2RnIvWitlQmY5MnV0TFJQSnVmL2RvSEp6?=
 =?utf-8?B?Mzc2aVNjMmZFalQyWTZ4cTdyUTlkQVRtcGRBSDNRR2YxbFFQaGxQL3lIRnU0?=
 =?utf-8?B?WTVMWUhrTlVKc3c0UElkTmp5VmpxQnlJVGcxRDRkZmJGTVNRa1BHN21pZGNO?=
 =?utf-8?B?L2JyTWhqcVFibC9YWEloRUJhV3pEWXRKdmJpV2FPTW5STXluL01wUWx0K1d3?=
 =?utf-8?B?ZmYwNTNXaUl2M01BVFlmZlU1VmhJL3Noek1wRnFJVTRCNlBGVkRPNW93MCt1?=
 =?utf-8?B?b0pXVzNUdUQzSWFwZ2ZrZ3ZHdVdseDlUZk0vT0dQWXN3bjdWWCtZbmJVdW1Y?=
 =?utf-8?B?eTJOTDVNc2V3OS9zSzlicUQ0bzQxSjVHVU03eWYrZVRMQmhMa3VaVTZLSFBi?=
 =?utf-8?B?aU1QVG9DVW1ib3hFZmV2VFdYNzhKRmdocXZiTExJd3FxVDdGUE9qTnE0UUdQ?=
 =?utf-8?B?S0tkL1pxQkN0VjBXZk1kVEIwN245UWtDeUdYbHZZbWlCc2xoZTA4c09DTGNV?=
 =?utf-8?B?eFA0ejNRTzZmQ2ltOWZsY0UwWlpHWUFyaEcybWpkWXA4TWs5MzJ4MkFHSSsx?=
 =?utf-8?B?ZWtVV1p5ZkdOVUpoa0dkVDl6cE9XM1g5bXRyR1k4UE1hM2FWeHB4eUdVRStO?=
 =?utf-8?B?SHpRS3NCZ0Q3VUsyN1I4d3Q4M3V3RW5uVTROY2pwYlJCVHNDU1FrbStzRTV3?=
 =?utf-8?B?NGsxS2hpVk1ZdW5hOGcwVkI1NUtkVVFaTlFzaU85ZFdldVhJNngzZTUzQmpL?=
 =?utf-8?B?ZlFMTm1vRFVnTDYveUhZQVRNNHZERFlvUnNJVjR1VzFKbnl2SCtscGUrMUZY?=
 =?utf-8?B?b0NHOTFwMlRkV3M3T2xZMzVTSit2UTkzaXRtekRMWGFORU9PQU9qajBCTWJX?=
 =?utf-8?B?Z0ZmaTNFT0hHTkRpdndhSWJNVUZFS2ZjbHdmK3kzd2VtdkhhREFuaTArQ0lF?=
 =?utf-8?B?M2VibkVYM0Exa0RiYXpHckRiYUNIekE1YzNXV3U1WWFLSURWNVdXZWhlbWwx?=
 =?utf-8?B?bm9RcmUyOS9WYUxQNnpxMmVnV3BlbUdrbTFMWFRhN0hGTmFpa1lBUGI1ejc3?=
 =?utf-8?B?cTNXZS8vQytJNjNBMGVpV2phdjJEbXUwYUJVMkNvTSs2UGlDWjFmbUpGMCt0?=
 =?utf-8?B?cjFrTHhBYS9RTUdtWElsRWpNTUxkUHJjZmVhU1pvK2pVVFRzZ2NJKzJiRTNW?=
 =?utf-8?B?Q2k3OWhIWXNqVTl4UTBFTlU4Zy91ZmdzL3d1RDE3YXN5QmozMGtFa01yOXcy?=
 =?utf-8?B?WHNXaHROSlF0Y3VwclZMU1E1M2ZkTVNaQlg4aVVlcnduQllGZk4xdGZwb1Vv?=
 =?utf-8?Q?fdG0oqUWTwLkc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f25538-7460-4458-8be4-08d89b5e288f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 09:46:38.2192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DRhlMEoi+f/73msa8y2UJo9hEt9V+oJyqR6L/3qJJf+LVNtfx7sahOQTZilypbgwmy65rBAPKUXKeKfrVp1jDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Po5dzvEV;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.1.82 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: ARM64 MSIX enabling error
> 
> On 08.12.20 09:01, Peng Fan wrote:
> >
> >> Subject: Re: ARM64 MSIX enabling error
> >>
> >> On 08.12.20 06:28, Peng Fan wrote:
> >>>> Subject: RE: ARM64 MSIX enabling error
> >>>>
> >>>>> Subject: Re: ARM64 MSIX enabling error
> >>>>>
> >>>>> On 07.12.20 08:46, Peng Fan wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> I use MSIX, not INTX in root cell file, but always met the following
> error.
> >>>>>> uio_ivshmem: probe of 0001:00:00.0 failed with error -28
> >>>>>>
> >>>>>>
> >>>>>> I am trying virtio ivshmem on my board, but seems virtio ivshmem
> >>>>>> vi_find_vqs not work with INTX, so I change to MSIX to see how.
> >>>>>> But met upper error, any suggestions?
> >>>>>
> >>>>> MSI-X for virtual devices only works when injecting them into a
> >>>>> physical PCI bus which is using MSI-X already. Is that the case here?
> >>>>> If not, you need to debug the INTx case.
> >>>>
> >>>> ok. Thanks.
> >>>>
> >>>> I could see virtio-ivshmem-console /dev/uio1 shows a few lines log,
> >>>>
> >>>> But it responds to input very slow, when I press enter key, it
> >>>> takes long time to respond.
> >>>
> >>> After correct the interrupt number, it responds to enter key fast.
> >>> But if I not press enter key, the virtio-ivshmem-console /dev/uio1
> >>> will show nothing. If I press enter key, it will show one line boot log.
> >>> Press one more time, it will show the other boot log.
> >>> I need press enter always, then could see the boot log printed out.
> >>>
> >>
> >> Still interrupts issues, I would say. The GIC MMIO resources are not
> >> accidentally passed through? Does /proc/interrupts report events for
> >> the virtual device?
> >
> > ivshm_irq_handler is triggered in the beginning, for several times,
> > but after that, there is no interrupt triggered from inmate Linux to root
> Linux.
> >
> > The inmate Linux is dead loop in
> > __send_to_port
> >       ->
> > 644         while (!virtqueue_get_buf(out_vq, &len)
> > 645                 && !virtqueue_is_broken(out_vq))
> > 646                 cpu_relax();
> >
> > If I press enter key in virtio-ivshmem-console /dev/uio1, it could pass the
> loop.
> > But it will run into it again later and not break out.
> >
> 
> I bet the "virtqueue_kick" that comes before this loop does not trigger an
> interrupt on the backend side 

Indeed.

- or we have race that this is consumed without
> delivering the expected answer to the frontend. Didn't recall to see this, so
> I'm afraid you need to debug deeper.

This change make it work. I am using INTX, so num_vector is 1, however
if device vector is 2 or 1, it will ignore the interrupt inject in hypervisor/
ivshmem.c

@@ -361,9 +369,9 @@ int main(int argc, char *argv[])

                memset(queue_config, 0, sizeof(queue_config));
                queue_config[0].size = 8;
-               queue_config[0].device_vector = 1;
+               queue_config[0].device_vector = 0;
                queue_config[1].size = 8;
-               queue_config[1].device_vector = 2;
+               queue_config[1].device_vector = 0;
                current_queue = -1;

                vc->config.cols = winsize.ws_col;


BTW: Do you think using kvmtool to include the virito ivshmemv2
support is a good option? Or you insist standalone tool as your
current design?

Thanks,
Peng.

> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760F7FE11280F9619178C5888CD0%40DB6PR0402MB2760.eurprd04.prod.outlook.com.

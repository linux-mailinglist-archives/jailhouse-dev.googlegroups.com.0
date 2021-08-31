Return-Path: <jailhouse-dev+bncBDBIZ3EL3UDRBTNEW6EQMGQEA5LLZKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3d.google.com (mail-vk1-xa3d.google.com [IPv6:2607:f8b0:4864:20::a3d])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEEA3FC2DF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Aug 2021 08:55:12 +0200 (CEST)
Received: by mail-vk1-xa3d.google.com with SMTP id o2-20020a1f2802000000b0028db8be8efcsf1538168vko.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Aug 2021 23:55:12 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1630392911; cv=pass;
        d=google.com; s=arc-20160816;
        b=n6TcurBb7lb6fVtaLCv2DODWNcSiLzW6Uj4qUPnKzsLt0n+U2SWi9x9EsF2bphXKDE
         SRdI0J1EUhka1STj134H3UErmFQzkLEiLSZpZqTdzdgneG6FhwvTU16Ii85V2e1+C1kO
         pD7PWs4ZuNMzq5+P0yorXNlWB5eLGLxfx5+jnxOJDPuX41ioBs0dBp4roroW5B2RmhMa
         xvksY1VkfB9r9E+sT7M6xPZF031qmZT7EfoVbxu2pNrS4gVFHmUpfNLHLJtO2tsCt9Ox
         AQFV0N5PD9WBVmUYy8+enXBUWlCyWPf1zRp0ddy02nU5XYQu+Bngw1KdoW5ovtKF9bBP
         W4yg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=7EacOXsncv4lyX/7/Tqj1NVRUOOVObxe9ompGc/pdy8=;
        b=xUP9AWchChCK/axFjvRT+T/NqzBr0tSYokVWLEWlebP8UReG0GEySlMk8Sfu5iVmyb
         UBXdam80fuvvKlG16W2hvqUVTXPAsCP7sMU5a7ZSG4RgvRSZLHrbXmSTL3uu7bERgkvf
         RZA6C2v+klxtfd9fvMdxudlSbJk8l4SEwEPNVRp4jd/SBvcjIQluazeTdb9/X7yDMT5Y
         Ema4/5SLm3t6ycryt08zl1YyimybhRQYY8W7PHUliXEDabXMk/3d7EWxt2VeShPKY7gH
         HUyf/mexPt2U83IISqQDP3JSK9Ip5vUGPOlt5/06y6FopLOSd9rBrhK3Vw27LGPCLZBu
         99VA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=SF+9tGhy;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.5.56 as permitted sender) smtp.mailfrom=zhiqiang.hou@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7EacOXsncv4lyX/7/Tqj1NVRUOOVObxe9ompGc/pdy8=;
        b=fWZVBhGM/5aCnRcePqBOyaBaKLA5AP1RYd2Z+4kRSPN2o+khGazMozWMQNwPAoB2/x
         EeN119G/z3UaiqfdIeV1nCOxNDtXO51IlYElAX/lAw4OlsOOiVSqkAfSY7G+uxHytdvj
         uu7RXlvJPhTrDWJZr5tvkS5o+Ivg3OZ0CUr1s9CkCNoqoePjzfP/52m4/SxxqDt2y/9m
         Wh5f4e7SuQuq49nFW43XSUqr/RUNIiQZMIPURGVS5qWG3xVahr3VeMAVj7M0nUnj0iIb
         UQ/l1EJNAOMk5XcjyLS1/zbFRrT3xXi1Sg8H+E/KPD94Eu4gY909fpWYex+vE6JJs+E5
         ++Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7EacOXsncv4lyX/7/Tqj1NVRUOOVObxe9ompGc/pdy8=;
        b=FeZTlvIGEJ+coVfEnU6HTWXu0JG+y+me3ExGXev2FwkZccPuqGrjh97OYA3Out6xyx
         j6kqMHx+Uo1IX+Mc0eX48iqWn3+6VoL+bk33Txb2UR5wnWKVCEfQ8KQWIPNiQOMiVekb
         6RZ+5ptXZ4VT84Cbf/yd7PtZtWV6tMs46W+UDWm8J6OMh7Ouan0AWXzoWWDVnv2TW3Rc
         PDFy8TcMONnazVZv0QoeO7me6iZjToGXE3Wts7B6drYMxWDnsaJ0Pg8W4hudKWuIll3w
         4gUBDSyymGqhF/6XF/gUzKPuQD5TxEhgqikWoLK1+IEfd/JIje404iFEnEKjJKmx9BgA
         T7Wg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532VekDDFxKinuAEQ6/DCNfYTVwTWc5DwjZPrsNMbtQtPjLLVcnk
	nR0rIdx8vm93/skMolU5gF0=
X-Google-Smtp-Source: ABdhPJxeFyFpzmd9jfrEHt+hZ1NLapfcRXb6C0P3reck52Uf668UGWQap/LVEKArlPHaq4jw1PiH9Q==
X-Received: by 2002:a9f:2429:: with SMTP id 38mr17858221uaq.67.1630392909604;
        Mon, 30 Aug 2021 23:55:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:48a6:: with SMTP id x35ls2011633uac.2.gmail; Mon, 30 Aug
 2021 23:55:09 -0700 (PDT)
X-Received: by 2002:ab0:3891:: with SMTP id z17mr17434165uav.4.1630392909005;
        Mon, 30 Aug 2021 23:55:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630392909; cv=pass;
        d=google.com; s=arc-20160816;
        b=lqc9U2EW4xRNlSbnwitgZ/z0gcW+yUsxG7/Kk5lEch4i9oawHyLqf91yAKvZZuMNK4
         ZuSYY/zo0iATVqIuxfvjsBd+DlUnkSflfVsfb8w6O7NkFE8B40bzwKi59Qys5THJzwCP
         R44Bx3MF7+uT7ZvuN8OmIEVnaIeCQbltcinJJ0+F8gt7miN3h8TRHGjc8v8puW0rLXz+
         HIQeiFxfxw0/+rI1Jd52V7R4BO4EeNumtUUrPWMEQtA6/doqr0OGYYiat0TNoOictws7
         fBjU33K4ho0ABvKUJMpv8eKXrz8XDb5qkIwV3smat9nD79MsN/s6CxXe6fgNYhFUrLDN
         N8kQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=wQ078AyyYUoUopX7I63rXgbdsYRSzZM7ws/67VfZkbs=;
        b=bB6NDva1O8yf5XAws7afqnqSV9bYnaK0Ts1ceYXZXzSzYio9qgsysPPxTV2pYEARdT
         kd6m1tNddpg//t/2BwZgaIvLvLXKGXCTDv7sGQJJFW66Ym76Lpm+v810vlTFNAkuszw4
         s9IP2YPT41TuRrrvDm/o7q+98ZFD1q/M+tyhPqXT3MPyFAm67pzo3ffQIhH+KiUJQ0C+
         Cf2WeQ+K7iV6KMBchdEcmub1Du3ZofFgLW9jZruEw0s6za+ci+HcdHX1u7sQMdCNYdMt
         KAS3zRxXS/WsxnHluX1eWz+eA9dKY3RTMH1I6JJqxqLD+qu+lTNCs+1/9xETEiRVGuh1
         xKhQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=SF+9tGhy;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.5.56 as permitted sender) smtp.mailfrom=zhiqiang.hou@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50056.outbound.protection.outlook.com. [40.107.5.56])
        by gmr-mx.google.com with ESMTPS id az31si157892uab.0.2021.08.30.23.55.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Aug 2021 23:55:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.5.56 as permitted sender) client-ip=40.107.5.56;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHhqqZRU5KbMBaKnPDE9Puvqpimu603yEEXkVZghynywRzelklotBcdxnPReVmOdPZ9ReqAdLQFT0FGUz2C1TxV69n9fFn4xLmJvfud/9ausXok2SZvZMaqg1LMLJvUWB/PxFs1efOWcGACDdslXu2YQIYxVhy4U/1BX9qX1xGHCColfaaIWc8WRG4GT6NKTpBslhCQ32SRson0GcyKhJeJalWVqGU6hZZcpLbv6jm77VTwN43BRafXqIllj5iWoP1daS19XG0TAN1/ZskZgMMpaCTm2O6JLURf3VsD0RvIdoNo+O8WYMs2nSsx4KFQwI1D7Qgkf6JKQH0HJBHRtYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQ078AyyYUoUopX7I63rXgbdsYRSzZM7ws/67VfZkbs=;
 b=ZdGw9MUPBkug5E8gixcA3rHD8cSWC9FuZ1+2SzZCKj7rvVDUgz7VNKcheFhHc4OkyU6e2/l78jz3ShKVnbAChWcrlhUyr6KndwzU1/5kI03uJLQ/t1Vi7lwZUXUWhrRM1DiuFSOZCpoObXnd5wyezdyUdK+x41iUi4m+3lTFgyj6gY+v5Xsfni/uW5Y3aCy6dksAx2pSH/HN/x7wEpn5iA63o5IlrnZ2U388PByhv5mApX7/m/fieW1Ntj+g4o2bAgalo59rZJfDQUGdXAXF4FNA0ovn/PwBQleomltd9DswaLu8BK7KCn39lce7+CGiHnyc38Dl1iG1cET1ZTk3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com (2603:10a6:7:85::27)
 by HE1PR0401MB2634.eurprd04.prod.outlook.com (2603:10a6:3:87::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Tue, 31 Aug
 2021 06:55:04 +0000
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::8d8a:89d:e110:3c3b]) by HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::8d8a:89d:e110:3c3b%6]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 06:55:04 +0000
From: "Z.Q. Hou" <zhiqiang.hou@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Jiafei Pan <jiafei.pan@nxp.com>, Rui Sousa <rui.sousa@nxp.com>
Subject: RE: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
Thread-Topic: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
Thread-Index: AQHXmxbhYfr68tdfjkGRS5idFHzolauG+uuAgAAZduCABHlagIAAUF/ggAAZuwCAARBj4A==
Date: Tue, 31 Aug 2021 06:55:04 +0000
Message-ID: <HE1PR0402MB337140548025A20E651BB4AA84CC9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
References: <20210827075116.6208-1-Zhiqiang.Hou@nxp.com>
 <2d3cfe41-3c51-34f8-8130-f6b86720d835@siemens.com>
 <HE1PR0402MB337191DE611BA6CC480C104D84CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <dd785b10-ac8d-f483-7483-f8830ed6147f@siemens.com>
 <HE1PR0402MB3371C1CDCCD9EA8CC8938FC684CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <9ecc5d87-c7b4-ce84-6621-f88cf05fbeff@siemens.com>
In-Reply-To: <9ecc5d87-c7b4-ce84-6621-f88cf05fbeff@siemens.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76c537b6-7e01-4862-85b6-08d96c4c42f5
x-ms-traffictypediagnostic: HE1PR0401MB2634:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0401MB2634C21DA78E6663246E8C5084CC9@HE1PR0401MB2634.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o/TvP5//iP4wQY09h8DCuMJttKFJNhAQZ6jgqcP+/T7706GhUzIcMB0Chsp8jZ4a+ttVKqj0Y836i5aTMbCREz54+PLbSrGCDn47tReyjZriPLizK+8iEJQCJzSKOmesGl/ku7TQUbNq8OMJyc4A66GK7VzGR7ZGHFJ6vd/pBcPhtxHCikkEiYh88HufHRWJbdoIJ8mmLP0+GI44RNsRkgvRkq7nPzHOjhT0DHXt3V209Rwt/n+b+Ltokxo7TUlBwVO6OlTzbYM1PMBhYWfp0l8rTj8zjt50dshYL1eIEK2lLUTOHRYhVSJkc3FrowBa257AgGk/1G7VNhyGFK9WjnPanY5XDspSnGrcWqQfjhYP0znFNSfZW/qJ8ZD1YQMRzGOOL+zS5+Kshjs0trFLTSBmj9Epvo1wqac9kaiMQMBv3LpsXIpTNTEc+XTiljee6mk0H7FEFu7wAK0+2tj2jm3Zk6GbGi62Z3uQaYqR0jKFdkTt7nuboBxX/EwSFohQ6dGT/4huH64OWbttmMcCiGK9AM4KYxsSl9wFNgizagjt0hXLynAlIr9dG7hNwoayQDSEgra95BlFeCy1tR2cFDAaXwBOayyNx1uhCsSe2Lp5CeM4wihl5fOLDKIyRNF5MrANSDmAcGTmdcrQ3QOBBUe8YkT0H09x+yKRDRKqsRQPwaUCROAsdtqN0upxgvDAL+DpK+Oh22GbVfDIzrA9Sw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3371.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(84040400005)(66946007)(8676002)(2906002)(64756008)(316002)(110136005)(8936002)(33656002)(83380400001)(478600001)(7696005)(66556008)(54906003)(76116006)(26005)(66476007)(55016002)(38100700002)(66446008)(53546011)(4326008)(5660300002)(86362001)(186003)(38070700005)(122000001)(9686003)(71200400001)(52536014)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnYzMnRneEpSakZKTU95R2NKUnNHNVhQZUhsbnVTSmF1bnJFYjVaL0tVa05j?=
 =?utf-8?B?R0w3blRZUGF0VnBRQmRYSStnbzcraFQvTnIrc04zSStCR0NUL05UTnBzTzQv?=
 =?utf-8?B?WENTOTEyQXNZMUVScmFLclRhZWlWcHk0MVNCaUpPdHRuSXZtN2NWSkdlOTdy?=
 =?utf-8?B?NFNQVXpzVlkrSnFzVnhpaEt0bGsycWgvYUlrS2RhaFhzVEI0d2wrY2xMa3BU?=
 =?utf-8?B?K0JPR2lsMk5lNFZ4Um1yN1QzRFptdnlqVHUzeGFnejNmUWtPVEN5MTcwdzkx?=
 =?utf-8?B?Mm5Oa05ySTlBSWFOd3YrY3ZRK0V3b3hXanozNWkxd1RNN3FnY1BYejFnb2NQ?=
 =?utf-8?B?QlN5a0ptSjVVY0ozdXJtUC95TjY0TnM3REU1Y2l1ZXpDUlJjbERObEVZZzhU?=
 =?utf-8?B?aXVGYjNVRlpwWk84ZW9sSnhGaE1zYTYrVzMxQkRacUE4eW5yMkFjY2VCRnRC?=
 =?utf-8?B?OFhrS3QwcHJDajliL2JjOWd5YzhPSVZhQUEyUVI4dVUzeUpkYjBhODFNMHNm?=
 =?utf-8?B?c0FBMTNkeG9Ma2QxdzJsb3NQVHBBM3dicFFMNlJjcmx5RG14QitpcVl6cjk2?=
 =?utf-8?B?UTlyV0paaEtkL1llRHlyYjFSN1hMVEgxYUowSDBJbGYrNHZpOUR5R0pLQkVt?=
 =?utf-8?B?WHRpRmREVFdEeTJkU3RLRzRWUnFoUFBNdlR1cE02NTByVmJYZk9OdnpmWVlB?=
 =?utf-8?B?OGR3REFUQTFhNkFmTmNMbE5waUVzYTcwMS9iVFZ5dkZDeCtuSFJTQzlSc1Iy?=
 =?utf-8?B?M2pJWi9IVnNXdllYSnM3azBSazZOWnJnZ3JYaGw3N1MzV0ZoNys5WFdDRXRQ?=
 =?utf-8?B?djFNS3pwU1dQb0FzeldmNUQrdWVUNURWdlBqTGhBMnR1RXMwSlNQZFExKzFz?=
 =?utf-8?B?TjRiZEloWEJpV282MXBLbDZCZ2JROTNCc3A5LzJ0NURYemVmQURpRkwxRDNn?=
 =?utf-8?B?MHJCT1UwVExBYlJ3MVVPL2FYdnRGRzlEcndKaGc5NllONTFVbTM5bTdRcU1N?=
 =?utf-8?B?cDQwQ291WVRWVGduYVNMSklxb3lNalRhOHFieFJXenJrSGNrazk0QWxaeG1k?=
 =?utf-8?B?YS9rcG5xeDVYeHdkYlAxUXBLY0lQa05LUnpwSHFKQkhhTjJ5UkxYRG90MTF0?=
 =?utf-8?B?UW5VanZiMm92cC9FTGpYNU8zV2kyREdNWlUzOVFFTm1kNUlJRXBJY0VoT2dW?=
 =?utf-8?B?eldyOE84Rm1xenBDRk1jdms5UXZ5SGlibEQyUWRkeTZ0c3NYZVNhNjA4SnFB?=
 =?utf-8?B?aWI0OHl2a2tUM3hkOTVUaG8vR1gyVDE4RlJvRXZtY0IwRmVoVE9Pb0VxWEJo?=
 =?utf-8?B?aXBPUDdvcTFPbE9ZM1dndXhES1hEWld4ODFVbVVheGcxN0ZjRnI5aUFqcU0v?=
 =?utf-8?B?QkMzM0gzTEw1SjhGWmJORUZwMTRkaWl6d3B6RVhucE5RenFBTDJ1eC9VMnNs?=
 =?utf-8?B?RmZOM2syOHY4N1JYUmRxWnhKR2tmK01KcVBhek9SckdoWFo0WloyYnZla213?=
 =?utf-8?B?WmM1dVMwS2R4S09OdWlpTDgwWEZtYVRsZDd1dlBFSjJxSDJEbjVyZUVoRGUz?=
 =?utf-8?B?dlNjSDBvNmdqSnBiYzJzVVJEQUM5VlFOT3c4ZVpqRmlnRGJrRUwweWJ1Tmdp?=
 =?utf-8?B?aDQwcHRyR0E0ZmRaaDJZMkQzZzlRRFNwS2IwTDBoT2Zna1VCdksrL3h4MSt5?=
 =?utf-8?B?V2lLeFRzeTlSME5yeXhEM3VDa2g5OFErb1JIckNRUWkxZC9VSWpiMW1RSGZL?=
 =?utf-8?Q?iUVN8nCdZzEG0GJItSPUYjJjfQrqNTBD2pYztBg?=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3371.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c537b6-7e01-4862-85b6-08d96c4c42f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 06:55:04.2039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4ZRX49XWwkgtZuKvwEvim38H6wiQhpULzn3OZK3ipJuvu65kAyrvZZLyDXoh62/6GpOIG9cKHhTJmxpo5AWdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2634
X-Original-Sender: zhiqiang.hou@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=SF+9tGhy;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 zhiqiang.hou@nxp.com designates 40.107.5.56 as permitted sender)
 smtp.mailfrom=zhiqiang.hou@nxp.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=nxp.com
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



> -----Original Message-----
> From: Jan Kiszka <jan.kiszka@siemens.com>
> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 20:03
> To: Z.Q. Hou <zhiqiang.hou@nxp.com>; jailhouse-dev@googlegroups.com
> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access addre=
ss
> and size
>=20
> On 30.08.21 12:54, Z.Q. Hou wrote:
> >
> >
> >> -----Original Message-----
> >> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> >> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 13:43
> >> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
> jailhouse-dev@googlegroups.com
> >> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
> >> address and size
> >>
> >> On 30.08.21 05:02, Z.Q. Hou wrote:
> >>> Hi Jan,
> >>>
> >>>> -----Original Message-----
> >>>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> >>>> Sent: 2021=E5=B9=B48=E6=9C=8827=E6=97=A5 15:53
> >>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
> jailhouse-dev@googlegroups.com
> >>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
> >>>> address and size
> >>>>
> >>>> On 27.08.21 09:51, Zhiqiang Hou wrote:
> >>>>> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >>>>>
> >>>>> In function restrict_bitmask_access(), the current access_mask is
> >>>>> implicitly assuming that it always access the whole register, but
> >>>>> some registers are byte-accessible, the Guest may get/set wrong
> >>>>> value when it issue a byte or halfword access to these registers.
> >>>>
> >>>> Can you be more specific in the affected scenarios? At least one
> >>>> example would be good.
> >>>
> >>> Let take GICD_IPRIORITYR as an example, which is a byte-accessible
> register.
> >>> Thinking the SPI INTID 33 is assigned to an inmate cell, and Guest
> >>> wants to set
> >> the priority of 33 by byte-accessing.
> >>>
> >>> Assuming:
> >>> GICD_IPRIORITY8 original value: 0x00000000 Guest set value: 0xa0
> >>>
> >>> Then the current logic like:
> >>> The access_mask is calculated as 0xff00, GICD_IPRIORITY8 read back
> >>> value is
> >> 0x00. Then 0x00 & ~(0xff00) get 0x00, 0x00 | (0xa0 & 0xff00) get
> >> 0x00, then finally 0x00 will be written back.
> >>>
> >>> With this fix, the access_mask will become (0xff00 >> 8) & 0xff =3D
> >>> 0xff, so finally
> >> the 0xa0 will be written back.
> >>>
> >>
> >> OK, indeed a good point. We missed the byte-accessability of
> GICD_IPRIORITYR.
> >>
> >> But this reveals more: We perform a read-modify-write cycle on behalf
> >> of the cell with the cell's idea of access width. That is potentially =
unsafe.
> >
> > Can you help understand why there is still potential unsafe with this f=
ix
> patch?
> >
>=20
> The patch is fine for GICD_IPRIORITYR, so is accepting all accesses for t=
hat
> register. The problem is with other registers that do not support byte
> accesses.

Don't worry, according to the programmer guide the Guest code must not acce=
ss those registers with Byte-width; even if there is someone do that by mis=
take, it will trigger an exception before the access is trapped to EL2.

Thanks,
Zhiqiang

>=20
> So, to make things simpler, we convert to always performing word accesses
> for all of them. That means no extra effort for the other regs, just filt=
ering of
> size !=3D 4, but GICD_IPRIORITYR now needs upfront work.
> And that provides the chance to address also the issue you found.
>=20
> >>
> >> Handling of GICD_ITARGETSR has to resolve the same issue, and it does
> >> that by converting the request unconditionally into a word-access. I
> >> think we should do the same here as well.
> >
> > I think this fix way is more simple than converting to word-access
> unconditionally, as this fix way only tweaks the access_mask, while the
> word-access way need to tweak both the addr and value.
> >
>=20
> We could stack the two changes. I'll take yours first, and then we only n=
eed
> to decide who does the second fix on top...
>=20
> Jan
>=20
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/HE1PR0402MB337140548025A20E651BB4AA84CC9%40HE1PR0402MB3371.eu=
rprd04.prod.outlook.com.

Return-Path: <jailhouse-dev+bncBDV3L7XXLYIPDEGTQIDBUBB6W24FC@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3C534212E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 16:51:13 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id p15sf21816143wre.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:51:13 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1616169073; cv=pass;
        d=google.com; s=arc-20160816;
        b=jDX6hEzAye/oo0VlUIsu9jRvzhvk4Lw5Xrb48sW4WkL0r0zcFV7TcDmUKkAYyfofrr
         xTDFPPyVDkatCH8zwsNiLzmEXMBNXt7UP0VHUFamjQOxCfbvJMMoWaiDWtF+FdakSa4P
         wrw3sVaRdJy32Zef3ictcZp+Dd0fUWIdq+EIyVjWM19cvLwW5RippMhZiXUI/mBpqer5
         wNGOn+XP1oFKaSl21awW3OWHOAGeodsAMEs31fhyoB0Mx4fBN5kjdLos+0PEzdJ7ZAa2
         SdtJ7q3aFNwK/NlTLZhlRQZsbzL6e+j9+BczgFP+CdYJg8HIkaz75uFV4SkC5zogQEPf
         Ax3g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=C2Cx9b0nMlhGAXHw9wjLhXnUlHd04iaWf4NcQyY7IxE=;
        b=OmmM3Ivw2Wu51iNsOhPdi/9fsa/OChh11sub4T8Gn4+wXhAmHJld0aQLCoXWpbXAIa
         sHj4pqj5OpB8KZDCxsNVyPfdb6j3DBWAauEKIFAAqWTD1f5A3VVPEWZpgzbEBrItvV7f
         BIdM0NGsrKnzB7YxFqiOuFoij32h6cNCOBGcU0nJqz23wzU/2u627qqW3ygk2lJbiPNt
         V2pA0fEwbRpFik8wlXBJ4BpWzu2AZFzVaHsMPFJtZfBY5dOUOFgzMY4XulD4pgvmUS1b
         T0MBqTjWXyf4vnvL15/7CvJkoVL2uWOiX6Fl85sXiZ3rwi66jEEDDA+vy8yESIxYQhwO
         c/Jw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=OELaVkV0;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.13.53 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=C2Cx9b0nMlhGAXHw9wjLhXnUlHd04iaWf4NcQyY7IxE=;
        b=s0jiVDGPn35d+qmIyN+3ppK3j+TXq1YBIBa6KxHuwh6RQ1YnBxd7D+s3umRA1rLFSJ
         oaWYMjwxpnowdenwkwS+Cu4jQBrGFalafvD/Gq53T5Euw9rNLX1wVW6Mv1/7okY8QPD+
         LT6T4m1PzxXDbs9J4o1MDVJwcR3wmul5hE2ljNufExxKhUYy4800RyI7qW9cRelhPi7H
         gFm0CPKeRtHmLz1rM8N4+WUIvd9YC/wj2GISwi/4E+LRJcQaT9M4TstS8qcaxYOFzbAO
         u8Wb3zRNl3aLtV3Zvh807PTPVPNNHci8Xkr2uTeQpv+VPJ0/r5vra0Ix7WkKTPkWOcxB
         sDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=C2Cx9b0nMlhGAXHw9wjLhXnUlHd04iaWf4NcQyY7IxE=;
        b=OwIsEoCI7zJ6roRL5/4W9gyEDcm8dYCaBhnyZ9TXcX4IXi9i2vocAjLsjF2cdkuDHE
         MkxqJrx6QI6mxcWfTONBT0V9IpebYhaafJ1jU1mHb66HoY3bPf+oGXz7pup07nsTGfKi
         0jbo390h313nN8Pm7XG8XESK+z7y3D2vOyn2CYFmVTyfbbBwXea2MNRcEes2mVqQ4rJc
         3KCpQ+de3ZvVC+wyOZbEEp+19M1AHMl7uLDvjwnFrpXLF2PezBjjaRNyZGDHv/XqB25F
         wu9457PRmRkDLpeEPAaXawml3hjA6I2eDTP+zEj5dDZ5oJ+nGlc412UVQGkdp/6f+S+j
         6Ggg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531hpUYxcbq+lBe0CMSPwePReOy43tc5tW/h3wf2yjGFlxE0Fxdf
	xTzqRrsc4uvmyEOpLtGHmxA=
X-Google-Smtp-Source: ABdhPJwgoCZYEMFMgpYEKdQNOXiWI5ScsHuGGDzSKmj91vdOISjgVE1MLfOk2XDn7gJ/+RtUHlxxTg==
X-Received: by 2002:adf:f7cc:: with SMTP id a12mr5278297wrq.54.1616169073237;
        Fri, 19 Mar 2021 08:51:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cc94:: with SMTP id p20ls2895596wma.0.gmail; Fri, 19 Mar
 2021 08:51:12 -0700 (PDT)
X-Received: by 2002:a1c:2308:: with SMTP id j8mr4457263wmj.45.1616169072303;
        Fri, 19 Mar 2021 08:51:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616169072; cv=pass;
        d=google.com; s=arc-20160816;
        b=kgI4pyB/ZlXLVjGoAH8y2P0wq/AaKIQFLEt9kgdbwKKLmkt/LZa0zGKi2OZe/o7SOt
         5gBPlQkxIdrMIQ/UzCfKmGAaG6Cr024rV7He0crd1tR3ut1vQf8SPGu5Z40GfrRilUpw
         imasgk6otMRNHQoV2RU7aWXiEvrPVo4rFw20DhJa3HrEDliXDlpXX36o7AYmk8uLdl74
         JEow9xLShqHe7w+br07AGIrNb8lsQRmXMXafjB8sKq5uRLMJxXJp1zxatY7VL0F24ukL
         XgzR4LGed8XHVQky8diPgQsWDt8i1pTZ5ZT9k9xPt45WyvyCROvFksMfDGuw5oJuUCkA
         8JCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=nrJzoinw2urMjeWik9cgJtogqJDLzeFabVUoj1sZpb8=;
        b=EPxf1bjEUZJ8jINRQXcWyxbtYXxKX5bCgHA7mZz2UVjrgnmmOnIrK5wOFK0CYuD76L
         wFZE7+EYiSPnx3n4z4dEtMYRYIvBr9kEoZ21Ipcza0S9d6NCCcBh0KfvAnXanlz7AWRQ
         jORgep59HC1ohqARmeVaeIYk6M1oHLLsqUMBkAXhLetUN9n6+E1Sf0yD44XDl2+G9Ezl
         SjFKKbZcOEAZUUPf7Es2eGqNYpvAtPZ9is38X/viphVnFVigVEPKAsczdsQdaIGfuGgw
         pGIRHgFpfwbKrEYHZM67FpC79qzvrpL7I0f9AGUGrWnWkdfgh02wvQqhg0Vg4uVrR6/1
         BQyA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=OELaVkV0;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.13.53 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130053.outbound.protection.outlook.com. [40.107.13.53])
        by gmr-mx.google.com with ESMTPS id k83si220133wma.0.2021.03.19.08.51.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 08:51:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.13.53 as permitted sender) client-ip=40.107.13.53;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJJrs9Htd56MidVnqXbyQm+Jfzfq2FDZG+Xz2iEnCsvAQiHddKyCbuf51MgX8UK6JbDNZbAuf0R9c0yruSzCi7hDQ65UXW6kepxgDkQeksVGk73E8jZGgZdZUH1/FbOivY4FufNOHR1RHbvQgap8xAG95E2zXaPJIL3LHXEMVkW/MOh2DzOV7Lq40OZl+qXCEGeSTxEu5RbjQ9aD/Goct/NkyjqrVg55cAlcNEOpLvw1zp4jYacY+bPFQyCWKsjZhgl3w4ZVwQMJ1BKa+5kubLeEphjiGTafG3eXmKYX41PRGZvY0D/VwYYL5QBNg7ykevt4TBsmVFS9EhLI45p2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrJzoinw2urMjeWik9cgJtogqJDLzeFabVUoj1sZpb8=;
 b=JJvqG3oM3vH0i0B5DIeoGTEjBAcc48LPsxGEygkaG4OWDidoiWaO9gYe6qnskDLsJipXo7fjXjo5/A+UAF0RILuiK/npWK45AyfiyZom5s0VLXWBwuR6fZyLpzeT7yHmMRNg6IwtLQLkUh8IW9PP9ZSJc+JOJ8CGceBMM5okcTnjmgJeJtX88pEN7X0ugzBxf1FZAfwoEs9udlfj/cSI6L5XkGcUJ9/j2LTwJSWDi/6sbnOp0gul0oJVa0/igsHGjE6OxhFU+TIiplt0i3AMgiYh40MF/uBVPQHNpSQGijPDHA+NbRVctwPJX0VdXJPwmWZnLlzWG3jAiwBwcemjaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com (2603:10a6:803:61::13)
 by VI1PR04MB6141.eurprd04.prod.outlook.com (2603:10a6:803:f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 15:51:09 +0000
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::5dc3:addc:b43e:a00e]) by VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::5dc3:addc:b43e:a00e%6]) with mapi id 15.20.3933.033; Fri, 19 Mar 2021
 15:51:09 +0000
From: Anda-alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [EXT] Re: [PATCH 1/2] configs: arm64: Add support for NXP
 LS1028ARDB platform
Thread-Topic: [EXT] Re: [PATCH 1/2] configs: arm64: Add support for NXP
 LS1028ARDB platform
Thread-Index: AQHXFP++cp4GhjxA6EmEQL7tYoxVXKqK+7kAgACIhXA=
Date: Fri, 19 Mar 2021 15:51:09 +0000
Message-ID: <VI1PR04MB471982F727E168816391C523BA689@VI1PR04MB4719.eurprd04.prod.outlook.com>
References: <20210309161735.26777-1-anda-alexandra.dorneanu@nxp.com>
 <20210309161735.26777-2-anda-alexandra.dorneanu@nxp.com>
 <015e353b-2e97-5939-3f80-e32da0787a14@siemens.com>
In-Reply-To: <015e353b-2e97-5939-3f80-e32da0787a14@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [86.121.118.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 049c3905-09b2-45e4-c5bd-08d8eaeed08e
x-ms-traffictypediagnostic: VI1PR04MB6141:
x-microsoft-antispam-prvs: <VI1PR04MB6141E31B37C1FF446F45FF56BA689@VI1PR04MB6141.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jXP0yUsvIuZ7kCB14vcUgd2WR8ZaOJO6ffA0h2lvpcJFsSWU7Rrlrwu5ZD3niU8xJhinml6LMOJNZL5rfbZoT3X1qp9n5Qz3ZCoqz3py1n09izPO6BMEd3hDxfvusq/SR+vYD0A8tbHUFz3RvzDJml1cGG91mRv28XGCXU8kpZbt9q15k8KJh23zbSrjANW/41c6SfWXFXcbCRSoIgi+AqQ23kgiLBEwXhOGYq2Uy+1gw7EU6aCnJHQEBUV+rYw/BnX77NQZfaNP+flFCFkifXGk9J0rDjQM5+b07yl8jkHmsZ7unI1Y9i6oCmdOhfHp1LwoU+j6oJr5ZhXs4ia+UatU5fzD+MRkfd/KFkGtkatpH/LH1GhjP4/mtMxGhpi5Ro5QIdVD5qFjOTLVRpyCfETSkl5rXepMxSiuzjmHjc1F7oYGEJAl2qL5WIE8HmsiP5C28ap5yEhg3EXDdwpI7RdwHxosqYu6Xu6BJF6BogOZXE4p4u7s8QLzJ+RRVv8TdPmgV6l4ERLhY3lk/tsacd7daC9dokpnMXMco1w4fx2NdneFxDreme8xmU1/x9+w7OYB+pCRpkmBE+6hDz1UXslwqZzZbqyCmMn81TP4OIuhmQ+5Fu910TzNKWUV6bw2LZkEytZY88fuEDtGRzSIXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4719.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(5660300002)(76116006)(8936002)(26005)(83380400001)(33656002)(30864003)(110136005)(2906002)(8676002)(55016002)(86362001)(7696005)(71200400001)(478600001)(6506007)(66476007)(9686003)(66946007)(66446008)(64756008)(52536014)(186003)(66556008)(38100700001)(316002)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WlVpTi9sZk1xdkY5OGphY0h3c1Jic2dSempEN0s3UjVtK3pnRnA0bnBsSWsy?=
 =?utf-8?B?eGsvdy9iOGNBakRYeFVvdFFiY1dKaWJBSUFtYVN2RHV0TkVHVFg2KzNSWXp0?=
 =?utf-8?B?ay9qUDFzRnFhYmpDQ3JJQkw3elVPcTlMa3VYZXRrbDhyV0EwcVgyU3lRY1l0?=
 =?utf-8?B?ZWJDeG9WTWFadzB4bnJPOWNoaXhWSWRkRzVSUG5yb3BueHp5MEJnaGk1bG1D?=
 =?utf-8?B?ZFlnMEFjVWp2NFJ6VUpQQ2p6UjU2ZEV6NlcyQU12dms4QVRnSTI1YW9sc1o5?=
 =?utf-8?B?c3JrYm5BNkp4STlhUUdHMlJRbmFsRkNMMzNpVjQ0SEM4cTNUUnhDZHhXQWRt?=
 =?utf-8?B?ODg2TVdqdHpwUDhiR2xwRnNwMUtkdkZKTzZIbmJsb054N0VIbnpFRks0eWxQ?=
 =?utf-8?B?cWwwM2FIMktBcFVaTFhMWm4zM1gzYUVvOTFzK1Y5U1F4OEhKamhMRXR5SFZZ?=
 =?utf-8?B?K2t4R0RRL2ltOVl4dGRvUHhJc3pjTWJlaHZ5TTBQMGpqWG80OXpnOFNPN3ZD?=
 =?utf-8?B?M0ZFcEdPblR4Z0lCVStZK0RWWllOREQ2bUdNY01oNVl3SStWMGhVZFBvWm9C?=
 =?utf-8?B?b2NIcGVjLzQwZ2JQaDFVRTAyYUZTUGhJOFJza0xlU0xKYjQzU2M1cEJFOE1L?=
 =?utf-8?B?NHRjV0FMUURtVzVGYzlxZXpyblNvUXh0T1Z2NE84TjlodlpwTEV5ais2VC9a?=
 =?utf-8?B?SFpKVG02UDNlWEo3T3dlQjRvd2M4NUUrdDdKTm5DOVZQM09uTmV6dDBDS0pl?=
 =?utf-8?B?UjZqYWZVZzZHWUhIZEk5cVJlZFd2V29CUmJOL2UxMkRybDdUWThndFRseXJw?=
 =?utf-8?B?UmhUdDFFMEtvZit6SFAzajRtQ3dhTncyRHI3Q1Qwa0hzWGRyV2VSNTVjcEUy?=
 =?utf-8?B?QnltaE9NWjh0MU1BRVMrNVJaaE5ZMzdtVkFDRkVrUWJMK2dIMWJWaGNzdk11?=
 =?utf-8?B?cmFidTl2bVFqYmpYMkhTelpvK0xhdVN1ZytYUmFPUXQrc1p4dzdtN3Q2dGgw?=
 =?utf-8?B?RnR6bzcwOEErZzd5SnlaNmVycDAxaVlhL1c0cDJ3TmdzUzVGUzVldmtVY1NI?=
 =?utf-8?B?ei94L200TG9MYWduWU5NbC9VYVB1VDgrWGhGUmVKWnE5cC9PWkFGbk5ydTMy?=
 =?utf-8?B?RU4ybjVGWlRnTWhESkpvSlNRa3BxdUVmTEdEemFySlpBZmNKR2hSejdVWHlB?=
 =?utf-8?B?UWZPK2ljMmdxMGFQQ3plRFRqL080RnRzMWdCb1ZsZFpxdlZ5Y1pMaXk2eFZK?=
 =?utf-8?B?NC9yZWNWdkNOUllkSEU1WjFhMVdnVWpSUjk4ZWt0TzBrWHZ6c0d3Y25keXIv?=
 =?utf-8?B?cml4QW05bE1USVdTM3VBUVFRTGpQbzV0cVVwQnpic1o4ZXEwUXZyYkdOME80?=
 =?utf-8?B?N1QxR3hBNXpETXBjeUM2ZGNQa1h6T3RqWXZ2UzhjV0Z1a05KclVJMUtEQXVE?=
 =?utf-8?B?dHRGN1NoY1lUOVJ0TXJOSEtZWkhIdW1MRGpGU25TeTd2Nzk2Qmw3SHNZOGRJ?=
 =?utf-8?B?aW9uUFQ3MG4yUG1adHBzQzlJOEFkZERpT0ZXWFQxaElsOXF5UUFiYmdIWXFG?=
 =?utf-8?B?Ujg5WU9MZkVFL0xiTmo2VWtkV25nVnBRK05BTVdRZFJaeTY4K0xtSk5vZjJN?=
 =?utf-8?B?TnpkY1RXbmxpNjRNZVEydG5DcWpFRTBZVWlRNnIvOUp3NjZkeDlWaWFKT3dC?=
 =?utf-8?B?OGpweEpqb3pneStnYXhDZExXQVRPN29yRUp5Ri9vaDFHMFAzNGdYRTFhZWsy?=
 =?utf-8?Q?1LubvP9744oyuX88d5s/iYy8x9SGTYUnQvUORex?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4719.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049c3905-09b2-45e4-c5bd-08d8eaeed08e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 15:51:09.3749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 65fu2f1+SwtYsPe7rxo84G34OsEV96gEQTREVaGprP8QMRJGpnmDfS1/SyCo+vLoUxdjeAQ6ox927ZKlesxXQTj8X8On/idqP8ePaejoqDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6141
X-Original-Sender: anda-alexandra.dorneanu@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=OELaVkV0;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 anda-alexandra.dorneanu@nxp.com designates 40.107.13.53 as permitted sender)
 smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=nxp.com
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

>-----Original Message-----
>From: Jan Kiszka <jan.kiszka@siemens.com> 
>Sent: Friday, March 19, 2021 9:39 AM
>To: Anda-alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>; jailhouse-dev@googlegroups.com
>Subject: [EXT] Re: [PATCH 1/2] configs: arm64: Add support for NXP LS1028ARDB platform
>
>Caution: EXT Email
>
>On 09.03.21 17:17, Anda-Alexandra Dorneanu wrote:
>> Add root cell, inmate cell and Linux demo cell configuration files for 
>> NXP LS1028ARDB platform.
>>
>
>Thanks for enabling another platform!
>
>The config checker found one issue (likely minor):
>
>$ jailhouse config check configs/arm64/ls1028a-rdb.cell \
>    configs/arm64/ls1028a-rdb-linux-demo.cell \
>    configs/arm64/ls1028a-rdb-inmate-demo.cell
>Reading configuration set:
>  Root cell:     ls1028a (configs/arm64/ls1028a-rdb.cell)
>  Non-root cell: linux-inmate-demo
>(configs/arm64/ls1028a-rdb-linux-demo.cell)
>  Non-root cell: inmate-demo (configs/arm64/ls1028a-rdb-inmate-demo.cell)
>Overlapping memory regions inside cell:
>
>In cell 'ls1028a', region 8
>  phys_start: 0x0000000080000000
>  virt_start: 0x0000000080000000
>  size:       0x0000000040000000
>  flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>JAILHOUSE_MEM_EXECUTE
>physically and virtually overlaps with region 11
>  phys_start: 0x00000000bf900000
>  virt_start: 0x00000000bf900000
>  size:       0x0000000000100000
>  flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>JAILHOUSE_MEM_EXECUTE
>
>Overlapping memory regions with hypervisor: None Missing PCI MMCONFIG interceptions: None Missing resource interceptions for architecture x86: None
>
>> Signed-off-by: Anda-Alexandra Dorneanu 
>> <anda-alexandra.dorneanu@nxp.com>
>> ---
>>  configs/arm64/ls1028a-rdb-inmate-demo.c | 132 +++++  
>> configs/arm64/ls1028a-rdb-linux-demo.c  | 152 ++++++
>>  configs/arm64/ls1028a-rdb.c             | 617 ++++++++++++++++++++++++
>>  3 files changed, 901 insertions(+)
>>  create mode 100644 configs/arm64/ls1028a-rdb-inmate-demo.c
>>  create mode 100644 configs/arm64/ls1028a-rdb-linux-demo.c
>>  create mode 100644 configs/arm64/ls1028a-rdb.c
>>
>> diff --git a/configs/arm64/ls1028a-rdb-inmate-demo.c 
>> b/configs/arm64/ls1028a-rdb-inmate-demo.c
>> new file mode 100644
>> index 00000000..9646975d
>> --- /dev/null
>> +++ b/configs/arm64/ls1028a-rdb-inmate-demo.c
>> @@ -0,0 +1,132 @@
>> +/*
>> + * Configuration for LS1028ARDB board - inmate demo
>> + *
>> + * Copyright NXP 2021
>> + *
>> + * Authors:
>> + *  Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  
>> +See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <jailhouse/types.h>
>> +#include <jailhouse/cell-config.h>
>> +
>> +struct {
>> +     struct jailhouse_cell_desc cell;
>> +     __u64 cpus[1];
>> +     struct jailhouse_memory mem_regions[7];
>> +     struct jailhouse_irqchip irqchips[2];
>> +     struct jailhouse_pci_device pci_devices[1]; } 
>> +__attribute__((packed)) config = {
>> +     .cell = {
>> +             .signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>> +             .revision = JAILHOUSE_CONFIG_REVISION,
>> +             .name = "inmate-demo",
>> +             .flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
>> +
>> +             .cpu_set_size = sizeof(config.cpus),
>> +             .num_memory_regions = ARRAY_SIZE(config.mem_regions),
>> +             .num_irqchips = ARRAY_SIZE(config.irqchips),
>> +             .num_pci_devices = ARRAY_SIZE(config.pci_devices),
>> +             .vpci_irq_base = 40 - 32,
>> +
>> +             .console = {
>> +                     .address = 0x21c0600,
>> +                     .divider = 0x6d,
>> +                     .type = JAILHOUSE_CON_TYPE_8250,
>> +                     .flags = JAILHOUSE_CON_ACCESS_MMIO |
>> +                             JAILHOUSE_CON_REGDIST_1,
>> +             },
>> +     },
>> +
>> +     .cpus = {
>> +             0x2,
>> +     },
>> +
>> +     .mem_regions = {
>> +             /* IVSHMEM shared memory region for 00:00.0 */ {
>> +                     .phys_start = 0xfb700000,
>> +                     .virt_start = 0xfb700000,
>> +                     .size = 0x1000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> +             },
>> +             {
>> +                     .phys_start = 0xfb701000,
>> +                     .virt_start = 0xfb701000,
>> +                     .size = 0x9000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_ROOTSHARED,
>> +             },
>> +             {
>> +                     .phys_start = 0xfb70a000,
>> +                     .virt_start = 0xfb70a000,
>> +                     .size = 0x2000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> +             },
>> +             {
>> +                     .phys_start = 0xfb70c000,
>> +                     .virt_start = 0xfb70c000,
>> +                     .size = 0x2000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_ROOTSHARED,
>> +             },
>> +             /* DUART1 */ {
>> +                     .phys_start = 0x21c0000,
>> +                     .virt_start = 0x21c0000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>> +             },
>> +             /* RAM */ {
>> +                     .phys_start = 0xc0000000,
>> +                     .virt_start = 0,
>> +                     .size = 0x00010000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>> +             },
>> +             /* communication region */ {
>> +                     .virt_start = 0x80000000,
>> +                     .size = 0x00001000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_COMM_REGION,
>> +             },
>> +     },
>> +
>> +     .irqchips = {
>> +             /* GIC */ {
>> +                     .address = 0x6000000,
>> +                     .pin_base = 32,
>> +                     .pin_bitmap = {
>> +                             1 << (40 - 32),
>> +                             0,
>> +                             0,
>> +                             0,
>> +                     },
>> +             },
>> +             /* GIC */ {
>> +                     .address = 0x6000000,
>> +                     .pin_base = 160,
>> +                     .pin_bitmap = {
>> +                             0,
>> +                             0,
>> +                             0,
>> +                             0,
>> +                     },
>> +             },
>
>Why listing this (second) entry when it is empty? Same for the Linux inmate.
>
>> +     },
>> +
>> +     .pci_devices = {
>> +             { /* IVSHMEM 00:00.0 */
>> +                     .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> +                     .domain = 0,
>> +                     .bdf = 0 << 3,
>> +                     .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>> +                     .shmem_regions_start = 0,
>> +                     .shmem_dev_id = 1,
>> +                     .shmem_peers = 1,
>> +                     .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>> +             },
>> +     },
>> +};
>> diff --git a/configs/arm64/ls1028a-rdb-linux-demo.c 
>> b/configs/arm64/ls1028a-rdb-linux-demo.c
>> new file mode 100644
>> index 00000000..fff8599f
>> --- /dev/null
>> +++ b/configs/arm64/ls1028a-rdb-linux-demo.c
>> @@ -0,0 +1,152 @@
>> +/*
>> + * Configuration for LS1028ARDB board - linux demo
>> + *
>> + * Copyright 2021 NXP
>> + *
>> + * Authors:
>> + *  Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  
>> +See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <jailhouse/types.h>
>> +#include <jailhouse/cell-config.h>
>> +
>> +struct {
>> +     struct jailhouse_cell_desc cell;
>> +     __u64 cpus[1];
>> +     struct jailhouse_memory mem_regions[13];
>> +     struct jailhouse_irqchip irqchips[2];
>> +     struct jailhouse_pci_device pci_devices[2]; } 
>> +__attribute__((packed)) config = {
>> +     .cell = {
>> +             .signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>> +             .revision = JAILHOUSE_CONFIG_REVISION,
>> +             .name = "linux-inmate-demo",
>> +             .flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
>> +
>> +             .cpu_set_size = sizeof(config.cpus),
>> +             .num_memory_regions = ARRAY_SIZE(config.mem_regions),
>> +             .num_irqchips = ARRAY_SIZE(config.irqchips),
>> +             .num_pci_devices = ARRAY_SIZE(config.pci_devices),
>> +             .vpci_irq_base = 40 - 32,
>> +     },
>> +
>> +     .cpus = {
>> +             0x2,
>> +     },
>> +
>> +     .mem_regions = {
>> +             /* IVSHMEM shared memory region for 00:00.0 */ {
>> +                     .phys_start = 0xfb700000,
>> +                     .virt_start = 0xfb700000,
>> +                     .size = 0x1000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> +             },
>> +             {
>> +                     .phys_start = 0xfb701000,
>> +                     .virt_start = 0xfb701000,
>> +                     .size = 0x9000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_ROOTSHARED,
>> +             },
>> +             {
>> +                     .phys_start = 0xfb70a000,
>> +                     .virt_start = 0xfb70a000,
>> +                     .size = 0x2000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> +             },
>> +             {
>> +                     .phys_start = 0xfb70c000,
>> +                     .virt_start = 0xfb70c000,
>> +                     .size = 0x2000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_ROOTSHARED,
>> +             },
>> +             /* IVSHMEM shared memory regions for 00:01.0 */
>> +             JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 1),
>> +             /* DUART1 */ {
>> +                     .phys_start = 0x21c0000,
>> +                     .virt_start = 0x21c0000,
>> +                     .size = 0x1000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>> +             },
>> +             /* clockgen */ {
>> +                        .phys_start = 0x01300000,
>> +                        .virt_start = 0x01300000,
>> +                        .size = 0xa0000,
>> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>> +                },
>> +             /* RAM */ {
>> +                     .phys_start = 0xbf900000,
>> +                     .virt_start = 0,
>> +                     .size = 0x00010000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>> +             },
>> +             /* RAM */ {
>> +                     .phys_start = 0xc0000000,
>> +                     .virt_start = 0xc0000000,
>> +                     .size = 0x3b500000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>> +                             JAILHOUSE_MEM_LOADABLE,
>> +             },
>> +             /* communication region */ {
>> +                     .virt_start = 0x80000000,
>> +                     .size = 0x00001000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_COMM_REGION,
>> +             },
>> +     },
>> +
>> +     .irqchips = {
>> +             /* GIC */ {
>> +                     .address = 0x6000000,
>> +                     .pin_base = 32,
>> +                     .pin_bitmap = {
>> +                             1 << (40 - 32) | 1 << (41 - 32) |
>> +                             1 << (42 - 32) | 1 << (43 - 32),
>> +                             0,
>> +                             0,
>> +                             0,
>> +                     },
>> +             },
>> +             /* GIC */ {
>> +                     .address = 0x6000000,
>> +                     .pin_base = 160,
>> +                     .pin_bitmap = {
>> +                             0,
>> +                             0,
>> +                             0,
>> +                             0,
>> +                     },
>> +             },
>> +     },
>> +
>> +     .pci_devices = {
>> +             { /* IVSHMEM 00:00.0 */
>> +                     .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> +                     .domain = 0,
>> +                     .bdf = 0 << 3,
>> +                     .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>> +                     .shmem_regions_start = 0,
>> +                     .shmem_dev_id = 1,
>> +                     .shmem_peers = 2,
>> +                     .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>> +             },
>> +             { /* IVSHMEM 00:01.0 */
>> +                     .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> +                     .domain = 0,
>> +                     .bdf = 1 << 3,
>> +                     .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>> +                     .shmem_regions_start = 4,
>> +                     .shmem_dev_id = 1,
>> +                     .shmem_peers = 2,
>> +                     .shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>> +             },
>> +     },
>> +};
>> diff --git a/configs/arm64/ls1028a-rdb.c b/configs/arm64/ls1028a-rdb.c 
>> new file mode 100644 index 00000000..f61a1615
>> --- /dev/null
>> +++ b/configs/arm64/ls1028a-rdb.c
>> @@ -0,0 +1,617 @@
>> +/*
>> + * Configuration for LS1028ARDB board
>> + *
>> + * Copyright 2021 NXP
>> + *
>> + * Authors:
>> + *  Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  
>> +See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <jailhouse/types.h>
>> +#include <jailhouse/cell-config.h>
>> +
>> +struct {
>> +     struct jailhouse_system header;
>> +     __u64 cpus[1];
>> +     struct jailhouse_memory mem_regions[77];
>> +     struct jailhouse_irqchip irqchips[2];
>> +     struct jailhouse_pci_device pci_devices[2]; } 
>> +__attribute__((packed)) config = {
>> +     .header = {
>> +             .signature = JAILHOUSE_SYSTEM_SIGNATURE,
>> +             .revision = JAILHOUSE_CONFIG_REVISION,
>> +             .flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>> +             .hypervisor_memory = {
>> +                     .phys_start = 0xfba00000,
>> +                     .size =       0x00400000,
>> +             },
>> +             .debug_console = {
>> +                     .address = 0x21c0500,
>> +                     .size = 0x100,
>> +                     .type = JAILHOUSE_CON_TYPE_8250,
>> +                     .flags = JAILHOUSE_CON_ACCESS_MMIO |
>> +                              JAILHOUSE_CON_REGDIST_1,
>> +             },
>> +             .platform_info = {
>> +                     .pci_mmconfig_base = 0xfb500000,
>> +                     .pci_mmconfig_end_bus = 0,
>> +                     .pci_is_virtual = 1,
>> +                     .pci_domain = -1,
>> +
>> +                     .arm = {
>> +                             .gic_version = 3,
>> +                             .gicd_base = 0x6000000,
>> +                             .gicr_base = 0x6040000,
>> +                             .maintenance_irq = 25,
>> +                     },
>> +             },
>> +             .root_cell = {
>> +                     .name = "ls1028a",
>> +                     .num_pci_devices = ARRAY_SIZE(config.pci_devices),
>> +                     .cpu_set_size = sizeof(config.cpus),
>> +                     .num_memory_regions = ARRAY_SIZE(config.mem_regions),
>> +                     .num_irqchips = ARRAY_SIZE(config.irqchips),
>> +                     .vpci_irq_base = 50 - 32,
>> +             },
>> +     },
>> +
>> +     .cpus = {
>> +             0x3,
>> +     },
>> +
>> +     .mem_regions = {
>> +             /* IVSHMEM shared memory region for 00:00.0 */ {
>> +                     .phys_start = 0xfb700000,
>> +                     .virt_start = 0xfb700000,
>> +                     .size = 0x1000,
>> +                     .flags = JAILHOUSE_MEM_READ,
>> +             },
>> +             {
>> +                     .phys_start = 0xfb701000,
>> +                     .virt_start = 0xfb701000,
>> +                     .size = 0x9000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> +             },
>> +             {
>> +                     .phys_start = 0xfb70a000,
>> +                     .virt_start = 0xfb70a000,
>> +                     .size = 0x2000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> +             },
>> +             {
>> +                     .phys_start = 0xfb70c000,
>> +                     .virt_start = 0xfb70c000,
>> +                     .size = 0x2000,
>> +                     .flags = JAILHOUSE_MEM_READ,
>> +             },
>> +             /* IVSHMEM shared memory regions for 00:01.0 */
>> +             JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 0),
>> +             /* RAM - 1GB - root cell */ {
>> +                     .phys_start = 0x80000000,
>> +                     .virt_start = 0x80000000,
>> +                     .size = 0x40000000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_EXECUTE,
>> +             },
>> +             /* DRAM2 6GB */ {
>> +                     .phys_start = 0x2080000000,
>> +                     .virt_start = 0x2080000000,
>> +                     .size = 0x80000000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_EXECUTE,
>> +             },
>> +             /* RAM - ~1GB - inmate */ {
>> +                     .phys_start = 0xc0000000,
>> +                     .virt_start = 0xc0000000,
>> +                     .size = 0x3b500000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_EXECUTE,
>> +             },
>> +             /* RAM: loader */ {
>> +                     .phys_start = 0xbf900000,
>> +                     .virt_start = 0xbf900000,
>> +                     .size = 0x00100000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_EXECUTE,
>> +             },
>> +             /* DDR memory controller */ {
>> +                     .phys_start = 0x01080000,
>> +                     .virt_start = 0x01080000,
>> +                     .size = 0x1000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* dcfg */ {
>> +                     .phys_start = 0x01e00000,
>> +                     .virt_start = 0x01e00000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* rst */ {
>> +                     .phys_start = 0x01e60000,
>> +                     .virt_start = 0x01e60000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* scfg */ {
>> +                     .phys_start = 0x01fc0000,
>> +                     .virt_start = 0x01fc0000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* clockgen */ {
>> +                     .phys_start = 0x01300000,
>> +                     .virt_start = 0x01300000,
>> +                     .size = 0xa0000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* i2c0 */ {
>> +                     .phys_start = 0x02000000,
>> +                     .virt_start = 0x02000000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* i2c1 */ {
>> +                     .phys_start = 0x02010000,
>> +                     .virt_start = 0x02010000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +                /* i2c2 */ {
>> +                        .phys_start = 0x02020000,
>> +                        .virt_start = 0x02020000,
>> +                        .size = 0x10000,
>> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                                JAILHOUSE_MEM_IO,
>> +                },
>> +             /* i2c3 */ {
>> +                     .phys_start = 0x02030000,
>> +                     .virt_start = 0x02030000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* i2c4 */ {
>> +                     .phys_start = 0x02040000,
>> +                     .virt_start = 0x02040000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* i2c5 */ {
>> +                     .phys_start = 0x02050000,
>> +                     .virt_start = 0x02050000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* i2c6 */ {
>> +                     .phys_start = 0x02060000,
>> +                     .virt_start = 0x02060000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* i2c7 */ {
>> +                     .phys_start = 0x02070000,
>> +                     .virt_start = 0x02070000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* fspi */ {
>> +                     .phys_start = 0x020c0000,
>> +                     .virt_start = 0x020c0000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +                /* dspi0 */ {
>> +                        .phys_start = 0x02100000,
>> +                        .virt_start = 0x02100000,
>> +                        .size = 0x10000,
>> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                                JAILHOUSE_MEM_IO,
>> +                },
>> +             /* dspi1 */ {
>> +                     .phys_start = 0x02110000,
>> +                     .virt_start = 0x02110000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* dspi2 */ {
>> +                     .phys_start = 0x02120000,
>> +                     .virt_start = 0x02120000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* esdhc */ {
>> +                     .phys_start = 0x02140000,
>> +                     .virt_start = 0x02140000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* esdhc1 */ {
>> +                     .phys_start = 0x02150000,
>> +                     .virt_start = 0x02150000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* can0 */ {
>> +                     .phys_start = 0x02180000,
>> +                     .virt_start = 0x02180000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* can1 */ {
>> +                     .phys_start = 0x02190000,
>> +                     .virt_start = 0x02190000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* duart0 */ {
>> +                     .phys_start = 0x021c0000,
>> +                     .virt_start = 0x021c0000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* lpuart0 */ {
>> +                     .phys_start = 0x02260000,
>> +                     .virt_start = 0x02260000,
>> +                     .size = 0x1000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* lpuart1 */ {
>> +                     .phys_start = 0x02270000,
>> +                     .virt_start = 0x02270000,
>> +                     .size = 0x1000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* lpuart2 */ {
>> +                     .phys_start = 0x02280000,
>> +                     .virt_start = 0x02280000,
>> +                     .size = 0x1000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* lpuart3 */ {
>> +                     .phys_start = 0x02290000,
>> +                     .virt_start = 0x02290000,
>> +                     .size = 0x1000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* lpuart4 */ {
>> +                     .phys_start = 0x022a0000,
>> +                     .virt_start = 0x022a0000,
>> +                     .size = 0x1000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* lpuart5 */ {
>> +                     .phys_start = 0x022b0000,
>> +                     .virt_start = 0x022b0000,
>> +                     .size = 0x1000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* edma0 */ {
>> +                     .phys_start = 0x022c0000,
>> +                     .virt_start = 0x022c0000,
>> +                     .size = 0x30000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* gpio1 */ {
>> +                     .phys_start = 0x02300000,
>> +                     .virt_start = 0x02300000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* gpio2 */ {
>> +                     .phys_start = 0x02310000,
>> +                     .virt_start = 0x02310000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* gpio3 */ {
>> +                     .phys_start = 0x02320000,
>> +                     .virt_start = 0x02320000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* usb0 */ {
>> +                     .phys_start = 0x03100000,
>> +                     .virt_start = 0x03100000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* usb1 */ {
>> +                     .phys_start = 0x03110000,
>> +                     .virt_start = 0x03110000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* sata */ {
>> +                     .phys_start = 0x03200000,
>> +                     .virt_start = 0x03200000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* pcie1 */ {
>> +                     .phys_start = 0x03400000,
>> +                     .virt_start = 0x03400000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* pcie2 */ {
>> +                     .phys_start = 0x03500000,
>> +                     .virt_start = 0x03500000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* pcie2 pf0 */ {
>> +                     .phys_start = 0x035c0000,
>> +                     .virt_start = 0x035c0000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* pcie1 host bridge */ {
>> +                     .phys_start = 0x8000000000,
>> +                     .virt_start = 0x8000000000,
>> +                     .size = 0x800000000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* pcie2 host bridge */ {
>> +                     .phys_start = 0x8800000000,
>> +                     .virt_start = 0x8800000000,
>> +                     .size = 0x800000000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* gic its */ {
>> +                     .phys_start = 0x06020000,
>> +                     .virt_start = 0x06020000,
>> +                     .size = 0x20000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* crypto */ {
>> +                     .phys_start = 0x08000000,
>> +                     .virt_start = 0x08000000,
>> +                     .size = 0x100000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* wdog0 */ {
>> +                     .phys_start = 0x0c000000,
>> +                     .virt_start = 0x0c000000,
>> +                     .size = 0x1000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* wdog1 */ {
>> +                     .phys_start = 0x0c010000,
>> +                     .virt_start = 0x0c010000,
>> +                     .size = 0x1000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* gpu */ {
>> +                     .phys_start = 0x0f0c0000,
>> +                     .virt_start = 0x0f0c0000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* sai1 */ {
>> +                     .phys_start = 0x0f100000,
>> +                     .virt_start = 0x0f100000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* sai2 */ {
>> +                     .phys_start = 0x0f110000,
>> +                     .virt_start = 0x0f110000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* sai3 */ {
>> +                     .phys_start = 0x0f120000,
>> +                     .virt_start = 0x0f120000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* sai4 */ {
>> +                     .phys_start = 0x0f130000,
>> +                     .virt_start = 0x0f130000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* sai5 */ {
>> +                     .phys_start = 0x0f140000,
>> +                     .virt_start = 0x0f140000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* sai6 */ {
>> +                     .phys_start = 0x0f150000,
>> +                     .virt_start = 0x0f150000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* tmu */ {
>> +                     .phys_start = 0x01f80000,
>> +                     .virt_start = 0x01f80000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* pcie  */ {
>> +                     .phys_start = 0x1f0000000,
>> +                     .virt_start = 0x1f0000000,
>> +                     .size = 0x10000000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* pwm0 */ {
>> +                     .phys_start = 0x02800000,
>> +                     .virt_start = 0x02800000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* pwm1 */ {
>> +                     .phys_start = 0x02810000,
>> +                     .virt_start = 0x02810000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* pwm2 */ {
>> +                     .phys_start = 0x02820000,
>> +                     .virt_start = 0x02820000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* pwm3 */ {
>> +                     .phys_start = 0x02830000,
>> +                     .virt_start = 0x02830000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* pwm4 */ {
>> +                     .phys_start = 0x02840000,
>> +                     .virt_start = 0x02840000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* pwm5 */ {
>> +                     .phys_start = 0x02850000,
>> +                     .virt_start = 0x02850000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* pwm6 */ {
>> +                     .phys_start = 0x02860000,
>> +                     .virt_start = 0x02860000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* pwm7 */ {
>> +                     .phys_start = 0x02870000,
>> +                     .virt_start = 0x02870000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* rcpm */ {
>> +                     .phys_start = 0x01e30000,
>> +                     .virt_start = 0x01e30000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* dpclk */ {
>> +                     .phys_start = 0x0f1f0000,
>> +                     .virt_start = 0x0f1f0000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* malidp */ {
>> +                     .phys_start = 0x0f080000,
>> +                     .virt_start = 0x0f080000,
>> +                     .size = 0x10000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +             /* hdptx0 */ {
>> +                     .phys_start = 0x0f200000,
>> +                     .virt_start = 0x0f200000,
>> +                     .size = 0x100000,
>> +                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +                             JAILHOUSE_MEM_IO,
>> +             },
>> +     },
>> +
>> +     .irqchips = {
>> +             /* GIC */ {
>> +                     .address = 0x6000000,
>> +                     .pin_base = 32,
>> +                     .pin_bitmap = {
>> +                             0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
>> +                     },
>> +             },
>> +             /* GIC */ {
>> +                     .address = 0x6000000,
>> +                     .pin_base = 160,
>> +                     .pin_bitmap = {
>> +                             0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
>> +                     },
>> +             },
>> +     },
>> +
>> +     .pci_devices = {
>> +             { /* IVSHMEM 00:00.0 */
>> +                     .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> +                     .domain = 0,
>> +                     .bdf = 0 << 3,
>> +                     .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>> +                     .shmem_regions_start = 0,
>> +                     .shmem_dev_id = 0,
>> +                     .shmem_peers = 2,
>> +                     .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>> +             },
>> +             { /* IVSHMEM 00:01.0 */
>> +                     .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> +                     .domain = 0,
>> +                     .bdf = 1 << 3,
>> +                     .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>> +                     .shmem_regions_start = 4,
>> +                     .shmem_dev_id = 0,
>> +                     .shmem_peers = 2,
>> +                     .shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>> +             },
>> +     },
>> +};
>> +
>>
>
>Rest appears fine.
>
>Jan
>
>--
>Siemens AG, T RDA IOT
>Corporate Competence Center Embedded Linux
>

Thank you for the feedback! I will address the comments and send a v2.

Regards,
Anda Dorneanu

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/VI1PR04MB471982F727E168816391C523BA689%40VI1PR04MB4719.eurprd04.prod.outlook.com.

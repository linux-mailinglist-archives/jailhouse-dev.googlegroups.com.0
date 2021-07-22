Return-Path: <jailhouse-dev+bncBCWKP54GYYIRBOWT4SDQMGQESYS4SMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB553D1FC2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Jul 2021 10:18:03 +0200 (CEST)
Received: by mail-qk1-x73a.google.com with SMTP id h12-20020a05620a400cb02903b8e915cccesf3540061qko.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Jul 2021 01:18:03 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1626941882; cv=pass;
        d=google.com; s=arc-20160816;
        b=F6kAINaNpJnmi6JXvLcGAQ2EuDgiTXH3OEL2E44njJhe2TA3QlzmVSihFx3VWKWNrQ
         tvmbSv65nbjGGevvUmLx4QQf1//xZcVEHLAsApd/GINdRI3Ksp/QarCcMGaqG/nEhSyx
         EHUoZ7/aApi+nTGY1+rLmoI0Yzy6RjNkl3gVZlh/+hGT+L9GOveH04ouKl21yeoMeaaz
         hN3TcMoUyOjSqY0DCwSvwM+iXOlv96BqhOQm1fmNP0OxqFhbfz2eHAZRY9c7OMvFS6KS
         oi4W/6kviqFQVGRvHeNkRVcBptNFx9VL3Hy2GtqldnHMU9GUYq7EE3GK47QPiz1E+fgS
         XEbw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=Xho0ZPcLQdtlHX0JP0e7CjrMXQBtHpTAssNnuLyKops=;
        b=qr8aIgA8d0yaQFNEYpLkWDyVoFWaQx9KvWB1X4PsQcEdcXeSy5sI7G5FXPpob7v7C+
         VN6BrsdCqkSPt1KwvvSp+dh0JSszKRuaTRLHuEGkGAkZ/3rIilcspWr+UJHoM6XxjgWJ
         9af5JqvgoauKlLGpQGf32j6oEkYN+/nrX/z7ZZijk17QmhI24zN7BD/9QUWTIqFxD7cT
         CwpPIviXZXbcQYqgQhBA3D+pDk+clpQCb6XCqXwUc58QnovR3OQhn94NeFrM9LmPmMUm
         oKKa1Dl/D6MeOVlAlmq7tUoeJjweSjHjv+4iHUTrOReiLIraWtu+NBGMvQ6fOCZxq3UV
         aD4w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ih3F9MxX;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.53 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Xho0ZPcLQdtlHX0JP0e7CjrMXQBtHpTAssNnuLyKops=;
        b=pkdYaWDIlWZ3xiNjH9EwXXJ1hf5pcUOGhBBjpee42loWjjPuBb565tI8joOHssIXLn
         7SERIH/Jj6S3imbT1QwdyKpRRWFseMbnbN+1K5N2W9oaWkbL1rI2GB5B9xVO3Tcal/vg
         GqGG8wHjxTLV78AYcPnQ5x1KSH4kgqmoiuAwSy4zo2VBTm/+hFg5UJRsOcV+fPR8Z2cm
         /QCGc9YsHt2SUr2VcXiSpZe8djTCUaXgOLYeXjnJVCf0JG1Sz6wK+sd25P0Y8myBVTaq
         hgDYTArimc7w0i4G+lFMfMlwAaPJ8sjXzrVDkjqFU7xC65iKcttb40aBOEPP5cP7EfRc
         u82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Xho0ZPcLQdtlHX0JP0e7CjrMXQBtHpTAssNnuLyKops=;
        b=fTkXTKmTI/Mi5qSm0kvUFxfHjzz6299OQx9z3+v+JhIgJaBZQn/0pR1dtpF5SFBvla
         kER3chzEFmG7PQg5Z0LB3F0kt5pnPHPpMBfR9I0HBVuaWptQc1zveFXjUnF9xyjTeOO5
         AuesIv9Ptq+SOw+35FGRsJkjjRs67sBaKfE3gc/etU72BT2VWashmCcx1lV1nolBQu8c
         caGuBdeTcHorsULG/OLyzlNJ6dyeVX8qU9LYDn3fWGol7E1G8mQfk06DWK2fZuOtIle6
         cC0k8o7TOe5MVgi5F3nOMVTJjBsItYqP4ehL+xGoAb/rzzjdTNZ5E8oWRJSdX/lLkR6t
         5QKA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5316DJwtenxl7i8F/AiIv3dnnJkKn60txwCOTGqg5pcxu2kLtgGz
	J91mHSPd8rmUSvV5+Z6iL6w=
X-Google-Smtp-Source: ABdhPJzc3QtUiua574DB8GYOWuZfOPCxVY7v9PoN3HfT4JmbNG4cuvzx+ToWP9zTlmuL+iDyZEuYDw==
X-Received: by 2002:a05:620a:2091:: with SMTP id e17mr39750738qka.265.1626941882568;
        Thu, 22 Jul 2021 01:18:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:4d93:: with SMTP id a19ls2640006qtw.9.gmail; Thu, 22 Jul
 2021 01:18:01 -0700 (PDT)
X-Received: by 2002:ac8:47d9:: with SMTP id d25mr34236034qtr.277.1626941881853;
        Thu, 22 Jul 2021 01:18:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626941881; cv=pass;
        d=google.com; s=arc-20160816;
        b=dJFj+CXtqfUW3LOvYc4WcTuem3Bz0BkF7Ph1SBEU1rRd/Z68HuS3kTBb8Gp8IdpqKF
         IOcBC4O1z+J0+GEkhrBd+ZZBfCEo8DvjXrk8gF3fWcNy67NcAzawLFSn6SNI4BN43FTU
         ewN7gXLN46Qja41DIHvAVW2RaeW9/jCobu2gw9IliGlgZOp8mn03tR3Cde54pPsEqaRg
         yTe0qFCeI0I90idVhak5tFQKZUbJRd7Td8Wf4PYxYyGww941gs5WgeyLF0voBLABQ106
         PDlqvv3oc6TA4b+iZElx5xRgHnwl9d5u34Ay+BQ6lQTTA2YrfKHxxX/Dtr8Md5NhZqEB
         Hnsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=qMVwnIjw0JCUooSvwYrvWu/8NaDeu5k7Ovc9Kiv3wu8=;
        b=QnuPuyxbGIybOyW0lWiQzmklEihX7sTI/PGIJSR3iQ0yMYovKcMSg83ncnc6SJMf1b
         T2aMq2I5LJpISN9dD8nr3Ql62pIOSxFPJKZXZFV2sarZrpJ9yD6uMBxqbSBxs3RHjjkB
         T0t17T94xiFeqcPbUThe9SOFGTBZlGGiPE0LRofdQyYch2ItbVPUxbCqdihLwYtQXLsm
         lRhjGbjH2FhhYlIR5aofyvKA1vOuR+F2KqIssXPPzaT/+h1fvBhdnCTg8t0/7gA+Z6zp
         1lWWf4t6d2enVQbLw2ynui2Ji27rJmTACi9pA49B4iyhP/5pgQ9XYvfL7fRxmMXVWAxj
         A/yw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ih3F9MxX;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.53 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com. [40.107.22.53])
        by gmr-mx.google.com with ESMTPS id y14si464349qtm.0.2021.07.22.01.18.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Jul 2021 01:18:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.53 as permitted sender) client-ip=40.107.22.53;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AW80eWedKYrMhO3ZqFdw2rcJkrEbAg5pQmnIngZNYcIYKefIvcb8YsKQosbrOpDv9OkAo1Nr03HXZryp/x8Sngtp9JK5zLyXfePReWoWw0XIQzWgqQNBnwDXUI5HYe5ZSaxv8zsEezNfqFXd38/DiQcVNd2X4wUX7QiwuZ9YF8aylRFoUDZkJu7SE++WnuzRLGVOcth3iopB7SPTZ0Eln5tUKVo1fATELZuFhfHAQ0JR8cCTLjnofKdhsXw8yAcFEX4vhJui+j+EJobXKbh2mzXtu5km1UqWStR2QsWN7n8aRzMGa9VoMVVqOgYIKdSAHyvr+BCly4mhfmK7dZh2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMVwnIjw0JCUooSvwYrvWu/8NaDeu5k7Ovc9Kiv3wu8=;
 b=Ns0rZjvLvGx02if8TFG3T054GAsPUtl5twAdDnFPpuvlFN6SSyzCS52QcjBemcgwvqZFZo04qB1FxI57d4BPab+6oi7ldmYAWdmd8DyoaT93LZc78kOcEiYY8lofzaZLXlUQEYxA3NoFtfZ3nPj2bkjLm1/FA4TirYEKmWB5wdOLMeqoaCsltdLeEmpHt/smR9ztmRi8K+SIJSxjEnRtqeNGTqkPcGiUR/pg0o8PpLdAZjHseQWLaGdgSKex3sMiJ97OWKmua3eWDn573i4tHvVIHqmhpz2/DfcSU5r7Z6sf+xJUHwDMMmoG5naP9vLfefpTkmtu3XLiI+Yc+EMI+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5241.eurprd04.prod.outlook.com (2603:10a6:10:1d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Thu, 22 Jul
 2021 08:17:58 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 08:17:58 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Any plan for a new release?
Thread-Topic: Any plan for a new release?
Thread-Index: Add+0ar9ATWaoCM5SeWg4u/IqoOeTQ==
Date: Thu, 22 Jul 2021 08:17:58 +0000
Message-ID: <DB6PR0402MB276049CD76F399B5733B883D88E49@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 878f91d4-24f2-4af7-b0ca-08d94ce93706
x-ms-traffictypediagnostic: DB7PR04MB5241:
x-microsoft-antispam-prvs: <DB7PR04MB5241BBC08F94811886B2CFB488E49@DB7PR04MB5241.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZHeWNEh0JMLpJSslVKoW6/FhAqhXeE8A8HSrDb4euJicH6gQroxnF0kj6NZSGndtMtl+RJ8kfIZDfZ8ccBkmNT9Ad8du4pk6jtsd1WN4Vpzeqxv8cbW61LyJQuIm3rNbpMXZAUgboaoXQ3O5dwF8jnyQ501Fau5pIZZMdSCpvZJHYJ/IUF3s/jjxgsD6fxRuRXfCfo/YBMftRvPvPfqLOvOUVTMVGTucBBSERQqSwHCGQDeRXXd/bQ7h/8WcOPEg2i465mdPlWe7NHr5qrXW9WGhwwDWP25yQDVBnhANMpljs1gjzfWtV9RFeXMO8SsbqzRZg7gZVw+KcgXxO9u09WcbFZLFxDAEONlQW49OdhN1xGpmdXV8tYM4X9L7TVjOtPwle2fHBY3YSZLAIBCGQoynzyVd+jY2rOKIK/p3FgxT2cb5ZODcuhaqrSUhEMyvvBdZuFp4y+HsMf6pQOwy2ACRO2rFAIoObqav/AjyVY36BekZ5D7hJi9ewS9Nd1N2K1A5jpw4cwBVmscJr0VecwYvfW+HAzKgsjRK0Tls8vwNAQoGfqIpTe86vFRwPc4Z94Iiy0u1GYvongr3Xz2St37dDE4ZGVlH842dJmW//5mhZkCzJgEbWPW7nMtm9WCYVbtpf1dj071wi306lpElFDjxeptcX0D2ijhOQPctWNGMp2BpLi7SaE6ZGFslqibuKvywRD/GYZEhTDqLZm8+4A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(55016002)(4326008)(6916009)(8676002)(9686003)(2906002)(66946007)(64756008)(5660300002)(76116006)(66446008)(478600001)(66556008)(66476007)(6506007)(8936002)(7696005)(558084003)(122000001)(52536014)(316002)(186003)(38100700002)(33656002)(71200400001)(86362001)(44832011)(26005)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pJHwoO/ydp4bx17uu32uI8LF6AeMb5s74JB2k1JJ51QTojIJvLfJI46R59ES?=
 =?us-ascii?Q?yd8MAjgYgEz0IFSQa7YDgKwACoZDq4aUw2RCza1Hwd6Yi3usN0RcSI6S9+YP?=
 =?us-ascii?Q?2PMPMzjgF/mLEGr5zD6dFC3fsViYfDuDQJpAo76N34NIgmXEyHd6KEqNnXMm?=
 =?us-ascii?Q?/CTXY3znVwLDszKpJAMkAiBreUZvB+0Q58dhYzlX0AVcTH+yzqMwVvgpZKFh?=
 =?us-ascii?Q?vrLvggv043IorBb9pmdwlD3sE7WEKM9n1VUjFyCRDdWlRxQ1MiWSLZh+3eUD?=
 =?us-ascii?Q?BjVjTsO2JIh3ZFLAqoFnYj/syQJHqL1ECyg/zECRr4Z9lrNh0q9sNt/7+b8d?=
 =?us-ascii?Q?w1nK5sO9fBapOO7atgbw3irt8XW34jk6wnMYK5BWoOzNW6i6B8cUIR7pXTVo?=
 =?us-ascii?Q?fczri5Yb3rMiby+3/vzSc74plTrIZFi5408Oja6DkEOupdSTXfF254CL3Mb5?=
 =?us-ascii?Q?Jnd4I/U/Ob2uFIa/g5rm7lW8bCKMjZgkQlvZHS4kvxrgR9aGNA2mHqVe1sqx?=
 =?us-ascii?Q?tz9ILZNhzQCG0npo+Pnkik3lUNou7JLRyH47nDC2C/C148TVeUbaWDj3/3ji?=
 =?us-ascii?Q?tFf5qPw2fUQhdh11dtPC5za6GpVsuU0Hb0hZto5jugW7evbECi7NXdtK4Gr2?=
 =?us-ascii?Q?W7IpqpCOOcf9zi5+BL6s/dg235zBudg2C5VITNiMSQfteZ96tuWVgSG3NAio?=
 =?us-ascii?Q?Km0OTQRBRrtdY6xZu2MHNas+mm1xcFfTWmEHMS3EUy2JRV9H0EepvjCBnOLX?=
 =?us-ascii?Q?UQb9jK8udVrUVVCy309YxIQ3LvxOE6cgW/iBBAxo/thPtxYyTwBE5I6TvB67?=
 =?us-ascii?Q?SbyesyAMrI6MWHgCgLAuDUIPuJUa1Ae7Vazthro3X5vZnOIxba6nQ0wb6Cta?=
 =?us-ascii?Q?3pYpqb3J4Ryzxbb/P2A+GAmNqq6+C1bGzuZw6tW79gN+BkkYgbmwbh78M5yr?=
 =?us-ascii?Q?j1PEGs8xdb6O8A4uWWSHESheaY9H3PEW+CNEjQWpVw7uHuAeWaoobDY8VgMu?=
 =?us-ascii?Q?qihkAoFEdPhJZTwBtE0k5jDM9DP/hr/hp6UH/ESWiTeI9HM83zavGdFh3+Xx?=
 =?us-ascii?Q?Y5QvX4wWhiDmgLEcYhekhUYoGxnC81gAjlb2vHEHnTVPnqpo+NEl04+URrp1?=
 =?us-ascii?Q?T5WCeT27gMBgtm+HOub8JnWFKOsfNK7zJwo0KEwpCs42AzlGh+6450UNRXE0?=
 =?us-ascii?Q?LJKGNznICiNlp7WZe+ZCj/jZzc3qQTt3BI8yW+xgkZpiw+GAek710rEc5An/?=
 =?us-ascii?Q?ttbGZ4m22CtQUvnL7bAztMZTWIp+lviAYS0nG3U5h+W8RHm8R2TJDXdGAtxV?=
 =?us-ascii?Q?yjo793CAIL4VlLkB0stCB7IF?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 878f91d4-24f2-4af7-b0ca-08d94ce93706
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2021 08:17:58.2592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WRDReoDTbmglSIk6eqRE98f1mJwzXqF4CEkC1HHHLfbPqga90fLyMB0XW7N+RCKhDsBco333wvW08kcn9OB52A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5241
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=ih3F9MxX;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.53 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Any plan for a new release? 0.12 is released last year.
Any plan regarding virtio ivshmem? I saw you hold for a while.

Regards,
Peng.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB276049CD76F399B5733B883D88E49%40DB6PR0402MB2760.eurprd04.prod.outlook.com.

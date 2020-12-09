Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBT6TYD7AKGQE3RNBWNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 1333C2D384B
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Dec 2020 02:35:12 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id u123sf45498wmu.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Dec 2020 17:35:12 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607477711; cv=pass;
        d=google.com; s=arc-20160816;
        b=rhjuz1+8nOYrMEaN1u2KY4eTyO6K0f/335wf0GsAQ6qAMHMB3q85K5ybC1crrsxbEN
         cpQnl1oG9M261DqkvEZVzphvFF8X1Fc696ZK/XLeOrxlGgSG4k7uz8z1op4S6r3zIjVo
         XdKnb6pg+4pASL5o5KxKOHh6M09xBogb2oUSWsQHFNLRh5Mh+vXHG3LFYmN8izG0qBBp
         yfOymefrqrGj4hJieWwHHG1rt8keNMtjotD28e3gz0YuANlj/fNdrfv64/GOL3VaH/IP
         llS7LL3yD9XRQV5VJBYUp0w0Givy8LYw4+l7/PL5cVc8onh0qUczqQj9eE8+TiHrLhzY
         BWog==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=o/ZPdz9fsEh8rgdzUQotGjy4IdgxZ7XVwP8IAn7zLDo=;
        b=ymdEgmUJwfO9kBR2F3hwb8wsEE7pEuxmoGRgofaRFUmjzOpBmtEefUnLYf203dLbSu
         DlQ5tC+enz3Xg9s1VA8Mh//YshwJxTp0wftvj0FV6GRmDi4bOOR8cOe95cVXoIy9SEJv
         VNoyQ1+GKCn9x9Qk87hJPLI9W0O4FYNanM3S6ePiJ7xIJ66yfIK/FIN2Tn2W20xm6Z7/
         7E7iSrZEl84eG9hNZFmz7J/DfYZUwSqHk3ecmrYf6X+JvKLaIiyMieJJsQiae0oOmJGC
         mjGbqVCfRUa/ECU0us6EjB1EBew8MVN7iSgtQdTiuQP+urL/DY5bBu2iPmAoBPH5LYOS
         Nrbw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=cCHfVQV+;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.85 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=o/ZPdz9fsEh8rgdzUQotGjy4IdgxZ7XVwP8IAn7zLDo=;
        b=p4/wmHFpqUXucwh4nBSIDPcNZmSUksiM5w0cUelBCy/yeYlW1YVjdJnlXBpfsl0IcL
         mz+WrNSoHhTw7viMPeub4OOdf9/fIRSzq6/FI8bnWv1TcC/NBcljYn/fdgmgJlTHsaTp
         1/m1fD499ab5qRetlNuG4vj1/BVDNwQsDYoPYgZTj98XAOuoDDR4l8PrwxjMuVOjbaZg
         S0wWXI17RQiTXioCidt6GTCHC++XPqLAcAP1xBAwwDeZ3zHA3t5u2QvcP2ldxMEQid6d
         ezo3iLVUagvza5OQQKcVow9S7hrqO9ip1GQ10IZRN9ZcRKXjUsUDChSPI5N/mSlBxirv
         hzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=o/ZPdz9fsEh8rgdzUQotGjy4IdgxZ7XVwP8IAn7zLDo=;
        b=rsbMS6B27XDPp58GeTMX8fYxgIBhh3JVtoGm0Zq9+IwCRLC4ewmYWnt1g2xa8yFpCw
         DHYYHa1/VkZz3dtaj5E5YZ76wvM9O8XAjNEC8BEewBCF0Dpd/+By9ocOjHisqzV/xI4M
         at78ZRyKdGPMAryYRG96OMJ93LppIYp4eT7iiW6vZK2fHwh3mkmCS1lnbkOu/phYJJVg
         dqNq/S4jots1x1uHwEZ+m8MHnMJUt6JV85vGu5bXAZwDAjOQtBRTVpdovd1eTVBGONiy
         9DHx5mTPfTlA9XSyAvr8NqpZ69dY31D/o2p62p/lxBo/2NYs0AZ8ARZwMfsdM8YcrUM+
         TdEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533OZl7NoYQ23fTYNZ/565OpF8VlpdNVyb71ttA8BZ11Et8LUIOq
	Th+GHzj/YJYfbJ8BHkwUlww=
X-Google-Smtp-Source: ABdhPJxmOpQ1nAHpGOovfSXqNPltWOZhW2d7FPYFlxUYfs22qJDI+jLQuf+q0ijHhm+EL9qsNMBRZQ==
X-Received: by 2002:adf:b359:: with SMTP id k25mr882408wrd.98.1607477711798;
        Tue, 08 Dec 2020 17:35:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6812:: with SMTP id w18ls218901wru.1.gmail; Tue, 08 Dec
 2020 17:35:10 -0800 (PST)
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr859113wrq.189.1607477710891;
        Tue, 08 Dec 2020 17:35:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607477710; cv=pass;
        d=google.com; s=arc-20160816;
        b=LA52S1ertcZ7nmKXadJVB0Q6V0187Tp7iuUdm7iITy0f7BRioQuptzn7KXSH4aYjKt
         cybW/zH236XBkRsEM4M2DXAH441HZ0JBiea2Kfr+UWuZxGc+QWh/MvyPapwPmqTVYpVz
         VaENzx7dNDd7hVCLRBaszX/xgHXj6GsiyOAmovL39CL4BBSwap6kzm2mdH5OQ7HMgVMu
         bXszuxB/Q3tL8J052vWn61D4CTa0bO0tZySypll100O/YqFQzbDYq2mBNQ5M2JCZ2c/M
         rGW5CrD8AgPq1akxlzLwUa1Xt0jJGsQPBVvlyYvec1c4Ux71zJgC/QfA6guFwx4gpECe
         M64g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=dwNrBn7gCYLvHXumFBKlmiwfqCeD0wJbXjmIhtsQsJk=;
        b=SvfXfknasiuZq7PfVi+iSegL5asJnn4OJ30GYwb5ByKVOvSWzduS0PszA8W4NxWJM1
         V1+L1YmYyf7w5Sn6NPqZNUB9IH01Vft1vPFvIL2/Az/kayyWBFtG3HX9JJ+CqcE8UXTF
         SC3bugEF1dXvWXQ1opM5GfWCQvgSZAcBflym7+NdpOLn1O5uOIxDXOG+lAiKfFcJIFfB
         Kmp3lxWauVvY8+xrPP5PLsIDteEZOfGfo8xXXfdEvbxFI0r4d8cIBc7Oa/PTGcDtPyVf
         fcYldKTGrkBJQogiKBAHskiVx+HmXfBmK6SMsUcd3IiySOc0jYs8jUefbkdZo0z3Xlzx
         DjyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=cCHfVQV+;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.85 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70085.outbound.protection.outlook.com. [40.107.7.85])
        by gmr-mx.google.com with ESMTPS id r21si8229wra.4.2020.12.08.17.35.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Dec 2020 17:35:10 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.85 as permitted sender) client-ip=40.107.7.85;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgDtGrarBtJdtbuONnE/b457LS0u30aFWE/fHRFfQYtyRemOMvBOKmoasW9sTmxEvZvmwWzw8KQd5oO6iJCMAbjNzg4g9BgiXn3tqRVOCba7AkK2kaOjGw3TV1CuNiKStwNNCfBTbCk2kwEgySrz7biKRoKsCMqghpuQtsIF+jzmN5oi+y1EmwK2FwKeurUrgHFExdqL8AeaC2jNIr0tUJ8yDGf5xZFiXmueNumAwNDzMV3Wn4ZLpgcN4RhHMDmf59jL6Et7G6Uag+QnKWZlbw2ssPFbC5uB/pMNb+gtmcZEBjoezgVLVWlnAssMAH6ugsAbTsxWFNUeA8BvGH+xYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwNrBn7gCYLvHXumFBKlmiwfqCeD0wJbXjmIhtsQsJk=;
 b=KEp0/Q+QLm5uRG3JxeFla+A081IDc37P7jh2W8RMCLWbW/0tT367rs0VqWGHW2Gyscvws2Ml8GnzxKligBgsyc4nGxcvAwznCxlL40LVkbWzx2KuuBQFxa6ykmQF9vA7oXNtpIBcUUh6Klo8pV9mtQd3dp1QiCHmq0XOb5ZpuopnjB7AblUqC51z0JzugsX0MGD54ui+G+aIPtvDkSA756NeqbZa1qRF9hWInZ4Uy6++Cal1T94Y5e36LCcvcuM3QDKAtDLDE5CXRcorc0ETBs6bF047WKVsT3zkeCTP3jQJqoWfLF4b90vuVF2AtitRWk0m+72/7ThFT1pWNyFT0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB5658.eurprd04.prod.outlook.com (2603:10a6:10:b2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.22; Wed, 9 Dec
 2020 01:35:09 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.024; Wed, 9 Dec 2020
 01:35:09 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: ARM64 MSIX enabling error
Thread-Topic: ARM64 MSIX enabling error
Thread-Index: AdbMbLjE+IGjwJH3TguDfS43O45UGQADqiQAACSJ9gAABUGw0AAEHfCAAAEwDFAAApGHAAAAH6zwAAH0v4AAIB0HwA==
Date: Wed, 9 Dec 2020 01:35:09 +0000
Message-ID: <DB6PR0402MB27604611BF7DE87E43799E3A88CC0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760E09A5E40B4818663E07D88CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <3bbd059e-632b-da36-1f79-de1731e1352e@siemens.com>
 <DB6PR0402MB2760AF37C2A42481C80249E788CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760C14BDE7BECED2A60906488CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <543a61e2-e521-5c89-0d96-9f06946f0aae@siemens.com>
 <DB6PR0402MB27605393AB95974CE4D8944E88CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <35de9824-dc88-dd3a-175f-6db6c086d2a6@siemens.com>
 <DB6PR0402MB2760F7FE11280F9619178C5888CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <5043bde5-fe69-398a-a0c6-9957459f2b57@siemens.com>
In-Reply-To: <5043bde5-fe69-398a-a0c6-9957459f2b57@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2380cadf-4bdd-40da-9c3f-08d89be2aa7f
x-ms-traffictypediagnostic: DB8PR04MB5658:
x-microsoft-antispam-prvs: <DB8PR04MB56584826E1A7517532D664D288CC0@DB8PR04MB5658.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 511K6JOmLjUQmiN5qF1FwR9wOYC6tWJ1o5NnYCCT7y4Gy1YKXavqKCjcf/aoHe9cysmACi6LLnKj+Mcf/xRlD7JL9VYjNIyfqVEhS3zGD2XrRHVG5kvxfdDqTfJ0vvysNkzNdnZaZ9xw1RcqhhvGCAVhpS+sfq6VPSCI3HdqIJHNDYP8eCiym1+KdV2xXHr/fbOPRZ5Nmty2qH6m7amc3O2PW1Efm1Bo/JeuN6iPsYgHgIwrDssfHg3+FYbSdJTROuoWzEP8UKIGCHe4+HgTiZ0d0tKncqyTfl87BsnG7UI2kvajjAphiLrzQT3HDUjaCgBrzgX1iwCVw+ChkDb4wg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(376002)(2906002)(66446008)(508600001)(5660300002)(44832011)(55016002)(64756008)(6506007)(76116006)(52536014)(7696005)(53546011)(26005)(9686003)(86362001)(66556008)(110136005)(186003)(33656002)(66946007)(71200400001)(8676002)(66476007)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NXA4a3pGM3BaUGxremtsUGJQNWJkKzhObXBJSVRPK1p4MjVxTXRzQUh4YWRi?=
 =?utf-8?B?cjFhcHplOC80TmRzaDFFM1k5SEtYYlNhbG9zMzV2V05yQzZodEU1RFlBN3Nh?=
 =?utf-8?B?RitHU29JdEVTMU9tRkNad1FsTFVBZjViS29MSkkzektwclBZbFZwbFY1RFhV?=
 =?utf-8?B?T05DbGlEZk84ZThPZVlTeHVJNmgzekIraXlhdW1vYUVHUU1KWmM3Z3hLN0sv?=
 =?utf-8?B?bTRsc2h0N0xhMTY1TVVmbm45VCttdjMyQUl5bnRJdDhLRjQxVXR6QS9NOHZK?=
 =?utf-8?B?cng1MFgvR09BQkJHRjJublN5c2tUQ3JUdHpBa29zU1p1Mlk2T2RYSmdQV2tF?=
 =?utf-8?B?K2VVU2gvVzFVVnQ3OGRSQ0RMaUpIblA3QnRvZDlyUzFWWVk3ZnJXbzRMUm1I?=
 =?utf-8?B?dFBTWCtjTC9meDRhaFNaY09BZk9sSlBRTWRHRGlRdHBLREFZYWQyU2t3SVJy?=
 =?utf-8?B?eE9Nc1dMQ3QvSUU2MUI2cmppckFTOE5VWnA1dmdtcGVQc2xpZDVsV3hDVFQx?=
 =?utf-8?B?aTVQblhqc3pSNE9zRHB4QlJzdDlHam5KT05tU3NZZDc2MEt5VDF3VlAzaXVq?=
 =?utf-8?B?Mis4eGVwbTlYRDA3byt0YUhlNEg0T0JjWU8zM04wdm5PWVVqeWpuNTNZaWht?=
 =?utf-8?B?dit0cE9HYWUrdmsxb1ZFaFd1aGVoZHhhMkk5MUQrckVVNWhYVTFHY0l4ajBv?=
 =?utf-8?B?WFZDZmNhM0dadWhET3c0Snhtc1hRM3hGdGZuUXBhZm5Ub2xWMytXV0lubUpi?=
 =?utf-8?B?aXRJMlhkVVNFRnpsOFYya0p0c20zRTliOFdXSTRQdzJJQmZOYU13NkdFbUsv?=
 =?utf-8?B?emRaaW11cTZTQnVUYWVtMTV3VXVUZWVzN2tCK0xUdkUzVC8xNHY5MnpVdVJo?=
 =?utf-8?B?N3hGWmJTbnN2Tkh5ZXRMeEVUODNKbFV4V0w4dENNMTdJYk9YQlhKZkcwYWJx?=
 =?utf-8?B?SElRcHVMbzc5WlFtOFRrU0RBb2hqOGhzdm9ubHVPLzZPUHMrWHdSQXZPTVRk?=
 =?utf-8?B?SWVGM2FGWVJjYm16OEgxanVjRTYwZWxqSTQ3b1lLZldvK3hjMlRZakJmYUF6?=
 =?utf-8?B?U3FtcFlkMWV1c2RIZmRZNVBIKzdQNm5xQnJLMng3WWkxR1ZQaEtGV0JmZUtu?=
 =?utf-8?B?cCtQWUIzMFB2QUxuQ2tEcUtSRW1WNHBhb1VRNjUzc090eEFDT0Z2dHZzbDdR?=
 =?utf-8?B?ZDJQeENvZjJkYkZEeFNJdUdXZzR3Q2Q3ZHV0SXh1UERheEh3ZHFMSVlRSkVI?=
 =?utf-8?B?ZENMSDJVNjRTQWpmTThNTHNkL3N0a1pwWXJjMGYxZm9KWVd4UDY2NXJsNzhG?=
 =?utf-8?Q?fHKW5JA3qT+po=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2380cadf-4bdd-40da-9c3f-08d89be2aa7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2020 01:35:09.7319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LXoRRDK/sRhm1OBY2O4Ol0tEi2i/I3Xhwy/P2hN5jx3995n95jeXXA6xlhXTPalIWyxUHAc7e2tzrF7Kh2funA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5658
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=cCHfVQV+;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.7.85 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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
> On 08.12.20 10:46, Peng Fan wrote:
> >> Subject: Re: ARM64 MSIX enabling error
> >>
> >> On 08.12.20 09:01, Peng Fan wrote:
> >>>
> >>>> Subject: Re: ARM64 MSIX enabling error
> >>>>
> >>>> On 08.12.20 06:28, Peng Fan wrote:
> >>>>>> Subject: RE: ARM64 MSIX enabling error
> >>>>>>
> >>>>>>> Subject: Re: ARM64 MSIX enabling error
> >>>>>>>
> >>>>>>> On 07.12.20 08:46, Peng Fan wrote:
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> I use MSIX, not INTX in root cell file, but always met the
> >>>>>>>> following
> >> error.
> >>>>>>>> uio_ivshmem: probe of 0001:00:00.0 failed with error -28
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> I am trying virtio ivshmem on my board, but seems virtio
> >>>>>>>> ivshmem vi_find_vqs not work with INTX, so I change to MSIX to
> see how.
> >>>>>>>> But met upper error, any suggestions?
> >>>>>>>
> >>>>>>> MSI-X for virtual devices only works when injecting them into a
> >>>>>>> physical PCI bus which is using MSI-X already. Is that the case here?
> >>>>>>> If not, you need to debug the INTx case.
> >>>>>>
> >>>>>> ok. Thanks.
> >>>>>>
> >>>>>> I could see virtio-ivshmem-console /dev/uio1 shows a few lines
> >>>>>> log,
> >>>>>>
> >>>>>> But it responds to input very slow, when I press enter key, it
> >>>>>> takes long time to respond.
> >>>>>
> >>>>> After correct the interrupt number, it responds to enter key fast.
> >>>>> But if I not press enter key, the virtio-ivshmem-console /dev/uio1
> >>>>> will show nothing. If I press enter key, it will show one line boot log.
> >>>>> Press one more time, it will show the other boot log.
> >>>>> I need press enter always, then could see the boot log printed out.
> >>>>>
> >>>>
> >>>> Still interrupts issues, I would say. The GIC MMIO resources are
> >>>> not accidentally passed through? Does /proc/interrupts report
> >>>> events for the virtual device?
> >>>
> >>> ivshm_irq_handler is triggered in the beginning, for several times,
> >>> but after that, there is no interrupt triggered from inmate Linux to
> >>> root
> >> Linux.
> >>>
> >>> The inmate Linux is dead loop in
> >>> __send_to_port
> >>>       ->
> >>> 644         while (!virtqueue_get_buf(out_vq, &len)
> >>> 645                 && !virtqueue_is_broken(out_vq))
> >>> 646                 cpu_relax();
> >>>
> >>> If I press enter key in virtio-ivshmem-console /dev/uio1, it could
> >>> pass the
> >> loop.
> >>> But it will run into it again later and not break out.
> >>>
> >>
> >> I bet the "virtqueue_kick" that comes before this loop does not
> >> trigger an interrupt on the backend side
> >
> > Indeed.
> >
> > - or we have race that this is consumed without
> >> delivering the expected answer to the frontend. Didn't recall to see
> >> this, so I'm afraid you need to debug deeper.
> >
> > This change make it work. I am using INTX, so num_vector is 1, however
> > if device vector is 2 or 1, it will ignore the interrupt inject in
> > hypervisor/ ivshmem.c
> >
> > @@ -361,9 +369,9 @@ int main(int argc, char *argv[])
> >
> >                 memset(queue_config, 0, sizeof(queue_config));
> >                 queue_config[0].size = 8;
> > -               queue_config[0].device_vector = 1;
> > +               queue_config[0].device_vector = 0;
> >                 queue_config[1].size = 8;
> > -               queue_config[1].device_vector = 2;
> > +               queue_config[1].device_vector = 0;
> >                 current_queue = -1;
> >
> >                 vc->config.cols = winsize.ws_col;
> >
> 
> OK, we need to explore how many vectors are available and configure the
> queues accordingly. I thought I did that already but apparently that wasn't for
> real. Or it was only for ivshmem-net...

Please help create a patch, I am a bit new to this.
For ivshmem-net, do you plan to support virtio network?

> 
> >
> > BTW: Do you think using kvmtool to include the virito ivshmemv2
> > support is a good option? Or you insist standalone tool as your
> > current design?
> 
> kvmtool is for... kvm. I'm not sure I you can easily factor out the device
> models from the kvm part there.
> 
> I fact, I'm rather thinking of something list rustvmm to exploit as device model
> supplier on the long run.

ok. I am not sure which is better currently. Rustvmm might be a good choice.

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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB27604611BF7DE87E43799E3A88CC0%40DB6PR0402MB2760.eurprd04.prod.outlook.com.

Return-Path: <jailhouse-dev+bncBAABB345QTYAKGQERCO4KQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 945C9129A37
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 20:01:04 +0100 (CET)
Received: by mail-oi1-x23f.google.com with SMTP id x75sf7811942oix.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 11:01:04 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1577127663; cv=pass;
        d=google.com; s=arc-20160816;
        b=crfiBYuQGm5LXOQ1PErm8nbtY8upQDGgTUCHUWmnAahZf+WfeaUoEhFak/cv/ANwle
         Gvbx7VCyY8jdb19+0FjJV46+At5hrbhG95orX6iETHhxhym6sIGs97i0lkH19rwbyCQs
         lf4zHlGlmoYbypgEfcgS+5d6QpAbubcASy1U/mxXf2VOfmTJoTVUtEo/c+ZRrVttPFw3
         pRH7SD5xKzf9IAU5j/B/9cf7tNIqq3H7F+V5q1KBNAq6mBM53bboCaXBM2dtGSggMpXW
         L80O7d180A6Buf3R9lREQ9w0qo6MllzqwDC/tIwcRKC29IE/Fx7lBzXy5Y/yTvtSbrJ9
         AHPg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :from:sender:dkim-signature;
        bh=kaB/hCKaOeABReWhccFXGZ9eF/yIRxUnikgYap4cBv8=;
        b=vGp/HCoeMrd7yPfakgAm3f1Y+LMTTBALDRMNS2BsYbuSR1PIhio6QpSPtPfXUTmVGo
         6FfAIQHrmu8ztyi2Dmg70sUgTkcoYBvzEyjmxgvZvGtSBf9QzlyAB79c7RcCh3lyBLws
         m/kQaOyXBqkVFQrDLKJylD+jfexKjTcNd9EJN6mFzdE2yJo8D1+g+OEeAWsSKVGHtmjj
         2BGd43M0wOKBVLEz7kav+BAhsGCbaLo4/fhtmqpLvHZRL6JQuByOHonI03TFZJFnDSZ8
         R0ze1taPzLlr8mmVPXmvLbMgTYhPJYudaG9lGf2O8Nf6QwCftnIw6UmxkrxNAztE9taU
         lC6g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@hotmail.com header.s=selector1 header.b=KKbrNdb6;
       arc=pass (i=1);
       spf=pass (google.com: domain of miran20089@hotmail.com designates 40.92.74.102 as permitted sender) smtp.mailfrom=miran20089@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kaB/hCKaOeABReWhccFXGZ9eF/yIRxUnikgYap4cBv8=;
        b=DcQkNjD1cLdbBFbkccZeI0efb6725lH6Gv6iOjzh5hH8YApZkJx/7tMDSeTAOuCupz
         cT4UIfB29zH7ge8pRUPyyMTInlMrPRjlLOlHNnWvvGofk6xZdWC9c9tndB5szpAQ92vJ
         zmtjzqBxmAnUx9NNRD2IZnJpRZjZWxgf9YvcDdIqwkQuitEdfW/9pi1R8LDsijAevcxf
         jQfJc0heXoXwLy+I7RHTbdk3OvptP8J5cbyR+UH231v1IeEJmwD3NFb449QVy6uGTEks
         Fm8NQI6PutAXexOkJoGxSA/oo1l7yIEuVut71TTyi3kOAakZ0/U7gTFzzriLOddTZzev
         x4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kaB/hCKaOeABReWhccFXGZ9eF/yIRxUnikgYap4cBv8=;
        b=tE+anJf30wYfva+dplH0WsLbY95NiAjfhccmQoLPYYF8lNms8Q9/5Gii3pS5rNlHOV
         DO4o7sQz0YIpHMZY+eB39KYTSW13q1cZ0WUQmXFnMrFN6Q2R66T6O8WRig93nV05c99P
         2i0UvXnZscCZpYy65okLlK84vcJyMX1LGzo1XxdiQJV1dflVSZD7xS2PcjVmbCBCgYuX
         GfdIr30WAaRNZbZWbYMn3v6LoQxB/wu3Znbbx1CIdP2arJnyrAmn5hQ2mNxT69+1QTF4
         yRIYISOSEgwbHBGBPDGSshmQJIDlPYx47eT+lzRANes1/7YLXfcfTcUUS9VQKDf2lQRA
         GVcw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAULyFWLWSY8qJ58/WTbCO9UYutgbQdd88U/4oAuP7j3Trx9KLzf
	VVfRi8ofIjIzshlVDypfc4s=
X-Google-Smtp-Source: APXvYqw9HlgPEFFBo5Hter0zHD1LE5XTiF/9lZ15qg9C734Ou59TdVv1+FaNTGR+ahjZVVVt8EqYNQ==
X-Received: by 2002:aca:f555:: with SMTP id t82mr176491oih.103.1577127663399;
        Mon, 23 Dec 2019 11:01:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:60d0:: with SMTP id b16ls1374502otk.0.gmail; Mon, 23 Dec
 2019 11:01:03 -0800 (PST)
X-Received: by 2002:a9d:3d0a:: with SMTP id a10mr30887429otc.327.1577127662938;
        Mon, 23 Dec 2019 11:01:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577127662; cv=pass;
        d=google.com; s=arc-20160816;
        b=vtwiUUqdIlDvzuyuSzia5Mutxq0vUIjuB4dH4sioQdz7G6DGQT+gENXRUVPUdVIC2O
         ID2k8H/G7Vm2sYWgNXCko0pBtcQ4w7curnxUsqEAY2nns/tTSwdu38JwPB+ILzHffdA6
         xItPycpNmhvEpAiFWRjFjq8ePTfX27EZTYoelxmZViFYL4x2+8hzwK2xMjmpqUALM+ZR
         4pJogOB3Vc7jgdl1fDFIzE5KvZBSrWJgEpDx5kQ/7syGYsvU7qldaWTnYCQy0N016C7M
         nBit9cAT/U2kjMJrm1CmRaP1t0YMaEbtqq9KZ1s3NmQ8Vw8BUVlakBWo9MN20gc+ExWP
         WYvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:from:dkim-signature;
        bh=JfkfnaJtZL6bSaKYWKaCqMfs6fwXWqCt6Wf6JBa02+Y=;
        b=jsyEIdIYdnczRRi/rNfYH44lyUcudqlgEG8sQs0iGY8Fbu8Yct91Bg1p5RQ2KmW4ny
         W9R2esOdpwk4x8WVtrDNFUjmGVKQa4Gs1j5AK5h796j+09M5URLwnL2sqng+TxalZR3r
         dxMVqf20H0aZT9BUPG7NJxTmlfGIkLmaChw5W4Iu1yxQCJ6nZ24m1WeXRVGebr/k7IxB
         BIQUApv1UKsQI7XmVenHU00dgxWMiJKotlipls+zu0Hc3eBJVb2XYZwgcTYO57Daupz6
         iWxWsU/Asqn/WHAHxzhYugEUB7K/Jcug6ZgNjQBlYb6epenJ55SXDaaVcnsLaEi7OOMl
         +cFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@hotmail.com header.s=selector1 header.b=KKbrNdb6;
       arc=pass (i=1);
       spf=pass (google.com: domain of miran20089@hotmail.com designates 40.92.74.102 as permitted sender) smtp.mailfrom=miran20089@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-oln040092074102.outbound.protection.outlook.com. [40.92.74.102])
        by gmr-mx.google.com with ESMTPS id h11si584031otk.0.2019.12.23.11.01.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 11:01:02 -0800 (PST)
Received-SPF: pass (google.com: domain of miran20089@hotmail.com designates 40.92.74.102 as permitted sender) client-ip=40.92.74.102;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AX7KAwNxlAhbKTegOvkYtoEOSD1nr0/s1LAgWGvfi/Qeikf4txtGHvVGIx+IYVA1BSK5Rokm0s3FrpsWg6nJxPy5yTDJd6lY+mE6EDf/CwDBVT98/JirCk2pSFRdRLny2i/aXW5Y+ntfJ3BFTblXO+D+PKe4odZlzs+4b0xGhCjRhArVfed+0m4NIY99edhLC7W4+6m/PwatX/zp+lBLPUkUtlKS1ozhAFedQWFcL7zbyHetboZhCgkLaOUtfd8X2I++WLO2RMZFW+8H/V13dcOmbor3kYVyE0MtVuE5H2wxYY88iPI54UpqUGxNdIxYv7vHt9rKr8uFwfSIVJ64TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfkfnaJtZL6bSaKYWKaCqMfs6fwXWqCt6Wf6JBa02+Y=;
 b=NNjaNGo+pY8gVI/vD5p4jWR2TODuNpOYAl+0HRcPj2uVmL+g+fAIMLdH6euR2PinLnHjNTkXlY8rSlt3usEfyl0SxFxVAxtrIgp/uZhCoMdfprvpSiL4c3AY3u+FHaX4TKqxocteax13i4R9yX6I3lGm04bLtUMBDuGz4YWIIubTJMQkbvdu4JTlxYQ7tzHGPA+OsTIXx/Eo+/t5tGdO6TRsnRaf5znhmAvTMe+N+fVtf/V1CnyCeiC38mr+JzYX8PAFA4InIjY2sqbrDO64MOoQGTGvz/Wqtqr23NOrJin+/hPQ8eMaVyGRCohzWynmxOHUd3zkO/jYHKpBXOE/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB3EUR04FT056.eop-eur04.prod.protection.outlook.com
 (10.152.24.55) by DB3EUR04HT020.eop-eur04.prod.protection.outlook.com
 (10.152.25.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Mon, 23 Dec
 2019 19:01:01 +0000
Received: from AM0PR07MB4002.eurprd07.prod.outlook.com (10.152.24.54) by
 DB3EUR04FT056.mail.protection.outlook.com (10.152.24.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Mon, 23 Dec 2019 19:01:01 +0000
Received: from AM0PR07MB4002.eurprd07.prod.outlook.com
 ([fe80::d0b2:8cf1:831c:3a35]) by AM0PR07MB4002.eurprd07.prod.outlook.com
 ([fe80::d0b2:8cf1:831c:3a35%3]) with mapi id 15.20.2581.007; Mon, 23 Dec 2019
 19:01:01 +0000
From: Miran Posser <miran20089@hotmail.com>
Subject: I wish you all the best
Thread-Topic: I wish you all the best
Thread-Index: AQHVub/3rO1dwmGi1EmcZLWweOSbog==
Date: Mon, 23 Dec 2019 19:01:01 +0000
Message-ID: <AM0PR07MB400266FF905E71D3DBCBDB32852E0@AM0PR07MB4002.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:01762F5A698C108C087840706475E7EA340C74A137632E42AF8AC6946A7C4DA3;UpperCasedChecksum:E811467564C73D40288ED62B51AB510421D2C891075E71EE36772590584180E6;SizeAsReceived:7029;Count:41
x-tmn: [pZH9jlK7Nb3pFrMeqcG9EcGgrnm2po7w]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 2f660d0f-5b38-4cd3-8876-08d787da73c0
x-ms-traffictypediagnostic: DB3EUR04HT020:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5t0rP+G77M/Nrv6lBYCsGKWp9nlL0/LJsmu1oFMBBc/irfWjVh0VAeSFB6krZy1Fo1if5B/aX0a8ANuAieGlrJAaif3yDY5BL8NrCQjJsB+oPMg3hA/JZaQHqic55XJSBGj7R1ZH1BM/cZkoYmsEzknNULYx9XolhOeRJXxdvk+8EWXtP41+OTnHZhg6UIuC
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_AM0PR07MB400266FF905E71D3DBCBDB32852E0AM0PR07MB4002eurp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f660d0f-5b38-4cd3-8876-08d787da73c0
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2019 19:01:01.0182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3EUR04HT020
X-Original-Sender: miran20089@hotmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@hotmail.com header.s=selector1 header.b=KKbrNdb6;       arc=pass
 (i=1);       spf=pass (google.com: domain of miran20089@hotmail.com
 designates 40.92.74.102 as permitted sender) smtp.mailfrom=miran20089@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
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

--_000_AM0PR07MB400266FF905E71D3DBCBDB32852E0AM0PR07MB4002eurp_
Content-Type: text/plain; charset="UTF-8"

I hope this email finds you.
I want to know if you received the last message I sent you?
I really want to hear from you.
wish you all the best.
Miran Posser....
I look forward to your response.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM0PR07MB400266FF905E71D3DBCBDB32852E0%40AM0PR07MB4002.eurprd07.prod.outlook.com.

--_000_AM0PR07MB400266FF905E71D3DBCBDB32852E0AM0PR07MB4002eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
<span style=3D"margin: 0px"><font face=3D"comic sans ms, sans-serif">I hope=
 this email finds you.<br>
</font></span></div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
<font face=3D"comic sans ms, sans-serif"><span style=3D"margin: 0px"></span=
></font></div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
<div style=3D"margin: 0px"><font face=3D"comic sans ms, sans-serif">I want =
to know if you received the last message I sent you?<br>
</font></div>
<div style=3D"margin: 0px"><font face=3D"comic sans ms, sans-serif">I reall=
y want to hear from you.<br>
</font></div>
<div style=3D"margin: 0px"><font face=3D"comic sans ms, sans-serif">wish yo=
u all the best.</font></div>
</div>
<font face=3D"comic sans ms, sans-serif" style=3D"background-color: rgb(255=
, 255, 255)">Miran Posser....<br>
I look forward to your response.&nbsp;&nbsp;</font><br>
</div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/AM0PR07MB400266FF905E71D3DBCBDB32852E0%40AM0PR07MB=
4002.eurprd07.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM0PR07MB400266FF905E71D3DBCBDB=
32852E0%40AM0PR07MB4002.eurprd07.prod.outlook.com</a>.<br />

--_000_AM0PR07MB400266FF905E71D3DBCBDB32852E0AM0PR07MB4002eurp_--

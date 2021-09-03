Return-Path: <jailhouse-dev+bncBDBIZ3EL3UDRBNVOY6EQMGQETYQNQ6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F723FFB88
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Sep 2021 10:05:11 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id a38-20020a05651c212600b001ca48d59b47sf1883193ljq.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Sep 2021 01:05:11 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1630656311; cv=pass;
        d=google.com; s=arc-20160816;
        b=dNbBt+SDZSRHPth7NlpRiDY9pW14GMV8GRUfodbAho4F0vZgE00ZdrWwsF9vHcwVWm
         LctRCB9B1b9D6KGK5qe8J6mhq6exVfvpD9oTA0h5cMmWRAFuFNzHATB7uJZEIkvLHJ7n
         1QyVpG5nWShy7AY5HV6ozQQh2MtcaR6zQo3Ex8VOssmLEC+Kof6JBhCfEdRzSw2oU124
         Xb21iD/PmGcKJk4YWXZTa4RhRIwzLlFGhytS3HqC63ODSA61li4lam5Wa3x2EGpLukFM
         DRCvJ5EDYiir+IiXdv0xPR6fdCn4epPShVEZ6LOimGFvsaQMMUbK/fCBN4Z/4i+M968y
         nieg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=WEv9U7FyXgH4lkX9BVCrYqNg9PuX19gy5QcT+uGs1CE=;
        b=0t1FJpqUf4ca8JABuUaH69pkre6S6QM8X0hu2L6vG3pkCKZYgu8gTrEMtsPDuRMsek
         E5y6yCwKxTMRReOEBHN8a+NcRM5n1UH65ei+iXdrEVBITmeENjuELfwbB4sdh4CamBJD
         flBwmie/6WPUk4Fz45uL5j48KhZcwLrzWGn/hM2z7qEsuru4fEq+GZGcemCKRJYunexY
         ArnUG88230pmnuH5zLOaCzy6Hz7g1ipSms/8dMbrA4YWiuNLoMUdlgRBvDwn9z9yvLf6
         KU/HIdsn6IygymLHBmPutAKqt/c5maY2Od9Bd0frhQ8IDKqcd28hDseWGMkM1mH/Cjhk
         RA0A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=KLaum6gr;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.22.62 as permitted sender) smtp.mailfrom=zhiqiang.hou@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WEv9U7FyXgH4lkX9BVCrYqNg9PuX19gy5QcT+uGs1CE=;
        b=lnsPKI4ouef6rAQb7pq/nY1ZlOXrhl4FgBDX7v16xkT7rstz8wb/huLFhlM0oQ1f83
         yvPI7Ndzb7Hs6pIrDDcmmaupzXAwR1QlUuea3yvym/hT9Ant0f3ZQDpIeIBvYfpR4uHp
         P9t+IGxblqiRYO3niWAUjDu1aQL5yL1vlqALHfSXW9eYdsTFE/ybfC9T2nC35FKFHGgQ
         3s2Cp1+06Bqoa8FbMxIzJnDJOQqeHiDL569DyfIjpHKy3yPTAYCNov3l1Hxx2xjnInHX
         3+0eOOQx22r8orHZbrWz0YGdvZAiVVYh9RsFAafzR2M5OnAFHLIB+YFeo7UCoHHlQBz9
         45uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WEv9U7FyXgH4lkX9BVCrYqNg9PuX19gy5QcT+uGs1CE=;
        b=gIvGCteeOMtWKocJLMI6ThXjRMupqB6yNNvM69yLJWZ54k/M+RnsDK+DT0JU1iKaxI
         5ROm+5zfKk5PwiTIQBGJ5xRmAMeaIYb1RIjSM59H8r4/0PYPBbeh97qUOruVFuHZ44qv
         KeJrFUZ44To8jZVnMrEFheKJh2i2SSj60t+3V8UaMcMQOGQz7smTe8nmhyhcANJ//fZd
         GhsISDNRA7cdEBLC21R6LVYiv+3RsTzqUNl8saxoI+vKCV2jEbQQPpIzByqXCNAcb2lY
         VG2FKh1gqooInIZxEtsAHF5ffWNbt2EyyFTmmAD+qznZvCeIsMdr3Z6TNkUzPkZUN9XN
         pLQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531yL4rH1JsXQtdaz8F/Wb1Qr+nmvSAvEBO2W5cBr5h0jjFYU8I4
	sXfQ7OHgWOvTQyTkoMnJYIM=
X-Google-Smtp-Source: ABdhPJxV4ZuHOIsJqDib43RYnV5WiyA0AWrEojp2kmTvuzS6XmNCHRNG1SUjb6UYfa/Rk9uTFL/zIQ==
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr1788049lfu.291.1630656311438;
        Fri, 03 Sep 2021 01:05:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3ba:: with SMTP id v26ls2187759lfp.3.gmail; Fri, 03
 Sep 2021 01:05:10 -0700 (PDT)
X-Received: by 2002:a05:6512:118e:: with SMTP id g14mr1873495lfr.661.1630656310019;
        Fri, 03 Sep 2021 01:05:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630656310; cv=pass;
        d=google.com; s=arc-20160816;
        b=0998mcewwsKxWgdkrI4VyQVXd3ADfWUw3qXkpek8p9XE9U0brtFrcrFBrsKPNc4vNH
         gVMw9vl390Vd/AE+a2Q9s104tBY6jHKDdoNVqG8Lpgml/qGOkOL5wgD3I3Dq8v9bXbW3
         33N7Kb1omQAX1qKf73yJXfESVWdrQeeGFnnvo8H1f4cwmPf6HmbdbO1igsm8UJnxIlXF
         weBQCzczfCrAYly+33gId9fj6MLCJ8FsGLHNvFzIQl5fX/Cahmvni8pYCAifUwIKgqim
         8Ize/HcffxZTnprzyyNkvRXEKqP1RWmOjdOkdg93llwpir7deOWZW4dYcEN/HwcKrzqx
         /lXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=EwUUyxZ7mDTd9QRm2i34lZs/CUEfYBPc2NPHwQJGoHw=;
        b=LrtiIgh5PnICmmlNNyyMWFVzq6+sAY+5J06bFCbeVB/wnUYGhur8F3Kp8Kvmtc6n/m
         zo179qeLAEEL2u6yb25+MTBwScEvMoZ+0hutWd8QfkviDsEbXSEL3TfW03Yi9s311Rlh
         b4FzJy1OEjaXKa61mbbtCVgLarLyWId6RNfiUMfroxBtQO+BTjgI+LilWsldLwcfxWCR
         xYyRJrjheyaGP5mgp9SpIsMYTZNG2pOLDuSwNnf4ojs/yD832kMVYGUTxDgeb1hjYq+T
         vZb57SQxlDGKe671NDTDbDNAomgSruGMgvYHg1eVoBlIsjj0AjFQj/cpeK5IR9EL0ac8
         ubSw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=KLaum6gr;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.22.62 as permitted sender) smtp.mailfrom=zhiqiang.hou@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2062.outbound.protection.outlook.com. [40.107.22.62])
        by gmr-mx.google.com with ESMTPS id h2si176150lft.5.2021.09.03.01.05.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 01:05:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.22.62 as permitted sender) client-ip=40.107.22.62;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naTWjlFVBOOW6/TxvQi4lkIyPQkeWqzfj1/fbjGLJW7FWP7adE1zPdxKPcMoMUxtYL0jPapocrnxi+Sq0qHUX+M6aC9D5fvHXnS4BD5Dz2PfK/rPL4o55NavyiN0ZKUL1y7YttZ6yXppJ4ahILcpwfSjdi0tl0utd5GP+z5Sy1betxp8HUe/gxkFWVSziUbir4/sojr5Ci774xcoTI/8SHKkn7m8PSc+8xaU//XDeNmTErVAd9Xfau7qjRekPNujbVMELz4OKRIwRLXeQQrbR52KprFMtbeUVGPoYv/zJRfDAnGxG64IfgHegNzPPLxoqlKgaWZhN4YnVp8IiIIybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=EwUUyxZ7mDTd9QRm2i34lZs/CUEfYBPc2NPHwQJGoHw=;
 b=MlP0uZGMGu1EVAX08kJ3P2QRcdjhUEUsuQ26AkdG7zoDqcbWt0WnwnyklWekaJWwNZQZVtmNt9+03SaVfOwr0W2m+Dlw75Xe3SZI25QJCq5lGNY39QndXRS73xuf1PtbuRn+b9h6c9FW0U0KQhgR0Qi/sMu2qcCwJU3Y1XP9kcQIaSUY4GG35Ly9EDcw1qFlD8rluVQBu9/tH3t6zCr9dfezi4jnmmqw5vlyjnQI67LpipUb2HfydYSH+xTA0u0Cz6rpKpYUAW7NKTdArUZrQ/n9RNj1cV/G5aUzL/enwJO8UqItWFJTeA+cvEkV3zD+HHF+GDlzJjRBM7NWQC46VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com (2603:10a6:7:85::27)
 by HE1PR04MB3243.eurprd04.prod.outlook.com (2603:10a6:7:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Fri, 3 Sep
 2021 08:05:06 +0000
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::8d8a:89d:e110:3c3b]) by HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::8d8a:89d:e110:3c3b%6]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 08:05:06 +0000
From: "Z.Q. Hou" <zhiqiang.hou@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Jiafei Pan <jiafei.pan@nxp.com>, Rui Sousa <rui.sousa@nxp.com>
Subject: RE: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
Thread-Topic: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
Thread-Index: AQHXmxbhYfr68tdfjkGRS5idFHzolauG+uuAgAAZduCABHlagIAAUF/ggAAZuwCAARBj4IAAMEqAgAAWFqCAAE9MgIAA4w4ggACLjACAAo1mgA==
Date: Fri, 3 Sep 2021 08:05:05 +0000
Message-ID: <HE1PR0402MB33715CAF5CE75BF5038BDD5884CF9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
References: <20210827075116.6208-1-Zhiqiang.Hou@nxp.com>
 <2d3cfe41-3c51-34f8-8130-f6b86720d835@siemens.com>
 <HE1PR0402MB337191DE611BA6CC480C104D84CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <dd785b10-ac8d-f483-7483-f8830ed6147f@siemens.com>
 <HE1PR0402MB3371C1CDCCD9EA8CC8938FC684CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <9ecc5d87-c7b4-ce84-6621-f88cf05fbeff@siemens.com>
 <HE1PR0402MB337140548025A20E651BB4AA84CC9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <4d107c19-ba44-c5db-9452-1552e0b66c93@siemens.com>
 <HE1PR0402MB337106827ECC0CE4ED356C1784CC9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <2b88eb53-8258-2d0b-d0d1-71c24bf372cb@siemens.com>
 <HE1PR0402MB33713AC7844D1B67AC8B67F384CD9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <ab9e7f4c-c52a-4c4f-ee77-c8148763184a@siemens.com>
In-Reply-To: <ab9e7f4c-c52a-4c4f-ee77-c8148763184a@siemens.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab086527-d08f-4521-78c6-08d96eb18a78
x-ms-traffictypediagnostic: HE1PR04MB3243:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR04MB32436E6237691384F5BE982184CF9@HE1PR04MB3243.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V+nVSeH3mm5zB65/q0jmIqKS5b9SHzS8oIVn8WPSZzJYWjuU3sWe+R/DPgb5cI45XuhdOz/OjjKib784JPzRnrX1gloBHn+/p7OzUgMA3HeaG+wv1TP1R/lyrx5IoJSFE3hCOdaGS+aHLk1Q4jak+pZMvmrDDFyBumdZXM0XIR1uJOg//MdrBs0o1aMZw/md8qrP0Jog9rZRPK56UCNznXYI4SeJsUsvBv4GkaHWPplLVAnUSKLb6BnO6WhNGgxkwA/tM2tQhLhQ2eOFKavDUDONY6P18Ajg8vxJwSQEA5DBfa4vZw07DMD+fRzcO5d1rcNnvawPMmEnzmCwjXOfUH34Sh3DuvS7RoqRHrqMwsa2qRgXPvHZR5Z4FsyQC5YfWa3Ex1EJtAgXc3xibfUBIiJobBd4zE2vgX/SY6sX25K3OsAIQ2Vl3kpmhna6/T/06SHZemTAK7gTu0FdoCB83ZHHzhgzzzgitoPMJgic0Ff7coIi84Zjc953Jx/QSh/mma+3QJOzry9w3u+eSq/aYlMJlPjMbDadGd1Vqiq0w/EUNsx3bjLW/Z3dJasycVt9QnVY8bs1vaWJdkD2YEce5RbC799gcGQRwOrV0t7g3bzKSTYPq/2txikNJcYCl8fWXxVuhJsLy76/zSqG4SU3jglcsAZ0qhrFuEZSDGCjwnlQ7CvncpSi/a6yEmHBF9Mga8FA93xyAWN2LbP7oiMKFw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3371.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(84040400005)(5660300002)(76116006)(86362001)(38070700005)(508600001)(26005)(33656002)(83380400001)(8936002)(2906002)(7696005)(54906003)(122000001)(38100700002)(8676002)(316002)(6506007)(66476007)(52536014)(66446008)(71200400001)(66556008)(66946007)(64756008)(9686003)(186003)(110136005)(53546011)(55016002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmRESm5nM1FqOGxMeXAwNEdUeDd3dWZtdXFNczUyMTRwWk82b1l1TGRwc0tK?=
 =?utf-8?B?RjZjTFBESXJaU052OEwrb1RmMFY5S0ZEOVVYK2xubkpLR3M4emZZdEtDYlBQ?=
 =?utf-8?B?RmhKSjNWRjE0ak1PcmtqVE5VYjdwdkxtN2tRRy9SNS9aWGozd3pEWVlHREF1?=
 =?utf-8?B?R2lQQVhBblNqYjdBL0hRUkVRLzM3RzlJSmlCYnUySGpUVlNVa2hzWUJrT3Mw?=
 =?utf-8?B?clR1TTlmMmU0S1dTeGdjcDFmNG1nNGJYclNrOTZ0YnJlNHkzRXdueGxMclNm?=
 =?utf-8?B?WmFvOTRaVXRidXlEeUhjaTJsRXZUNlVYZnhwRnZqdjZSUzFTbHF2NllJcFdM?=
 =?utf-8?B?QWNncjFvT1F6Q2xEZTlDMUsyTXFiWDFuSitBTDFydkZhYi9GSi9FVzRjZlVK?=
 =?utf-8?B?SFVxNlJzOTRTRFFsdnJ4UjZjdW9xazNadUdGNmt5RE9QczVmRDYxeERYVHlJ?=
 =?utf-8?B?TWZiRG1wdThkK3V4dmczeitwRThpRWEyVjh6Zmtpc2RnWG1oZUV3VGlZcWhG?=
 =?utf-8?B?czdyK2lFZVoydE5Ob2lLU0szZ3E1STBidmZLK1JuV1ZLUm5rOXZhM3liQzBw?=
 =?utf-8?B?Z3NlODZVTFRPaHNrakVFbWdLdGZuOXo2QitTUmlySy9JdXBNTnFmRlFEc05u?=
 =?utf-8?B?QmZiUVJzR0NQTDFsY0hhNzMzQU9ieDJBM09Rd2lXMnRKeVF2K1UvM20ybmxn?=
 =?utf-8?B?WnRMRXdwa2dTWXdSSVptdmw4TzVYUkxsMk1zOEx0Y0xpZkZBSkQ1cnFZOWNu?=
 =?utf-8?B?aXdZeDA1NzhWaDFIdjZRdlhSdkFHM3AvQVc5ZytaYWMxOCtNQW9jWjdvdEZv?=
 =?utf-8?B?R0FMelFDTjJlbVAwakRScTRUVFJnb0ZRNXBpaG01eEU4d1JJUFFPR2RTQzd1?=
 =?utf-8?B?dnpkcGNES0JWNzh1akR3aDJVSTREMFlSa3ZudWQ2dWtOQlBCR3A1bmIvR0xM?=
 =?utf-8?B?NzdDMUpqNWxLMkxUQVYxMk53Sk90Vi91NVJ1QXNNV1NlUGJ5emxPMTdlSkdN?=
 =?utf-8?B?MkhsM05sWldCazBIc2NFY3hiN3FBbW1PekZXRmhvS0ZTdGUzL2FMaFNUVVZl?=
 =?utf-8?B?VHlpSWV2VUVPcXVMRUV6SXhBalpDWFFlcWxZcm9QcS83RWJ0NHVzRzd1L1pw?=
 =?utf-8?B?UWR6QVRHQi9XV25qMXFONksyWmsyMGdvdTdXSDRoSVNRTk5oTGpJZWNNOEg2?=
 =?utf-8?B?U0IxSEM0aGRBRGVvd2pnVkVQS01PdC9tRVhrZ3A1YzRWTG1nbnA5TFhRYWhP?=
 =?utf-8?B?UzdNWHNmakZnb1ltd0JPbXdpd29yT0w1aE5wa1FGbk40ZTI0QUdrNlRQSUpG?=
 =?utf-8?B?M25ERDVvTW9nOEtWWXZuWUdPWUlFVXlnanZFcWdYaVdHRkhPSXFYYVJRd1cw?=
 =?utf-8?B?dHg3dzhlT2tqK0NlOU4wQS9JRUNOdmV3MU9ScUhZbnF6VDNHbHM2ZEJiVUl0?=
 =?utf-8?B?VVhuTjBhWFhVSjV4SDEwUzJ4VUVSWnRPOXhzcUFXdmxCYW15MXFrWkQ3YlZu?=
 =?utf-8?B?RUJFMmZnQ05kcUJmV3AyYU5HREZrZXBNWVIvcHR0YWRtaGowS2xRYjFKd1FP?=
 =?utf-8?B?Z2ZoekdxOHkzTlF2b2tibFhlK0UvaHJESit6N0RiakJxQWJpZ0hidHZ2cmNE?=
 =?utf-8?B?amdjMEIzNlZxa0d0MFJkdnZoNnpCenZySFFYTkNkUW9SSnphelg3aE5scW92?=
 =?utf-8?B?bE5nUkxzMEJ2bThBalF4dS9HZkNUdTU2Q0luajNwcUt2dkg4UnZiSkhqbWEx?=
 =?utf-8?Q?KwnO2ZWMT8tIsOV0zw=3D?=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3371.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab086527-d08f-4521-78c6-08d96eb18a78
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2021 08:05:05.9781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gl34VGtqlzBYYtxqtR9IXbi+4ClczazHQGIn6Q066D5O6pLVPyhfFpM1+I890Gl13phw0HfS3DUltP543zQwEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3243
X-Original-Sender: zhiqiang.hou@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=KLaum6gr;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 zhiqiang.hou@nxp.com designates 40.107.22.62 as permitted sender)
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
> Sent: 2021=E5=B9=B49=E6=9C=881=E6=97=A5 19:06
> To: Z.Q. Hou <zhiqiang.hou@nxp.com>; jailhouse-dev@googlegroups.com
> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access addre=
ss
> and size
>=20
> On 01.09.21 05:47, Z.Q. Hou wrote:
> >
> >
> >> -----Original Message-----
> >> From: Jan Kiszka <jan.kiszka@siemens.com>
> >> Sent: 2021=E5=B9=B48=E6=9C=8831=E6=97=A5 21:14
> >> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
> jailhouse-dev@googlegroups.com
> >> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
> >> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
> >> address and size
> >>
> >> On 31.08.21 10:48, Z.Q. Hou wrote:
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>>> Sent: 2021=E5=B9=B48=E6=9C=8831=E6=97=A5 15:11
> >>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
> >> jailhouse-dev@googlegroups.com
> >>>> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
> >>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
> >>>> address and size
> >>>>
> >>>> On 31.08.21 08:55, Z.Q. Hou wrote:
> >>>>>
> >>>>>
> >>>>>> -----Original Message-----
> >>>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>>>>> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 20:03
> >>>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
> >>>> jailhouse-dev@googlegroups.com
> >>>>>> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa
> >>>>>> <rui.sousa@nxp.com>
> >>>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to
> >>>>>> access address and size
> >>>>>>
> >>>>>> On 30.08.21 12:54, Z.Q. Hou wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>> -----Original Message-----
> >>>>>>>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> >>>>>>>> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 13:43
> >>>>>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
> >>>>>> jailhouse-dev@googlegroups.com
> >>>>>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to
> >>>>>>>> access address and size
> >>>>>>>>
> >>>>>>>> On 30.08.21 05:02, Z.Q. Hou wrote:
> >>>>>>>>> Hi Jan,
> >>>>>>>>>
> >>>>>>>>>> -----Original Message-----
> >>>>>>>>>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> >>>>>>>>>> Sent: 2021=E5=B9=B48=E6=9C=8827=E6=97=A5 15:53
> >>>>>>>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
> >>>>>> jailhouse-dev@googlegroups.com
> >>>>>>>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to
> >>>>>>>>>> access address and size
> >>>>>>>>>>
> >>>>>>>>>> On 27.08.21 09:51, Zhiqiang Hou wrote:
> >>>>>>>>>>> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >>>>>>>>>>>
> >>>>>>>>>>> In function restrict_bitmask_access(), the current
> >>>>>>>>>>> access_mask is implicitly assuming that it always access the
> >>>>>>>>>>> whole register, but some registers are byte-accessible, the
> >>>>>>>>>>> Guest may get/set wrong value when it issue a byte or
> >>>>>>>>>>> halfword access to these
> >>>> registers.
> >>>>>>>>>>
> >>>>>>>>>> Can you be more specific in the affected scenarios? At least
> >>>>>>>>>> one example would be good.
> >>>>>>>>>
> >>>>>>>>> Let take GICD_IPRIORITYR as an example, which is a
> >>>>>>>>> byte-accessible
> >>>>>> register.
> >>>>>>>>> Thinking the SPI INTID 33 is assigned to an inmate cell, and
> >>>>>>>>> Guest wants to set
> >>>>>>>> the priority of 33 by byte-accessing.
> >>>>>>>>>
> >>>>>>>>> Assuming:
> >>>>>>>>> GICD_IPRIORITY8 original value: 0x00000000 Guest set value:
> >>>>>>>>> 0xa0
> >>>>>>>>>
> >>>>>>>>> Then the current logic like:
> >>>>>>>>> The access_mask is calculated as 0xff00, GICD_IPRIORITY8 read
> >>>>>>>>> back value is
> >>>>>>>> 0x00. Then 0x00 & ~(0xff00) get 0x00, 0x00 | (0xa0 & 0xff00)
> >>>>>>>> get 0x00, then finally 0x00 will be written back.
> >>>>>>>>>
> >>>>>>>>> With this fix, the access_mask will become (0xff00 >> 8) &
> >>>>>>>>> 0xff =3D 0xff, so finally
> >>>>>>>> the 0xa0 will be written back.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> OK, indeed a good point. We missed the byte-accessability of
> >>>>>> GICD_IPRIORITYR.
> >>>>>>>>
> >>>>>>>> But this reveals more: We perform a read-modify-write cycle on
> >>>>>>>> behalf of the cell with the cell's idea of access width. That
> >>>>>>>> is potentially
> >>>> unsafe.
> >>>>>>>
> >>>>>>> Can you help understand why there is still potential unsafe with
> >>>>>>> this fix
> >>>>>> patch?
> >>>>>>>
> >>>>>>
> >>>>>> The patch is fine for GICD_IPRIORITYR, so is accepting all
> >>>>>> accesses for that register. The problem is with other registers
> >>>>>> that do not support byte accesses.
> >>>>>
> >>>>> Don't worry, according to the programmer guide the Guest code must
> >>>>> not
> >>>> access those registers with Byte-width; even if there is someone do
> >>>> that by mistake, it will trigger an exception before the access is
> >>>> trapped
> >> to EL2.
> >>>>>
> >>>>
> >>>> I do worry: We trap the access to EL2 because the memory region is
> >>>> not backed by memory in the first stage translation. And then EL2
> >>>> will issue that request and panic.
> >>>
> >>> You're correct, I did some experiments, the byte-width access to
> >> non-byte-accessible register is also trapped to EL2.
> >>> But what I'm not understanding is the byte-width write access
> >>> finally
> >> trigger a SError (ESR_EL1: 0xbf000002) to the Guest instead of a
> >> exception to EL2, and the Jailhouse does not crash. Do you know the
> >> reason of the result?
> >>>
> >>
> >> No, not really. I'm architecturally not fluent in that details, and
> >> in that state I would have expected a crash at EL2 as well. Maybe
> >> someone else is listening with more detailed knowledge. Or we are in
> >> an implementation-specific behavior region here, and your mileage can
> vary from SoC to SoC.
> >
> > I did the experiments on imx8mp with A53 cores and GIC-500, and looked
> into the TRM of GIC-500, it says: " Byte or halfword accesses to register=
s
> that do not permit those access sizes are not successful and return a SLV=
ERR
> response." According to A53 TRM, the SLVERR is consistent with
> experimental results ESR 0xbf000002.
> >
> > The last point I'm wondering is, the actual access instruction is issue=
d from
> EL2, but finally this SError is taken to EL1? This doesn't adhere to the =
armv8
> exception model that an exception can never be taken to a lower EL. How t=
o
> explain this?
> > I did one more experiment that in restrict_bitmask_access() check the
> access size, doesn't perform the access if it's not word-width. The resul=
t is
> the byte-access to the not permitted registers doesn't cause SError, so i=
t
> confirms that the SError is indeed caused by the EL2 access instruction.
> >
>=20
> Hmm, maybe try that with a different silicon as well? Or, to be vendor
> neutral, see what happens inside QEMU. Image available via
> jailhouse-images.

It's my misunderstanding on the rule that "an exception can never be taken =
to a lower EL". In this case, the SError interrupt is not routed to EL2 in =
Jailhouse setup, so it's target EL is EL1 (it is also not routed to EL3 by =
SCR_EL3). As the target EL is lower than the EL exception occurred, it will=
 not be taken and will keep in Pending state until the EL is changed back t=
o the Target EL (EL1). So the SError is taken from EL1 to EL1, not a violat=
ion.

Now I'm thinking whether we should do the word-width access converting unco=
nditionally in the mmio handler or obey the original access (addr and size)=
 from Guest.
I trend to the latter, because the former will let Guest avoid experience t=
he exception which is supposed to be triggered by the instructions that are=
 unpredictable, then this will result in that the same image can get incons=
istent execution result on top of Jailhouse and on HW directly.

Thanks,
Zhiqiang

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
jailhouse-dev/HE1PR0402MB33715CAF5CE75BF5038BDD5884CF9%40HE1PR0402MB3371.eu=
rprd04.prod.outlook.com.

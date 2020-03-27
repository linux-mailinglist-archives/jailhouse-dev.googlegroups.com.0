Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB27X67ZQKGQEEBNIAMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3F21957C2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Mar 2020 14:13:16 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id cq16sf8176371edb.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Mar 2020 06:13:16 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1585314796; cv=pass;
        d=google.com; s=arc-20160816;
        b=P+rdE1qXRTRXBTSnhUBteM+iuCricXLKouqfCsVt/Jg8turAdUzrc/FGQw1RZv1dTU
         C4LTnIkxTmGogM8SAH87MDMJiLXGOxGRNkmNsT9unzViEoiT4kO+aKv4FAzsew9BQTbV
         aagOfOSF28qMHiY0iGHNAZ5QG8ms30U4/nWSDSUjw+b3sKQcGZJi/8c8cJuBPNYzjfzU
         UKtC994U+QqJbd4j8QyDTlZpTPjwUCx88LpLTecm6lyqSc2cmhLd8cQGc6Ok220ss4H8
         dA9gvKXrjd+bYlq0msw3rjuuHbwU6GhuMNf7e3dFZhx6+RgimZDyCw5mDORiekbmZ6id
         9Lzw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=R1+zaUe6zSIu14MR36oucXRQHK7u3LRbQ/xwi5C9Wiw=;
        b=d68aslYrMpF7yd38k3xl1E0JmBdcyrLYW6X5HYx5sm3R2exZ3RgSsWqGSM5mtHvoNv
         UHKzL9E7I3rvw4wuYjB7huJXzf3GTS25D2LK2wB942RnQdfaRtOX3Y8ak/1FUL6QPu8H
         YMCCtlEOmeanusedn2m5XMcarIEbgzoDSk5y+jxgmXfkEYXmvV7SVik+CgS0lyCLrXmR
         zY5Cq3+IawjRB/RI4GmNYkB0giz1Eti8FUEG/OgnsEKZvfoXH2PBxtWcC6GeP9CTAijv
         jrnUa+A257b1f6YEIzrWy5f5uhpNKT9w2/MqpM6oYdjlLcDnbztFaboZuRjp8vkj6YAj
         fANw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=nRM2QmPU;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=R1+zaUe6zSIu14MR36oucXRQHK7u3LRbQ/xwi5C9Wiw=;
        b=iZpCpw92ryAqQF647Cv5dIVOyszOrJjaWO2S9Wn8OYNQI/BNWnXR/wfk3V2NDemBP/
         n5/z95Ca5arX6b+ghZp3C9LI8STbl8RptKsZp0/T3hAyHV/2piToSz+BiVP74qyQz/80
         lvPbUYFBzBd2b8jsdEVbVdtNgkYb3Ti/x3mIWTzhTgmA6WJtwu/9BcKS22VtTG9hAyf/
         Mn4y8ZimAeP7MjBgl6pwTqZkWeNO+mfbzasNyRF0mdul0gbXUPXtxwEdJAGGstCIrH9I
         UTQGUPPSCrJOeAl7ml9+H43GUw49Rp9Y9+FEyFmMvhyxQ6T1Po+HrrJF1S8/g8iuQeX4
         a5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=R1+zaUe6zSIu14MR36oucXRQHK7u3LRbQ/xwi5C9Wiw=;
        b=ZUc5ULIsO0EKgbxC2zQsIyrpV70GA5ZEg1HEkALxMqerNj8zDtZaIYX1S3Z5WELlJo
         G74bMp1pe90Qum9/d0mI5r/fLYX0yBC64ELVyCFX0NnFQMlUpDKHZHJ+KsmBRPpWdaWb
         oubGApj29HuzDM0YRgQs3GcU/49loGCLKPJbTXy2isPqtVsomO1cxka10n2uobz7LIq/
         lff/3XWeT8CtJIwz8TMlhZqItkTfrehQWN82FHawO/9nsHnvX7L9uXP8oWpKyO6NFVw3
         k4aQfTcYcjQWySQWpZxOsDSkRUTymIfaXlOenTMDuk58zx3V/8FpqIBfczabvRMXrSCC
         gEvQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1FilFzwzYzfcnCsyaMKjxKFiFJHieCNAdW/i+7yzPJ29zUQL2z
	F16TKWcRWhZSgPYftyb4imw=
X-Google-Smtp-Source: ADFU+vtqpV2RZXse3Tlw7wH6n1dB6Oi9kisfbn99mFm5e6rDMnYKDtz76IUzwKP7eWNE0ncnNMQpcg==
X-Received: by 2002:a05:6402:2076:: with SMTP id bd22mr13661387edb.262.1585314795959;
        Fri, 27 Mar 2020 06:13:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:aad0:: with SMTP id kt16ls5468032ejb.2.gmail; Fri,
 27 Mar 2020 06:13:15 -0700 (PDT)
X-Received: by 2002:a17:906:5045:: with SMTP id e5mr12485971ejk.325.1585314795351;
        Fri, 27 Mar 2020 06:13:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585314795; cv=pass;
        d=google.com; s=arc-20160816;
        b=w4EKJpthVAaLlsK+bk5FbdNWw19ivFF/XFhvekkNpq8xsu9/G0j/9H6wWLsRKLI6s9
         HLKtoKXHAmrYpp4VumY/VQK7S2p6BZsykQGlpSYehSAiI+gvXuS4EuhTbkQYyaSdXtm/
         0qlcgapIiI/bzdrGoRNgDrisQoUl2jZF84jNuqBGZ5eg0r/8TyXPRCX11381Y8NUm2rF
         jMVZKethC6EHJI8l1lseGBrBl8omusbV8DaJLJe7nLgn5YzzVHLlFEAloPOp7+zQL8CU
         Xm66JYHlBJBcm5zrOJOzOkWbyxUy7iXMz/H8RXZKKSxufLOf8/QPTvnPAMAhPMvjzdDa
         JdHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=ZN3r0sIKs8us5ld7wwWcZaFohMCGfAzhnsLkuUBQjxw=;
        b=RIjE2+LPo1CUD7NiWCpmGmz0pZd6z+en//5PUq5rbttwkkvpbsN/zdEOpiYfGVL1sT
         uvjKBJrG6cT5ezx62Z2g+kzALBmABqdiqwyEoiY/5CP/E7piFHg9JODlF1XTcWmdvcMm
         0dILIbcR+JLUxwIm/N8eDelpcHlyOMhd1nkLrC2l/ydBS2ibfZYlF8YIibFsHyM2maQQ
         szWWlz5D6UYp4gNS0QF2WHLOkkH3ZzBXy8Foki8Qb0cRYW5Y8dl72wnkfpR9pRzFP2w6
         HoaXduPf679wpS4QfJnLqkpM/EsTPPeZzDZk0My+MZ/qek92SzVjXgr6bntqzHgcUOaP
         P0ug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=nRM2QmPU;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2059.outbound.protection.outlook.com. [40.107.22.59])
        by gmr-mx.google.com with ESMTPS id ck3si409574edb.5.2020.03.27.06.13.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Mar 2020 06:13:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.59 as permitted sender) client-ip=40.107.22.59;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bI7VLKSzKxRqp03IrlYO44SxUMz1C7sEzLMDVxBI2wmdsbQTWJw6nO8oDKEJLjdxAljBwS6+dtt2fEP6AOmoUPqi26LH8LO7x0rEIYUtgUKoGwRM63d6X4cmJWHzIhJY+4AOXgK7i8EYLmu2zBl+yBs7BjJU97mMlBEgfOkEFs0iC2SVryQvnlOwcGlTNnekeJtOWac9x14x+mdYZ5byNH6+zAPeLxE3vmrV4ZaRhB3MyndCVdGIi+1SbRzpUb2F0BxQ4T3pM4SAFCbk5QuyD0oyC1RbLIzKuYQdoQXnE+8LBKtSy+NK862DK93iZoQkFVoaUe9IS+zMkqlSc3aiFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZN3r0sIKs8us5ld7wwWcZaFohMCGfAzhnsLkuUBQjxw=;
 b=fGqwrg/wrMj6lhT2NJ0cj2UzKWAbhazEAXF/CnNuPcf7rKgYijePpQSlzsk0YmzYZYKY8wZLwEEwndl3U4nGN9j6tZykTZrYvXSsmwckb95w4MR+aXe6vrKqDbAoQQ1oLSVIxl+3fvaGZQBugm+h0rDXT5AAlJonFVj7lx8znPMmIP2L5uwbpt2a9By4nnj8OjUih0+Sa4kOpVAzfxCYNUjeAduA4I0PBL+K3vtPr2cxSbdBSWNpCm4ben4QlQeesX8KsiGaVMdqQHAoHajPynLtFzWOCio1Ttrc8fTNTeg/TKnKYlPSIfkGj+GK2r631SKXOOkp17vicxLtdTn5lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5587.eurprd04.prod.outlook.com (20.178.117.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Fri, 27 Mar 2020 13:13:12 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc%7]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 13:13:12 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Angelo Ruocco <angelo.ruocco.90@gmail.com>, Jan Kiszka
	<jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Marco Solieri <marco.solieri@unimore.it>, Luca Miccio
	<206497@studenti.unimore.it>, Alice Guo <alice.guo@nxp.com>
Subject: RE: [RFC] Linux-less boot
Thread-Topic: [RFC] Linux-less boot
Thread-Index: AQHWBCycIelwmWF0A0SVIsO47fjr0ahcZKcA
Date: Fri, 27 Mar 2020 13:13:12 +0000
Message-ID: <AM0PR04MB4481DD780EC90AB57695B8E388CC0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <CADiTV-1QiRhSWZnw+kHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw@mail.gmail.com>
In-Reply-To: <CADiTV-1QiRhSWZnw+kHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.107.26.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 498df971-4c91-4d1b-e44e-08d7d2509a97
x-ms-traffictypediagnostic: AM0PR04MB5587:|AM0PR04MB5587:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB5587C4299E65A8B3C1E6315A88CC0@AM0PR04MB5587.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4481.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(186003)(6506007)(7696005)(110136005)(86362001)(4326008)(54906003)(33656002)(26005)(9686003)(44832011)(81156014)(66946007)(64756008)(5660300002)(478600001)(316002)(55016002)(81166006)(2906002)(71200400001)(52536014)(66556008)(45080400002)(8676002)(8936002)(76116006)(966005)(66446008)(66476007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NlqakpOfYbo8ErFXdQGLed0mxi0GZElYZw0Q69lHAT/qUw/cvjRKbjK14lSoypsMOMTda66WTi5dF2eEYct83gziRuVkLiAXXhX2M7n6+7IUAlxEpJzFT5FkVZNlecpL4ePLoAY9RfTB4yTmyI1/iF1fUmDMD/5LY4QYBkIvxVSKRHIFO+0Rekl3vYxP9F1Yf+4I2Y0sfawNPvj/e8luzfc1NtmsXsw8/oMhqItbKoV5pRTnLZsAYovRYqmmG6rz9bVTChuTnNnoYtGIrHrxo+KWGoFMnqOXmyKi6aMM3AGzz0jkbLI/YKkkf5hMdsaGa4qHhuAqpttG5FL5jMyceZ0hozp/Ayo6C6eHXAJvfHa8T7+94cCmBu/dc3AVUh8tXCWKcxd97GNiGPsH1gas71otuPux6Bw2iHs8tGXZE9FIXkEYG4f97R6B2OJhD44d5HzgaP96TUCbpcHUG+pJpzG9qM2WuxrXceyNdk0OFdNBu2FAfn3ALlT+LLtrl4kMFhrE2o+5dc2GkKhpqF+QdA==
x-ms-exchange-antispam-messagedata: ZMwqjmGgoZQbz1OAGCRNLXTwWkRvRPzEJjogK8FcQGlTiLiPj1qKvvTkdnPWiUwaCzkGTSKN1Mq5sy2uXolsPTBmRc2yCwiFCI7u+UryAJxxEKK9u7HVfPxw3Y8r9lquINzW2C8/vMXQfQhyfmYHJQ==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 498df971-4c91-4d1b-e44e-08d7d2509a97
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 13:13:12.7197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UItRuP6rVrdjMkUmbmx243Cn1ZtwVKqFwGynruTJy+eiKxUD4OwI0z2LKW2/0RpjWHkQwAqfMGb0gV+7sWhdaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5587
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=nRM2QmPU;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Hi Angelo,

> Subject: [RFC] Linux-less boot
> 
> Hi Jan, Peng, all,
> 
> We currently have a better understanding of Peng's work [1] and manage to
> somewhat reproduce his results on another NXP board, the IMX8QM.

Good.

> Since you showed interest in this, we would like to start implement something
> a bit more portable and user-friendly.
> 
> In this regard, I would like to share some design choices:
> - Jailhouse image stays more or less the same, all the code is added into a
> loader, expanding Peng's work to make it more portable (across Arm v8
> boards for now) and generic. The loader will boot and init everything that
> jailhouse and the inmates need. Without the loader jailhouse can be started
> exactly like it was before.
> - The loader is platform-specific, and thus it's necessary, at compile-time, to
> have a parameter that specifies the target (something like `BOOT=` or
> `TARGET=`), using the root-cell information to fill the correct addresses and
> compile only the necessary drivers. Without the parameter, the loader is not
> compiled.

I am not sure about x86. But for AARCH64 and RISC, let uboot pass
a table to the loader, the table contains all platform specific things. The format
should be defined by jailhouse community.

Or use device tree, but that means needs to import libfdt to jailhouse.

> - There is going to be a "sync" function at some point, probably when loading
> the module, that can update the status of jailhouse so that the cells created at
> boot time are controllable. The idea is to have the same situation as if
> jailhouse was started with the `enable`.

Agree.

> 
> Finally, we would also like to hear from Peng, to understand his current plan
> so that we don't step in each other's toes.

Ah. I was crazy busy in the past days on some remoteproc work, so stop the
Loader work for a while. but the other work will be done in a few days, and
I will back to this:)

Actually this feature is planned in our software release, and I need to have
the loader related stuff checked in NXP tree in the end of April. 

My planned stuff are:
arm32+arm64 inmate cell with arm64 jailhouse.
Real cache color with Linux root cell + one inmate cell, and considering fit
jailhouse into SRAM.
As you listed, userspace tool support.
Considering MMU for loader. But not sure this really needed currently.

It is good we could reuse the work between, but not sure I could wait
until then, because I have a tight schedule.

Thanks,
Peng.

> 
> [1]
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups
> .google.com%2Fforum%2F%23!topic%2Fjailhouse-dev%2FIZEFz-e2lh4&amp;d
> ata=02%7C01%7Cpeng.fan%40nxp.com%7C8ae0f1ab40054707b2af08d7d24
> 3be6f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6372090607
> 11306332&amp;sdata=r8uxIgLOTqIMydWTlo6rDdaerSPd12MRnURPIUDA9X0
> %3D&amp;reserved=0
> 
> Angelo
> 
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FCADiTV-1QiRhSWZnw%252
> BkHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw%2540mail.gmail.com&amp;dat
> a=02%7C01%7Cpeng.fan%40nxp.com%7C8ae0f1ab40054707b2af08d7d243b
> e6f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637209060711
> 306332&amp;sdata=L4PCq2Lo6FlAqzw%2FhPr0p7dhtG3DrOsfRl%2BBtBV7lA
> w%3D&amp;reserved=0.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM0PR04MB4481DD780EC90AB57695B8E388CC0%40AM0PR04MB4481.eurprd04.prod.outlook.com.

Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBR4FQX4QKGQEVDGGA2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 456A4231C2A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 11:35:04 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id w1sf4438159wro.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 02:35:04 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1596015304; cv=pass;
        d=google.com; s=arc-20160816;
        b=nxwRJWNgEJGTr9xM4tnwNXUJIMPSQcGoF2K/wzu/u8KfWpjx29NpzS1hgX3XT6RIbz
         UpxWdgn1st7XiQWvW3gf73V3wTeaVfdGXgEPU4Yzc+WdMBj6Tu2Ss+7gx6OBEyQsyiHH
         ta+eJsjdihsbMuiKS96TKCr/HitaNQJN1ChlcIaS5BXgr3JL1oQKetwPBwbQfguGlSQz
         LJ7ssL8J2y32Y4OdFiMTmYZxVwcefsiYpL3GaUhAF1eTxfwYCg7smsCYv8WBilOuAIE+
         c4ES3Pfu0UsYkOxS6FlKkq7tfUI9GX7ZwQclJX0uVbfc6RJGxtCwAyeQ38FkzY9Fbfax
         ZFEA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=MvRrcu1o9OW1GHt0wFAGm8dS4FiFnVyR5klUX9a/e2Y=;
        b=Kp5meD2vns9lOrNA+Wg0BCHDgsBcBk8PR8DjzE4zJvaPeGuswmVhLhXGzrBxnxbNxZ
         harairZ9Ap9UtzIoWg8RjGlzUIZKGbBG3oLpprKP3rgs7HEyxGb46W0p/5/931lgBHk6
         j28gmptlBsZJjTDZ7naWnGY5BpWqz+43AizaYvkJkQxgAY9RDCsM5DO8OXX/aLlEur9e
         KIeLBsmnmSIbvgZN+Ubass08edu/xEUgBhtedkMEXz9W3XzoVdOCcnmHCuXfCPXak0a9
         yoRM25l21l6rGa2z4jp9TgCYSHNs80egZZWZkU+zKvOSUpnTSOt1pgBo4ZSiIoDXCMkZ
         z2TA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=r7RFCFeJ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.87 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MvRrcu1o9OW1GHt0wFAGm8dS4FiFnVyR5klUX9a/e2Y=;
        b=mRnra2lIdnKMbXDOAjG2UG7Ud8oBTxppBMSt/xkqK80+d4Nu2LZ/11SwPuxBz9jkhe
         UfEms3ZueJ+//xPBEf1A3732Syt++Ot5xYu6+0in57xKsGV0aeJJIFsNGYHURO/h2eQi
         kiHJV+DvNmkRmYLdWtJym0VMWRke99+Gr1D4N+Tu3J1CRHsRys2kn9DzSjRrSZ7iVyw9
         3BiROkLrGM9CDRloxinu6gv4GiJmPNibcofhyuH2vxg3vrpa/ygPoZFWoyTKotAqJ0dr
         6olpYy+aKTXGbwQhhNYFmDOpq9fXz50qikdebANICU0C8THGBPsgY1E8VHB+Ny4ncftb
         30cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MvRrcu1o9OW1GHt0wFAGm8dS4FiFnVyR5klUX9a/e2Y=;
        b=M4ZeyTJnk1fD743DMttvn/8k6B2WJptMgASknQzetC+GDDft9MFROTlLP2mCGLN/k6
         YoMHvISdEvSfpjgAom1uaHg1XGlTOkkNFC4FWAnWBWA3A6iUoS71UMM/Ygvu0fhE18iK
         VYmbkdRIwo69hohq5gahXKa3QIbtrwZEFriOpdqWAkXOD3VEL5VQcJxl9fqO1p8Ubuxa
         aWphC7Q3R5j1vF48RtISpfVuD7rKnrm4DwS5B54jTwf68Pxl7N6KXzbdGYeFJPV7Juex
         HGDYplIkApeSa0zuY3Fs0gtdia1ETic5hbvT+yvSzSiFPhGjqwD2J8ELpZTjbmaZN1ph
         Xv3w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533wc0bBuuDznxcJdH6fdy42v3nmQq0oRluSKXenTblWgcwA5Hyi
	Y9geuxTz8eHsAoiIlIHhCgI=
X-Google-Smtp-Source: ABdhPJx/feTVO62tQ9KqCNJFHtisz5hFf+sCbHlAAdsinwQtECAW+7DiHAKfZWJrzvts0JAggqQFCg==
X-Received: by 2002:adf:ee51:: with SMTP id w17mr29892275wro.239.1596015303983;
        Wed, 29 Jul 2020 02:35:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b787:: with SMTP id h129ls689399wmf.3.canary-gmail; Wed,
 29 Jul 2020 02:35:03 -0700 (PDT)
X-Received: by 2002:a7b:c194:: with SMTP id y20mr8266029wmi.183.1596015303354;
        Wed, 29 Jul 2020 02:35:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596015303; cv=pass;
        d=google.com; s=arc-20160816;
        b=Lyk22HhO1tPvllqFYMfOOWrHvxnJF97Egvk++aQefrnKLHRpeUwMBnYibZ7CU+PqzG
         cjUzbEDcrdFrNeSjQUM6eHryu1bKtO6g4kyc84V8MnX9YPKrYGbA1XuH3noa8rEsXD9t
         znTHK+H99M89Ac1iaczW61oPAuWYSsbeGIvCmRFRCMYsUjaO7ZYvyA6Spyvwe8ShomOU
         Wf3DcDvE7GseFIK0UimdDQ2RiojQzGTLeqWJpb/hzKWMMMpOm2cH2q/+8WKOXsFBwS+v
         nIzZp6C0fg+QXqXzoQnoBYwvMogIpteRB1sFgiuODkTgd9+P7zEq2It4h0hHxbU2mTXG
         tk6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=Ny1kTcV7KmfYSpp+uHu9aoaYiNMwa+aBmWOUA5uNU6w=;
        b=slCYPivjnULaTe6bp8NQoEDsbFSBRV9fnHV/vP77p8a66ad6fTrpoCx2RsdncGv8MP
         vPmCebaSeuXuUprx+GTDGAojacMX08945QQUJXNzqaRJaEP5uwgodpEZeIp/o4Gu8n2e
         zLlKKaR8jnP7JuUL+3WKtpVxGUqariCnWOP8DO3IhD7ynSu++liyLJ6UyeQMvj5e//BQ
         O/zRz+IcZTmyj5uqEW3wEqwMtZw9sw41ohUYR88RxIHGKDaJwDNPrV+pOOnwuhsHJjH9
         xtGlP/ZDQR7MB0eQ0+6cUYd/YiiqpusNsD9pNHCoy5QovTcuDmUkDRIxVLMESFNMV/VF
         IdZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=r7RFCFeJ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.87 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60087.outbound.protection.outlook.com. [40.107.6.87])
        by gmr-mx.google.com with ESMTPS id j83si409922wmj.0.2020.07.29.02.35.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jul 2020 02:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.87 as permitted sender) client-ip=40.107.6.87;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqumZXq1OvnmBG2wkiBQ8GwWyydd62jUojzUzMmmHjI8UjLp8XL9XEgYT6huYDy0yZrNGHOKrvDg9NzkdUqLPGimeiC98fj2a/KF1j0Z0rreGtG3YhExdpGInS+OjgS4M4cXDyh2+LETYtFY/cX0ONsPKaWikppUbhClhVyAMBvjcYFsWwPnVXHbOg4QXq/yOqGxw/Ah7kup1jqHpnnrQCaetOThSof5egxI3FJmqzaU5Lc//QYwLA65KFXI0UAkgPx/7HNp9CyMTg66F9ldhTjcJfRZQL8yeL3rXh1/38XKJXWqJupbYkwjoDAGHRIAKsf1KnKw58471GfYYPRg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ny1kTcV7KmfYSpp+uHu9aoaYiNMwa+aBmWOUA5uNU6w=;
 b=ZeH5PXfScq+/bEdiXfx0B75nok8DYNEti2OPjyGmHDLoI/Vl9q4uYIlISPTXC1H5h+VIQ+C8wx+yPZjUdG1XHL8y0QvWQjRpwnJyITi5eQh/ShY5aDcty4je4kTsCUsHUzepcKJ5Sb+wHAe9OzwbCX+e4QT2IkEbvFosrMkWFAkWBHkEa4G4GiYS3RQQlnt9+kcEmKduUaZwN0LVNaZ0xNLt7xotONc+h9vr3rIlXcMj5C0HoX3QR3EHm1yadJjVl9ZWAMuyDCMLwLpCtcvHP7Z/9yk+tVt35U+ryLmsgBXdMMJfkexMVGep0NXtVSPeb+5Pz2sqb98N6kMTH9Pxzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6619.eurprd04.prod.outlook.com (2603:10a6:10:108::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Wed, 29 Jul
 2020 09:35:02 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3216.033; Wed, 29 Jul 2020
 09:35:02 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Angelo Ruocco
	<angelo.ruocco.90@gmail.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>, Ralf
 Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jose Martins
	<jose.martins@bao-project.org>
Subject: RE: jailhouse jitter?
Thread-Topic: jailhouse jitter?
Thread-Index: AdZQV9Sg2ghlhzPgRlmJb7fpOVsBgwADlDcAAAL01YAAAMZ8gAAGw6oAAAZGpAAALvHKAANegwUAABKcb+ABLTLsQAAAvACAAABJEgAAAlS8AABbEs/wAAy0U4AAACP6kA==
Date: Wed, 29 Jul 2020 09:35:02 +0000
Message-ID: <DB6PR0402MB2760893A4ED60F92C6E107C088700@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com>
 <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
 <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
 <1d5b0ac8-0744-59ab-bb90-8133df4a1525@siemens.com>
 <d0b0c698-7ee2-97dc-7b6e-685f2f169f39@siemens.com>
 <CADiTV-1oJBD+SkAT475xD5iODeo24wqwBSFGu2JQATxqpF1W0w@mail.gmail.com>
 <b96f90ad-23bc-db73-9603-f9eb640804d0@siemens.com>
 <DB6PR0402MB2760B4463A03D7FC4EE3E4E988780@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760EA5C808D0A49208E7A9788720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <640c6eb8-07ca-c354-f888-abee87ff49b6@siemens.com>
 <DB6PR0402MB27609A148CE4F1B5DC105D3088720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <8c4f35ef-1b12-e08a-6d20-85d7c6c0fcad@siemens.com>
 <DB6PR0402MB276063FAB38B540E81ED7D3288700@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <1dffaed3-aec7-2bd5-7046-88059813c63f@siemens.com>
In-Reply-To: <1dffaed3-aec7-2bd5-7046-88059813c63f@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a5fb8a7e-abc5-49d2-a946-08d833a2ab27
x-ms-traffictypediagnostic: DB8PR04MB6619:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB66199A3B3099D109C31C29A988700@DB8PR04MB6619.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1mvRe4oiSh3fYpsGGMWUkVeC2+NGYCoFSea5j0oL0uHD89sERrau7aMpGsELwftfArHE4+y2envTFNXL8/O5mqCBDTyEkNDBr9a3lJgiZMVBUhLRhV2cTKCkgQ3JYRiLU3dfJkoYmkY+riC6enNW1PRIGvhEn6VJCW02pbFpBWJDCyNdB0RuJjO4w/LiM8lAKhgnsEMQI5huZ3CNd1UIc9N/sNBhuhmTjIq9VQdrUwXtPtcWOwxfGaj1fFIevedScZkZEhKhdd0SdkUypnR9T17nOlIX/HMrcUrUpELYlKFC1seoW5fwOj65AFPQ07RYg8+SWQeImU/o4mfNDGmEvtXqJKQqEkl1+gWyKJiBRh/nT5f9Wb4FnVnD+6SVB5m3gRHF+PSF5H8vY90DOrm8sA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(4326008)(8936002)(26005)(186003)(966005)(3480700007)(86362001)(8676002)(110136005)(33656002)(6506007)(53546011)(316002)(7696005)(54906003)(9686003)(478600001)(2906002)(55016002)(83380400001)(45080400002)(52536014)(64756008)(7116003)(76116006)(71200400001)(66446008)(66476007)(66556008)(5660300002)(66946007)(83080400001)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: AM4rP6ZLIG0RhBVeu+B8eX91yK6xaVp4wBHSLhy7KSGSDzudmofNkvpYF2k2JtFQ4Di62KmGYT7DpzAebPeGRhKSvVOTT2tj9YUetKt/qplUCh9Em29zNB1W1cfY3fGwR8QVjrIA7HDrLpl61LvcPap5GKBjZtNEAqn2z4fwIp01JyJpz5Zxcss0LH6OkYZND24N3UukVHZG13x3y4eb8XIFPaO3PU4Kynv/ntZZTyG+16nr958TlPWw/dqtEdPZSbkeIbjIvfyBqAlnebNTcF1fkECHZwE+x8yyPyuEHcFasbd36iXpyjOBvWo17cmmqoZxdJ/rIl+gFodBkjDrt2Xaf5S666U8KIseIJPLnkZPUuV6sCyuAijwx2JXHhb5JnUpb2/+ynZD0eSXR6z3VPZCUaRFM8mjDSYArhe8ojAUk5Dy30LwZdvlWOw8TIN1uKScC90WcyVN6nXds971mTVNmrzrky9oi4yoR+MQdp0=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fb8a7e-abc5-49d2-a946-08d833a2ab27
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 09:35:02.1417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1P0fSg6T8U195+CE53kQyUga6/pvc41fFkg4f6HmIFI/jWIweYnRa7yDoX7TuTFy6Vx7eLyvPTJDYkwwn2rr0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6619
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=r7RFCFeJ;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.6.87 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: jailhouse jitter?
> 
> On 29.07.20 05:28, Peng Fan wrote:
> >> Subject: Re: jailhouse jitter?
> >>
> >> On 27.07.20 08:56, Peng Fan wrote:
> >>>> Subject: Re: jailhouse jitter?
> >>>>
> >>>> On 27.07.20 08:25, Peng Fan wrote:
> >>>>> Hi Jan
> >>>>
> >>>> ...
> >>>>
> >>>>>
> >>>>> I tested the SDEI on i.MX8MM, it shows the jitter became smaller.
> >>>>>
> >>>>> Without SDEI, the gic-demo jitter is 999ns+ With SDEI, the
> >>>>> gic-demo jitter is 124ns~246ns.
> >>>>>
> >>>>> Indeed no more vmexits.
> >>>>>
> >>>>> But the max jitter, some times SDEI bigger only when program start
> >>>>> up,
> >>>> mostly because of CACHE WARM UP I think.
> >>>>
> >>>> That is one source. If you add a warm-up period, they can be
> >>>> mitigated, though.
> >>>>
> >>>> The other source might be last-level cache sharing. If there are
> >>>> cache-miss counters, maybe you can check if those increase along
> >>>> the
> >> peaks.
> >>>
> >>> Yes. When I add stress-ng in root cell, the jitter became larger sometimes.
> >>>
> >>
> >> I've seen the same on the ultra96. My cache theory should be
> >> validated, though, because I would have assumed that all of the gic
> >> demo fits into a core-local cache.
> >
> > After thinking more about root cell color, when booting jailhouse before
> Linux.
> >
> > We are not using 1:1 mapping anymore or we could use 1:1 mapping with
> > many pieces of small ram area.
> 
> I suspect Linux may not like a device tree with hundreds or thousands of
> memory region entries.

True.

> 
> >
> > So I think the first 1 is better, but when use kmalloc for dma usage
> > sometimes, it will bring issues, because not 1:1 mapping, unless we
> > let all drivers use dedicated dma area reserved and not colored.
> 
> We will need an SMMU for colored Linux instances. That will make things
> appear 1:1 mapped again for Linux.

But SMMU is really eating silicon die size, many platforms not have that.

Thanks,
Peng

> 
> >
> >>
> >>>
> >>>>
> >>>>>
> >>>>> Will you move SDEI support to jailhouse mainline?
> >>>>
> >>>> Once the to-dos are addressed. Any contributions?
> >>>
> >>> I'll read more into your patches and check the to-dos you listed in
> >>> the jailhouse commit log to see what I could help there.
> >>>
> >>
> >> Item one (SDEI probing) is almost resolved.
> >>
> >>>>
> >>>> BTW, did you have to patch ATF for your experiment? Will you
> >>>> upstream that patch?
> >>>
> >>> Yes. I'll upstream that. Quite simple, I only enabled one SDEI private
> event.
> >>>
> >>
> >> Perfect.
> >
> > Sent out.
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Frevi
> >
> ew.trustedfirmware.org%2Fc%2FTF-A%2Ftrusted-firmware-a%2F%2B%2F511
> 6&am
> >
> p;data=02%7C01%7Cpeng.fan%40nxp.com%7C243dabd82a3449fff8b308d83
> 3a1f850
> > %7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6373161180330
> 65867&amp;s
> >
> data=%2FNf1rQNr5fgDkE2T%2FWpWZclAom57nxCfCmtJX5nfxPs%3D&amp;r
> eserved=0
> >
> 
> Great! Let's see how the review works out, then I could try getting my patches
> ready for upstream as well.
> 
> Jan
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760893A4ED60F92C6E107C088700%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
